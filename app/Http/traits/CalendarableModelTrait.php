<?php


namespace App\Http\traits;


use App\Models\Event;
use App\Models\Holiday;
use App\Models\leave;
use App\Models\Meeting;
use App\Models\Project;
use App\Models\Task;
use App\Models\TrainingList;
use App\Models\Travel;

trait CalendarableModelTrait {

    protected function getHolidays(){
        $holidays = Holiday::where('is_publish', 1)
            ->whereIn('company_id',  auth()->user()->companies->pluck('id'))
            ->get();

        return $holidays;
    }

    protected function getLeaves(){
        $leaves = Leave::with('LeaveType:id,leave_type', 'employee:id,first_name,last_name,company_id')
            ->whereHas('employee', function ($query) {
                $query->whereIn('company_id',  auth()->user()->companies->pluck('id'));
            })
            ->get();

        return $leaves;
    }

    protected function getTravels(){
        $travels = Travel::with('TravelType:id,arrangement_type', 'employee:id,company_id')
            ->where('status', 'approved')
            ->whereHas('employee', function ($query) {
                $query->whereIn('company_id',  auth()->user()->companies->pluck('id'));
            })
            ->get();

        return $travels;
    }

    protected function getTrainings(){
        $training = TrainingList::with(
                'TrainingType:id,type',
                'employees:id,first_name,last_name,company_id',
                'trainer:id,first_name,last_name'
            )
            ->whereHas('employees', function ($query) {
                $query->whereIn('company_id',  auth()->user()->companies->pluck('id'));
            })
            ->get();

        return $training;
    }

    protected function getProjects(){
        $projects = Project::whereIn('company_id',  auth()->user()->companies->pluck('id'))
            ->select('id', 'title', 'start_date', 'end_date')
            ->get();

        return $projects;
    }

    protected function getTasks(){
        $tasks = Task::whereIn('company_id',  auth()->user()->companies->pluck('id'))
            ->select('id', 'task_name', 'start_date', 'end_date')
            ->get();

        return $tasks;
    }

    protected function getEvents(){
        $events = Event::where('status', 'approved')
            ->whereIn('company_id',  auth()->user()->companies->pluck('id'))
            ->get();

        return $events;
    }

    protected function getMeetings(){
        $meetings = Meeting::select('id', 'meeting_title', 'meeting_date', 'meeting_time')
            ->where('status', 'ongoing')
            ->where('company_id', auth()->user()->company_id)
            ->get();

        return $meetings;
    }

    // protected function getBirthdays(){
    //     $birthdays = Employee::select('id', 'first_name', 'last_name', 'date_of_birth')
    //         ->where('company_id', auth()->user()->company_id)
    //         ->get();

    //     return $birthdays;
    // }
}
