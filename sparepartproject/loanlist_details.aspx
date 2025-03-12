<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loanlist_details.aspx.cs" Inherits="sparepartproject.loanlist_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - Loan Details</title>
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

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Loan Details</h5>
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
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>

                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0; padding: 0;">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold" style="padding-left: 20px; color: #003366;">Loan Part Details</h6>
                            <div class="d-flex align-items-center">
                                <!-- Tombol Close -->
                                <span class="close-button" onclick="window.location.href='loanlist.aspx'" style="margin-left: 10px; color: red; cursor: pointer;">
                                    <i class="fas fa-times"></i>
                                </span>
                            </div>
                        </div>
                        <div class="card-body">


                            <!-- Tab Panes -->
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
                                    <!-- Isi untuk tab Details (Bagian 1 dari kode Anda) -->
                                    <div class="row" style="padding: 20px;">
                                        <div class="col-md-8">
                                            <label style="font-weight: 600; color: #333;"><strong>Approval Document</strong></label>
                                            <img id="imgLoanAttc" runat="server" src="" alt="Sparepart Image" class="img-responsive" style="max-width: 100%; height: auto; border: 1px solid #ddd; padding: 5px;" />
                                            <br />
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Goods Code</strong></label>
                                                <asp:Label ID="modalGoodsCode" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Loan to Model</strong></label>
                                                <asp:Label ID="loanToModel" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Line</strong></label>
                                                <asp:Label ID="modalLine" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Cell</strong></label>
                                                <asp:Label ID="modalCell" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Qty Loan</strong></label>
                                                <asp:Label ID="modalQty" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; background-color: lightgreen; width: 95%; padding: 0.375rem 0.75rem; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Loan On</strong></label>
                                                <asp:Label ID="modalLoanOn" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Loan By PIC</strong></label>
                                                <asp:Label ID="modalLoanByPIC" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px; background-color:#e4e4e4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Status</strong></label>
                                                <asp:Label ID="lblLoanStatus" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <div class="form-group" id="formReturnedOn">
                                                <label style="font-weight: 600; color: #333; margin-left: 25px;"><strong>Returned On</strong></label>
                                                <asp:Label ID="lblReturnedOn" runat="server" CssClass="form-control" Style="border: 1px solid #ddd; padding: 0.375rem 0.75rem; width: 95%; color: #555; margin-left: 25px;"></asp:Label>
                                            </div>
                                            <!-- Tambahkan label lain sesuai kebutuhan -->
                                        </div>
                                        <div class="col-md-12" style="text-align: center; margin-top: 20px;">
                                            <button type="button" class="btn btn-primary" id="btnReturnOpenModal" data-toggle="modal" data-target="#returnModal">Return</button>
                                        </div>
                                    </div>
                                    <!-- Modal untuk Validasi Return -->
                                    <div class="modal fade" id="returnModal" tabindex="-1" role="dialog" aria-labelledby="returnModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title" id="returnModalLabel" style="font-size:1.2rem;">Validasi Return</h3>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body" style="margin-left:13px; font-weight:500; font-family:Poppins">
                                                    <p style="color:black;">Apakah Sparepart yang dikembalikan berfungsi dengan baik?</p>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="condition" id="goodCondition" value="yes" />
                                                        <label class="form-check-label" for="goodCondition">Ya</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="condition" id="badCondition" value="no" />
                                                        <label class="form-check-label" for="badCondition">Tidak</label>
                                                    </div>
                                                    <br />
                                                    <p style="color:black;">Apakah qty yang dikembalikan sesuai dengan qty peminjaman?</p>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="qtyMatch" id="qtyYes" value="yes" />
                                                        <label class="form-check-label" for="qtyYes">Ya</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="qtyMatch" id="qtyNo" value="no" />
                                                        <label class="form-check-label" for="qtyNo">Tidak</label>
                                                    </div>
                                                    
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary" id="btnReturnConfirm">Return</button>
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
        let urlParams = "";
        let idParam = "";
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

            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";


            urlParams = new URLSearchParams(window.location.search);
            idParam = urlParams.get('id');
            loadLoanDetails(idParam); // Memuat data awal

        });

        function loadLoanDetails(id) { // Tidak perlu parameter page lagi
            $.ajax({
                url: `/api/loan/${id}`, // Hanya detail sparepart dasar
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Mengisi data sparepart ke dalam label
                    $('#modalGoodsCode').text(data.Sparepart.goodsCode);
                    $('#loanToModel').text(data.Sparepart.model);
                    $('#modalLine').text(data.Sparepart.line);
                    $('#modalCell').text(data.Sparepart.cell);
                    $('#modalQty').text(data.Sparepart.issuedQty);
                    $('#modalLoanByPIC').text(data.Sparepart.issuedBy);
                    $('#lblLoanStatus').text(data.Sparepart.status);

                    const isoString3 = new Date(data.Sparepart.issuedOn).toISOString();
                    const d3 = new Date(isoString3);

                    const year3 = d3.getFullYear();
                    const month3 = ('0' + (d3.getMonth() + 1)).slice(-2);
                    const day3 = ('0' + d3.getDate()).slice(-2);
                    const hours3 = ('0' + d3.getHours()).slice(-2);
                    const minutes3 = ('0' + d3.getMinutes()).slice(-2);
                    const seconds3 = ('0' + d3.getSeconds()).slice(-2);

                    const formattedDate3 = year3 + '-' + month3 + '-' + day3 + ' ' + hours3 + ':' + minutes3 + ':' + seconds3;
                    $('#modalLoanOn').text(formattedDate3);

                    const isoString = new Date(data.Sparepart.returnedOn).toISOString();
                    const d = new Date(isoString);

                    const year = d.getFullYear();
                    const month = ('0' + (d.getMonth() + 1)).slice(-2);
                    const day = ('0' + d.getDate()).slice(-2);
                    const hours = ('0' + d.getHours()).slice(-2);
                    const minutes = ('0' + d.getMinutes()).slice(-2);
                    const seconds = ('0' + d.getSeconds()).slice(-2);

                    const formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
                    console.log(formattedDate);
                    $('#lblReturnedOn').text(formattedDate);


                    console.log(data.Sparepart.imageApproval);
                    console.log(data.Sparepart.status);

                    // Mengubah warna latar belakang jika status "loaned"
                    if (data.Sparepart.status.toLowerCase() === 'loaned') {
                        $('#lblLoanStatus').css('background-color', 'yellow');
                        $('#formReturnedOn').hide();

                        
                    } else {
                        // Reset warna jika status bukan "loaned"
                        $('#lblLoanStatus').css('background-color', 'green');
                        $('#lblLoanStatus').css('color', 'white');
                        $('#btnReturnOpenModal').hide();
                    }

                    // Mengisi gambar jika ada
                    //if (data.Sparepart.imageApproval) {
                    //    $('#imgLoanAttc').attr('src', data.Sparepart.imageApproval);
                    //} else {
                    //    $('#imgLoanAttc').attr('src', 'path/to/default/image.png'); // Gambar default jika tidak ada URL
                    //}

                    // Menangani PDF atau Gambar
                    if (data.Sparepart.imageApproval && data.Sparepart.imageApproval.toLowerCase().endsWith(".pdf")) {
                        // Jika URL mengarah ke PDF, ganti <img> dengan <iframe>
                        $('#imgLoanAttc').replaceWith('<iframe id="imgLoanAttc" src="' + data.Sparepart.imageApproval + '" width="100%" height="600px"></iframe>');
                    } else if (data.Sparepart.imageApproval) {
                        // Jika URL mengarah ke gambar
                        $('#imgLoanAttc').attr('src', data.Sparepart.imageApproval);
                    } else {
                        // Jika tidak ada URL, tampilkan gambar default
                        $('#imgLoanAttc').attr('src', 'path/to/default/image.png');
                    }

                    // Memuat data issued dan history
                    //loadIssuedData(goodsCode, 1); // Load halaman pertama issued
                    //loadModificationHistory(goodsCode, 1); // Load halaman pertama history
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching sparepart details: ", error);
                    alert('Failed to load sparepart details.');
                }
            });
        }

        $('#btnReturnConfirm').click(function () {
            var condition = $('input[name="condition"]:checked').val();
            var qtyMatch = $('input[name="qtyMatch"]:checked').val();
            var id = idParam; // Ambil ID dari hidden field
            var goodsCode = $('#modalGoodsCode').text(); // Ambil GoodsCode dari hidden field
            var qtyReturned = parseInt($('#modalQty').text()); // Ambil qty yang dikembalikan

            if (condition === 'yes' && qtyMatch === 'yes') {
                // Tampilkan SweetAlert untuk konfirmasi sekali lagi
                Swal.fire({
                    title: 'Konfirmasi Return',
                    text: 'Apakah Anda yakin ingin melakukan return Sparepart?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Ya, Return',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.value) {
                        // Proses return jika konfirmasi diterima
                        // Panggil fungsi server-side untuk memproses return
                        $.ajax({
                            type: "POST",
                            url: "loanlist_details.aspx/ProsesReturn",
                            data: JSON.stringify({ id: id, goodsCode: goodsCode, qtyReturned: qtyReturned }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                alert(data.d); // Menampilkan hasil proses return
                                // Tutup modal
                                $('#returnModal').modal('hide');
                                window.location.href = 'loanlist.aspx';
                            },
                            failure: function (response) {
                                alert('Gagal memproses return.');
                            }
                        });
                    } else {
                        // Jika konfirmasi dibatalkan, tutup SweetAlert
                    }
                });
            } else {
                //alert('Validasi gagal. Pastikan kondisi dan qty sesuai.');
                Swal.fire({
                    title: 'Validasi belum lengkap',
                    text: 'Validasi gagal. Pastikan kondisi dan qty sesuai.',
                    icon: 'warning'
                })
            }
        });
    </script>
</body>
</html>
