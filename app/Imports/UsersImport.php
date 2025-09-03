<?php

namespace App\Imports;

use App\Models\Employee;
use App\Models\User;
use App\Models\company;
use App\Models\department;
use App\Models\designation;
use App\Models\Country;
use App\Models\office_shift;
use Spatie\Permission\Models\Role;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;
use Carbon\Carbon;
use \PhpOffice\PhpSpreadsheet\Shared\Date;

HeadingRowFormatter::default('none'); // Ignorar linhas vazias

class UsersImport implements ToModel,WithHeadingRow, ShouldQueue,WithChunkReading,WithBatchInserts, WithValidation
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

	use Importable;

        public function headingRow(): int{
                return 3; // Define em que linha estão os cabeçalhos
        }

        public function prepareForValidation(array $row){
            // Filtrar colunas nulas antes da validação
            return array_map(fn($value) => is_string($value) ? trim($value) : $value, $row);
        }

        public function model(array $row)
        {
            // Colunas
            if (empty(array_filter($row, fn($value) => !is_null($value) && trim($value) !== ''))) {
                return null; // Ignorar a linha
            }

            $name = $row['Nome'] ?? null;
            $codigo = $row['CPF'] ?? null;
            $celular = $row['Celular'] ?? null;

            // Verificar se já existe um usuário ou funcionário com o mesmo nome
            $existingUser = User::whereRaw('LOWER(first_name) = ?', [strtolower($name)])->first();
            $existingEmployee = Employee::whereRaw('LOWER(first_name) = ?', [strtolower($name)])->first();

            if ($existingUser || $existingEmployee) {
                // Log para indicar que o usuário ou funcionário já existe
                logger()->info("Usuário ou funcionário '{$name}' já existe, não será criado novamente.");

                // Mensagem para exibição na tela
                session()->flash('error', "Usuário ou funcionário '{$name}' já existe, não será criado novamente.");
                return null; // Ignorar a linha
            }

            // Separação do departamento e designação
            $department = $row['Serviço'] ?? null;
            if (!empty($department)) {
                $pos = strpos($department, '-');
                if ($pos !== false) {
                    $department_name = trim(substr($department, 0, $pos));
                    $designation_part = trim(substr($department, $pos + 1));

                    if (empty($department_name)) {
                        $department_name = 'Departamento não informado';
                    }
                    if (empty($designation_part)) {
                        $designation_part = 'Designação não informada';
                    }
                } else {
                    $department_name = trim($department);
                    $designation_part = 'Designação não informada';
                }
            } else {
                $department_name = 'Departamento não informado';
                $designation_part = 'Designação não informada';
            }

            // Converte data de nascimento
            $date_of_birth = Date::excelToDateTimeObject($row['Dat.Nasc'] ?? null);

            // Converte data de admissão
            $joiningDate = $row['Admissão'] ?? null;
            if (isset($joiningDate) && is_numeric($joiningDate) && $joiningDate > 0) {
                try {
                    $dateTimeObject = Date::excelToDateTimeObject($joiningDate);
                    $joiningDate = Carbon::instance($dateTimeObject);
                } catch (\Exception $e) {
                    logger()->error("Erro ao converter número de série da data de admissão '{$joiningDate}': " . $e->getMessage());
                    $joiningDate = null;
                }
            } elseif (isset($joiningDate) && is_string($joiningDate)) {
                try {
                    $joiningDate = Carbon::createFromFormat('Y-m-d', $joiningDate);
                } catch (\Exception $e) {
                    logger()->error("Erro ao parsear string de data de admissão '{$joiningDate}': " . $e->getMessage());
                    $joiningDate = null;
                }
            }

            // Processamento do restante dos dados
            $company = company::whereRaw('LOWER(company_name) = ?', [strtolower($row['Nome da Empresa '] ?? null)])->first();
            $company_id = $company->id ?? null;

            $department = department::whereRaw('LOWER(department_name) = ?', [strtolower($department_name)])->first();
            if (!$department) {
                $department = department::create([
                    'department_name' => $department_name,
                    'company_id' => $company_id,
                ]);
                logger()->info("Departamento '{$department_name}' criado.");
            }

            $designation = designation::whereRaw('LOWER(designation_name) = ?', [strtolower($designation_part)])
                ->where('department_id', optional($department)->id)
                ->first();

            if (!$designation) {
                $designation = designation::create([
                    'designation_name' => $designation_part,
                    'company_id' => $company_id,
                    'department_id' => optional($department)->id,
                ]);
                logger()->info("Cargo '{$designation_part}' criado no departamento '{$department_name}'.");
            }

            $office_shift = office_shift::where('company_id', $company_id)->first();
            $role = Role::where('name', $row['perfil'] ?? 'Funcionário')->first();

            $user = User::create([
                'first_name' => $name,
                'username' => $name,
                'password' => Hash::make($row['senha'] ?? '123456'),
                'contact_no' => $celular,
                'role_users_id' => optional($role)->id,
                'is_active' => 1,
                'company_id' => $company_id,
            ]);

            if ($user && $company_id) {
                $company = Company::find($company_id);
                if ($company) {
                    $user->companies()->attach($company->id);
                }
            }

            return Employee::create([
                'id' => $user->id,
                'first_name' => $name,
                'staff_id' => $codigo,
                'email' => $row['email'] ?? null,
                'contact_no' => $celular,
                'joining_date' => $joiningDate,
                'date_of_birth' => $date_of_birth,
                'city' => $row['municipio'] ?? null,
                'company_id' => $company_id,
                'department_id' => optional($department)->id,
                'designation_id' => optional($designation)->id,
                'office_shift_id' => optional($office_shift)->id,
                'role_users_id' => optional($role)->id,
                'is_active' => 1,
                'basic_salary' => $row['salario'] ?? null,
                'status_id' => 7,
            ]);
        }

        public function rules(): array
        {
            return [
            'codigo' => 'nullable|numeric|unique:employees,staff_id',
            'nome' => 'nullable|string|max:255',
            'email' => 'nullable|email|unique:users,email',
            'celular' => 'nullable|numeric',
            'cpf' => 'nullable|unique:users',
            'admissao' => 'nullable|numeric', // Formato de data esperado
            'company' => 'nullable|string', // Correto para a tabela 'company'
            'servico' => 'nullable', // Pode ser mais específico
            'cargo' => 'nullable|string', // Pode ser mais específico
            'turno' => 'nullable|exists:office_shifts,shift_name', // Correto
            ];
        }



        public function chunkSize(): int
        {
            return 500;
        }

        public function batchSize(): int
        {
            return 1000;
        }
    }
