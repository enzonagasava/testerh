<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Http;

class Employee extends Model
{
	use Notifiable;
    protected $fillable = [
        'id',
        'first_name',
        'last_name',
        'is_physically_disabled',
        'is_street_vendor',
        'staff_id',
        'email',
        'contact_no',
        'date_of_birth',
        'gender',
        'status_id',
        'office_shift_id',
        'salary_id',
        'location_id',
        'designation_id',
        'district_id',
        'company_id',
        'department_id',
        'is_active',
        'role_users_id',
        'permission_role_id',
        'joining_date',
        'exit_date',
        'marital_status',
        'address',
        'address_number',
        'latitude',
        'longitude',
        'city',
        'state',
        'country',
        'zip_code',
        'cv',
        'skype_id',
        'fb_id',
        'twitter_id',
        'linkedIn_id',
        'blogger_id',
        'basic_salary',
        'payslip_type',
        'leave_id',
        'attendance_id',
        'performance_id',
        'award_id',
        'transfer_id',
        'resignation_id',
        'travel_id',
        'promotion_id',
        'complain_id',
        'warning_id',
        'termination_id',
        'attendance_type',
        'total_leave',
        'remaining_leave',
        'pension_type',
        'pension_amount',
        'area'
    ];


	public function getFullNameAttribute() {
		return ucfirst($this->first_name) . ' ' . ucfirst($this->last_name);
	}

	public function getBirthDateAttribute() {
		return $this->date_of_birth;
	}

    public function resignation() {
        return $this->hasOne(Resignation::class, 'regination_id', 'id');
    }

	public function department(){
		return $this->hasOne('App\Models\department','id','department_id');
	}

	public function officeShift(){
		return $this->hasOne('App\Models\office_shift','id','office_shift_id');
	}

	public function company(){
		return $this->hasOne('App\Models\company','id','company_id');
	}

	public function designation(){
		return $this->hasOne('App\Models\designation','id','designation_id');
	}

	public function status(){
		return $this->hasOne('App\Models\status','id','status_id');
	}

	public function user(){
		return $this->hasOne('App\Models\User','id','id');
	}

	public function role(){
		return $this->hasOne('Spatie\Permission\Models\Role','id','role_users_id');
	}

	public function salaryBasic(){
		return $this->hasMany(SalaryBasic::class);
	}

	public function allowances(){
		return $this->hasMany(SalaryAllowance::class);
	}
	public function deductions(){
		return $this->hasMany(SalaryDeduction::class);
	}
	public function commissions(){
		return $this->hasMany(SalaryCommission::class);
	}
	public function loans(){
		return $this->hasMany(SalaryLoan::class);
	}
	public function otherPayments(){
		return $this->hasMany(SalaryOtherPayment::class);
	}
	public function overtimes(){
		return $this->hasMany(SalaryOvertime::class);
	}
	public function payslips(){
		return $this->hasMany(Payslip::class);
	}

	public function payslipNew(){
		return $this->hasOne(Payslip::class);
	}

	public function employeeAttendance(){
		return $this->hasMany(Attendance::class);
	}

	public function employeeLeave(){
		return $this->hasMany(leave::class)
			->select('id','start_date','end_date','status','employee_id','leave_type_id','total_days')
			->whereStatus('approved');
	}
	public function employeeLeaveTypeDetail(){
		return $this->hasOne(EmployeeLeaveTypeDetail::class);
	}

    public function employeeQualifications() {
        return $this->hasMany(EmployeeQualificaiton::class, 'employee_id', 'id');
    }

    public function district() {
        return $this->belongsTo(District::class, 'district_id', 'id');
    }

	public function setDateOfBirthAttribute($value)
	{
		$this->attributes['date_of_birth'] = Carbon::createFromDate($value)->format('Y-m-d');
	}

	public function getDateOfBirthAttribute($value)
	{
		return Carbon::parse($value)->format(env('Date_Format'));
	}

	public function setJoiningDateAttribute($value)
	{
		$this->attributes['joining_date'] = Carbon::createFromDate($value)->format('Y-m-d');
	}

	public function getJoiningDateAttribute($value)
	{
		if($value === null)
		{
			return '';
		}
		else{
			return Carbon::parse($value)->format(env('Date_Format'));
		}
	}

	// public function setExitDateAttribute($value)
	// {
    //     $this->attributes['exit_date'] = Carbon::createFromFormat(env('Date_Format'), $value)->format('Y-m-d');
	// }

	public function getExitDateAttribute($value)
	{
		if($value === null)
		{
			return '';
		}
		else{
			return Carbon::parse($value)->format(env('Date_Format'));
		}
	}

    public function formattedAddress() {
        return $this->address . ' ' . $this->address_number . ', ' . $this->zip_code . ', ' . $this->city;
    }

    public function getGeoLocation() {
        try {
            $response = Http::get(env('TOMTOM_API_URL') . '/search/2/geocode/' . urlencode($this->formattedAddress()) . '.json?key=' . env('TOMTOM_API_KEY'));
            $result = $response->json('results')[0];

            $this->latitude = $result['position']['lat'];
            $this->longitude = $result['position']['lon'];
            // return $response->json('results')[0]['position']['lat'];
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }

    public function getGoogleGeoLocation() {
        try {
            $response = Http::get(env('GOOGLE_MAPS_URL') . '/maps/api/geocode/json?address=' . urlencode($this->formattedAddress()) . '&key=' . env('GOOGLE_MAPS_API_KEY'));

            $result = $response->json('results')[0]['geometry']['location'];

            $this->latitude = $result['lat'];
            $this->longitude = $result['lng'];
            // return $response->json('results')[0]['position']['lat'];
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }

}
