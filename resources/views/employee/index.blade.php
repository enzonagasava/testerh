@extends('layout.main')
@section('content')
    <section>
            @php
                $user = auth()->user();
            @endphp

        @if($user->company_id == null){
            @if ($user->companies()->count() == 0)
                <div class="alert alert-danger">
                    <strong>Você não esta vinculada a nenhuma empresa</strong>
                    <p>Para se vincular á uma empresa, atualize o seu perfil em <a href="/users-list" >lista de usuários.</a></p>
                </div>
            @endif
            <script>
                $(document).ready(function() {
                    $('#create_record').hide();
                    $('#filterSubmit').hide();
                    $('#employee-table').DataTable().clear().draw();
                });
            </script>
        }
        @endif

        <div class="container-fluid"><span id="general_result"></span></div>


        <div class="container-fluid mb-3">
            @can('store-details-employee')
                <button type="button" class="btn btn-info" name="create_record" id="create_record"><i class="fa fa-plus"></i>
                    Adicionar Funcionário</button>
            @endcan
            @can('modify-details-employee')
                {{-- <button type="button" class="btn btn-danger" name="bulk_delete" id="bulk_delete"><i
                        class="fa fa-minus-circle"></i> {{ __('Bulk delete') }}</button> --}}
            @endcan
            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
                <i class="fa fa-filter" aria-hidden="true"></i> Filtro
            </button>
        </div>
        <div class="col-12">
            <!-- Filtering -->
            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <form action="" method="GET" id="filter_form">
                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="text-bold"><strong>Nome do Funcionário</strong></label>
                                    <input type="text" name="employee_name" id="employee_name_filter" class="form-control" placeholder="Digite o nome para buscar...">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="text-bold"><strong>Departamento</strong></label>
                                        <select name="department_id_filter" id="department_id_filter" class="form-control selectpicker dynamic"
                                               placeholder="Selecione o departamento para buscar..." data-live-search="true">
                                            <option value="">Selecione o departamento</option>
                                            @foreach($departments as $department)
                                                <option value="{{$department->id}}">{{$department->department_name}}</option>
                                            @endforeach
                                        </select>
                                </div>
                            </div>



                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="text-bold"><strong>Designação</strong></label>
                                        <select name="designation_id_filter" id="designation_id_filter" class="form-control selectpicker dynamic"
                                               placeholder="Selecione a designação para buscar..." data-live-search="true">
                                            <option value="">Selecione a designação</option>
                                            {{-- @foreach($designations as $design)
                                                <option value="{{$design->id}}">{{$design->designation_name}}</option>
                                            @endforeach --}}
                                        </select>
                                </div>
                            </div>

                            <div class="col-md-1">
                                <label class="text-bold"></label><br>
                                <button type="button" class="btn btn-dark" id="filterSubmit">
                                    <i class="fa fa-arrow-right" aria-hidden="true"></i> &nbsp; Filtrar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--/ Filtering -->
        </div>

        <div class="table-responsive">
            <table id="employee-table" class="table ">
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th>{{ trans('Employee') }}</th>
                        <th>{{ trans('Company') }}</th>
                        <th>Cidade</th>
                        <th>{{ trans('Contact') }}</th>
                        <th>Data de Início</th>
                        {{-- <th>Fim do Contrato</th> --}}
                        <th class="not-exported">{{ trans('action') }}</th>
                    </tr>
                </thead>

            </table>
        </div>
    </section>



    <div id="formModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">Adicionar Funcionário</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <span id="form_result"></span>
                    <form method="post" id="sample_form" class="form-horizontal" enctype="multipart/form-data">

                        @csrf
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ __('First Name') }} <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="first_name" id="first_name"
                                    placeholder="{{ __('First Name') }}" required class="form-control">
                            </div>
                            {{-- <div class="col-md-6 form-group">
                                <label class="text-bold">Segundo Nome</label>
                                <input type="text" name="last_name" id="last_name"
                                    placeholder="Segundo Nome" class="form-control">
                            </div> --}}
                            <div class="col-md-6 form-group">
                                <label class="text-bold">CPF <span class="text-danger">*</span></label>
                                <input type="text" name="staff_id" id="staff_id" placeholder="CPF" required
                                    class="form-control cpf">
                            </div>
                            {{-- <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Email') }}</label>
                                <input type="email" name="email" id="email" placeholder="example@example.com"
                                    class="form-control">
                            </div> --}}
                            <div class="col-md-6 form-group">
                                <label class="text-bold">Possui alguma deficiência (PcD)?<span
                                        class="text-danger">*</span></label>
                                <select name="is_physically_disabled" id="is_physically_disabled" class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="Selecione uma opção">
                                    <option value="1">Sim</option>
                                    <option value="0">Não</option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Phone') }} <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="contact_no" id="contact_no"
                                    placeholder="{{ trans('Phone') }}" required class="form-control cellphone"
                                    value="{{ old('contact_no') }}">
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ __('Date Of Birth') }} <span
                                        class="text-danger">*</span></label>
                                <input type="date" name="date_of_birth" id="date_of_birth" required
                                    autocomplete="off" class="form-control" value="">
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Gender') }}</label>
                                <select name="gender" id="gender" class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="{{ __('Selecting', ['key' => trans('Gender')]) }}...">
                                    <option value="Masculino">Masculino</option>
                                    <option value="Feminino">Feminino</option>
                                    <option value="Outros">Outros</option>
                                </select>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-bold">{{ trans('Company') }} <span
                                            class="text-danger">*</span></label>
                                    <select name="company_id" id="company_id" required
                                        class="form-control selectpicker dynamic" data-live-search="true"
                                        data-live-search-style="contains" data-shift_name="shift_name"
                                        data-dependent="department_name"
                                        title="{{ __('Selecting', ['key' => trans('Company')]) }}...">
                                        @foreach ($companies as $company)
                                            <option value="{{ $company->id }}">{{ $company->company_name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-bold">{{ trans('Department') }} <span
                                            class="text-danger">*</span></label>
                                    <select name="department_id" id="department_id" required
                                        class="selectpicker form-control designation" data-live-search="true"
                                        data-live-search-style="contains" data-designation_name="designation_name"
                                        title="{{ __('Selecting', ['key' => trans('Department')]) }}...">
                                    </select>
                                </div>
                            </div>


                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Designation') }} <span
                                        class="text-danger">*</span></label>
                                <select name="designation_id" id="designation_id" required
                                    class="selectpicker form-control" data-live-search="true"
                                    data-live-search-style="contains"
                                    title="{{ __('Selecting', ['key' => trans('Designation')]) }}...">
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Período de Trabalho <span class="text-danger">*</span></label>
                                <select name="office_shift_id" id="office_shift_id" required
                                    class="selectpicker form-control" data-live-search="true"
                                    data-live-search-style="contains" title="Período de Trabalho">
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Zona/Área <span class="text-danger">*</span></label>
                                <select name="area" id="area" required class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains" title="Zona/Área">
                                    <option value="rural">Rural</option>
                                    <option value="urbana">Urbana</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Username') }} <span
                                        class="text-danger">*</span></label>
                                <input type="text" name="username" id="username"
                                    placeholder="{{ __('Unique Value', ['key' => trans('Username')]) }}" required
                                    class="form-control">
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Role') }} <span
                                        class="text-danger">*</span></label>
                                <select name="role_users_id" id="role_users_id" required
                                    class="selectpicker form-control" data-live-search="true"
                                    data-live-search-style="contains"
                                    title="{{ __('Selecting', ['key' => trans('Role')]) }}...">
                                    @foreach ($roles as $item)
                                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                                    @endforeach
                                    {{-- <option value="1">Admin</option>
                                    <option value="2">Employee</option> --}}
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Ferista?<span
                                        class="text-danger">*</span></label>
                                <select name="is_street_vendor" id="is_street_vendor" class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="Selecione uma opção">
                                    <option value="1">Sim</option>
                                    <option value="0">Não</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ trans('Password') }} <span
                                        class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="password" name="password" id="password"
                                        placeholder="{{ trans('Password') }}" required class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ __('Confirm Password') }} <span
                                        class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input id="confirm_pass" type="password" class="form-control "
                                        name="password_confirmation" placeholder="{{ __('Re-type Password') }}" required
                                        autocomplete="new-password">
                                </div>
                                <div class="form-group">
                                    <div class="registrationFormAlert" id="divCheckPasswordMatch">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Município <span class="text-danger">*</span></label>
                                <select name="city" id="city" required class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="Selecione o município">
                                    <option value="Acrelândia">Acrelândia</option>
                                    <option value="Assis Brasil">Assis Brasil</option>
                                    <option value="Brasiléia">Brasiléia</option>
                                    <option value="Bujari">Bujari</option>
                                    <option value="Capixaba">Capixaba</option>
                                    <option value="Cruzeiro do Sul">Cruzeiro do Sul</option>
                                    <option value="Epitaciolândia">Epitaciolândia</option>
                                    <option value="Feijó">Feijó</option>
                                    <option value="Jordão">Jordão</option>
                                    <option value="Mâncio Lima">Mâncio Lima</option>
                                    <option value="Manoel Urbano">Manoel Urbano</option>
                                    <option value="Marechal Thaumaturgo">Marechal Thaumaturgo</option>
                                    <option value="Plácido de Castro">Plácido de Castro</option>
                                    <option value="Porto Acre">Porto Acre</option>
                                    <option value="Porto Walter">Porto Walter</option>
                                    <option value="Rio Branco">Rio Branco</option>
                                    <option value="Rodrigues Alves">Rodrigues Alves</option>
                                    <option value="Santa Rosa do Purus">Santa Rosa do Purus</option>
                                    <option value="Senador Guiomard">Senador Guiomard</option>
                                    <option value="Sena Madureira">Sena Madureira</option>
                                    <option value="Tarauacá">Tarauacá</option>
                                    <option value="Xapuri">Xapuri</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Bairro <span class="text-danger">*</span></label>
                                <select name="district_id" id="district" required class="selectpicker form-control"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="Selecione o município">
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">Tipo de Comparecimento<span class="text-danger">*</span></label>
                                <select name="attendance_type" id="attendance_type" required
                                    class="selectpicker form-control" data-live-search="true"
                                    data-live-search-style="contains" title="Tipo de Comparecimento">
                                    <option value="CLT">CLT</option>
                                    <option value="outros">Outros</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="text-bold">{{ __('Date Of Joining') }} <span
                                        class="text-danger">*</span></label>
                                <input type="date" name="joining_date" id="joining_date" class="form-control">
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="profile_photo" class=""><strong>{{ __('Image') }}</strong></label>
                                <input type="file" id="profile_photo"
                                    class="form-control @error('photo') is-invalid @enderror" name="profile_photo"
                                    placeholder="{{ __('Upload', ['key' => trans('Photo')]) }}">
                            </div>

                            {{-- <div class="col-md-6 form-group"  id="ipField"></div> --}}


                            <div class="container">
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="action" />
                                    <input type="hidden" name="hidden_id" id="hidden_id" />
                                    <input type="submit" name="action_button" id="action_button"
                                        class="btn btn-warning w-100" value="{{ trans('Add') }}" />
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>


    <div id="confirmModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">{{ trans('Confirmation') }}</h2>
                    <button type="button" class="employee-close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4 align="center" style="margin:0;">{{ __('Are you sure you want to remove this data?') }}</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button" id="ok_button"
                        class="btn btn-danger">{{ trans('OK') }}</button>
                    <button type="button" class="close btn btn-default"
                        data-dismiss="modal">{{ trans('Cancel') }}</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script type="text/javascript">
        $(document).ready(function() {

            if (window.location.href.indexOf('#formModal') != -1) {
                $('#formModal').modal('show');
            }

            var date = $('.date');
            date.datepicker({
                format: '{{ env('Date_Format_JS') }}',
                autoclose: true,
                todayHighlight: true
            });

            var table_table = $('#employee-table').DataTable({
                initComplete: function() {
                    this.api().columns([2, 4]).every(function() {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo($(column.footer()).empty())
                            .on('change', function() {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function(d, j) {
                            select.append('<option value="' + d + '">' + d +
                                '</option>');
                            $('select').selectpicker('refresh');
                        });
                    });
                },
                responsive: true,
                fixedHeader: {
                    header: true,
                    footer: true
                },
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('employees.index') }}",
                    type: 'GET',
                    data: function(d) {
                        d.company_id = $("#company_id_filter").val();
                        d.department_id = $('#department_id_filter').val();
                        d.designation_id = $('#designation_id_filter').val();
                        d.office_shift_id = $('#office_shift_id_filter').val();
                        d.employee_name = $('#employee_name_filter').val();
                    }
                },

                columns: [

                    {
                        data: 'id',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'name',
                        name: 'name',

                    },
                    {
                        data: 'company',
                        name: 'company',
                    },
                    {
                        data: 'city',
                        name: 'city',
                    },
                    {
                        data: 'contacts',
                        name: 'contacts',
                    },
                    {
                        data: 'joining_date',
                        name: 'joining_date',
                    },
                    // {
                    //     data: 'resignation',
                    //     name: 'resigination',
                    // },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    }
                ],


                "order": [],
                'language': {
                    'lengthMenu': '_MENU_ {{ __('records per page') }}',
                    "info": '{{ trans('file.Showing') }} _START_ - _END_ (_TOTAL_)',
                    "search": '{{ trans('file.Search') }}',
                    "zeroRecords": "Nenhum registro correspondente encontrado",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "processing": "Processando...",
                    'paginate': {
                        'previous': '{{ trans('file.Previous') }}',
                        'next': '{{ trans('file.Next') }}'
                    }
                },
                'columnDefs': [{
                        "orderable": false,
                        'targets': [0, 4],
                        "className": "text-left"
                    },
                    {
                        'render': function(data, type, row, meta) {
                            if (type == 'display') {
                                data =
                                    '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label class="text-bold"></label></div>';
                            }

                            return data;
                        },
                        'checkboxes': {
                            'selectRow': true,
                            'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label class="text-bold"></label></div>'
                        },
                        'targets': [0]
                    }
                ],


                'select': {
                    style: 'multi',
                    selector: 'td:first-child'
                },
                'lengthMenu': [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                dom: '<"row"lfB>rtip',
                buttons: [{
                        extend: 'pdf',
                        text: '<i title="exportar para pdf" class="fa fa-file-pdf-o"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    {
                        extend: 'csv',
                        text: '<i  title= "exportar para csv" class="fa fa-file-text-o"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    // {
                    //     extend: 'csv',
                    //     text: '<i title="export for device" class="fa fa-tablet"></i>',
                    //     className: 'export-for-device',
                    //     exportOptions: {
                    //         columns: [1,2],
                    //         rows: ':visible',
                    //         format: {
                    //             body: function ( data, row, column, node ) {
                    //                 if (column === 0) {
                    //                     var id = data.match(/<span>Staff Id: (.*?)<\/span>/)[1];
                    //                     name = data.match(/<[a][^>]*>(.+?)<\/[a]>/)[1];
                    //                     return id;
                    //                 }
                    //                 else {
                    //                     return name;
                    //                 }
                    //             }
                    //         }
                    //     },
                    //     customize: function (csv) {
                    //         var csvRows = csv.split('\n');
                    //         csvRows[0] = csvRows[0].replace(['"Employee"', '"Company"'], ['"Staff Id"','"Name"']);
                    //         return csvRows.join('\n');
                    //     }
                    // },
                    {
                        extend: 'print',
                        text: '<i title="imprimir" class="fa fa-print"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    {
                        extend: 'colvis',
                        text: '<i title="visibilidade das colunas" class="fa fa-eye"></i>',
                        columns: ':gt(0)'
                    },
                ],
            });
            new $.fn.dataTable.FixedHeader(table_table);

        });


        //-------------- Filter -----------------------

        $('#filterSubmit').on("click", function(e) {
            $('#employee-table').DataTable().draw(true);
        });
        //--------------/ Filter ----------------------


        $('#create_record').click(function() {

            $('.modal-title').text("Adicionar Funcionário");
            $('#action_button').val('{{ trans('Add') }}');
            $('#action').val('{{ trans('Add') }}');
            $('#formModal').modal('show');
        });

        $('#sample_form').on('submit', function(event) {
            event.preventDefault();
            // var attendance_type = $("#attendance_type").val();
            // console.log(attendance_type);

            $.ajax({
                url: "{{ route('employees.store') }}",
                method: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    var html = '';
                    if (data.errors) {
                        data.errors.forEach(function(error) {
                        html += '<p>Erro no campo: <strong>' + error.input + '</strong> - ' + error.error + '</p>';
                    });
                    }
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }
                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                        $('#sample_form')[0].reset();
                        $('select').selectpicker('refresh');
                        $('.date').datepicker('update');
                        $('#employee-table').DataTable().ajax.reload();
                    }
                    $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                }
            });
        });


        let employee_delete_id;

        $(document).on('click', '.delete', function() {
            employee_delete_id = $(this).attr('id');
            $('#confirmModal').modal('show');
            $('.modal-title').text('{{ __('DELETE Record') }}');
            $('#ok_button').text('{{ trans('OK') }}');

        });


        $(document).on('click', '#bulk_delete', function() {
            var id = [];
            let table = $('#employee-table').DataTable();
            id = table.rows({
                selected: true
            }).ids().toArray();
            if (id.length > 0) {
                if (confirm('{{ __('Delete Selection', ['key' => trans('Employee')]) }}')) {
                    $.ajax({
                        url: '{{ route('mass_delete_employees') }}',
                        method: 'POST',
                        data: {
                            employeeIdArray: id
                        },
                        success: function(data) {
                            if (data.success) {
                                html = '<div class="alert alert-success">' + data.success + '</div>';
                            }
                            if (data.error) {
                                html = '<div class="alert alert-danger">' + data.error + '</div>';
                            }
                            table.ajax.reload();
                            table.rows('.selected').deselect();
                            $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);

                        }

                    });
                }
            } else {
                alert('{{ __('Please select atleast one checkbox') }}');
            }
        });


        $('#close').click(function() {
            $('#sample_form')[0].reset();
            $('select').selectpicker('refresh');
            $('.date').datepicker('update');
            $('#employee-table').DataTable().ajax.reload();
        });

        $('#ok_button').click(function() {
            let target = "{{ route('employees.index') }}/" + employee_delete_id + '/delete';
            $.ajax({
                url: target,
                beforeSend: function() {
                    $('#ok_button').text('{{ trans('Deleting...') }}');
                },
                success: function(data) {
                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                    }
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }
                    setTimeout(function() {
                        $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);
                        $('#confirmModal').modal('hide');
                        $('#employee-table').DataTable().ajax.reload();
                    }, 2000);
                }
            })
        });


        $('#confirm_pass').on('input', function() {

            if ($('input[name="password"]').val() != $('input[name="password_confirmation"]').val())
                $("#divCheckPasswordMatch").html('{{ __('Password does not match! please type again') }}');
            else
                $("#divCheckPasswordMatch").html('{{ __('Password matches!') }}');

        });


        $('.dynamic').change(function() {
            if ($(this).val() !== '') {
                let value = $(this).val();
                let dependent = $(this).data('dependent');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_department') }}",
                    method: "POST",
                    data: {
                        value: value,
                        _token: _token,
                        dependent: dependent
                    },
                    success: function(result) {

                        $('select').selectpicker("destroy");
                        $('#department_id').html(result);
                        $('select').selectpicker();

                    }
                });
            }
        });


        $('.dynamic').change(function() {
            if ($(this).val() !== '') {
                let value = $(this).val();
                let dependent = $(this).data('shift_name');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_office_shifts') }}",
                    method: "POST",
                    data: {
                        value: value,
                        _token: _token,
                        dependent: dependent
                    },
                    success: function(result) {
                        $('select').selectpicker("destroy");
                        $('#office_shift_id').html(result);
                        $('select').selectpicker();
                    }
                });
            }
        });

        $('.designation').change(function() {
            if ($(this).val() !== '') {
                let value = $(this).val();
                let designation_name = $(this).data('designation_name');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_designation_department') }}",
                    method: "POST",
                    data: {
                        value: value,
                        _token: _token,
                        designation_name: designation_name
                    },
                    success: function(result) {
                        $('select').selectpicker("destroy");
                        $('#designation_id').html(result);
                        $('select').selectpicker();

                    }
                });
            }
        });


        // Login Type Change
        // $('#login_type').change(function() {
        //     var login_type = $('#login_type').val();
        //     if (login_type=='ip') {
        //         data = '<label class="text-bold">{{ __('IP Address') }} <span class="text-danger">*</span></label>';
        //         data += '<input type="text" name="ip_address" id="ip_address" placeholder="Type IP Address" required class="form-control">';
        //         $('#ipField').html(data)
        //     }else{
        //         $('#ipField').empty();
        //     }
        // });



        //--------  Filter  ---------

        // Company--> Department
        // $('.dynamic').change(function() {
        //     if ($(this).val() !== '') {
        //         let value = $('#company_id_filter').val();
        //         let dependent = $(this).data('dependent');
        //         let _token = $('input[name="_token"]').val();
        //         $.ajax({
        //             url: "{{ route('dynamic_department') }}",
        //             method: "POST",
        //             data: {
        //                 value: value,
        //                 _token: _token,
        //                 dependent: dependent
        //             },
        //             success: function(result) {

        //                 $('select').selectpicker("destroy");
        //                 $('#department_id_filter').html(result);
        //                 $('select').selectpicker();

        //             }
        //         });
        //     }
        // });

        //Department--> Designation
        // $('.designationFilter').change(function() {
        //     if ($(this).val() !== '') {
        //         // let value = $(this).val();
        //         // let value = $('#company_id_filter').val();
        //         let value = $('#department_id_filter').val();
        //         let designation_name = $(this).data('designation_name');
        //         let _token = $('input[name="_token"]').val();
        //         $.ajax({
        //             url: "{{ route('dynamic_designation_department') }}",
        //             method: "POST",
        //             data: {
        //                 value: value,
        //                 _token: _token,
        //                 designation_name: designation_name
        //             },
        //             success: function(result) {
        //                 $('select').selectpicker("destroy");
        //                 $('#designation_id_filter').html(result);
        //                 $('select').selectpicker();

        //             }
        //         });
        //     }
        // });

        //Company--> Office Shift
        $('.dynamic').change(function() {
            if ($(this).val() !== '') {
                // let value = $(this).val();
                let value = $('#company_id_filter').val();
                let dependent = $(this).data('shift_name');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_office_shifts') }}",
                    method: "POST",
                    data: {
                        value: value,
                        _token: _token,
                        dependent: dependent
                    },
                    success: function(result) {
                        $('select').selectpicker("destroy");
                        $('#office_shift_id_filter').html(result);
                        $('select').selectpicker();
                    }
                });
            }
        });

        $('#department_id_filter').on('change', function () {
        const departmentId = $(this).val();
        const $designation = $('#designation_id_filter');
        console.log(departmentId);
        $designation.empty().append(`<option value="">${'{{ __("Selecione a designação") }}'}</option>`);
        $designation.selectpicker && $designation.selectpicker('refresh');
        if (departmentId) {
            $.ajax({
                url: '/fetch/related',
                data: { department_id: departmentId},
                type: 'GET',
                success: function (response) {
                    if (response.type === 'designations' || response.designations) {
                        let designations = response.data || response.designations;
                        $designation.empty().append(`<option value="">${'{{ __("Selecione a designação") }}'}</option>`);
                        $.each(designations, function (key, value) {
                            $designation.append(`<option value="${value.id}">${value.designation_name}</option>`);
                        });
                        $designation.selectpicker && $designation.selectpicker('refresh');
                    }
                },
                error: function () {
                    $designation.empty().append(`<option value="">{{ __("No results found") }}</option>`);
                }
            });
        }
    });


        $('#city').change(function() {
            let value = $(this).val();
            let _token = $('input[name="_token"]').val();
            $.ajax({
                url: "{{ route('dynamic_districts_by_city') }}",
                method: 'POST',
                data: {
                    value: value,
                    _token: _token
                },
                success: function(result) {
                    $('select').selectpicker("destroy");
                    $('#district').html(result);
                    $('select').selectpicker();
                }
            })
        });
    </script>
@endpush
