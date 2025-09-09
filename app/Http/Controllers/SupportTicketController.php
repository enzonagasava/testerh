<?php

namespace App\Http\Controllers;

use App\Models\company;
use App\Models\department;
use App\Models\Employee;
use App\Models\designation;
use App\Notifications\TicketCreatedNotification;
use App\Notifications\TicketUpdatedNotification;
use App\Models\SupportTicket;
use App\Models\User;
use DB;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class SupportTicketController extends Controller {

    public function index()
    {
        $logged_user = auth()->user()->load('companies');
        $companies = $logged_user->companies;
        $companiesIds = $companies->pluck('id')->toArray();

        $departments = department::select('id', 'department_name')->whereIn('company_id', $companiesIds)->get();
        $designation = designation::select('id', 'designation_name')->whereIn('company_id', $companiesIds)->whereIn('department_id', $departments->pluck('id'))->get();

        $open_count = SupportTicket::whereIn('ticket_status', ['aberto', 'open'])
            ->whereIn('company_id', $companiesIds)
            ->count();
        $closed_count = SupportTicket::whereIn('ticket_status', ['fechado', 'open'])
            ->whereIn('company_id', $companiesIds)
            ->count();
        $pending_count = SupportTicket::whereIn('ticket_status', ['Em andamento', 'pending'])
            ->whereIn('company_id', $companiesIds)
            ->count();


        if ($logged_user->can('view-ticket'))
        {
            if (request()->ajax())
            {
                $query = SupportTicket::with('company:id,company_name', 'employee:id,first_name,last_name,designation_id', 'employee.designation:id,designation_name', 'department:id,department_name')
                    ->whereIn('company_id', $companiesIds);

                // Filtra tickets pela empresa vinculada ao usuário
                // if ($logged_user->company_id) {
                //     $query->where('company_id', $logged_user->company_id);
                // }

                // Filtros adicionais do request
                $employee_name = request('employee_name');
                $company_id = request('company_id');
                $department_id = request('department_name');
                $ticket_status = request('ticket_status');
                $start_date = request('start_date');
                $end_date = request('end_date');
                $designation_id = request('designation_name');

                if ($employee_name) {
                    $query->whereHas('employee', function($q) use ($employee_name) {
                        $q->where('first_name', 'like', "%{$employee_name}%")
                        ->orWhere('last_name', 'like', "%{$employee_name}%");
                    });
                }

                if ($company_id) {
                    $query->where('company_id', $company_id);
                }



                if ($department_id) {
                    $query->whereHas('employee.department', function($q) use ($department_id) {
                        $q->where('id', $department_id);
                    });
                }


                if ($designation_id) {
                    $query->whereHas('employee', function($q) use ($designation_id) {
                        $q->where('designation_id', $designation_id);
                    });
                }

                if ($ticket_status && $ticket_status != '') {
                    $query->where('ticket_status', $ticket_status);
                }

                if ($start_date && $end_date) {
                    $query->whereBetween('created_at', [$start_date, $end_date]);
                } elseif ($start_date) {
                    $query->whereDate('created_at', '>=', $start_date);
                } elseif ($end_date) {
                    $query->whereDate('created_at', '<=', $end_date);
                }

                return datatables()->of($query->get())
                    ->setRowId(function ($ticket) {
                        return $ticket->id;
                    })
                    ->addColumn('employee_company', function ($row) {
                        $employeeName = $row->employee ? $row->employee->first_name . ' ' . $row->employee->last_name : '';
                        $companyName = $row->company ? $row->company->company_name : '';
                        $designationName = ($row->employee && $row->employee->designation) ? $row->employee->designation->designation_name : '';

                        return "<strong>Funcionário:</strong> {$employeeName}<br>
                                <strong>Empresa:</strong> {$companyName}<br>
                                <strong>Designação:</strong> {$designationName}";
                    })
                    ->addColumn('ticket_details', function ($row) {
                        return $row->ticket_code ?: '';
                    })
                    ->addColumn('action', function ($data) {
                        $button = '<a id="' . $data->id . '" class="show btn btn-success btn-sm" href="' . route('tickets.show', $data) . '"><i class="dripicons-preview"></i></a>&nbsp;&nbsp;';

                        if ($data->ticket_attachment) {
                            $button .= '<button id="' . $data->id . '" class="btn btn-success btn-sm document_view" data-link="' . route('tickets.viewDocument', $data->id) . '"><i class="dripicons-document"></i></button>&nbsp;&nbsp;';
                        }

                        if (auth()->user()->can('edit-ticket')) {
                            $button .= '<button type="button" name="edit" id="' . $data->id . '" class="edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>&nbsp;&nbsp;';
                        }
                        if (auth()->user()->can('delete-ticket')) {
                            $button .= '<button type="button" name="delete" id="' . $data->id . '" class="delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';
                        }

                        return $button;
                    })
                    ->rawColumns(['action', 'ticket_details', 'employee_company'])
                    ->make(true);
            }

            return view('SupportTicket.index', compact('companies', 'open_count', 'closed_count', 'pending_count', 'designation', 'logged_user', 'departments'));
        }

        return abort('403', __('You are not authorized'));
    }


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function store(Request $request)
	{
		if (auth()->user()->can('store-ticket') || auth()->user())
		{
			$validator = Validator::make($request->only('subject', 'company_id', 'department_id', 'employee_id', 'ticket_priority', 'description', 'ticket_note'
				, 'ticket_attachments'),
				[
                    'ticket_priority' => 'required',
					'subject' => 'required',
                    'ticket_note' => 'required',
					'company_id' => 'required',
					'department_id' => 'required',
					'employee_id' => 'required',
					'ticket_attachment' => 'nullable|file|max:10240|mimes:jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf',
				]
				,
				[
                    'ticket_priority.required' => 'Por favor, selecione a prioridade da solicitação',
                    'ticket_note.required' => 'O destino da solicitação não pode estar vazia',
                    'subject.required' => 'O título não pode estar vazio',
					'company_id.required' => 'Por favor, selecione a empresa',
					'department_id.required'=> 'Por favor, selecione o departamento',
					'employee_id.required' => 'Por favor, selecione o funcionário',
					'ticket_attachment.file'=>'O arquivo deve ser um arquivo válido',
					'ticket_attachment.max'=>'O arquivo deve ter no máximo 10 MB',
					'ticket_attachment.mimes'=>'O arquivo deve ser do tipo: PDF',
				]
			);


			if ($validator->fails())
			{
				return response()->json(['errors' => $validator->errors()]);
			}


			$data = [];

			$data['ticket_code'] = $this->ticketId();
			$data['subject'] = $request->subject;
			$data['employee_id'] = $request->employee_id;
			$data['company_id'] = $request->company_id;
			$data['department_id'] = $request->department_id;
			$data ['description'] = $request->description;
			$data ['ticket_priority'] = $request->ticket_priority;
			// $data ['ticket_status'] = $request->ticket_status;
			$data ['ticket_note'] = $request->ticket_note;
			$data ['ticket_status'] = $request->ticket_status ?? 'pendente';

			$file = $request->ticket_attachments;

			$file_name = null;

			if (isset($file))
			{
				$file_name = $data['ticket_code'];
				if ($file->isValid())
				{
					$file_name = 'ticket_' . $file_name . '.' . $file->getClientOriginalExtension();
					$file->storeAs('ticket_attachments', $file_name);
					$data['ticket_attachment'] = $file_name;
				}
			}


			// try {
			// 	$ticket = SupportTicket::create($data);
			// } catch (Exception $e) {
			// 	return response()->json($e);
			// }

			$ticket = SupportTicket::create($data);

            if ($ticket->ticket_status == 'aberto') {
            $companyIds = \DB::table('company_user')
                ->where('user_id', $data['employee_id'])  // ou $data['employee_id'], ajuste conforme seu dado
                ->pluck('company_id')
                ->toArray();

            // Busca usuários com role 1 ou 6 que pertençam a essas empresas
            $notificable = User::whereIn('role_users_id', [1, 6])
                    ->whereHas('companies', function($query) use ($companyIds) {
                        $query->whereIn('companies.id', $companyIds);
                    })
                    ->get();

                Notification::send($notificable, new TicketCreatedNotification($ticket));
            }
			return response()->json(['success' => __('Data Added successfully.')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function ticketId()
	{
		$unique = Str::random(8);

		$check = SupportTicket::where('ticket_code', $unique)->first();

		if ($check)
		{
			return $this->ticketId();
		}

		return $unique;
	}

	public function show(SupportTicket $ticket)
	{
		try
		{
			$name = DB::table('employee_support_ticket')->where('support_ticket_id', $ticket->id)->pluck('employee_id')->toArray();
		} catch (Exception $e)
		{
			$name = null;
		}

		$logged_user = auth()->user();
        $company = DB::table('companies')->where('id', $ticket->employee->company_id)->first();
        $department = DB::table('departments')->where('id', $ticket->employee->department_id)->first();

        if ($logged_user)
		{

			$employees = DB::table('employees')
				->select('employees.id', DB::raw("CONCAT(employees.first_name,' ',employees.last_name) as full_name"))
				->get();

			return view('SupportTicket.details', compact('ticket', 'employees', 'name', 'company', 'department'));
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function edit($id)
	{
		if (request()->ajax())
		{
			$data = SupportTicket::findOrFail($id);
			$departments = department::select('id', 'department_name')
				->where('company_id', $data->company_id)->get();

			$employees = Employee::select('id', 'first_name', 'last_name')->where('department_id', $data->department_id)->where('is_active',1)->where('exit_date',NULL)->get();

            return response()->json(['data' => $data, 'employees' => $employees, 'departments' => $departments]);
		}
	}

	public function update(Request $request)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('edit-ticket'))
		{
			$id = $request->hidden_id;

			$validator = Validator::make($request->only('subject', 'company_id', 'department_id', 'employee_id', 'ticket_priority', 'description', 'ticket_note'
			),
				[
					'subject' => 'required',
					'company_id' => 'required',
					'department_id' => 'required',
					'employee_id' => 'required',
					'ticket_priority' => 'required',
				]
//				,
//				[
//					'subject.required' => 'Subject can not be empty',
//							]
			);


			if ($validator->fails())
			{
				return response()->json(['errors' => $validator->errors()->all()]);
			}


			$data = [];

			$data['subject'] = $request->subject;
			$data ['description'] = $request->description;
			$data ['ticket_note'] = $request->ticket_note;


			$data['employee_id'] = $request->employee_id;

			$data ['company_id'] = $request->company_id;

			$data['department_id'] = $request->department_id;

			$data['ticket_priority'] = $request->ticket_priority;


			SupportTicket::whereId($id)->update($data);
			$ticket = SupportTicket::findOrFail($id);

            $companyIds = \DB::table('company_user')
                ->where('user_id', $data['employee_id'])  // ou $data['employee_id'], ajuste conforme seu dado
                ->pluck('company_id')
                ->toArray();

            // Busca usuários com role 1 ou 6 que pertençam a essas empresas
            $notificable = User::whereIn('role_users_id', [1, 6])
                    ->whereHas('companies', function($query) use ($companyIds) {
                        $query->whereIn('companies.id', $companyIds);
                    })
                    ->get();

			Notification::send($notificable, new TicketUpdatedNotification($ticket));


			return response()->json(['success' => __('Data is successfully updated')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function destroy($id)
	{
		if(!env('USER_VERIFIED'))
		{
			return response()->json(['error' => 'This feature is disabled for demo!']);
		}
		$logged_user = auth()->user();

		if ($logged_user->can('delete-ticket'))
		{
			$ticket = SupportTicket::findOrFail($id);
			$file_path = $ticket->ticket_attachment;

			if ($file_path)
			{
				$file_path = public_path('uploads/ticket_attachments/' . $file_path);
				if (file_exists($file_path))
				{
					unlink($file_path);
				}
			}

			$ticket->delete();

			return response()->json(['success' => __('Data is successfully deleted')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function delete_by_selection(Request $request)
	{
		if(!env('USER_VERIFIED'))
		{
			return response()->json(['error' => 'This feature is disabled for demo!']);
		}
		$logged_user = auth()->user();

		if ($logged_user->can('delete-ticket'))
		{
			$ticket_id = $request['ticketIdArray'];
			$tickets = SupportTicket::whereIntegerInRaw('id', $ticket_id)->get();

			foreach ($tickets as $ticket)
			{
				$file_path = $ticket->ticket_attachment;

				if ($file_path)
				{
					$file_path = public_path('uploads/ticket_attachments/' . $file_path);
					if (file_exists($file_path))
					{
						unlink($file_path);
					}
				}
				$ticket->delete();
			}

			return response()->json(['success' => __('Multi Delete', ['key' => __('Support Ticket')])]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function download($id)
	{

		$file = SupportTicket::findOrFail($id);

		$file_path = $file->ticket_attachment;

		$download_path = public_path("uploads/ticket_attachments/" . $file_path);

		if (file_exists($download_path))
		{
			$response = response()->download($download_path);

			return $response;
		} else
		{
			return abort('404', __('File not Found'));
		}
	}

    public function viewDocument($id)
    {
        $file = SupportTicket::findOrFail($id);
        $file_path = $file->ticket_attachment;
        $file_full_path = storage_path("app/uploads/ticket_attachments/" . $file_path);
        if (file_exists($file_full_path)) {
            return response()->file($file_full_path);
        } else {
            return abort(404, __('File not Found'));
        }
    }


	public function detailsStore(Request $request, SupportTicket $ticket)
	{

			$validator = Validator::make($request->only('ticket_remarks', 'ticket_status'),
				[
					'ticket_remarks' => 'nullable',
					'ticket_status' => 'required',
				]
//				,
//				[
//					'ticket_remarks.required' => 'Remarks can not be empty',
//					'ticket_status.required' => 'Please select a status',
//						]
			);


			if ($validator->fails())
			{
				return response()->json(['errors' => $validator->errors()->all()]);
			}


			$data = [];

			$data['ticket_remarks'] = $request->ticket_remarks;
			$data['ticket_status'] = $request->ticket_status;
            $data['employee_id'] = $ticket->employee_id;

			$ticket->update($data);

			$assigned = $ticket->assignedEmployees()->get();

            $companyIds = \DB::table('company_user')
                ->where('user_id', $data['employee_id'])
                ->pluck('company_id')
                ->toArray();

            // Busca usuários com role 1 ou 6 que pertençam a essas empresas
            $notificable = User::whereIn('role_users_id', [1, 6])
                    ->whereHas('companies', function($query) use ($companyIds) {
                        $query->whereIn('companies.id', $companyIds);
                    })
                    ->get();

			Notification::send($notificable, new TicketUpdatedNotification($ticket));

			if (sizeof($assigned) == 0)
			{
				Notification::send($assigned, new TicketUpdatedNotification($ticket));
			}

			return response()->json(['success' => 'Dados Atualizado com Sucesso.', 'ticket' => $ticket]);
		}


	public function notesStore(Request $request, SupportTicket $ticket)
	{
		$validator = Validator::make($request->only('ticket_note'),
			[
				'ticket_note' => 'required',
			]
				,
				[
					'ticket_note.required' => 'Note can not be empty',
				]
		);


		if ($validator->fails())
		{
			return response()->json(['errors' => $validator->errors()->all()]);
		}


		$data = [];

		$data['ticket_note'] = $request->ticket_note;

		$ticket->update($data);

		return response()->json(['success' => 'Dados Atualizado com Sucesso.', 'ticket' => $ticket]);
	}

    public function getDesignationsByDepartment($department_id)
    {
        $designations = designation::where('department_id', $department_id)->get();
        return response()->json($designations);
    }

    public function getDepartmentByCompany($company_id)
    {
        $departments = department::where('company_id', $company_id)->get();
        return response()->json($departments);
    }
}
