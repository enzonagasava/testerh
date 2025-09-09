<div class="row">
    <div class="table-responsive">
        <table id="employee_ticket-table" class="table ">
            <thead>
            <tr>
                <th>{{__('Ticket Details')}}</th>
                <th>{{trans('Subject')}}</th>
                <th>{{trans('Priority')}}</th>
                <th>{{trans('Date')}}</th>
                <th class="not-exported">{{trans('action')}}</th>
            </tr>
            </thead>

        </table>
    </div>

    <div id="document_view_modal2" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
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

</div>
