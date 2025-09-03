
$('#salary_pension_form').on('submit', function (event) {
    event.preventDefault();

    var fieldName = 'pension_amount'
    var formData = new FormData(this);
    let amountFormatted = $("#"+fieldName).val();
    let amountRaw = amountFormatted.replace(/[^0-9,]/g, '').replace(',', '.'); // Convert "R$ 1.234,56" to "1234.56"
    formData.set(fieldName, amountRaw);

    $.ajax({
        url: "{{ route('employees.pension_update',$employee->id) }}",
        method: "POST",
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
        dataType: "json",
        success: function (data) {
            console.log(data);
            var html = '';
            if (data.errors) {
                html = '<div class="alert alert-danger">';
                for (var count = 0; count < data.errors.length; count++) {
                    html += '<p>' + data.errors[count] + '</p>';
                }
                html += '</div>';
            }
            if (data.error) {
                html = '<div class="alert alert-danger">' + data.error + '</div>';
            }
            if (data.success) {
                html = '<div class="alert alert-success">' + data.success + '</div>';
            }
            $('#pension_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
        }

    });
});

