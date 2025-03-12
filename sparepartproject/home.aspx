<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="sparepartproject.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>SPI Inventory - Dashboard</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />

    <%--<link rel="stylesheet" href="Style/font-awesome.css" />--%>
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="Scripts/fontawesome.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="Content/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="Style/admin-2.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <style>
        .card-body {
            display: flex;
            flex-direction: column; /* Susun konten secara vertikal */
            /*height: auto !important;*/ /* Biarkan tinggi menyesuaikan dengan konten */
        }

        .chart-area {
            flex-grow: 1; /* Biarkan area chart mengisi ruang yang tersedia */
        }

        .text-xs {
            font-size: .8rem;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('Font/Poppins-Light.ttf') format('truetype'), url('Font/Poppins-Light.woff2') format('woff2');
            font-weight: 300;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('Font/Poppins-Regular.ttf') format('truetype'), url('Font/Poppins-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('Font/Poppins-Medium.ttf') format('truetype'), url('Font/Poppins-Medium.woff2') format('woff2');
            font-weight: 500;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('Font/Poppins-Bold.ttf') format('truetype'), url('Font/Poppins-Bold.woff2') format('woff2');
            font-weight: 600;
            font-style: normal;
        }
    </style>
</head>
<body style="font-family: 'Poppins';">

    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components" style="font-weight: 500;">
                <li id="menuConfig">
                    <a href="#configSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">System Config</a>
                    <ul class="collapse list-unstyled" id="configSubmenu">
                        <li id="menuModel">
                            <a href="systemconfig/spi_model.aspx">Model</a>
                        </li>
                        <li id="menuLine">
                            <a href="systemconfig/spi_line.aspx">Line</a>
                        </li>
                        <li id="menuCell">
                            <a href="systemconfig/spi_cell.aspx">Cell</a>
                        </li>
                        <li id="menuKeeping">
                            <a href="systemconfig/spi_keeping.aspx">Keeping & Sub Keeping</a>
                        </li>
                        <li id="menuCurrency" onclick="alert('Coming Soon');">
                            <a href="#">Currency</a>
                        </li>
                        <li id="menuEmployee">
                            <a href="systemconfig/spi_employee.aspx">Employee</a>
                        </li>
                        <li id="menuVendor">
                            <a href="systemconfig/spi_vendor.aspx">Vendor</a>
                        </li>
                        <li id="menuMaker">
                            <a href="systemconfig/spi_maker.aspx">Maker</a>
                        </li>
                        <li id="menuUnit">
                            <a href="systemconfig/spi_unit.aspx">Unit</a>
                        </li>
                    </ul>
                </li>
                <li id="menuHome" class="active">
                    <a href="home.aspx" style="background-color: white; color: #172679;">Home</a>
                </li>
                <li id="menuSPI">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">SPI</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li id="menuRegisterPart">
                            <a href="registernew.aspx">Register Part</a>
                        </li>
                        <li id="menuCatalog">
                            <a href="catalog.aspx">Catalog</a>
                        </li>
                        <li id="menuDatabasePart">
                            <a href="spi_databasepart.aspx">Database Part</a>
                        </li>
                        <li id="menuDailyIssuedPart">
                            <a href="dailyissuedpart.aspx">Daily Issued Part</a>
                        </li>
                        <li id="menuLoanList">
                            <a href="loanlist.aspx">Loan List</a>
                        </li>
                        <li id="menuOrderPart">
                            <a href="sparepartorder.aspx">Order Part</a>
                        </li>
                        <li id="menuComingPart">
                            <a href="comingpart.aspx">Coming Part</a>
                        </li>
                        <li id="menuListPrintLabel">
                            <a href="listprintlabel.aspx">List Print Label</a>
                        </li>
                        <li id="menuClosedActivity">
                            <a href="closedactivity.aspx">Closed Activity</a>
                        </li>
                        <li id="menuModifHistory">
                            <a href="modification_history.aspx">Modification History</a>
                        </li>
                    </ul>
                </li>
                <li id="menuExpenses">
                    <a href="#ExpensesSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Expenses</a>
                    <ul class="collapse list-unstyled" id="ExpensesSubmenu">
                        <li id="menuPreExpenses">
                            <a href="expenses.aspx">Pre Expenses</a>
                        </li>
                        <li id="menuExpensesList">
                            <a href="expenseslist.aspx">Expenses</a>
                        </li>
                        <li id="menuExpensesUncounting">
                            <a href="expenseslist_uncounting.aspx">Expenses (Uncounting)</a>
                        </li>
                    </ul>
                </li>
                <li id="menuQC">
                    <a href="qcreminder_insertnew.aspx">QC Check Reminder</a>
                </li>
                <li id="menuContactor">
                    <a href="informationitem.aspx">Contactor</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li id="menuLogout">
                    <a href="Logout.aspx" class="article">Logout</a>
                </li>
            </ul>
        </nav>
        <div id="content">
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Sparepart</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800" id="asd" runat="server">6635 items</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-tools fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Zero Stock</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800" id="zeroo">1880 items</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-database fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Zero Stock Percentage</div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="percentage">12%</div>
                                        </div>
                                        <div class="col">
                                            <div class="progress progress-sm mr-2">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 12%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Part Coming (Under Construction)</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">190 items</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Area Chart -->
                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-4">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Top 10 Part Issued</h6>
                            <div>
                                <select id="monthDropdown" style="cursor:pointer;" class="form-control form-control-sm">
                                </select>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body" style="height: 430px;">
                            <div class="chart-area">
                                <div style="position: relative; height: 100%; width: 100%;">
                                    <div id="myAreaChart"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <!-- Area Chart -->
                <%--<div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Top 10 Part Issued</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                    <div class="dropdown-header">Dropdown Header:</div>
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <canvas id="myAreaChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>--%>


                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Stock Category</h6>
                            
                        </div>
                        <!-- Card Body -->
                        <div class="card-body" style="height: 440px;">
                            <div id="chartContainer" style="width:100%; height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <form id="form1" runat="server">
    </form>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>
    <script src="Scripts/highchart.js"></script>
    <script src="Scripts/highchart3d.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            // Fungsi untuk menghasilkan opsi dropdown bulan
            function populateMonthDropdown() {
                const monthDropdown = $('#monthDropdown');
                monthDropdown.empty(); // Kosongkan dropdown

                const now = new Date();
                for (let i = 0; i < 12; i++) {
                    const month = now.getMonth(); // 0-11
                    const year = now.getFullYear();
                    const monthName = new Date(year, month, 1).toLocaleString('default', {
                        month: 'long'
                    }); // Nama bulan
                    const value = `${year}-${String(month + 1).padStart(2, '0')}`; // Format YYYY-MM

                    monthDropdown.append(`<option style="cursor:pointer;" value="${value}">${monthName} ${year}</option>`);

                    now.setMonth(now.getMonth() - 1); // Mundur satu bulan
                }

                // Set nilai default ke bulan saat ini
                const currentMonth = new Date().getMonth() + 1;
                const currentYear = new Date().getFullYear();
                const defaultValue = `${currentYear}-${String(currentMonth).padStart(2, '0')}`;
                monthDropdown.val(defaultValue);
            }

            // Fungsi untuk membuat grafik (dengan parameter bulan)
            function createTop10Chart(selectedMonth) {
                $.ajax({
                    url: `/api/sparepartissued/top10?month=${selectedMonth}`, // Ganti dengan endpoint API Anda
                    type: 'GET',
                    dataType: 'json',
                    beforeSend: function () {
                        $('#myAreaChart').html('<p>Loading data...</p>');
                    },
                    success: function (top10Data) {
                        const labels = top10Data.map(item => item.goodsName);
                        const values = top10Data.map(item => item.quantityIssued);

                        // Mengolah data untuk Highcharts
                        const seriesData = labels.map((label, index) => ({
                            name: label,
                            y: values[index]
                        }));

                        Highcharts.chart('myAreaChart', { // Ganti dengan ID container Anda
                            chart: {
                                type: 'bar' // atau 'bar' untuk horizontal bar
                            },
                            title: {
                                text: null
                            },
                            xAxis: {
                                categories: labels,
                                title: {
                                    text: 'Partcode / Part Name'
                                }
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Quantity Issued',
                                    align: 'high'
                                },
                                labels: {
                                    overflow: 'justify'
                                }
                            },
                            tooltip: {
                                valueSuffix: ' pcs'
                            },
                            plotOptions: {
                                bar: {
                                    dataLabels: {
                                        enabled: true
                                    }
                                }
                            },
                            legend: {
                                enabled: false
                            },
                            credits: {
                                enabled: false
                            },
                            colors: ['#7cb5ec'], // Tambahkan opsi colors di sini
                            series: [{
                                name: 'Quantity Issued',
                                data: seriesData
                            }]
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching top 10 spareparts:', error);
                        alert('Failed to load top 10 spareparts data.');
                    }
                });
            }

            // Fungsi untuk membuat grafik (dengan parameter bulan)
            function createStockCategoryChart() {
                const apiUrl = `/api/home/groupbycategory`;
                const categoryColors = {
                    'INACTIVE': '#cc3700',   // Merah
                    'REGULAR': '#bbdefb', // Biru
                    'CRITICAL': '#7cb5ec',  // Oranye
                    'ACTIVE': '#2b908f'       // Abu-abu
                    // Tambahkan warna lain sesuai kebutuhan
                };

                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    dataType: 'json',
                    beforeSend: function () {
                        $('#chartContainer').html('<p>Loading data...</p>');
                    },
                    success: function (data) {
                        if (!data || data.length === 0) {
                            $('#chartContainer').html('<p>No data available.</p>');
                            return;
                        }

                        // Format data untuk Highcharts, termasuk warna
                        const chartData = data.map(item => ({
                            name: item.StockCategory,
                            y: item.Percentage,
                            color: categoryColors[item.StockCategory] || '#607d8b' // Warna default jika kategori tidak ditemukan
                        }));

                        Highcharts.chart('chartContainer', {
                            chart: {
                                type: 'pie',
                                options3d: {
                                    enabled: true,
                                    alpha: 45,
                                    beta: 0
                                }
                            },
                            title: {
                                text: null
                            },
                            tooltip: {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    depth: 35,
                                    innerSize: '50%', // Membuat donat
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        connectorColor: 'silver'
                                    }
                                }
                            },
                            series: [{
                                name: 'Stock Category',
                                data: chartData
                            }],
                            credits: {
                                enabled: false
                            }
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching data:', error);
                        $('#chartContainer').html('<p>Error loading chart data: ' + error + '</p>');
                    },
                    complete: function () {
                    }
                });
            }


            // Isi dropdown saat halaman dimuat
            populateMonthDropdown();

            // Buat grafik awal (dengan bulan saat ini)
            createTop10Chart($('#monthDropdown').val());

            // Tambahkan event listener ke dropdown
            $('#monthDropdown').on('change', function () {
                const selectedMonth = $(this).val();
                createTop10Chart(selectedMonth); // Perbarui grafik saat bulan dipilih
            });

            var role = sessionStorage.getItem("role");

            // Fungsi untuk menyembunyikan semua menu kecuali yang diizinkan
            function hideAllMenus() {
                $("#menuConfig").hide();
                $("#menuModel").hide();
                $("#menuLine").hide();
                $("#menuCell").hide();
                $("#menuKeeping").hide();
                $("#menuCurrency").hide();
                $("#menuEmployee").hide();
                $("#menuVendor").hide();
                $("#menuMaker").hide();
                $("#menuUnit").hide();
                $("#menuHome").hide();
                $("#menuSPI").hide();
                $("#menuRegisterPart").hide();
                $("#menuCatalog").hide();
                $("#menuDatabasePart").hide();
                $("#menuDailyIssuedPart").hide();
                $("#menuOrderPart").hide();
                $("#menuComingPart").hide();
                $("#menuListPrintLabel").hide();
                $("#menuClosedActivity").hide();
                $("#menuExpenses").hide();
                $("#menuPreExpenses").hide();
                $("#menuExpensesList").hide();
                $("#menuExpensesUncounting").hide();
                $("#menuQC").hide();
                $("#menuContactor").hide();
                $("#menuLogout").hide();
                $("#menuModifHistory").hide();
                $("#menuLoanList").hide();
                
            }

            // Jika role adalah ADMIN, tampilkan semua menu
            if (role === "ADMIN") {
                // Semua menu sudah ditampilkan secara default
                // Anda bisa menambahkan logika lain di sini jika diperlukan
            }
            else if (role === "SPV") {
                hideAllMenus(); // Sembunyikan semua menu

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDailyIssuedPart").show();
                $("#menuDatabasePart").show();

                // ... tambahkan menu lain yang diizinkan untuk STAFF
            } else if (role === "STAFF") {
                hideAllMenus(); // Sembunyikan semua menu
                $("#menuDatabasePart").show();

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDailyIssuedPart").show();
            }
            else if (role === null) {
                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                window.location.href = "Default.aspx";

            }

            // Panggil AJAX untuk mengambil total sparepart saat halaman dimuat
            $.ajax({
                type: "POST",
                url: "home.aspx/GetTotalSparepart",  // URL WebMethod
                data: '{}',  // Data kosong karena kita tidak mengirimkan parameter
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Ambil total sparepart dari response dan update elemen #asd
                    $('#asd').text(response.d + " items");
                },
                error: function (xhr, status, error) {
                    console.log("Error: " + error);
                }
            });


            // Panggil AJAX untuk mengambil total sparepart saat halaman dimuat
            $.ajax({
                type: "POST",
                url: "home.aspx/GetTotalSparepart_Zero",  // URL WebMethod
                data: '{}',  // Data kosong karena kita tidak mengirimkan parameter
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Ambil total sparepart dari response dan update elemen #asd
                    $('#zeroo').text(response.d + " items");
                },
                error: function (xhr, status, error) {
                    console.log("Error: " + error);
                }
            });

            // Panggil AJAX untuk mengambil total sparepart dan zero stock percentage saat halaman dimuat
            $.ajax({
                type: "POST",
                url: "home.aspx/GetZeroStockPercentage",  // URL WebMethod untuk zero stock percentage
                data: '{}',  // Data kosong karena kita tidak mengirimkan parameter
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Ambil zero stock percentage dari response dan update elemen #zeroStockPercentage
                    $('#percentage').text(response.d + "%");
                },
                error: function (xhr, status, error) {
                    console.log("Error: " + error);
                }
            });

            //createTop10Chart();
            createStockCategoryChart();
        });


        

    </script>
</body>
</html>
