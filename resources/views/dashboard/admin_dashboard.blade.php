@extends('layout.main')
@section('content')

        <!-- Alert Section for version upgrade-->
        @if (env('USER_VERIFIED'))
            <div id="alertSection" class="{{ $versionUpgradeData['alert_version_upgrade_enable']==true ? null : 'd-none' }} alert alert-primary alert-dismissible fade show" role="alert">
                <p id="announce"><strong>Announce !!!</strong> A new version {{$versionUpgradeData['demo_version']}} has been released. Please <i><b><a href="{{route('new-release')}}">Click here</a></b></i> to check upgrade details.</p>
                <button type="button" id="closeButtonUpgrade" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif

    <section>
        <div class="container-fluid">
            <div class="d-flex justify-content-between mb-30px">
                <div><h1 class="thin-text">{{__('Welcome')}} {{auth()->user()->username}}</h1></div>
                <div><h4 class="thin-text">{{__('Today is')}} {{ now()->locale('pt_BR')->dayName }} {{now()->format(env('Date_Format'))}}</h4></div>
            </div>
            @foreach ($companiesIndicators as $key => $value)
                <h3 class="mt-3">{{ $key }}</h3>
                <div class="row">
                    <div class="col-sm-1">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('employees.index')}}">
                                <div class="name"><strong class="purple-text">Funcionários</strong>
                                </div>
                                <div class="count-number employee-count">{{ $value['employees_count'] }}</div>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-1">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('employees.index', ['is_street_vendor' => 1])}}">
                                <div class="name"><strong class="purple-text">Feristas</strong>
                                </div>
                                <div class="count-number employee-count">{{ $value['street_vendors_count'] }}</div>
                            </a>
                        </div>
                    </div>

                    <!-- Count item widget-->
                    <div class="col-sm-2">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('resignations.index')}}">
                                <div class="name"><strong class="orange-text">Desligamentos</strong></div>
                                <div class="count-number attendance-count">{{ $value['resignations_count'] }}</div>
                            </a>
                        </div>
                    </div>
                    <!-- Count item widget-->
                    <div class="col-sm-2">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('leaves.index')}}">
                                <div class="name"><strong class="green-text">Licenças</strong></div>
                                <div class="count-number leave-count">{{ $value['leaves_count'] }}</div>
                            </a>
                        </div>
                    </div>
                    <!-- Count item widget-->
                    <div class="col-sm-2">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('employees.index')}}">
                                <div class="name"><strong class="blue-text">Masculinos</strong></div>
                                <div class="count-number total_expense"> {{ $value['employees_male'] }}</div>
                                {{-- <div class="count-number total_expense"> {{number_format((float)$total_expense, 2, '.', '') }}</div> --}}
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-2">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('employees.index')}}">
                                <div class="name"><strong class="green-text">Femininos</strong></div>
                                <div class="count-number total_deposit">{{ $value['employees_female'] }}</div>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-2">
                        <div class="wrapper count-title text-center">
                            <a href="{{route('employees.index')}}">
                                <div class="name"><strong class="green-text">Funcionários PCD</strong></div>
                                <div class="count-number total_deposit">{{ $value['employees_physically_disabled'] }}</div>
                            </a>
                        </div>
                    </div>

                </div>
            @endforeach

            <div class="row">
                <div class="col-md-8 mt-4">
                    <div class="card mb-0">
                        <div class="card-header d-flex align-items-center">
                            <h4>Funcionários por Município --- {{__('Last 6 Months ')}}</h4>
                        </div>
                        <div class="card-body">
                            <canvas id="payment_last_six" data-last_six_month_payment = "{{json_encode($funcionariosPorMunicipio->values()) ?? ''}}" data-months="{{json_encode($funcionariosPorMunicipio->keys()->map(fn($municipio) => $municipio == " " || $municipio == "" ? "N/I" : $municipio)) ?? ''}}"  data-label1="Por Município" data-label2="empresa"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mt-4">
                    <div class="card mb-0">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>{{__('Employee Department')}}</h4>
                        </div>
                        <div class="pie-chart mb-2">
                            <canvas id="department_chart" data-dept_bgcolor='@json($dept_bgcolor_array)'
                                    data-hover_dept_bgcolor='@json($dept_hover_bgcolor_array)'
                                    data-dept_emp_count='@json($dept_count_array)'
                                    data-dept_label='@json($dept_name_array)' width="100" height="95"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mt-4">
                    <div class="card mb-0">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>{{__('Employee Designation')}}</h4>
                        </div>
                        <div class="pie-chart mb-2">
                            <canvas id="designation_chart" data-desig_bgcolor='@json($desig_bgcolor_array)'
                                    data-hover_desig_bgcolor='@json($desig_hover_bgcolor_array)'
                                    data-desig_emp_count='@json($desig_count_array)'
                                    data-desig_label='@json($desig_name_array)' width="100" height="95"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mt-4">
                    <div class="card mb-0">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>{{__('Expense Vs Deposit')}}</h4>
                        </div>
                        <div class="pie-chart mb-2">
                            <canvas id="expense_deposit_chart" data-expense_count='{{$total_expense_raw}}'
                                    data-expense_level="{{trans('Expense')}}"
                                    data-deposit_count='{{$total_deposit_raw}}'
                                    data-deposit_level="{{trans('Deposit')}}" width="100" height="95"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mt-4">
                    <div class="card mb-0">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>{{__('Project Status')}}</h4>
                        </div>
                        <div class="pie-chart mb-2">
                            <canvas id="project_chart" data-project_status='@json($project_count_array)'
                                    data-project_label='@json($project_name_array)' width="100" height="95"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            Escolaridade
                        </div>
                        <div class="card-body">
                            <canvas id="escolaridade-chart"
                                data-labels="{{ json_encode($qualificationsCounts->keys()->toArray()) }}"
                                data-values="{{ json_encode($qualificationsCounts->values()->toArray()) }}"
                                data-colors="{{ json_encode($qualificationsCountsColors) }}">
                            </canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-4 mt-2">
                    <div class="wrapper count-title d-flex">
                        <div class="icon blue-text ml-2 mr-3"><i class="dripicons-volume-medium"></i></div>
                        <a href="{{route('announcements.index')}}">
                            <h3 class="mt-3">{{ count($announcements) }} {{trans('Announcement')}}</h3>
                        </a>
                    </div>
                </div>
                <div class="col-4 mt-4">
                    <div class="wrapper count-title d-flex">
                        <div class="icon green-text ml-2 mr-3"><i class="dripicons-ticket"></i></div>
                        <a href="{{route('tickets.index')}}">
                            <h3 class="mt-3">{{$ticket_count}} {{__('Open Ticket')}}</h3>
                        </a>
                    </div>
                </div>
                <div class="col-4 mt-4">
                    <div class="wrapper">
                        <div class="icon orange-text ml-2 mr-3"><i class="dripicons-briefcase"></i></div>
                        <a href="{{route('projects.index')}}">
                            <h3 class="mt-3">{{$completed_projects}} {{__('Completed Projects')}}</h3>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                @include('calendarable.calendar')
            </div>
                <div class="card">
                    <div class="card-body">
                        <h3 class="box-title"> Mapa de funcionarios </h3>
                        <div id="mapa" style="height: 500px; width: 100%"></div>
                    </div>
                </div>
            </div>
            @php
                $firstEmployee = $employees
                    ->filter(fn($employee) => $employee->latitude != null && $employee->longitude != null)
                    ->first();

                $employeesWithGeoLocation = $employees
                    ->filter(fn($employee) => $employee->latitude != null && $employee->longitude != null);
            @endphp
            {{-- <gmp-map center="{{$firstEmployee->latitude}},{{$firstEmployee->longitude}}" zoom="15" map-id="DEMO_MAP_ID" style="height: 500px;">
                @foreach ($employees as $employee)
                    @if($employee->latitude && $employee->longitude)
                        <gmp-advanced-marker
                            position="{{$employee->latitude}},{{$employee->longitude}}"
                            title="My location">
                        </gmp-advanced-marker>
                    @endif
                @endforeach
            </gmp-map> --}}
        </div>

    </section>
@endsection

@push('scripts')
<script>
    let employees = @json($employees);
    let firstEmployee = @json($firstEmployee);
    let employeesWithGeoLocation = @json($employeesWithGeoLocation);
    let companies = @json($companies);

    function generateColor(id) {
        const hash = id.toString().split("").reduce((acc, char) => acc + char.charCodeAt(0), 0);
        const hue = hash % 360; // Ensure it stays within valid HSL range
        return `hsl(${hue}, 70%, 50%)`; // Adjust saturation and lightness for better colors
    }

    companies = companies.reduce((acc, { id, company_name, company_logo }, index) => {
        acc[id] = { index, company_name, company_logo, color: generateColor(id) };
        return acc;
    }, {});

    function initMap() {
        const centerMap = { lat: parseFloat(-9.941624), lng: parseFloat(-67.804987) }; // Localização Inicial Rio Branco, AC
        const map = new google.maps.Map(document.getElementById("mapa"), {
            zoom: 13,
            center: centerMap,
            mapId: "mapa",
        });

        const icon = {
            //url: "https://cdn-icons-png.flaticon.com/256/1673/1673221.png", // url
            scaledSize: new google.maps.Size(50, 50), // scaled size
            origin: new google.maps.Point(0,0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
        };

        employees.forEach(emp => {
            const marker = new google.maps.Marker({
                position: { lat: parseFloat(emp.latitude), lng: parseFloat(emp.longitude) },
                map: map,
                title: emp.first_name
            });

            const infoWindow = new google.maps.InfoWindow({
                content: `
                    <span><strong>Nome: </strong>${emp.first_name}</span><br>
                    <span><strong>CPF: </strong>${emp.staff_id}</span><br>
                    <span><strong>Empresa: </strong>${emp.company ? emp.company.company_name : '-'}</span><br>
                    <span><strong>Telefone: </strong>${emp.contact_no}</span><br>
                    <span><strong>Rua: </strong>${emp.address}, ${emp.address_number}, ${emp.zip_code}</span><br>
                    <span><strong>Cidade: </strong> ${emp.city}</span><br>
                `
            });

            marker.addListener("click", () => {
                infoWindow.open(map, marker);
            });
        });
    }

    // Function to create the marker content
    function createStyledMarker(color, logo) {
        const div = document.createElement("div");
        div.style.width = "40px";
        div.style.height = "40px";
        div.style.borderRadius = "50%";
        div.style.backgroundColor = color;
        div.style.display = "flex";
        div.style.alignItems = "center";
        div.style.justifyContent = "center";
        div.style.boxShadow = "0px 2px 6px rgba(0,0,0,0.3)";

        if (logo) {
            const img = document.createElement("img");
            img.src = logo;
            img.style.width = "60%";
            img.style.height = "60%";
            img.style.borderRadius = "50%";
            div.appendChild(img);
        }

        return div;
    }

    // var map = L.map('mapa').setView([51.505, -0.09], 13);

    // let employees = @json($employees);

    // L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    //     attribution: '&copy; OpenStreetMap contributors'
    // }).addTo(map);

    // employees.forEach(employee => {
    //     if (employee.latitude && employee.longitude) {
    //         L.marker([employee.latitude, employee.longitude])
    //             .addTo(map)
    //             .bindPopup(`<b>${employee.first_name}</b>`)
    //     }
    // })

    // var mapGroup = new L.featureGroup(
    //     employees.filter(employee =>
    //         (employee.latitude !== null && employee.latitude !== '')
    //         && (employee.longitude !== null && employee.longitude !== '')
    //     ).map(employee => L.marker([employee.latitude, employee.longitude]))
    // );

    // map.fitBounds(mapGroup.getBounds());

    $(document).ready(function () {
        // Gráfico de escolaridade
        setTimeout(() => {
            initMap()
        }, 1000);
        const escolaridadeChart = document.getElementById('escolaridade-chart');
        const escolaridadeChartLabels = escolaridadeChart.getAttribute('data-labels');
        const escolaridadeChartValues = escolaridadeChart.getAttribute('data-values');
        const escolaridadeChartColors = escolaridadeChart.getAttribute('data-colors');

        new Chart(escolaridadeChart, {
            type: 'bar',
            data: {
                labels: JSON.parse(escolaridadeChartLabels),
                datasets: [
                    {
                        axis: 'y',
                        label: 'Escolaridades',
                        data: JSON.parse(escolaridadeChartValues),
                        borderWidth: 1,
                        backgroundColor: JSON.parse(escolaridadeChartColors)
                    }
                ]
            },
            options: {
                indexAxis: 'y',
                plugins: {
                    legend: {
                        position: 'right',
                    },
                    title: {
                        display: true,
                        text: 'Chart.js Horizontal Bar Chart'
                    }
                },
                responsive: true
            }
        });
    })
</script>
@endpush



