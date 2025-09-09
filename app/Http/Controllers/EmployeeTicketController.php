<?php

namespace App\Http\Controllers;

use DB;
use App\Models\SupportTicket;
use Exception;

class EmployeeTicketController extends Controller {

	public function index($employee)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('view-details-employee') || $logged_user->id == $employee)
		{
			if (request()->ajax())
			{
				return datatables()->of(SupportTicket::where('employee_id', $employee)->get())
					->setRowId(function ($ticket)
					{
						return $ticket->id;
					})
					->addColumn('ticket_details', function ($row)
					{
						if ($row->ticket_attachment)
						{
							return $row->ticket_code . '<br><h6><a href="' . route('tickets.downloadTicket', $row->id) . '">' . trans('file.File') . '</a></h6>';
                            //'<br><td><b><i>"' . $row->ticket_status.'"</i></b>';
						} else
						{
							return $row->ticket_code;
						}
					})
					->addColumn('action', function ($data) use ($logged_user,$employee)
					{
						$button = '';
						// if (auth()->user()->can('view-details-employee') || $logged_user->id == $employee)
						if (auth()->user()->can('view-details-employee') || $logged_user->id == $employee)						{
							$button = '<a id="' . $data->id . '" class="show btn btn-primary btn-sm" href="' . route('tickets.show', $data) . '"><i class="dripicons-preview"></i></a>';
						}

                        if ($data->ticket_attachment) {
                            $button .= '<button id="' . $data->id . '" class="ml-1 btn btn-success btn-sm document_view" data-link="' . route('tickets.viewDocument', $data->id) . '"><i class="dripicons-document"></i></button>&nbsp;&nbsp;';
                        }

						return $button;
					})
					->rawColumns(['action', 'ticket_details'])
					->make(true);
			}
		}
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

        if ($logged_user->can('view-ticket') || in_array($logged_user->id, $name))
		{

			$employees = DB::table('employees')
				->select('employees.id', DB::raw("CONCAT(employees.first_name,' ',employees.last_name) as full_name"))
				->get();

			return view('SupportTicket.details', compact('ticket', 'employees', 'name', 'company', 'department'));
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

}
