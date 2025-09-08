<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="icon" type="image/png" href="{{asset('/images/logo/'.$general_settings->site_logo)}}"/>
    <title>{{$general_settings->site_title ?? "NO Title"}}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Bootstrap CSS-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/awesome-bootstrap-checkbox.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/awesome-bootstrap-checkbox.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap-datepicker.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap-datepicker.min.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/jquery-clockpicker/bootstrap-clockpicker.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/jquery-clockpicker/bootstrap-clockpicker.min.css') }}"></noscript>

    <!-- Boostrap Tag Inputs-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/Tag_input/tagsinput.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/Tag_input/tagsinput.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap-select.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/bootstrap/css/bootstrap-select.min.css') }}"></noscript>

    <!-- Font Awesome CSS-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/font-awesome/css/font-awesome.min.css') }}"></noscript>

    <!-- Dripicons icon font-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/dripicons/webfont.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/dripicons/webfont.css') }}"></noscript>

    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">

    <!-- jQuery Circle-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('css/grasp_mobile_progress_circle-1.0.0.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('css/grasp_mobile_progress_circle-1.0.0.min.css') }}"></noscript>

    <!-- Custom Scrollbar-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css') }}"></noscript>

    <!-- date range stylesheet-->
    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/daterange/css/daterangepicker.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('vendor/daterange/css/daterangepicker.min.css') }}"></noscript>

    <!-- Assinatura -->
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>

    <!-- datatable stylesheet start-->
    @if (isset($isDataTableExist) && $isDataTableExist)
        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/dataTables.bootstrap4.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/dataTables.bootstrap4.min.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/buttons.bootstrap4.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/buttons.bootstrap4.min.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/select.bootstrap4.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/select.bootstrap4.min.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/dataTables.checkboxes.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/dataTables.checkboxes.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/datatables.flexheader.boostrap.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/datatables.flexheader.boostrap.min.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/datatable.responsive.boostrap.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/datatable/datatable.responsive.boostrap.min.css') }}"></noscript>
    @endif
    <!-- datatable stylesheet End-->


    @stack('css')


    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/select2/dist/css/select2.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/select2/dist/css/select2.min.css') }}"></noscript>

    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/RangeSlider/ion.rangeSlider.min.css') }}">
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/RangeSlider/ion.rangeSlider.min.css') }}"></noscript>


    <!-- theme stylesheet-->


    <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('css/style.default.css') }}" id="theme-stylesheet" >
    <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'" href="{{ asset('css/style.default.css') }}" id="theme-stylesheet" ></noscript>




    @if (env('RTL_LAYOUT')!=NULL)
        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/bootstrap/css/bootstrap-rtl.min.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('vendor/bootstrap/css/bootstrap-rtl.min.css') }}"></noscript>

        <link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('css/custom-rtl.css') }}">
        <noscript><link rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'"  href="{{ asset('css/custom-rtl.css') }}"></noscript>
    @endif


    @if((request()->is('admin/dashboard*')) || (request()->is('calendar*')) )
        @include('calendarable.css')
    @endif

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
</head>


<body>
<div id="loader"></div>

@include('layout.main_partials.header')


@if ($isCrmModuleExist)
    @include('crm::layouts.partials.admin_sidebar')
@else
    @include('layout.main_partials.sidebar')
@endif


<section id="content" class="page animate-bottom d-none">
    @yield('content')
    @include('layout.main_partials.footer')
</section>



{{-- New Format --}}
<script type="text/javascript" src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/jquery/jquery-ui.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/jquery/bootstrap-datepicker.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/jquery-clockpicker/bootstrap-clockpicker.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/popper.js/umd/popper.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/bootstrap-toggle/js/bootstrap-toggle.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/bootstrap/js/bootstrap-select.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('js/grasp_mobile_progress_circle-1.0.0.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/chart.js/Chart.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/jquery-validation/jquery.validate.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/charts-custom.js') }}"></script>
<script type="text/javascript" src="{{ asset('js/front.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/daterange/js/moment.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/daterange/js/knockout-3.4.2.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/daterange/js/daterangepicker.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/tinymce/js/tinymce/tinymce.min.js') }}"></script>

<!-- JS for Boostrap Tag Inputs-->
<script type="text/javascript" src="{{ asset('vendor/Tag_input/tagsinput.js') }}"></script>
<script type="text/javascript" src="{{ asset('vendor/RangeSlider/ion.rangeSlider.min.js') }}"></script>

<!-- table sorter js-->

<!-- datatable Script Start-->
@if (isset($isDataTableExist) && $isDataTableExist)

    @if(Config::get('app.locale') == 'Arabic')
        <script type="text/javascript" src="{{ asset('vendor/datatable/pdfmake_arabic.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('vendor/datatable/vfs_fonts_arabic.js') }}"></script>
    @else
        <script type="text/javascript" src="{{ asset('vendor/datatable/pdfmake.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('vendor/datatable/vfs_fonts.js') }}"></script>
    @endif

    <script type="text/javascript" src="{{ asset('vendor/datatable/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/dataTables.bootstrap4.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/dataTables.buttons.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/buttons.bootstrap4.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/buttons.colVis.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/buttons.html5.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/buttons.print.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/dataTables.select.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/sum().js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/dataTables.checkboxes.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/datatable.fixedheader.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/datatable.responsive.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/datatable/datatable.responsive.boostrap.min.js') }}"></script>
@endif
<!-- datatable Script End-->


<script type="text/javascript" src="{{ asset('vendor/select2/dist/js/select2.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDx0V6xpjH-wydIt0CaDVcMFrOsj_bqa7Y&callback=initMap"></script>

@if((request()->is('admin/dashboard*')) || (request()->is('calendar*')) )
    @include('calendarable.js')
@endif

{{-- New Format --}}


<script type="text/javascript">
    (function ($) {
        "use strict";

        $(document).ready(function () {

            // alert('teste');
            $('.cpf').mask('000.000.000-00', {reverse: true});
            $('.phone').mask('(00) 0000-0000');
            $('.cellphone').mask('(00) 00000-0000');

            if (window.location.href.indexOf('#formModal') != -1) {
                $('#formModal').modal('show');
            }
            else if(window.location.href.indexOf('#createModal') != -1) {
                $('#createModal').modal('show');
            }
        });

        // $('#empty_database').on('click', function () {
        //     if (confirm('{{__('Delete Selection',['key'=>__('Empty Database')])}}')) {
        //         let url = '{{route('empty_database')}}';
        //         document.location.href = url;
        //     } else {

        //     }
        // });


        $('.notify-btn').on('click', function (e) {
            e.preventDefault(); // evita o comportamento padrão do link

            var notificationId = $(this).data('id');
            var url = $(this).find('a').attr('href');

            $.ajax({
                url: '{{ route('markAsRead') }}',
                type: 'POST',
                data: {
                    id: notificationId,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function (result) {
                    // redireciona para o link após marcar como lida
                    window.location.href = url;
                },
                error: function () {
                    // em caso de erro, também redireciona para o link
                    window.location.href = url;
                }
            });
        });


    })(jQuery);
</script>

<script>
    // Força o idioma para Portuguese ao carregar a página, se não estiver definido
    document.addEventListener('DOMContentLoaded', function() {
        var langCookie = document.cookie.split('; ').find(row => row.startsWith('language='));
        if (!langCookie || langCookie.split('=')[1] !== 'Portuguese') {
            document.cookie = 'language=Portuguese; path=/; max-age=' + (60*60*24*365);
            // Recarrega a página para aplicar o idioma
            location.reload();
        }
    });
</script>

@stack('scripts')


</body>
</html>
