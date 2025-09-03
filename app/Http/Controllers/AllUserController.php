<?php

namespace App\Http\Controllers;

use App\Models\company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Illuminate\Validation\Rule;

class AllUserController extends Controller {

    public function index()
    {
        $authUser = User::find(auth()->user()->id);
        $role = Role::find($authUser->role_users_id);
        $logged_user = auth()->user();

        //$users = User::with('RoleUser')->orderByDesc('is_active');
        $users = User::orderBy('is_active', 'desc')->get();
        $user = User::find(auth()->user()->id);


        $companies = company::all('id', 'company_name');
        $userCompanies = $user->companies->pluck('id')->toArray();

        if ($logged_user->can('view-user')) {
            if (request()->ajax()) {

                return datatables()->of($users)
                    ->setRowId(function ($user) {
                        return $user->id;
                    })
                    ->addColumn('username', function ($row) {
                        if ($row->profile_photo) {
                            $url = url("uploads/profile_photos/" . $row->profile_photo);
                            $profile_photo = '<img src="' . $url . '" class="profile-photo md" style="height:35px;width:35px"/>';
                        } else {
                            $url = url("logo/avatar.jpg");
                            $profile_photo = '<img src="' . $url . '" class="profile-photo md" style="height:35px;width:35px"/>';
                        }
                        $full_name  = "<span><a class='d-block text-bold' style='color:#24ABF2'>" . $row->first_name . ' ' . $row->last_name . "</a></span>";
                        $username = "<span><b>Nome do Usuário :</b> &nbsp;" . $row->username . "</span>";

                        return "<div class='d-flex'>
                                        <div class='mr-2'>" . $profile_photo . "</div>
                                        <div>"
                            . $full_name . '</br>' . $username . '</br>' .
                            // '<b>Role :</b> '.$row->RoleUser->role_name;
                            '<b>Cargo :</b> ' . $row->RoleUser->name . '</br>' .
                            '<b>Empresa:</b> ' . ($row->companies && $row->companies->count() ? $row->companies->pluck('company_name')->implode(', ') : 'Nenhuma empresa') .
                            "</div>
                            </div>";
                    })
                    ->addColumn('company', function($row) {
                        if ($row->companies && $row->companies->count() > 0) {
                            // Pega os nomes de todas as empresas e junta em uma string separada por vírgula
                            return $row->companies->pluck('company_name')->implode(', ');
                        } else {
                            return 'Nenhuma empresa';
                        }
                    })
                    ->addColumn('contacts', function ($row) {
                        $contact_no = "<i class='text-muted fa fa-phone' title='Phone'></i>&nbsp;" . $row->contact_no;
                        if ($row->email != null) {
                            $email = "<i class='fa fa-envelope text-muted' title='Email'></i>&nbsp;" . $row->email;
                            return $email . '</br>' . $contact_no;
                        } else {
                            return $contact_no;
                        }
                    })
                    ->addColumn('login_info', function ($row) {
                        return '<b>Último Login :</b> ' . $row->last_login_date . '</br>' . '<b>Último Login IP :</b> ' . $row->last_login_ip;
                    })
                    ->addColumn('action', function ($data) {
                        $button = '';
                        if (auth()->user()->can('edit-user')) {
                            if ($data->role_users_id != 1) {
                                $button = '<button type="button" name="edit" id="' . $data->id . '" class="edit btn btn-primary btn-sm"><i class="dripicons-document-edit"></i></button>';
                                $button .= '&nbsp;&nbsp;';
                            } else {
                                if ($data->id == auth()->user()->id) {
                                    $button = '<button type="button" name="edit" id="' . $data->id . '" class="edit btn btn-primary btn-sm"><i class="dripicons-document-edit"></i></button>';
                                    $button .= '&nbsp;&nbsp;';
                                }
                            }
                        }
                        if (auth()->user()->can('delete-user')) {
                            if ($data->role_users_id != 1) {
                                $button .= '<button type="button" name="delete" id="' . $data->id . '" class="delete btn btn-danger btn-sm"><i class="dripicons-cross"></i></button>';
                            }
                        }

                        return $button;
                    })
                    ->rawColumns(['username', 'contacts', 'login_info', 'action'])
                    ->make(true);
            }
            return view('all_user.index', [
                'companies' => $companies,
            ]);
        }
        return abort('403', __('You are not authorized'));
    }


	public function edit($id)
	{

		if (request()->ajax())
		{
            $data = User::with('companies')->findOrFail($id);
            $userCompanies = $data->companies->pluck('id')->toArray();



			return response()->json(['data' => $data, 'company_user' => $userCompanies]);
		}
	}

	// public function add_user_form()
	// {

	// 	$logged_user = auth()->user();

	// 	if ($logged_user->can('store-user'))
	// 	{

	// 		$data['roles'] = Role_User::select('id', 'role_name')->limit(2)->get();

	// 		return view('all_user.add_user_form', $data);
	// 	}

	// 	return abort('403', __('You are not authorized'));
	// }


	public function add_user_process(Request $request)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('store-employee'))
		{

            $validator = Validator::make(
                $request->all(),
                [
                    'first_name'    => 'required',
                    'last_name'     => 'required',
                    'username'      => 'required|unique:users',
                    'company_id'    => 'required',
                    'email'         => 'nullable|email|unique:users',
                    'contact_no'    => 'required|unique:users',
                    'password'      => 'required|min:4|confirmed',
                    'profile_photo' => 'nullable|image|max:10240|mimes:jpeg,png,jpg,gif',
                ],
                [
                    'first_name.required'    => 'O campo nome é obrigatório.',
                    'last_name.required'     => 'O campo sobrenome é obrigatório.',
                    'username.required'      => 'O campo nome de usuário é obrigatório.',
                    'username.unique'        => 'Este nome de usuário já está em uso.',
                    'company_id.required'    => 'Selecione uma empresa',
                    'email.email'            => 'O campo e-mail deve conter um endereço válido.',
                    'email.unique'           => 'Este e-mail já está cadastrado.',
                    'contact_no.required'    => 'O campo telefone é obrigatório.',
                    'contact_no.unique'      => 'Este telefone já está cadastrado.',
                    'password.required'      => 'O campo senha é obrigatório.',
                    'password.min'           => 'A senha deve conter pelo menos 4 caracteres.',
                    'password.confirmed'     => 'A confirmação da senha não corresponde.',
                    'profile_photo.image'    => 'O arquivo deve ser uma imagem.',
                    'profile_photo.max'      => 'A imagem não deve ultrapassar 10MB.',
                    'profile_photo.mimes'    => 'A imagem deve ser do tipo: jpeg, png, jpg, gif.',
                ]
            );

            if ($validator->fails())
            {
                return response()->json(['errors' => $validator->errors()->all()]);
            }
                $data = [];

                $data['first_name'] = $request->first_name;
                $data['last_name']  = $request->last_name;
                $data['username'] 	= strtolower(trim($request->username));
                $data['contact_no'] = $request->contact_no;
                $data['email'] 		= strtolower(trim($request->email));
                $data['password'] 	= bcrypt($request->password);
                $data['is_active'] 	= $request->is_active;
                $data['role_users_id'] = 1;
                $data['company_id'] = $request->company_id;

                $photo = $request->profile_photo;
                $file_name = null;


                if (isset($photo))
                {
                    $new_user = $request->username;
                    if ($photo->isValid())
                    {
                        $file_name = preg_replace('/\s+/', '', $new_user) . '_' . time() . '.' . $photo->getClientOriginalExtension();
                        $photo->storeAs('profile_photos', $file_name);
                        $data['profile_photo'] = $file_name;
                    }
                }


                $user = User::create([
                    'first_name' => $data['first_name'],
                    'last_name' => $data['last_name'],
                    'username' =>$data['username'],
                    'password' => $data['password'],
                    'email' => $data['email'],
                    'contact_no' => $data['contact_no'],
                    'is_active' => $data['is_active'],
                    'role_users_id' => 1,
                    'status_id' => 7,

                ]);
                // Employee::create([
                //     'id' => $user->id,
                //     'first_name' => $user->first_name,
                //     'last_name' => $user->last_name,
                //     'email' => $user->email,
                //     'contact_no' => $user->contact_no,
                //     'is_active' => $user->is_active,
                //     'company_id' => reset($data['company_id']),
                //     'role_users_id' => 1,
                //     'status_id' => 7,
                // ]);

                $companyIds = is_array($request->company_id) ? $request->company_id : [$request->company_id];

                // Sincroniza as empresas na tabela pivot company_user
                $user->companies()->sync($companyIds);

                $user->syncRoles(1);


                return response()->json(['success' => __('Data Added successfully.')]);
            }


            return abort('403', __('You are not authorized'));

        }

        public function process_update(Request $request)
        {
            if (!env('USER_VERIFIED')) {
                return response()->json(['success' => 'This feature is disabled for demo!']);
            }

            $logged_user = auth()->user();

            if ($logged_user->can('edit-user')) {
                $id = $request->hidden_id;

                $messages = [
                    'first_name.required' => 'O nome é obrigatório.',
                    'last_name.required' => 'O sobrenome é obrigatório.',
                    'username.required' => 'O nome de usuário é obrigatório.',
                    'username.unique' => 'Este nome de usuário já está em uso.',
                    'contact_no.required' => 'O telefone é obrigatório.',
                    'contact_no.unique' => 'Este telefone já está cadastrado.',
                    'email.email' => 'O email informado não é válido.',
                    'password.min' => 'A senha deve ter no mínimo 4 caracteres.',
                    'password.confirmed' => 'A confirmação da senha não confere.',
                    'profile_photo.image' => 'O arquivo deve ser uma imagem válida.',
                    'company_id.array' => 'O campo empresa deve ser um array.',
                    'company_id.*.exists' => 'A empresa selecionada é inválida.',
                    'is_active.in' => 'O campo status deve ser ativo ou inativo.',
                ];

                $validator = Validator::make($request->all(), [
                    'first_name'    => 'required|string',
                    'last_name'     => 'required|string',
                    'username'      => ['required', 'string', Rule::unique('users', 'username')->ignore($id)],
                    'contact_no'    => ['required', Rule::unique('users', 'contact_no')->ignore($id)],
                    'email'         => 'nullable|email',
                    'password'      => 'nullable|string|min:4|confirmed',
                    'profile_photo' => 'nullable|image|max:10240|mimes:jpeg,png,jpg,gif',
                    'company_id'    => 'nullable|array',
                    'company_id.*'  => 'exists:companies,id',
                    'is_active'     => 'required|in:0,1',
                ], $messages);

                if ($validator->fails())
                {
                    return response()->json(['errors' => $validator->errors()]);
                }


            $data = [
                'first_name' => $request->first_name,
                'last_name'  => $request->last_name,
                'username'   => strtolower(trim($request->username)),
                'contact_no' => $request->contact_no,
                'email'      => strtolower(trim($request->email)),
                'is_active'  => (int) $request->is_active,
            ];

            // Tratar upload de foto
            if ($request->hasFile('profile_photo') && $request->file('profile_photo')->isValid()) {
                $photo = $request->file('profile_photo');
                $file_name = preg_replace('/\s+/', '', $request->username) . '_' . time() . '.' . $photo->getClientOriginalExtension();
                $photo->storeAs('profile_photos', $file_name);
                $data['profile_photo'] = $file_name;
            }

            // Atualizar senha somente se preenchida
            if ($request->filled('password')) {
                $data['password'] = bcrypt($request->password);
            }

            // Atualiza os dados do usuário (exceto company_id)
            User::whereId($id)->update($data);

            $user = User::findOrFail($id);

            // Sincroniza o relacionamento many-to-many com empresas
            if ($request->has('company_id') && is_array($request->company_id)) {
                $user->companies()->sync($request->company_id);
            } else {
                // Se não enviou empresas, desvincula todas
                $user->companies()->sync([]);
            }

            // Atualiza tabela employees (assumindo que id é o mesmo)
            Employee::whereId($id)->update([
                'first_name' => $data['first_name'],
                'last_name'  => $data['last_name'],
                'email'      => $data['email'],
                'contact_no' => $data['contact_no'],
                'is_active'  => $data['is_active'],
            ]);

            return response()->json(['success' => __('Data is successfully updated')]);
        }

        return response()->json(['success' => __('You are not authorized')]);
    }

	public function login_info()
	{

		$logged_user = auth()->user();

		if ($logged_user->can('last-login-user'))
		{

			$login_info = User::select('id', 'username', 'profile_photo', 'last_login_date', 'last_login_ip', 'is_active')->latest('last_login_date')->get();

			return view('all_user.login_info', ['login_info' => $login_info]);
		}

		return abort('403', __('You are not authorized'));

	}

	public function user_roles()
	{
		$logged_user = auth()->user();
		if(auth()->user()->role_users_id == 1) {
			$roles = Role::where('id', '!=', 3)->where('is_active',1)->select('id', 'name')->get();
		}
		else {
			$roles = Role::where('id', '!=', 1)->where('id', '!=', 3)->where('is_active',1)->select('id', 'name')->get();
		}


		if ($logged_user->can('role-access-user'))
		{
			$users = User::with('roles')->get();

			//return $users;

			if (request()->ajax())
			{
				return datatables()->of($users)
					->addColumn('role_name', function ($row)
					{
						foreach ($row->roles as $role)
						{
							return $role->name;
						};

						return null;
					})
					->setRowId(function ($user)
					{
						return $user->id;
					})
					->addColumn('role-access-user', function ($data)
					{
						return '';
					})
					->make(true);
			}


			return view('all_user.user_roles', compact('roles'));
		}

		return abort('403', __('You are not authorized'));

	}


	public function delete_user($id)
	{
		if (!env('USER_VERIFIED'))
		{
			return response()->json(['success' => 'This feature is disabled for demo!']);
		}

		$logged_user = auth()->user();

		if ($logged_user->can('delete-user'))
		{
			$user = User::findOrFail($id);
			$file_path = $user->profile_photo;

			if ($file_path)
			{
				$file_path = public_path('uploads/profile_photos/' . $file_path);
				if (file_exists($file_path))
				{
					unlink($file_path);
				}
			}

			$user->delete();

			return response()->json(['success' => __('Data is successfully deleted')]);

		}

		return response()->json(['success' => __('You are not authorized')]);
	}


	public function delete_by_selection(Request $request)
	{

		if (!env('USER_VERIFIED'))
		{
			return response()->json(['error' => 'This feature is disabled for demo!']);
		}
		$logged_user = auth()->user();


		if ($logged_user->can('delete-user'))
		{
			$user_id = $request['userIdArray'];

			$user = User::whereIntegerInRaw('id', $user_id)->where('role_users_id','!=',1);

			if ($user->delete())
			{
				return response()->json(['success' => __('Multi Delete', ['key' => trans('file.User')])]);
			} else
			{
				return response()->json(['error' => 'Error selected users can not be deleted']);
			}
		}

		return response()->json(['success' => __('You are not authorized')]);
	}
}
