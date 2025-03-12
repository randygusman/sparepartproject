<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loanlist.aspx.cs" Inherits="sparepartproject.loanlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - Loan List</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <%--<link rel="stylesheet" href="Style/font-awesome.css" />--%>
    <%--<link href="Style/all.min.css" rel="stylesheet" />--%>
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="Scripts/fontawesome.min.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />

    <style>
        .page-item.active .page-link {
            z-index: 3;
            color: #fff;
            background-color: #003366;
            border-color: #003366;
        }

        .page-link {
            position: relative;
            display: block;
            padding: .5rem .75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: #003366;
            background-color: #fff;
            border: 1px solid #dee2e6;
        }

        #issuedPaginationContainer {
            display: inline-block; /* Atau block */
            text-align: right;
        }

        /* Tombol Pagination */
        .page-button {
            padding: 8px 12px;
            border: 1px solid #007bff; /* Border biru */
            background-color: white; /* Latar belakang putih */
            color: #007bff; /* Warna teks biru */
            cursor: pointer;
            margin: 0 2px; /* Spasi antar tombol */
            font-size: 0.7rem; /* Ukuran font lebih kecil */
            border-radius: 5px; /* Memberikan sudut tombol yang lebih halus */
        }

            /* Hover pada tombol pagination */
            .page-button:hover {
                background-color: #007bff; /* Latar belakang biru saat tombol hover */
                color: white; /* Teks putih saat hover */
            }

            /* Tombol pagination aktif */
            .page-button.active {
                background-color: #007bff; /* Latar belakang biru untuk tombol aktif */
                color: white; /* Teks putih untuk tombol aktif */
                font-weight: bold; /* Menebalkan teks tombol aktif */
            }

            /* Tombol pagination disabled */
            .page-button:disabled {
                background-color: #e0e0e0; /* Latar belakang gray untuk tombol disabled */
                color: #b0b0b0; /* Warna teks gray untuk tombol disabled */
                cursor: not-allowed; /* Menghilangkan kursor pointer untuk tombol disabled */
            }

        /* Penataan untuk bagian pagination */
        #pagination {
            text-align: right;
            margin-top: 15px;
            padding: 10px 0;
        }

        /* Tabel */
        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem; /* Ukuran font tabel */
            font-family: sans-serif; /* Jenis font tabel */
            cursor: pointer;
        }

            .table th, .table td {
                /*padding: 10px;*/ /* Padding untuk sel tabel */
                text-align: center; /* Mengatur teks menjadi rata tengah */
                border: 1px solid #cec6c6; /* Border yang ringan untuk tabel */
                vertical-align: middle;
            }

            /* Header tabel */
            .table thead {
                background-color: #003366; /* Warna latar belakang header tabel */
                color: white; /* Warna teks header */
            }

            /* Hover efek pada baris tabel */
            .table tbody tr:hover {
                background-color: #e9ecef; /* Warna latar belakang saat hover baris tabel */
                transition: background-color 0.1s ease; /* Menambahkan transisi agar lebih smooth */
            }

            /* Warna latar belakang untuk baris ganjil */
            .table tbody tr:nth-child(odd) {
                background-color: #f9f9f9; /* Warna latar belakang baris ganjil */
            }

            /* Warna latar belakang untuk baris genap */
            .table tbody tr:nth-child(even) {
                background-color: #ffffff; /* Warna latar belakang baris genap */
            }

            /* Hover pada baris tabel */
            .table tbody tr:hover {
                background-color: #e0e0e0; /* Warna latar belakang saat hover pada baris tabel */
                cursor: pointer; /* Mengubah kursor menjadi pointer */
            }

        .btn-primary {
            background-color: #3C5A8D !important; /* Warna latar belakang untuk tombol utama */
            border-color: #3C5A8D !important; /* Warna border tombol */
        }

            .btn-primary:hover {
                background-color: #4E7BAF !important; /* Warna latar belakang saat hover */
                border-color: #4E7BAF !important; /* Warna border saat hover */
            }

            .btn-primary:focus, .btn-primary.focus {
                box-shadow: 0 0 0 0.2rem rgba(78, 123, 175, 0.5) !important; /* Efek focus */
            }

        /* Override untuk .btn-outline-primary */
        .btn-outline-primary {
            color: #3C5A8D !important; /* Warna teks untuk tombol outline */
            border-color: #3C5A8D !important; /* Warna border untuk tombol outline */
        }

            .btn-outline-primary:hover {
                background-color: #3C5A8D !important; /* Warna latar belakang saat hover */
                color: #ffffff !important; /* Warna teks saat hover (putih) */
                border-color: #4E7BAF !important; /* Warna border saat hover */
            }

            .btn-outline-primary:focus, .btn-outline-primary.focus {
                box-shadow: 0 0 0 0.2rem rgba(78, 123, 175, 0.5) !important; /* Efek focus */
            }

        #btnAddPart, #btnExportToExcel, #btnReg {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
        }

        #btnAddPartonebyone {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
        }

        .dataTables_info {
            font-size: 10px;
        }

        .dataTables_filter {
            font-size: 10px;
        }

        .dataTables_length {
            font-size: 10px;
        }

        .paging_simple_numbers {
            font-size: 10px;
        }

        .overlay {
            position: fixed;
            left: 0px;
            margin-top: 200px;
            width: 100%;
            text-align: center;
            height: 100%;
            z-index: 9999;
            background-color: transparent;
            /*background: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif') 50% 50% no-repeat rgb(249,249,249);*/
            /*background:url('load.gif');*/
            /*background: url('https://i0.wp.com/hpscans.com/wp-content/uploads/2020/10/loading.gif') 50% 50% no-repeat rgb(249,249,249);*/
        }

            .overlay::before {
                margin: auto;
                display: block;
                text-align: center;
                content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');
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

        /* Styling untuk container pencarian */
        .search-container {
            display: flex;
            justify-content: flex-end; /* Menempatkan input pencarian ke kanan */
            margin-bottom: 20px; /* Memberikan jarak di bawah input */
        }

        /* Styling untuk input pencarian */
        .search-input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 250px; /* Lebar input bisa disesuaikan */
            text-align: left; /* Menjaga teks dalam input berada di kiri */
        }

        /* Warna dasar untuk tab */
        .nav-tabs .nav-link {
            color: #003366; /* Warna teks */
            background-color: #f8f9fa; /* Warna background default */
            border: 1px solid #ddd; /* Warna border */
        }

            /* Warna untuk tab yang aktif */
            .nav-tabs .nav-link.active {
                color: white; /* Warna teks saat aktif */
                background-color: #3C5A8D !important; /* Warna background saat aktif (biru Bootstrap) */
                border-color: #3C5A8D !important; /* Warna border saat aktif */
            }

            /* Warna saat tab di-hover */
            .nav-tabs .nav-link:hover {
                background-color: #e9ecef; /* Warna background saat di-hover */
            }

            /* Hilangkan border atas pada tab yang aktif */
            .nav-tabs .nav-link.active {
                border-bottom: 0px;
            }
    </style>
</head>
<body style="font-family: Poppins;">
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
                        <li id="menuEmployee" onclick="alert('Coming Soon');">
                            <a href="#">Employee</a>
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
                <li id="menuHome">
                    <a href="home.aspx">Home</a>
                </li>
                <li id="menuSPI" class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">SPI</a>
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
                            <a href="loanlist.aspx" style="background-color: white; color: #172679;">Loan List</a>
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
    </div>

    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span></span>
                </button>
                <h5 style="margin-bottom: 0px; margin-left: 20px;">Loan List</h5>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto" style="display: inline;">
                        <li class="nav-item active">
                            <a class="nav-link" id="A1" style="display: none" runat="server"></a>
                            <a class="nav-link" id="user" runat="server">GUEST</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%-- <div class="line"></div>--%>
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="row">
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold" style="padding-left: 20px; color: #003366;">List Sparepart on Loan</h6>
                            <%--<div class="d-flex align-items-center">
                                <!-- Tombol Close -->
                                <span class="close-button" onclick="window.location.href='spi_databasepart.aspx'" style="margin-left: 10px; color: red; cursor: pointer;">
                                    <i class="fas fa-times"></i>
                                </span>
                            </div>--%>
                        </div>
                        <div class="card-body">
                          

                            <!-- Tab Panes -->
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab" style="padding-right: 20px;">
                                    <!-- Isi untuk tab Details (Bagian 1 dari kode Anda) -->
                                    <div class="row mt-3">
                                        <!-- Container Flex untuk memposisikan input pencarian ke kanan -->
                                        <div class="col-12 text-right">
                                            <input type="text" id="searchInput" placeholder="Search..." style="font-family: Poppins; font-size: .8rem; width: 250px;" />
                                        </div>
                                    </div>
                                    <table class="table table-hover mt-3 mb-3" style="font-size: .7rem; margin-left: 20px; font-family: Tahoma; cursor: pointer;" id="tabela">
                                        <thead style="background-color: #2A476B; color: white; text-align: center;">
                                            <tr>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Loan ID</th>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col" style="vertical-align: middle;">Model</th>
                                                <th scope="col" style="vertical-align: middle;">Line</th>
                                                <th scope="col" style="vertical-align: middle;">Cell</th>
                                                <th scope="col" style="vertical-align: middle;">Qty Loan</th>
                                                <th scope="col" style="vertical-align: middle;">Loan By PIC</th>
                                                <th scope="col" style="vertical-align: middle;">Remark</th>
                                                <th scope="col" style="vertical-align: middle;">Loan On</th>
                                                <th scope="col" style="vertical-align: middle;">Loan By Account</th>
                                                <th scope="col" style="vertical-align: middle;">Status</th>
                                                <th scope="col" style="vertical-align: middle;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div id="pagination">
                                        <!-- Pagination buttons akan dimuat di sini -->
                                    </div>

                                </div>

                                <div class="tab-pane fade" id="issued" role="tabpanel" aria-labelledby="issued-tab" style="padding-right: 20px;">
                                    <!-- Isi untuk tab Issued Details (Bagian 2, card Issued Details) -->
                                    <div class="row mt-3">
                                        <!-- Container Flex untuk memposisikan input pencarian ke kanan -->
                                        <div class="col-12 text-right">
                                            <input type="text" id="searchInputReturned" placeholder="Search..." style="font-family: Poppins; font-size: .8rem; width: 250px;" />
                                        </div>
                                    </div>
                                    <table class="table table-hover mt-3 mb-3" style="font-size: .7rem; margin-left: 20px; font-family: Tahoma; cursor: pointer;" id="tabelreturned">
                                        <thead style="background-color: #2A476B; color: white; text-align: center;">
                                            <tr>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Loan ID</th>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col" style="vertical-align: middle;">Model</th>
                                                <th scope="col" style="vertical-align: middle;">Line</th>
                                                <th scope="col" style="vertical-align: middle;">Cell</th>
                                                <th scope="col" style="vertical-align: middle;">Qty Loan</th>
                                                <th scope="col" style="vertical-align: middle;">Loan By PIC</th>
                                                <th scope="col" style="vertical-align: middle;">Remark</th>
                                                <th scope="col" style="vertical-align: middle;">Loan On</th>
                                                <th scope="col" style="vertical-align: middle;">Loan By Account</th>
                                                <th scope="col" style="vertical-align: middle;">Returned On</th>
                                                <th scope="col" style="vertical-align: middle;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div id="pagination-returned">
                                        <!-- Pagination buttons akan dimuat di sini -->
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%-- <div id="loadingImg" style="display: none;" class="m-auto mt-9"><%--images/load.gif
                            <img src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif" height="120" width="240" />
                        </div>--%>

                        <div class="overlay" id="loadingImg">
                            <p>Processing data, please wait...</p>
                        </div>
                    </div>

                </div>
            </div>


        </form>
    </div>

    <script src="Scripts/jquery-3.5.1.min.js"></script>

    <%--<script src="Scripts/popper.min.js"></script>--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            loadSpareParts(currentPage);
            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";
        });

        let currentPage = 1; // Halaman saat ini
        let searchTerm = ""; // Variabel untuk menyimpan kata kunci pencarian
        const pageSize = 10; // Jumlah item per halaman

        function loadSpareParts(page, search = "") {
            $.ajax({
                url: `/api/loan?page=${page}&pageSize=${pageSize}&searchTerm=${encodeURIComponent(search)}`,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    displayData(response.data); // Tampilkan data di tabel
                    //setupPagination(response.total, response.totalPages, page); // Setup pagination
                    $('#loadingImg').hide();
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                }
            });
        }

        function displayData(spareParts) {
            // Bersihkan tabel sebelumnya
            $('#tabela tbody').empty();

            if (spareParts.length === 0) {
                // Jika tidak ada hasil, tampilkan pesan
                $('#tabela tbody').append(`
            <tr>
                <td colspan="11" class="text-center" style="color:red; font-weight:500;">No Loan Part Found</td>
            </tr>
        `);
            } else {
                // Tambahkan data ke tabel
                spareParts.forEach(sparePart => {

                    let badgeStatus = '';
                    if (sparePart.status === "LOANED") {
                        badgeStatus = `<span class="badge bg-warning">LOANED</span>`;
                    } else {
                        badgeStatus = `<span class="badge bg-success" style="color:white;">RETURNED</span>`;
                    }

                    $('#tabela tbody').append(`
                <tr>
                    <td>${sparePart.id}</td>
                    <td>${sparePart.goodsCode}</td>
                    <td>${sparePart.model}</td>
                    <td>${sparePart.line}</td>
                    <td>${sparePart.cell}</td>
                    <td>${sparePart.issuedQty}</td>
                    <td>${sparePart.issuedBy}</td>
                    <td>${sparePart.reason}</td>
                    <td>${sparePart.issuedOn}</td>
                    <td>${sparePart.issuedByAccount}</td>
                    <td>${badgeStatus}</td>
                    <td>
                        <!-- Tombol View dengan ikon -->
                        <button class="btn btn-outline-info btn-sm view-btn" data-id="${sparePart.id}" title="View Loan Part">
                            <i class="fas fa-search"></i>
                        </button>
                    
                    </td>
                </tr>
            `);
                });
            }
        }

        //handle button view nantinya
        $('#tabela').on('click', '.view-btn', function (e) {
            e.preventDefault();  // Mencegah reload halaman

            const id = $(this).data('id'); // Mendapatkan GoodsCode dari data-id

            // Membuka halaman detail sparepart dengan GoodsCode sebagai parameter
            //window.open(`spi_databasepart_detail.aspx?goodsCode=${goodsCode}`);
            window.location.href = `loanlist_details.aspx?id=${id}`;
        });


    </script>
</body>
</html>
