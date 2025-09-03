        let table_table = $('#employeeRemainingLeaveTable').DataTable({
            responsive: true,
            fixedHeader: {
                header: true,
                footer: true
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('employee_leave_type_detail.index',$employee->id) }}",
            },

            columns: [
                {
                    data: 'leave_type',
                    name: 'leave_type',

                },
                {
                    data: 'allocated_day',
                    name: 'allocated_day',

                },
                {
                    data: 'remaining',
                    name: 'remaining',

                },
            ],


            "order": [],
            'language': {
                'lengthMenu': '_MENU_ {{__('records per page')}}',
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
                    'targets': [0, 2],
                },
        ],


            'select': {style: 'multi', selector: 'td:first-child'},
            'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],

        });
        new $.fn.dataTable.FixedHeader(table_table);


