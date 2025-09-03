<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeDocument;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class EmployeeDocumentController extends Controller {

	public function show(Employee $employee)
	{
		$logged_user = auth()->user();
		$employee_id = $employee->id;

		if ($logged_user->can('view-details-employee')||$logged_user->id==$employee_id)
		{
			if (request()->ajax())
			{
				return datatables()->of(EmployeeDocument::with('DocumentType')->where('employee_id', $employee->id)
                ->where('is_active', true)
                ->get())
					->setRowId(function ($document)
					{
						return $document->id;
					})
					->addColumn('document', function ($row)
					{
						return $row->DocumentType->document_type;
					})
					->addColumn('expiry_date', function ($row)
					{
						return $row->expiry_date;
					})
					->addColumn('title', function ($row)
					{
						if ($row->document_file)
						{
							return $row->document_title . '<br><h6><a class="text-primary" href="' . route('documents_document.download', $row->id) . '">' . trans('file.File') . '</a></h6>';
						} else
						{
							return $row->document_title;
						}
					})
					->addColumn('action', function ($data) use ($logged_user,$employee_id)
					{
						if ($logged_user->can('modify-details-employee')||$logged_user->id==$employee_id)
						{
                            $button = '';
							//$button = '<button type="button" name="edit" id="' . $data->id . '" class="document_edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>';
							$button .= '&nbsp;&nbsp;';

                            $button .= '<button type="button" name="view" id="' . $data->id . '" data-link="' . route('documents_document.view', $data->id)  . '" class="document_view btn btn-success btn-sm"><i class="dripicons-preview"></i></button>';
                            $button .= '&nbsp;&nbsp;';

                            $button .= '<a href="' . route('documents_document.download', $data->id) . '" class="btn btn-info btn-sm"><i class="dripicons-download"></i></a>';
                            $button .= '&nbsp;&nbsp;';

                            $button .= '<button type="button" name="delete" id="' . $data->id . '" class="document_delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';

							return $button;
						} else
						{
							return '';
						}
					})
					->rawColumns(['action', 'title'])
					->make(true);
			}
		}

	}

    public function showTicket()
{
    $logged_user = auth()->user();

    if ($logged_user->can('view-ticket')) {
        if (request()->ajax()) {
            return datatables()->of(Ticket::with(['employee', 'company'])
                ->get())
                ->setRowId(function ($ticket) {
                    return $ticket->id;
                })
                ->addColumn('ticket_details', function ($row) {
                    // Você pode montar um campo customizado aqui, se quiser
                    return $row->ticket_code ?? '—'; // Exemplo de código do ticket
                })
                ->addColumn('employee', function ($row) {
                    return $row->employee ? $row->employee->first_name . ' ' . $row->employee->last_name : '';
                })
                ->addColumn('company', function ($row) {
                    return $row->company ? $row->company->company_name : '';
                })
                ->addColumn('subject', function ($row) {
                    return $row->subject;
                })
                ->addColumn('ticket_priority', function ($row) {
                    return ucfirst($row->ticket_priority);
                })
                ->addColumn('ticket_status', function ($row) {
                    return ucfirst($row->ticket_status);
                })
                ->addColumn('created_at', function ($row) {
                    return $row->created_at ? $row->created_at->format('Y-m-d') : '';
                })
                ->addColumn('action', function ($row) use ($logged_user) {
                    if ($logged_user->can('modify-ticket')) {
                        $button = '';
                        $button .= '<button type="button" name="edit" id="' . $row->id . '" class="edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>';
                        $button .= '&nbsp;&nbsp;';
                        $button .= '<button type="button" name="delete" id="' . $row->id . '" class="delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';
                        return $button;
                    }
                    return '';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    abort(403, 'Unauthorized action.');
}


	public function store(Request $request, $employee)
	{
		$logged_user = auth()->user();
		if ($logged_user->can('store-details-employee')||$logged_user->id==$employee)
		{
			$validator = Validator::make($request->only('document_title', 'document_type_id', 'expiry_date',
				'description', 'document_file', 'is_notify'),
				[
					'document_title' => 'required',
					'document_type_id' => 'required',
					'expiry_date' => 'required',
					'document_file' => 'nullable|file|max:10240|mimes:jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf',
				]
//				,
//				[
//					'document_title.required' => 'Document Title can not be empty',
//					'expiry_date.required' => 'Expiry Date can not be empty',
//					'document_type_id.required' => 'Please select document Type',
//					'notification_email.email' => 'please enter a valid email',
//					'document_file.file'=>'File is not valid',
//					'document_file.max'=>'File must be less than 10 mb',
//					'document_file.mimes'=>'File must be of (jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf) type',
//				]
			);


			if ($validator->fails())
			{
				return response()->json(['errors' => $validator->errors()->all()]);
			}


			$data = [];

			$data['document_title'] = $request->document_title;
			$data['employee_id'] = $employee;
			$data['document_type_id'] = $request->document_type_id;
			$data ['expiry_date'] = $request->expiry_date;
			$data ['description'] = $request->description;
			$data['is_notify'] = $request->is_notify;

			$file = $request->document_file;

			$file_name = null;

			if (isset($file))
			{
				$file_name = $data['document_title'];
                $file_name = preg_replace('/\s+/', '_', $file_name);

				if ($file->isValid())
				{
					$file_name = $file_name . '.' . time() . '.' . $file->getClientOriginalExtension();
					$file->storeAs('document_documents', $file_name);
					$data['document_file'] = $file_name;
				}
			}

			EmployeeDocument::create($data);


			return response()->json(['success' => __('Data Added successfully.')]);
		}

		return response()->json(['success' => __('You are not authorized')]);

	}

	public function edit($id)
	{
		if (request()->ajax())
		{
			$data = EmployeeDocument::findOrFail($id);

			return response()->json(['data' => $data]);
		}
	}

	public function update(Request $request)
	{
		$id = $request->hidden_id;
		$logged_user = auth()->user();
		if ($logged_user->can('modify-details-employee')||$logged_user->id==$id)
		{
			$validator = Validator::make($request->only('document_title', 'document_type_id', 'expiry_date',
				'description', 'document_file', 'is_notify'),
				[
					'document_title' => 'required',
					'document_type_id' => 'required',
					'expiry_date' => 'required',
					'document_file' => 'nullable|file|max:10240|mimes:jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf',
				]
//				,
//				[
//					'document_title.required' => 'Document Title can not be empty',
//					'expiry_date.required' => 'Expiry Date can not be empty',
//					'document_type_id.required' => 'Please select document Type',
//					'notification_email.email' => 'please enter a valid email',
//					'document_file.file'=>'File is not valid',
//					'document_file.max'=>'File must be less than 10 mb',
//					'document_file.mimes'=>'File must be of (jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf) type',
//				]
			);


			if ($validator->fails())
			{
				return response()->json(['errors' => $validator->errors()->all()]);
			}


			$data = [];

			$data['document_title'] = $request->document_title;
			$data['document_type_id'] = $request->document_type_id;
			$data ['expiry_date'] = $request->expiry_date;
			$data ['description'] = $request->description;
			$data['is_notify'] = $request->is_notify;


			$file = $request->document_file;

			$file_name = null;

			if (isset($file))
			{
				$this->unlink($id);
				$file_name = $data['document_title'];
				if ($file->isValid())
				{
					$file_name = $file_name . '.' . time() . '.' . $file->getClientOriginalExtension();
					$file->storeAs('document_documents', $file_name);
					$data['document_file'] = $file_name;
				}
			}

			EmployeeDocument::find($id)->update($data);

			return response()->json(['success' => __('Data is successfully updated')]);
		} else
		{

			return response()->json(['success' => __('You are not authorized')]);
		}
	}

	public function unlink($id)
	{

		$document = EmployeeDocument::findOrFail($id);
		$file_path = $document->document_file;

		if ($file_path)
		{
			$file_path = public_path('uploads/document_documents/' . $file_path);
			if (file_exists($file_path))
			{
				unlink($file_path);
			}
		}
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$logged_user = auth()->user();
		if ($logged_user->can('modify-details-employee')||$logged_user->id==$id)
		{

			//$this->unlink($id);
			EmployeeDocument::whereId($id)->update(['is_active' => false]);

			return response()->json(['success' => __('Data is successfully deleted')]);

		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function download($id)
	{
		$file = EmployeeDocument::findOrFail($id);

		$file_path = $file->document_file;

		$download_path = public_path("uploads/document_documents/" . $file_path);

		if (file_exists($download_path))
		{
			$response = response()->download($download_path);

			return $response;
		} else
		{
			return abort('404', __('File not Found'));
		}
	}

    public function view($id)
	{
		$file = EmployeeDocument::findOrFail($id);

		$file_path = $file->document_file;

		$download_path = public_path("uploads/document_documents/" . $file_path);

		if (file_exists($download_path))
		{
            $headers = [
                'Content-Type' => 'application/pdf',
            ];
            return response()->file($download_path, $headers);

			return $response;
		} else
		{
			return abort('404', __('File not Found'));
		}
	}
}
