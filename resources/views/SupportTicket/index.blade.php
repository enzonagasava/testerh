@extends('layout.main')
@section('content')


    <section>

        <div class="container-fluid"><span id="general_result"></span></div>

        <div class="row justify-content-center">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-check text-success text-lg"></i>
                        <span class="ml-2">Abertos: <strong>{{ $open_count }}</strong></span>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-spinner text-warning"></i>
                        <span class="ml-2">Em Andamento: <strong>{{ $pending_count }}</strong></span>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <i class="fa fa-times text-danger text-lg"></i>
                        <span class="ml-2">Fechados: <strong>{{ $closed_count }}</strong></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid mb-3 d-flex justify-content-between">
            <div class="h-100" style="width: 90%;">
                @can('store-ticket')
                    <button type="button" class="btn btn-info" name="create_record" id="create_record"><i
                                class="fa fa-plus"></i> {{__('Add Ticket')}}</button>
                @endcan
                @can('delete-ticket')
                    {{-- <button type="button" class="btn btn-danger" name="bulk_delete" id="bulk_delete"><i
                                class="fa fa-minus-circle"></i> {{__('Bulk delete')}}</button> --}}
                @endcan
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample"
                        aria-expanded="false" aria-controls="collapseExample">
                        <i class="fa fa-filter" aria-hidden="true"></i> Filtro
                </button>

                <div class="col-12">
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
                                            <label class="text-bold"><strong>Empresa</strong></label>
                                            <select name="company_id" id="company_id_filter" class="form-control selectpicker dynamic" placeholder="Selecione a empresa para buscar...">
                                                <option value="">{{ __('All Companies') }}</option>
                                                @foreach($companies as $company)
                                                    <option value="{{ $company->id }}">
                                                        {{ $company->company_name }}
                                                    </option>
                                                @endforeach
                                            </select>
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
                                            <select name="designation_id" id="designation_id_filter" class="form-control selectpicker dynamic"
                                                    placeholder="Selecione a designação para buscar..." data-live-search="true">
                                                <option value="">Selecione a designação</option>
                                                @foreach($designation as $design)
                                                    <option value="{{$design->id}}">{{$design->designation_name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="text-bold"><strong>Status</strong></label>
                                            <select name="ticket_status" id="ticket_status" class="form-control">
                                                <option value="">Selecione um status para filtrar</option>
                                                <option value="aberto">Aberto</option>
                                                <option value="Em andamento">Em andamento</option>
                                                <option value="fechado">Fechado</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="text-bold"><strong>Data Inicial</strong></label>
                                            <input type="date" name="start_date" id="start_date_filter" class="form-control" placeholder="Data inicial">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="text-bold"><strong>Data Final</strong></label>
                                            <input type="date" name="end_date" id="end_date_filter" class="form-control" placeholder="Data final">
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
                </div>

            </div>
        </div>


        <div class="table-responsive">
            <table id="ticket-table" class="table ">
                <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{__('Ticket Code')}}</th>
                    <th>{{trans('Employee')}} / {{ trans('Company') }}</th>
                    <th>{{trans('Subject')}}</th>
                    <th>{{trans('Priority')}} / {{trans('Status')}}</</th>
                    <th>{{trans('Status')}}</th>
                    <th>{{trans('Date')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
                </thead>

            </table>
        </div>
    </section>

        <div id="document_view_modal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{__('Document Info')}}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="document_info"></div>
                            <iframe id="document_file" frameborder="0" src="" width="100%" height="600px"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="formModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{__('Add Ticket')}}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
                </div>

                <span id="form_result"></span>
                <form method="post" id="sample_form" class="form-horizontal" enctype="multipart/form-data">
                @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>{{trans('Company')}}</label>
                                    <select name="company_id" id="company_id"
                                            class="form-control selectpicker dynamic"
                                            data-live-search="true" data-live-search-style="contains"
                                            data-dependent="department_name"
                                            title='{{__('Selecting',['key'=>trans('Company')])}}...'>
                                        @foreach($companies as $company)
                                            <option value="{{$company->id}}">{{$company->company_name}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>{{trans('Department')}}</label>
                                    <select name="department_id" id="department_id"
                                            class="selectpicker form-control employee"
                                            data-live-search="true" data-live-search-style="contains"
                                            data-first_name="first_name" data-last_name="last_name"
                                            title='{{__('Selecting',['key'=>trans('Department')])}}...'>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>{{trans('Employee')}}</label>
                                    <select name="employee_id" id="employee_id" class="selectpicker form-control"
                                            data-live-search="true" data-live-search-style="contains"
                                            title='{{__('Selecting',['key'=>trans('Employee')])}}...'>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>{{trans('Priority')}}</label>
                                <select name="ticket_priority" id="ticket_priority" class="form-control selectpicker "
                                        data-live-search="true" data-live-search-style="contains"
                                        title='{{__('Selecting',['key'=>trans('Priority')])}}...'>
                                    <option value="baixo">{{trans('Low')}}</option>
                                    <option value="médio">{{trans('Medium')}}</option>
                                    <option value="alto">{{trans('High')}}</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Título da solicitação *</label>
                                <input type="text" name="subject" id="subject" class="form-control"
                                       placeholder="Título da solicitação">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Destino da solicitação</label>
                                    <select class="form-control selectpicker" name="ticket_note" id="ticket_note"
                                    data-live-search="true" data-live-search-style="contains"
                                    title="{{__('Selecting',['key'=>'Destino da solicitação'])}}...">
                                    <option value="Setor Operacional">Setor Operacional</option>
                                    <option value="Setor Executivo">Setor Executivo</option>
                                    <option value="Setor RH/DP">Setor RH/DP</option>
                                    <option value="Setor Atendimento">Setor Atendimento</option>
                                </select>
                            </div>

                            <div class="col-md-6 form-group hide_edit">
                                <label>{{__('Ticket Attachments')}} </label>
                                <input type="file" name="ticket_attachments" id="ticket_attachments"
                                       class="form-control">
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Descrição detalhada</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                </div>
                            </div>


                            <div class="container">
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="action"/>
                                    <input type="hidden" name="hidden_id" id="hidden_id"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" name="action_button" id="action_button" class="btn btn-warning btn-block btn-lg" value={{trans('Add')}}>
                </form>
            </div>
        </div>
    </div>


    <div id="confirmModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">{{trans('Confirmation')}}</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4 align="center">{{__('Are you sure you want to remove this data?')}}</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button" id="ok_button" class="btn btn-danger">{{trans('OK')}}'
                    </button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">{{trans('Cancel')}}</button>
                </div>
            </div>
        </div>
    </div>


@endsection

@push('scripts')
<script type="text/javascript">
    (function($) {
        "use strict";

        updateRelatedFields();
        function updateRelatedFields() {
            const companyId = $('#company_id_filter').val();
            console.log(companyId);
            const $department = $('#department_id_filter');
            const $designation = $('#designation_id_filter');
                $.ajax({
                    url: '/fetch/related',
                    type: 'GET',
                    data: { company_id: companyId },
                    success: function (response) {
                        if (response.departments) {
                            $department.empty().append(`<option value="">${'{{ __("Select Department") }}'}</option>`);
                            $.each(response.departments, function (key, value) {
                                $department.append(`<option value="${value.id}">${value.department_name}</option>`);
                            });
                            $department.selectpicker && $department.selectpicker('refresh');
                        }
                        if (response.designations) {
                            $designation.empty().append(`<option value="">${'{{ __("All Designations") }}'}</option>`);
                            $.each(response.designations, function (key, value) {
                                $designation.append(`<option value="${value.id}">${value.designation_name}</option>`);
                            });
                            $designation.selectpicker && $designation.selectpicker('refresh');
                        }
                    },
                    error: function () {
                        $department.empty().append(`<option value="">{{ __("No results found") }}</option>`);
                        $designation.empty().append(`<option value="">{{ __("No results found") }}</option>`);
                    }
                });
                return;
        }

        // Filtro de Empresa e Designação
        $('#company_id_filter').on('change', function() {
            var companyId = $(this).val();

            $('#department_id_filter').empty().append('<option value="">Selecione o departamento</option>');
            $('#designation_id_filter').empty().append('<option value="">Selecione a designação</option>');

            if(companyId) {
                $.ajax({
                    url: '/dynamic_variable/department-by-company/' + companyId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        $.each(data, function(key, department) {
                            $('#department_id_filter').append('<option value="'+ department.id +'">'+ department.department_name +'</option>');
                        });
                        $('#department_id_filter').selectpicker('refresh'); // se usar bootstrap-select
                    }
                });
            }
        });

        $('#department_id_filter').on('change', function() {
            var departmentId = $(this).val();

            var $designationDropdown = $('#designation_id_filter');

            $designationDropdown.empty();
            $designationDropdown.append('<option value="">Selecione a designação</option>');

            $designationDropdown.selectpicker('refresh');

            if(departmentId) {
                $.ajax({
                    url: '/dynamic_variable/designation-by-department/' + departmentId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        $.each(data, function(key, designation) {
                            $('#designation_id_filter').append('<option value="'+ designation.id +'">'+ designation.designation_name +'</option>');
                        });
                        $('#designation_id_filter').selectpicker('refresh'); // se usar bootstrap-select
                    }
                });
            }
        });

        $(document).ready(function () {
            $('#ticket_status').val('aberto');
            var table_table = $('#ticket-table').DataTable({
                initComplete: function () {
                    this.api().columns([1]).every(function () {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo($(column.footer()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>');
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
                    url: "{{ route('tickets.index') }}",
                    type: 'GET',
                    data: function(d) {
                        d.company_id = $("#company_id_filter").val();
                        d.department_name = $('#department_id_filter').val();
                        d.designation_name = $('#designation_id_filter').val();
                        d.employee_name = $('#employee_name_filter').val();
                        d.start_date = $('#start_date_filter').val();
                        d.end_date = $('#end_date_filter').val();
                        d.ticket_status = $('#ticket_status').val();
                    }
                },

                columns: [
                    {
                        data: 'id',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'ticket_details',
                        name: 'ticket_details',
                    },
                    {
                        data: 'employee_company',
                        name: 'employee_company',
                    },
                    {
                        data: 'subject',
                        name: 'subject',
                    },
                    {
                        data: null,
                        name: 'ticket_priority_status',
                        render: function(data, type, row) {
                            return `<strong>Prioridade:</strong> ${row.ticket_priority}<br><strong>Status:</strong> ${row.ticket_status}`;
                        }
                    },
                    {
                        data: 'ticket_status',
                        name: 'ticket_status',
                        visible: false
                    },
                    {
                        data: 'created_at',
                        name: 'created_at',

                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    }
                ],


                "order": [],
                'language': {
                    'lengthMenu': '_MENU_ {{__("records per page")}}',
                    "info": '{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)',
                    "zeroRecords": "Nenhum registro correspondente encontrado",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "processing": "Processando...",
                    "search": '{{trans("file.Search")}}',
                    'paginate': {
                        'previous': '{{trans("file.Previous")}}',
                        'next': '{{trans("file.Next")}}'
                    }
                },
                'columnDefs': [
                    {
                        "orderable": false,
                        'targets': [0, 7],
                    },
                    {
                        'render': function (data, type, row, meta) {
                            if (type == 'display') {
                                data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                            }

                            return data;
                        },
                        'checkboxes': {
                            'selectRow': true,
                            'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                        },
                        'targets': [0]
                    }
                ],


                'select': {style: 'multi', selector: 'td:first-child'},
                'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
                dom: '<"row"lfB>rtip',
                buttons: [
                    {
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
        $('#filterSubmit').on('click', function() {
            table_table.ajax.reload();
        });
       $('#filter_form').on('submit', function(e) {
        e.preventDefault();

        const form = this;
        if (form.checkValidity()) {
            table_table.ajax.reload();
        } else {
            form.reportValidity();
        }
    });
            new $.fn.dataTable.FixedHeader(table_table);
        });


        tinymce.init({
            selector: 'textarea',
            setup: function (editor) {
                editor.on('change', function () {
                    editor.save();
                });
            },
            height: 130,

            image_title: true,
            /* enable automatic uploads of images represented by blob or data URIs*/
            automatic_uploads: true,
            /*
              URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
              images_upload_url: 'postAcceptor.php',
              here we add custom filepicker only to Image dialog
            */
            file_picker_types: 'image',
            /* and here's our custom image picker*/
            file_picker_callback: function (cb, value, meta) {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');

                /*
                  Note: In modern browsers input[type="file"] is functional without
                  even adding it to the DOM, but that might not be the case in some older
                  or quirky browsers like IE, so you might want to add it to the DOM
                  just in case, and visually hide it. And do not forget do remove it
                  once you do not need it anymore.
                */

                input.onchange = function () {
                    var file = this.files[0];

                    var reader = new FileReader();
                    reader.onload = function () {
                        /*
                          Note: Now we need to register the blob in TinyMCEs image blob
                          registry. In the next release this part hopefully won't be
                          necessary, as we are looking to handle it internally.
                        */
                        var id = 'blobid' + (new Date()).getTime();
                        var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                        var base64 = reader.result.split(',')[1];
                        var blobInfo = blobCache.create(id, file, base64);
                        blobCache.add(blobInfo);

                        /* call the callback and populate the Title field with the file name */
                        cb(blobInfo.blobUri(), { title: file.name });
                    };
                    reader.readAsDataURL(file);
                };

                input.click();
            },

            plugins: [
                'advlist autolink lists link image charmap print preview anchor textcolor',
                'searchreplace visualblocks code fullscreen',
                'insertdatetime media table contextmenu paste code wordcount'
            ],
            toolbar: 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat',
            branding: false
        });


        $('#create_record').on('click', function () {

            $('.modal-title').text('{{__('Add Ticket')}}');
            $('#action_button').val('{{trans("file.Add")}}');
            $('#action').val('{{trans("file.Add")}}');
            $('#formModal').modal('show');
        });

        $('#sample_form').on('submit', function (event) {
            event.preventDefault();
            if ($('#action').val() == '{{trans('Add')}}') {

                $.ajax({
                    url: "{{ route('tickets.store') }}",
                    method: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    dataType: "json",
                    success: function (data) {
                        var html = '';
                        if (data.errors) {
                            html = '<div class="alert alert-danger">';
                            for (var count = 0; count < data.errors.length; count++) {
                                html += '<p>' + data.errors[count] + '</p>';
                            }
                            html += '</div>';
                        }
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success + '</div>';
                            $('#sample_form')[0].reset();
                            $('select').selectpicker('refresh');
                            $('#ticket-table').DataTable().ajax.reload();
                        }
                        $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    }
                })
            }

            if ($('#action').val() == '{{trans('Edit')}}') {
                $.ajax({
                    url: "{{ route('tickets.update') }}",
                    method: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    dataType: "json",
                    success: function (data) {
                        var html = '';
                        if (data.errors) {
                            html = '<div class="alert alert-danger">';
                            for (var count = 0; count < data.errors.length; count++) {
                                html += '<p>' + data.errors[count] + '</p>';
                            }
                            html += '</div>';
                        }
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success + '</div>';
                            setTimeout(function () {
                                $('#formModal').modal('hide');
                                $('select').selectpicker('refresh');
                                $('#ticket-table').DataTable().ajax.reload();
                                $('#sample_form')[0].reset();
                            }, 2000);

                        }
                        $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    }
                });
            }
        });


        $(document).on('click', '.edit', function () {

            var id = $(this).attr('id');
            $('#form_result').html('');
            $('.hide_edit').hide();


            var target = "{{ route('tickets.index') }}/" + id + '/edit';


            $.ajax({
                url: target,
                dataType: "json",
                success: function (html) {

                    $('#subject').val(html.data.subject);
                    $('#ticket_priority').selectpicker('val', html.data.ticket_priority);
                    if (html.data.description) {
                        function htmlDecode(input){
                            var e = document.createElement('div');
                            e.innerHTML = input;
                            return e.childNodes.length == 0 ? "" : e.childNodes[0].nodeValue;
                        }
                        tinymce.get('description').setContent(htmlDecode(html.data.description));
                    }
                    $('#company_id').selectpicker('val', html.data.company_id);

                    let all_departments = '';
                    $.each(html.departments, function (index, value) {
                        all_departments += '<option value=' + value['id'] + '>' + value['department_name'] + '</option>';
                    });
                    $('#department_id').empty().append(all_departments);
                    $('#department_id').selectpicker('refresh');
                    $('#department_id').selectpicker('val', html.data.department_id);
                    $('#department_id').selectpicker('refresh');

                    let all_employees = '';
                    $.each(html.employees, function (index, value) {
                        all_employees += '<option value=' + value['id'] + '>' + value['first_name'] + ' ' + value['last_name'] + '</option>';
                    });
                    $('#employee_id').empty().append(all_employees);
                    $('#employee_id').selectpicker('refresh');
                    $('#employee_id').selectpicker('val', html.data.employee_id);
                    $('#employee_id').selectpicker('refresh');

                    let all_ticket_notes = '';
                    if (html.data.ticket_note && Array.isArray(html.data.ticket_note)) {
                        html.data.ticket_note.forEach(function(value, index) {
                            all_ticket_notes += '<option value="' + value + '">' + value + '</option>';
                        });
                    } else if (html.data.ticket_note) {
                        all_ticket_notes = '<option value="' + html.data.ticket_note + '">' + html.data.ticket_note + '</option>';
                    }

                    $('#ticket_note').selectpicker('val', html.data.ticket_note);
                    $('#hidden_id').val(html.data.id);
                    $('.modal-title').text('{{trans('Edit')}}');
                    $('#action_button').val('{{trans('Edit')}}');
                    $('#action').val('{{trans('Edit')}}');
                    $('#formModal').modal('show');
                }
            })
        });


        let delete_id;

        $(document).on('click', '.delete', function () {
            delete_id = $(this).attr('id');
            $('#confirmModal').modal('show');
            $('.modal-title').text('{{__('DELETE Record')}}');
            $('#ok_button').text('{{trans('OK')}}');

        });


        $('.close').on('click', function () {
            $('#sample_form')[0].reset();
            $('select').selectpicker('refresh');
            $('#ticket-table').DataTable().ajax.reload();
        });

        $('#ok_button').on('click', function () {
            let target = "{{ route('tickets.index') }}/" + delete_id + '/delete';
            $.ajax({
                url: target,
                beforeSend: function () {
                    $('#ok_button').text('{{trans('Deleting...')}}');
                },
                success: function (data) {
                    let html = '';
                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                    }
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }
                    setTimeout(function () {
                        $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);
                        $('#confirmModal').modal('hide');
                        $('#ticket-table').DataTable().ajax.reload();
                    }, 2000);
                }
            })
        });

        $(document).on('click', '#bulk_delete', function () {

            var id = [];
            let table = $('#ticket-table').DataTable();
            id = table.rows({selected: true}).ids().toArray();
            if (id.length > 0) {
                if (confirm('{{__('Delete Selection',['key'=>trans('Ticket')])}}')) {
                    $.ajax({
                        url: '{{route('mass_delete_tickets')}}',
                        method: 'POST',
                        data: {
                            awardIdArray: id
                        },
                        success: function (data) {
                            let html = '';
                            if (data.success) {
                                html = '<div class="alert alert-success">' + data.success + '</div>';
                            }
                            if (data.error) {
                                html = '<div class="alert alert-danger">' + data.error + '</div>';
                            }
                            table.ajax.reload();
                            table.rows('.selected').deselect();
                            if (data.errors) {
                                html = '<div class="alert alert-danger">' + data.error + '</div>';
                            }
                            $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);

                        }

                    });
                }
            } else {
                alert('{{__('Please select atleast one checkbox')}}');
            }
        });

        $('.dynamic').change(function () {
            if ($(this).val() !== '') {
                let value = $(this).val();
                let dependent = $(this).data('dependent');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_department') }}",
                    method: "POST",
                    data: {value: value, _token: _token, dependent: dependent},
                    success: function (result) {
                        $('select').selectpicker("destroy");
                        $('#department_id').html(result);
                        $('select').selectpicker();

                    }
                });
            }
        });

        $('.employee').change(function () {
            if ($(this).val() !== '') {
                let value = $(this).val();
                let first_name = $(this).data('first_name');
                let last_name = $(this).data('last_name');
                let _token = $('input[name="_token"]').val();
                $.ajax({
                    url: "{{ route('dynamic_employee_department') }}",
                    method: "POST",
                    data: {value: value, _token: _token, first_name: first_name, last_name: last_name},
                    success: function (result) {
                        $('select').selectpicker("destroy");
                        $('#employee_id').html(result);
                        $('select').selectpicker();

                    }
                });
            }
        });
    })(jQuery);

    //Abre modal para visualizar documentos
    $(document).on('click', '.document_view', function(){
        var docUrl = $(this).data('link');

        $('.modal-title').text('{{__('View Document')}}');
        $('#document_view_modal iframe').attr('src',docUrl);
        $('#document_view_modal').modal('show');
    })



</script>

@endpush
