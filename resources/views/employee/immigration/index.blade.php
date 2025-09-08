<section>

    <span id="immigration_general_result"></span>


    @if (auth()->user()->can('store-details-employee') || auth()->user()->id == $employee->id)
        <button type="button" class="btn btn-info" name="create_record" id="create_immigration_record"><i
                class="fa fa-plus"></i>Adicionar Documento</button>
    @endif


    <div class="table-responsive row">
        <table id="immigration-table" class="table ">
            <thead>
                <tr>
                    <th>{{ trans('Document') }}</th>
                    <th>{{ __('Issue Date') }}</th>
                    <th>{{ __('Expired Date') }}</th>
                    <th>{{ __('Issue By') }}</th>
                    <th>{{ __('Review Date') }}</th>
                    <th class="not-exported">{{ trans('action') }}</th>
                </tr>
            </thead>

        </table>
    </div>


    <div id="ImmigrationformModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ __('Add Immigration') }}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i
                            class="dripicons-cross"></i></button>
                </div>

                <div class="modal-body">
                    <span id="immigration_form_result"></span>
                    <form method="post" id="immigration_sample_form" class="form-horizontal"
                        enctype="multipart/form-data" autocomplete="off">

                        @csrf
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>{{ __('Document Type') }}</label>
                                <select name="document_type_id" id="immigration_document_type_id" required
                                    class="form-control selectpicker" data-live-search="true"
                                    data-live-search-style="contains"
                                    title='{{ __('Selecting', ['key' => __('Document Type')]) }}...'>
                                    @foreach ($document_types as $document_type)
                                        <option value="{{ $document_type->id }}">{{ $document_type->document_type }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>{{ __('Document Number') }} *</label>
                                <input type="text" name="document_number" id="immigration_document_number"
                                    placeholder={{ __('Document Number') }} required class="form-control">
                            </div>


                            <div class="col-md-6 form-group">
                                <label>{{ __('Issue Date') }} *</label>
                                <input type="text" name="issue_date" id="immigration_issue_date" required
                                    autocomplete="off" class="form-control date" value="">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>{{ __('Expired Date') }} </label>
                                <input type="text" name="expiry_date" id="immigration_expiry_date" autocomplete="off"
                                    class="form-control date" value="">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>{{ __('Eligible Review Date') }} </label>
                                <input type="text" name="eligible_review_date" id="immigration_eligible_review_date"
                                    autocomplete="off" class="form-control date" value="">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>{{ trans('Document') }} {{ trans('File') }} *</label>
                                <input type="file" name="document_file" id="immigration_document_file"
                                    class="form-control">
                                <span id="stored_immigration_document"></span>
                            </div>

                            <div class="col-md-4 form-group">
                                <label>{{ trans('Country') }} *</label>
                                <select name="country" id="immigration_country" required
                                    class="form-control selectpicker" data-live-search="true"
                                    data-live-search-style="contains"
                                    title='{{ __('Selecting', ['key' => trans('Country')]) }}...'>
                                    @foreach ($countries as $country)
                                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-12 form-group mt-3">
                                <div class="form-group">
                                    <label for="assinatura-pad">Por favor, assine no campo abaixo:</label><br>
                                    <canvas id="assinatura-pad" class="signature-canvas border"></canvas>
                                    <small class="form-text text-muted">Use o mouse ou o dedo para desenhar sua
                                        assinatura.</small>
                                    <input type="hidden" name="employee_signature" id="employee_signature">
                                </div>

                                <div class="d-flex justify-content-between">
                                    <button type="button" id="limpar-assinatura" class="btn btn-sm btn-danger">
                                        Limpar Assinatura
                                    </button>
                                </div>
                            </div>

                            <div class="container">
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="immigration_action" />
                                    <input type="hidden" name="hidden_id" id="immigration_hidden_id" />
                                    <input type="submit" name="action_button" id="immigration_action_button"
                                        class="btn btn-warning" value={{ trans('Add') }} />
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade confirmModal" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">{{ trans('Confirmation') }}</h2>
                    <button type="button" class="immigration-close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4 align="center" style="margin:0;">{{ __('Are you sure you want to remove this data?') }}</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button"
                        class="btn btn-danger immigration-ok">{{ trans('OK') }}</button>
                    <button type="button" class="immigration-close btn btn-default"
                        data-dismiss="modal">{{ trans('Cancel') }}</button>
                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')
    <script>
        const canvas = document.getElementById('assinatura-pad');
        const signaturePad = new SignaturePad(canvas, {
            backgroundColor: 'rgb(255, 255, 255)'
        });

        const employeeSignatureInput = $('#employee_signature').val();

        $(document).ready(function() {
            $('#limpar-assinatura').on('click', function() {
                signaturePad.clear();
            });

            $('form').on('submit', function(e) {
                if (signaturePad.isEmpty()) {
                    alert("Por favor, forneça sua assinatura.");
                    return false;
                }

                // Obtém a assinatura em formato de URL de dados (base64)
                const signatureData = signaturePad.toDataURL();
                $('#employee_signature').val(signatureData);
            });
        })

        $(document).on('click', '.immigration_edit', function() {

            signaturePad.clear();

            var id = $(this).attr('id');

            var target = "{{ route('immigrations.index') }}/" + id + '/edit';

            $.ajax({
                url: target,
                dataType: "json",
                success: function(html) {

                    let id = html.data.id;

                    $('#immigration_document_number').val(html.data.document_number);
                    $('#immigration_issue_date').val(html.data.issue_date);
                    $('#immigration_expiry_date').val(html.data.expiry_date);
                    $('#immigration_eligible_review_date').val(html.data.eligible_review_date);
                    $('#immigration_document_type_id').selectpicker('val', html.data.document_type_id);
                    $('#immigration_country').selectpicker('val', html.data.country_id);

                    if (html.data.employee_signature) {
                        signaturePad.fromDataURL(html.data.employee_signature, {width: 300, height: 100});
                    }

                    $('#immigration_hidden_id').val(html.data.id);
                    $('.modal-title').text('{{ trans('Edit') }}');
                    $('#immigration_action_button').val('{{ trans('Edit') }}');
                    $('#immigration_action').val('{{ trans('Edit') }}');
                    $('#ImmigrationformModal').modal('show');
                }
            });
        });
    </script>
@endpush
