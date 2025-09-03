<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use App\Models\User;
use Illuminate\Http\Request;

use function auth;

class RouteClosureHandlerController extends Controller {

	//
	public function redirectToLogin()
	{
		return redirect('login');
	}

    public function markAsReadNotification(Request $request)
    {
        $notificationId = $request->input('id');

        $notification = auth()->user()->unreadNotifications()->where('id', $notificationId)->first();

        if ($notification) {
            $notification->markAsRead();
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false, 'message' => 'Notificação não encontrada'], 404);
    }


	public function allNotifications()
	{
		$all_notification = auth()->user()->notifications()->get();

		if(auth()->user()->role_users_id == 3)
		{
			return view('shared.client_all_notifications', compact('all_notification'));
		}
		return view('shared.all_notifications', compact('all_notification'));
	}

    public function clearAll()
    {
        $notifications = User::allUnreadNotifications();

        foreach ($notifications as $notification) {
            $notification->markAsRead();
        }

        return redirect()->back();
    }

	public function help()
	{
		return view('help.index');
	}
}
