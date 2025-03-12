<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spi_databasepart_detail.aspx.cs" Inherits="sparepartproject.spi_databasepart_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - Database Part</title>
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
                            <a href="spi_databasepart.aspx" style="background-color: white; color: #172679;">Database Part</a>
                        </li>
                        <li id="menuDailyIssuedPart">
                            <a href="dailyissuedpart.aspx">Daily Issued Part</a>
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

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Sparepart Details</h5>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto" style="display: inline;">
                            <li class="nav-item active">
                                <a class="nav-link" id="user" runat="server">GUEST</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <%-- <div class="line"></div>--%>
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>

                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0; padding: 0;">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold" style="padding-left: 20px; color: #003366;">Sparepart Details</h6>
                            <div class="d-flex align-items-center">
                                <!-- Tombol Close -->
                                <span class="close-button" onclick="window.location.href='spi_databasepart.aspx'" style="margin-left: 10px; color: red; cursor: pointer;">
                                    <i class="fas fa-times"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- Nav Tabs -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-left: 20px;">
                                <li class="nav-item">
                                    <a class="nav-link active" id="detail-tab" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="true">Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="issued-tab" data-toggle="tab" href="#issued" role="tab" aria-controls="issued" aria-selected="false">Issued Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">Modification History</a>
                                </li>
                            </ul>

                            <!-- Tab Panes -->
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                                    <!-- Isi untuk tab Details (Bagian 1 dari kode Anda) -->
                                    <div class="row mt-3" style="padding: 20px;">
                                        <div class="col-md-4">
                                            <img id="imgSparepart" runat="server" src="" alt="Sparepart Image" class="img-responsive" style="max-width: 100%; height: auto; border: 1px solid #ddd; padding: 5px;" />
                                            <br />
                                            <div class="mt-3" id="rataKiri" style="font-family: Poppins">
                                                <table class="table table-borderless">
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row" style="font-size: 1rem; font-weight: 500; color: #333;">Location</th>
                                                            <td style="font-size: 1rem; font-weight: 500; color: #007bff;"><span id="modalSubKeeping"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="font-size: 1rem; font-weight: 500; color: #333;">Now Stock</th>
                                                            <td style="font-size: 1rem; font-weight: 500; color: #007bff;"><span id="modalStock"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="font-size: 1rem; font-weight: 500; color: #333;">Min Stock</th>
                                                            <td style="font-size: 1rem; font-weight: 500; color: #007bff;"><span id="minStock"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="font-size: 1rem; font-weight: 500; color: #333;">Max Stock</th>
                                                            <td style="font-size: 1rem; font-weight: 500; color: #007bff;"><span id="maxStock"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" style="font-size: 1rem; font-weight: 500; color: #333;">Min Order</th>
                                                            <td style="font-size: 1rem; font-weight: 500; color: #007bff;"><span id="minOrder"></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Goods Code</strong></label>
                                                <asp:Label ID="modalGoodsCode" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Goods Name</strong></label>
                                                <asp:Label ID="modalGoodsName" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Goods Desc</strong></label>
                                                <asp:Label ID="modalGoodsDesc" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Supplier Name</strong></label>
                                                <asp:Label ID="modalVendor" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Maker:</strong></label>
                                                <asp:Label ID="lblMaker" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Model:</strong></label>
                                                <asp:Label ID="lblModel" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Stock Category:</strong></label>
                                                <asp:Label ID="lblStockCategory" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <!-- Tambahkan label lain sesuai kebutuhan -->
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="issued" role="tabpanel" aria-labelledby="issued-tab">
                                    <!-- Isi untuk tab Issued Details (Bagian 2, card Issued Details) -->
                                    <div class="row justify-content-end mt-3">
                                        <div class="col-auto">
                                            <button id="downloadExcelBtn" class="btn btn-sm btn-success" style="font-size: .8rem; margin-right: 20px;">Export</button>
                                        </div>
                                        <div class="col-md-12">
                                            <div id="issuedSparepartsContainer" style="padding-left: 20px; padding-right: 20px;">
                                                <!-- Tabel issued spareparts akan ditampilkan di sini -->
                                            </div>
                                            <div class="text-right">
                                                <div id="issuedPaginationContainer" class="mt-3" style="margin-right: 20px;">
                                                    <!-- Kontrol pagination -->
                                                    <ul class="pagination">
                                                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                                    <!-- Isi untuk tab Modification History (Bagian 2, card Modification History) -->
                                    <div class="row justify-content-end">
                                        <div class="col-md-12">
                                            <div id="modificationContainer" style="padding-left: 20px; padding-right: 20px;">
                                                <!-- Tabel issued spareparts akan ditampilkan di sini -->
                                            </div>
                                            <div class="text-right">
                                                <div id="modificationPaginationContainer" class="mt-3" style="margin-right: 20px;">
                                                    <!-- Kontrol pagination -->
                                                    <ul class="pagination">
                                                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>


    <script src="Scripts/jquery-3.5.1.min.js"></script>

    <%--<script src="Scripts/popper.min.js"></script>--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
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
            
        }

        let urlParams = "";
        let goodsCode = "";

        $(document).ready(function () {
            var role = sessionStorage.getItem("role");
            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                window.location.href = "Default.aspx";

            }
            else
                // Periksa apakah role bukan ADMIN
                if (role === "ADMIN") {

                } else if (role === "SPV") {
                    $('#rowBtn').hide();

                    hideAllMenus();

                    $("#menuSPI").show();
                    $("#menuCatalog").show();
                    $("#menuDatabasePart").show();
                    $("#menuDailyIssuedPart").show();
                    $("#menuHome").show();
                    $("#lineShow").hide();
                    $("#menuLogout").show();

                } else if (role === "STAFF") {
                    hideAllMenus();
                    $('#rowBtn').hide();
                    $("#menuSPI").show();
                    $("#menuCatalog").show();
                    $("#menuDatabasePart").show();
                    $("#menuDailyIssuedPart").show();
                    $("#menuHome").show();
                    $("#lineShow").hide();
                    $("#menuLogout").show();

                }
            //else if (role !== "ADMIN") {
            //    Swal.fire({
            //        icon: 'error',
            //        title: 'Akses Ditolak',
            //        text: 'Anda akan diarahkan kembali ke halaman home.',
            //    }).then((result) => {
            //        window.location.href = "home.aspx";
            //    });

            //    // ... tambahkan menu lain yang diizinkan untuk STAFF
            //}

            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";

            urlParams = new URLSearchParams(window.location.search);
            goodsCode = urlParams.get('goodsCode');
            loadSparepartDetails(goodsCode, issuedCurrentPage); // Memuat data awal

            $('#downloadExcelBtn').on('click', async function (e) {
                e.preventDefault();

                try {
                    const response = await fetch(`/api/sparepart/${goodsCode}/excel`);

                    if (!response.ok) {
                        // Tangani respons error
                        console.error('Error downloading Excel file:', response.status, response.statusText);
                        alert('Failed to download Excel file. Status: ' + response.status + ' ' + response.statusText);
                        return;
                    }

                    const blob = await response.blob();
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = url;
                    a.download = `IssuedSpareparts_${goodsCode}.xlsx`; // Nama file dinamis
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(url);
                    document.body.removeChild(a);

                } catch (error) {
                    console.error('Error downloading Excel file:', error);
                    alert('Failed to download Excel file: ' + error.message);
                }
            });

        });

        let issuedCurrentPage = 1; // Halaman saat ini untuk data issued
        const issuedPageSize = 10; // Jumlah item per halaman untuk data issued

        let historyCurrentPage = 1; // Halaman saat ini untuk data issued
        const historyPageSize = 10; // Jumlah item per halaman untuk data issued

        function loadIssuedData(goodsCode, page) {
            $.ajax({
                url: `/api/sparepart/${goodsCode}?page=${page}&pageSize=${issuedPageSize}&type=issued`, // Tambahkan parameter 'type'
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Menampilkan data issued sparepart
                    displayIssuedSpareparts(data.IssuedSpareparts);
                    setupIssuedPagination(data.TotalIssuedSpareparts, page, issuedPageSize); // Gunakan 'page' dari parameter
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching issued data: ", error);
                    alert('Failed to load issued data.');
                }
            });
        }

        function loadModificationHistory(goodsCode, page) {
            $.ajax({
                url: `/api/sparepart/${goodsCode}?page=${page}&pageSize=${historyPageSize}&type=history`, // Tambahkan parameter 'type'
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Menampilkan data modification history sparepart
                    displayModificationSpareparts(data.ModificationHistory);
                    setupModificationPagination(data.totalModificationHistory, page, historyPageSize); // Gunakan 'page' dari parameter
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching modification history data: ", error);
                    alert('Failed to load modification history data.');
                }
            });
        }


        function loadSparepartDestails(goodsCode, page) {
            $.ajax({
                url: `/api/sparepart/${goodsCode}?page=${page}&pageSize=${issuedPageSize}`,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Mengisi data sparepart ke dalam label
                    $('#modalGoodsCode').text(data.Sparepart.GoodsCode);
                    $('#modalGoodsName').text(data.Sparepart.GoodsName);
                    $('#modalGoodsDesc').text(data.Sparepart.GoodsDesc);
                    $('#lblMaker').text(data.Sparepart.Maker);
                    $('#lblModel').text(data.Sparepart.Model);
                    $('#modalStock').text(data.Sparepart.NowStock);
                    $('#maxStock').text(data.Sparepart.MaxStock);
                    $('#minStock').text(data.Sparepart.MinStock);
                    $('#minOrder').text(data.Sparepart.MinOrder);
                    $('#modalSubKeeping').text(data.Sparepart.SubKeeping);
                    $('#lblStockCategory').text(data.Sparepart.StockCategory);
                    $('#modalVendor').text(data.Sparepart.SuppName);
                    console.log(data.Sparepart.AttcFilePicture);

                    // Mengisi gambar jika ada
                    if (data.Sparepart.AttcFilePicture) {
                        $('#imgSparepart').attr('src', data.Sparepart.AttcFilePicture);
                    } else {
                        $('#imgSparepart').attr('src', 'path/to/default/image.png'); // Gambar default jika tidak ada URL
                    }

                    // Menampilkan data issued sparepart
                    displayIssuedSpareparts(data.IssuedSpareparts);
                    setupIssuedPagination(data.TotalIssuedSpareparts, data.CurrentPage, data.PageSize);
                    displayModificationSpareparts(data.ModificationHistory);
                    setupModificationPagination(data.totalModificationHistory, data.CurrentPage, data.PageSize);

                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                    alert('Failed to load sparepart details.');
                }
            });
        }

        function loadSparepartDetails(goodsCode) { // Tidak perlu parameter page lagi
            $.ajax({
                url: `/api/sparepart/${goodsCode}`, // Hanya detail sparepart dasar
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Mengisi data sparepart ke dalam label
                    $('#modalGoodsCode').text(data.Sparepart.GoodsCode);
                    $('#modalGoodsName').text(data.Sparepart.GoodsName);
                    $('#modalGoodsDesc').text(data.Sparepart.GoodsDesc);
                    $('#lblMaker').text(data.Sparepart.Maker);
                    $('#lblModel').text(data.Sparepart.Model);
                    $('#modalStock').text(data.Sparepart.NowStock);
                    $('#maxStock').text(data.Sparepart.MaxStock);
                    $('#minStock').text(data.Sparepart.MinStock);
                    $('#minOrder').text(data.Sparepart.MinOrder);
                    $('#modalSubKeeping').text(data.Sparepart.SubKeeping);
                    $('#lblStockCategory').text(data.Sparepart.StockCategory);
                    $('#modalVendor').text(data.Sparepart.SuppName);
                    console.log(data.Sparepart.AttcFilePicture);

                    // Mengisi gambar jika ada
                    if (data.Sparepart.AttcFilePicture) {
                        $('#imgSparepart').attr('src', data.Sparepart.AttcFilePicture);
                    } else {
                        $('#imgSparepart').attr('src', 'path/to/default/image.png'); // Gambar default jika tidak ada URL
                    }

                    // Memuat data issued dan history
                    loadIssuedData(goodsCode, 1); // Load halaman pertama issued
                    loadModificationHistory(goodsCode, 1); // Load halaman pertama history
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching sparepart details: ", error);
                    alert('Failed to load sparepart details.');
                }
            });
        }


        // Fungsi untuk menampilkan data issued sparepart
        function displayIssuedSpareparts(issuedSpareparts) {
            let issuedTable = '<table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabela">';
            issuedTable += '<thead style="background-color: #2A476B; color: white; text-align: center;"><tr>';
            issuedTable += '<th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Issued ID</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Goods Name</th>';
            //issuedTable += '<th scope="col" style="vertical-align: middle;">Goods Desc</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Issued By</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Qty</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Model</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Line</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Issued Date</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Reason</th>';
            issuedTable += '</tr></thead><tbody>';

            if (issuedSpareparts.length === 0) {
                issuedTable += '<tr><td colspan="9" class="text-center">No issued spareparts found</td></tr>';
            } else {
                issuedSpareparts.forEach(item => {
                    // Contoh penggunaan:
                    const issuedDate = new Date(item.issuedDate);
                    const formattedDate = formatDate(issuedDate);
                    console.log(formattedDate); // Output: 2025-01-14

                    issuedTable += `<tr>
                                <td>${item.SPI_IDissued}</td>
                                <td>${item.goodsCode}</td>
                                <td>${item.goodsName}</td>
                                <td>${item.issuedBy_ID}</td>
                                <td>${item.qtyIssued}</td>
                                <td>${item.model}</td>
                                <td>${item.lineName}</td>
                                <td>${formattedDate}</td>

                                <td>${item.reason}</td>
                            </tr>`;
                });
            }

            issuedTable += '</tbody></table>';
            $('#issuedSparepartsContainer').html(issuedTable);
        }

        function formatDate(date) {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return `${year}-${month}-${day}`;
        }

        function setupIssuedPagination(totalItems, currentPage, pageSize) {
            const totalPages = Math.ceil(totalItems / pageSize);
            let paginationHtml = '';

            if (totalPages > 1) {
                paginationHtml += '<ul class="pagination">';

                // Tombol Halaman Pertama (jika total halaman lebih dari 3)
                if (totalPages > 3 && currentPage > 2) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>`;
                    if (currentPage > 3) {
                        paginationHtml += `<li class="page-item disabled"><span class="page-link">...</span></li>`; // Tambahkan ellipsis jika ada halaman yang dihilangkan
                    }
                }

                // Tombol Previous
                if (currentPage > 1) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${currentPage - 1}">Prev</a></li>`;
                } else {
                    paginationHtml += `<li class="page-item disabled"><span class="page-link">Prev</span></li>`;
                }

                // Nomor Halaman
                let startPage = currentPage - 1;
                let endPage = currentPage + 1;

                if (startPage < 1) {
                    startPage = 1;
                    endPage = Math.min(3, totalPages);
                }

                if (endPage > totalPages) {
                    endPage = totalPages;
                    startPage = Math.max(1, totalPages - 2);
                }

                for (let i = startPage; i <= endPage; i++) {
                    const activeClass = i === currentPage ? 'active' : '';
                    paginationHtml += `<li class="page-item ${activeClass}"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }

                // Tombol Next
                if (currentPage < totalPages) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${currentPage + 1}">Next</a></li>`;
                } else {
                    paginationHtml += `<li class="page-item disabled"><span class="page-link">Next</span></li>`;
                }

                // Tombol Halaman Terakhir (jika total halaman lebih dari 3)
                if (totalPages > 3 && currentPage < totalPages - 1) {
                    if (currentPage < totalPages - 2) {
                        paginationHtml += `<li class="page-item disabled"><span class="page-link">...</span></li>`; // Tambahkan ellipsis jika ada halaman yang dihilangkan
                    }
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${totalPages}">${totalPages}</a></li>`;
                }

                paginationHtml += '</ul>';
            }

            $('#issuedPaginationContainer').html(paginationHtml);

            //// Menangani klik pada pagination
            //$('#issuedPaginationContainer').off('click', 'a').on('click', 'a', function (e) {
            //    e.preventDefault();
            //    const pageIssued = parseInt($(this).data('page'));
            //    issuedCurrentPage = pageIssued;
            //    loadSparepartDetails(goodsCode, issuedCurrentPage);
            //});

            $('#issuedPaginationContainer').off('click', 'a').on('click', 'a', function (e) {
                e.preventDefault();
                const pageIssued = parseInt($(this).data('page'));
                issuedCurrentPage = pageIssued;
                loadIssuedData(goodsCode, pageIssued); // Panggil loadIssuedData dengan pageIssued
            });
        }


        // Fungsi untuk menampilkan data issued sparepart
        function displayModificationSpareparts(issuedSpareparts) {
            let issuedTable = '<table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabela">';
            issuedTable += '<thead style="background-color: #2A476B; color: white; text-align: center;"><tr>';
            issuedTable += '<th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Modification At</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Old Value</th>';
            //issuedTable += '<th scope="col" style="vertical-align: middle;">Goods Desc</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">New Value</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Update By Account</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Account Role</th>';
            issuedTable += '<th scope="col" style="vertical-align: middle;">Update Time</th>'
            issuedTable += '</tr></thead><tbody>';

            if (issuedSpareparts.length === 0) {
                issuedTable += '<tr><td colspan="7" class="text-center">No history modification found</td></tr>';
            } else {
                issuedSpareparts.forEach(item => {

                    const isoString = new Date(item.ChangeTime).toISOString();
                    const d = new Date(isoString);

                    const year = d.getFullYear();
                    const month = ('0' + (d.getMonth() + 1)).slice(-2);
                    const day = ('0' + d.getDate()).slice(-2);
                    const hours = ('0' + d.getHours()).slice(-2);
                    const minutes = ('0' + d.getMinutes()).slice(-2);
                    const seconds = ('0' + d.getSeconds()).slice(-2);

                    const formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                    console.log(formattedDate);


                    issuedTable += `<tr>
                                <td>${item.GoodsCode}</td>
                                <td>${item.ColumnName}</td>
                                <td>${item.OldValue}</td>
                                <td>${item.NewValue}</td>
                                <td>${item.Username}</td>
                                <td>${item.Role}</td>
                                <td>${formattedDate}</td>

                            </tr>`;
                });
            }

            issuedTable += '</tbody></table>';
            $('#modificationContainer').html(issuedTable);
        }


        function setupModificationPagination(totalItems, currentPage, pageSize) {
            const totalPages = Math.ceil(totalItems / pageSize);
            let paginationHtml = '';

            if (totalPages > 1) {
                paginationHtml += '<ul class="pagination">';

                // Tombol Halaman Pertama (jika total halaman lebih dari 3)
                if (totalPages > 3 && currentPage > 2) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>`;
                    if (currentPage > 3) {
                        paginationHtml += `<li class="page-item disabled"><span class="page-link">...</span></li>`; // Tambahkan ellipsis jika ada halaman yang dihilangkan
                    }
                }

                // Tombol Previous
                if (currentPage > 1) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${currentPage - 1}">Prev</a></li>`;
                } else {
                    paginationHtml += `<li class="page-item disabled"><span class="page-link">Prev</span></li>`;
                }

                // Nomor Halaman
                let startPage = currentPage - 1;
                let endPage = currentPage + 1;

                if (startPage < 1) {
                    startPage = 1;
                    endPage = Math.min(3, totalPages);
                }

                if (endPage > totalPages) {
                    endPage = totalPages;
                    startPage = Math.max(1, totalPages - 2);
                }

                for (let i = startPage; i <= endPage; i++) {
                    const activeClass = i === currentPage ? 'active' : '';
                    paginationHtml += `<li class="page-item ${activeClass}"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }

                // Tombol Next
                if (currentPage < totalPages) {
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${currentPage + 1}">Next</a></li>`;
                } else {
                    paginationHtml += `<li class="page-item disabled"><span class="page-link">Next</span></li>`;
                }

                // Tombol Halaman Terakhir (jika total halaman lebih dari 3)
                if (totalPages > 3 && currentPage < totalPages - 1) {
                    if (currentPage < totalPages - 2) {
                        paginationHtml += `<li class="page-item disabled"><span class="page-link">...</span></li>`; // Tambahkan ellipsis jika ada halaman yang dihilangkan
                    }
                    paginationHtml += `<li class="page-item"><a class="page-link" href="#" data-page="${totalPages}">${totalPages}</a></li>`;
                }

                paginationHtml += '</ul>';
            }

            $('#modificationPaginationContainer').html(paginationHtml);

            //// Menangani klik pada pagination
            //$('#modificationPaginationContainer').off('click', 'a').on('click', 'a', function (e) {
            //    e.preventDefault();
            //    const pageHistory = parseInt($(this).data('page'));
            //    historyCurrentPage = pageHistory;
            //    loadSparepartDetails(goodsCode, historyCurrentPage);
            //});

            $('#modificationPaginationContainer').off('click', 'a').on('click', 'a', function (e) {
                e.preventDefault();
                const pageHistory = parseInt($(this).data('page'));
                historyCurrentPage = pageHistory;
                loadModificationHistory(goodsCode, pageHistory); // Panggil loadModificationHistory dengan pageHistory
            });
        }

    </script>
</body>
</html>
