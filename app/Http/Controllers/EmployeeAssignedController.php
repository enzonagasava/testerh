<?php

namespace App\Http\Controllers;


use App\Notifications\TicketAssignedNotification;
use App\Models\Project;
use App\Models\SupportTicket;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Notification;

class EmployeeAssignedController extends Controller {

	public function employeeTicketAssigned(Request $request, SupportTicket $ticket)
	{
		if (auth()->user()->can('assign-ticket'))
		{
			$employees = $request->input('employee_id');
            $employees = is_array($employees) ? $employees : [$employees];
            $ticket->assignedEmployees()->sync($employees);

            $companyIds = \DB::table('company_user')
                ->where('user_id', $employees)  // ou $data['employee_id'], ajuste conforme seu dado
                ->pluck('company_id')
                ->toArray();

            // Busca usuários com role 1 ou 6 que pertençam a essas empresas
            $notificable = User::whereIn('role_users_id', [1, 6])
                    ->whereHas('companies', function($query) use ($companyIds) {
                        $query->whereIn('companies.id', $companyIds);
                    })
                    ->get();

			Notification::send($notificable, new TicketAssignedNotification($ticket));

			return response()->json(['success' => __('Data Added successfully.')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function employeeProjectAssigned(Request $request, Project $project)
	{
		if (auth()->user()->can('assign-project'))
		{
			$employees = $request->input('employee_id');
			$project->assignedEmployees()->sync($employees);

			return response()->json(['success' => __('Data Added successfully.')]);
		}
		return response()->json(['success' => __('You are not authorized')]);
	}

	public function employeeTaskAssigned(Request $request, Task $task)
	{
		if (auth()->user()->can('assign-task'))
		{
			$employees = $request->input('employee_id');
			$task->assignedEmployees()->sync($employees);

			return response()->json(['success' => __('Data Added successfully.')]);
		}
		return response()->json(['success' => __('You are not authorized')]);
	}
}
