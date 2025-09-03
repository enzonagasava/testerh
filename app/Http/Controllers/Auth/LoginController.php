<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\IpSetting;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;


class LoginController extends Controller
{

    use AuthenticatesUsers;

    //redirect to the login page

    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

     // over riding the method for custom redirecting after login
     protected function authenticated(Request $request, $user)
     {
        Cache::put('teste_cache', 'valor_teste'. 600);
        Log::info('Antes do cache:' . Cache::get('teste_cache'));

        Artisan::call('cache:clear');

        Log::info('Depois cache:' . Cache::get('teste_cache'));

        //saving login timestamps and ip after login
        $user->timestamps = false;
        $user->last_login_date = Carbon::now()->toDateTimeString();
        $user->last_login_ip = $request->ip();
        $user->save();
        $response = null;

        try{
            if ($user->role_users_id == 1)
            {
                return redirect('/admin/dashboard');
            } // if client
            elseif ($user->role_users_id == 3)
            {
                return redirect('/client/dashboard');
            } //if employee
            else
            {
                return redirect('/employee/dashboard');
            }
        } catch (\Exception $e) {
            return redirect('/login')->withErrors(['msg'=> 'Erro ao acessar o Dashboard. Por favor, faça login novamente']);
        }

        return $response->header('Cache-Control', 'no-Cache', 'no-store, must-revalidate')
        ->header('Pragma', 'no-cache')
        ->header('Expires', '0');
    }


	public function username()
	{
		return 'username';
	}

}
