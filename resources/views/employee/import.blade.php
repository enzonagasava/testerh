@extends('layout.main')
@section('content')


    <section>

        <div class="card animated fadeInRight mr-5 ml-5">
            <div class="card-header  with-border">
                <h3 class="card-title">{{__('Import EXCEL/CSV file only')}}</h3>
                @include('shared.flash_message')
               <div id="form_result"></div>
            </div>
            <div class="card-body">
                @if(session('error'))
                    <div class="alert alert-danger">
                        {{ session('error') }}
                    </div>
                @endif
                 @if(session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @endif


                <h6><a href="{{url('sample_file/exemplo_importacao.xlsx')}}" class="btn btn-primary"> <i
                    class="fa fa-download"></i> {{__('Download Sample File')}} </a></h6>
                <p class="card-text">A primeira linha no arquivo de amostra baixado deve permanecer como está. Por favor, não altere a ordem das colunas no arquivo.</p>
                <p class="card-text">A ordem correta das colunas é (Nome, Dat.Nasc, CPF, Celular, Admissão, Seviço e Nome da Empresa).</p>
                <ul>
                    <li>O formato da data deve ser (De acordo com as configurações gerais)</li>
                    <li>Empresa, Departamento, Designação, Turno e nome do Papel devem coincidir com seus dados existentes.</li>
                    <li>Você deve seguir o arquivo, caso contrário, ocorrerá um erro ao importar o arquivo.</li>
                    <li>O Arquivo começa a ser lido a partir da linha 3.</li>
                    <li>As Células não devem estar agrupadas a outras colunas.</li>
                </ul>
                <form action="{{ route('employees.importPost') }}" name="import_employee" id="import_employee" autocomplete="off" enctype="multipart/form-data"
                      method="post" accept-charset="utf-8">
                    @csrf
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <fieldset class="form-group">
                                    <label for="logo">{{trans('Upload')}} {{trans('File')}}</label>
                                    <input type="file" class="form-control-file" id="file" name="file"
                                           accept=".xlsx, .xls, .csv">
                                    <small>{{__('Please select excel/csv')}} (tamanho máximo do arquivo 2MB)</small>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="mt-1">
                        <div class="form-actions box-footer">
                            <button name="import_form" type="submit" class="btn btn-primary"><i
                                        class="fa fa fa-check-square-o"></i> {{trans('Save')}}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </section>


@endsection
