<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spi_databasepart.aspx.cs" Inherits="sparepartproject.spi_databasepart" %>

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
                padding: 10px; /* Padding untuk sel tabel */
                text-align: center; /* Mengatur teks menjadi rata tengah */
                border: 1px solid #cec6c6; /* Border yang ringan untuk tabel */
                vertical-align: middle;
            }

            .table td, .table th {
                padding:6px;
            }
            .view-btn{
                font-size:.5rem;
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


        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Database Part</h5>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto" style="display: inline;">
                            <li class="nav-item active">
                                <a class="nav-link" id="A1" style="display:none" runat="server"></a>
                                <a class="nav-link" id="user" runat="server">GUEST</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="col-12">
            </div>

            <%-- <div class="line"></div>--%>
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row" style="margin-bottom: 10px;" id="rowBtn">
                        <div class="col-12">
                            <button type="button" runat="server" id="btnAddPart" class="btn btn-primary text-center" data-toggle="modal" data-target="#exampleModalCenter">
                                Upload Part
                            </button>
                            <asp:Button ID="btnExportToExcel" runat="server" CssClass="btn btn-success" Text="Download Excel" OnClick="btnExportToExcel_Click" />
                            <input type="button" class="btn btn-outline-info" id="btnReg" value="Register Part" onclick="window.location.href='registernew.aspx'" />
                        </div>
                    </div>
                    <div class="line" id="lineShow"></div>
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <label style="margin-top: 0px; font-size: 1.5rem; font-weight: 500;" class="mb-5">List Sparepart Database</label>
                                </div>
                            </div>
                            <div class="row">
                            </div>

                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="font-weight: 500;">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Current</a>
                                </li>
                                <li class="nav-item" id="minimumStock">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Minimum Stock</a>
                                </li>
                                <li class="nav-item" id="zeroStock">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Zero Stock</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row mt-3">
                                        <!-- Container Flex untuk memposisikan input pencarian ke kanan -->
                                        <div class="col-12 text-right">
                                            <input type="text" id="searchInput" placeholder="Search..." style="font-family: Poppins; font-size: .8rem; width: 250px;" />
                                        </div>
                                    </div>
                                    <table class="table table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabela">
                                        <thead style="background-color: #2A476B; color: white; text-align: center;">
                                            <tr>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                                <th scope="col" style="vertical-align: middle;">Goods Desc</th>
                                                <th scope="col" style="vertical-align: middle;">Maker</th>
                                                <th scope="col" style="vertical-align: middle;">Model</th>
                                                <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                                <th scope="col" style="vertical-align: middle;">Drawer</th>
                                                <th scope="col" style="vertical-align: middle;">Status</th>
                                                <th scope="col" style="vertical-align: middle;">Action</th>
                                                <%--<th scope="col" style="vertical-align: middle;"></th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div id="pagination">
                                        <!-- Pagination buttons akan dimuat di sini -->
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="row mt-3"></div>
                                    <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelMinimumStock">
                                        <thead style="background-color: #2A476B; color: white; text-align: center;">
                                            <tr>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                                <th scope="col" style="vertical-align: middle;">Maker</th>
                                                <th scope="col" style="vertical-align: middle;">Model</th>
                                                <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                                <th scope="col" style="vertical-align: middle;">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <div class="row mt-3"></div>
                                    <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelZeroStock">
                                        <thead style="background-color: #2A476B; color: white; text-align: center;">
                                            <tr>
                                                <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                                <th scope="col" style="vertical-align: middle;">Maker</th>
                                                <th scope="col" style="vertical-align: middle;">Model</th>
                                                <%--<th scope="col" style="vertical-align: middle;">Rack Name</th>--%>
                                                <%--<th scope="col" style="vertical-align: middle;">Min Stock</th>--%>
                                                <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                                <%--<th scope="col" style="vertical-align: middle;">Min Order</th>--%>
                                                <th scope="col" style="vertical-align: middle;">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>

                                </div>
                            </div>




                        </div>
                        <%-- <div id="loadingImg" style="display: none;" class="m-auto mt-9"><%--images/load.gif
                            <img src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif" height="120" width="240" />
                        </div>--%>

                        <div class="overlay" id="loadingImg">
                            <p>Processing data, please wait...</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: 600; float: left;" class="mb-5" id="lblUpdate" runat="server"></label>
                            <br />
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: 600; float: left;" class="mb-5" id="updateby" runat="server"></label>
                            <br />
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: 500; float: left;" class="mb-5" id="filename" runat="server"></label>
                        </div>
                    </div>

                </div>

                <!--modal upload file-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Upload Sparepart Data</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row d-inline" style="margin-top: 20px;">
                                        <asp:FileUpload ID="Upload" runat="server" CssClass="form-control-file"></asp:FileUpload>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <asp:Button ID="Button1" runat="server" CausesValidation="false" CssClass="btn btn-outline-primary text-center" OnClientClick="return cekFile()" Text="Upload Data" OnClick="Button1_Click" />
                                <%--<button id="Button12" data-target="#exampleModalCenter" class="btn btn-outline-primary text-center" onclick="Button1_Click" data-modal="#exampleModalCenter">Upload</button>--%>
                            </div>
                        </div>
                    </div>

                </div>


                <!-- modal upload data one by one-->
                <!-- The Modal -->
                <div class="modal fade" id="myModalonebyone">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Insert Sparepart Data</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOnebyOne" runat="server" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsNameOneByOne" runat="server" Width="75%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Desc</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsDescOneByOne" runat="server" Width="90%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Currency</label>
                                            <asp:TextBox CssClass="form-control" ID="txtCurrencyOneByOne" runat="server" Width="30%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Unit</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsUnitOneByOne" runat="server" Width="80%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Unit Price</label>
                                            <asp:TextBox CssClass="form-control" ID="txtUnitPriceOneByOne" runat="server" Width="20%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Maker</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMakerOneByOne" runat="server" Width="75%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Minimum Order</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMinimumOrderOneByOne" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Model</label>
                                            <asp:TextBox CssClass="form-control" ID="txtModelOneByOne" runat="server" Width="35%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Line / Cell</label>
                                            <asp:TextBox CssClass="form-control" ID="txtLineCellOneByOne" runat="server" Width="30%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Maximum Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMaximumStockOneByOne" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Rack Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtRackNameOneByOne" runat="server" Width="50%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Minimum Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMinimumStockOneByOne" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Now Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtNowStockOneByOne" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Attach Picture</label>
                                            <asp:FileUpload CssClass="form-control-file" runat="server" Enabled="false" />
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Attach File Document</label>
                                            <asp:FileUpload CssClass="form-control-file" runat="server" Enabled="false" />
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Stock Category</label>
                                            <asp:TextBox CssClass="form-control" ID="txtStockCategoryOneByOne" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Supplier Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtSupplierNameOneByOne" runat="server" Width="65%"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <asp:LinkButton ID="btnInsert" Text="Insert Data" CssClass="btn btn-outline-primary text-center" OnClick="btnInsertDataOnebyOne_Click" OnClientClick="return cekKosong();" runat="server"></asp:LinkButton>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal fade" id="editModal" role="dialog">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Sparepart Data</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeEdit" runat="server" Enabled="false" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsNameEdit" runat="server" Width="75%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Desc</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsDescEdit" runat="server" Width="90%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Currency</label>
                                            <asp:TextBox CssClass="form-control" ID="txtCurrencyEdit" runat="server" Width="30%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Unit</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsUnitEdit" runat="server" Width="80%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Unit Price</label>
                                            <asp:TextBox CssClass="form-control" ID="txtUnitPriceEdit" runat="server" Width="20%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Maker</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMakerEdit" runat="server" Width="75%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Minimum Order</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMinimumOrderEdit" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Model</label>
                                            <asp:TextBox CssClass="form-control" ID="txtModelEdit" runat="server" Width="35%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Line / Cell</label>
                                            <asp:TextBox CssClass="form-control" ID="txtLineCellEdit" runat="server" Width="30%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Maximum Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMinimumStockEdit" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Rack Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtRackNameEdit" runat="server" Width="50%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Minimum Order</label>
                                            <asp:TextBox CssClass="form-control" ID="asdsd" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Now Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtNowStockEdit" runat="server" Width="15%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Attach Picture</label>
                                            <asp:FileUpload CssClass="form-control-file" runat="server" Enabled="false" />
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Attach File Document</label>
                                            <asp:FileUpload CssClass="form-control-file" runat="server" Enabled="false" />
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Stock Category</label>
                                            <asp:TextBox CssClass="form-control" ID="txtStockCategoryEdit" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Supplier Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtSupplierNameEdit" runat="server" Width="65%"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline-dark">Delete Data</button>
                                <button type="button" class="btn btn-outline-primary">Edit Data</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

                <!-- modal input order qty-->
                <div class="modal fade" id="modalOrderQty">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Form Manual Order Part</h4>
                                <button type="button" class="close" data-dismiss="modal" <%--onclick="javascript:window.location.reload()"--%>>&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <input type="hidden" id="hdGoodsCode" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOrder" ReadOnly="true" runat="server" Width="45%" placeholder="SPI-XXX-XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Now Stock</label>
                                            <input type="hidden" id="hdNowStock" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtNowStockOrder" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Name</label>
                                            <input type="hidden" id="hdGoodsName" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsNameOrder" ReadOnly="true" runat="server" Width="65%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Min Stock</label>
                                            <input type="hidden" id="hdMinStock" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtMinStockOrder" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <%--<label class="lblModal">Goods Desc</label>
                                            <input type="hidden" id="hdGoodsDesc" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsDescOrder" ReadOnly="true" runat="server" Width="75%"></asp:TextBox>--%>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Min Order Qty</label>
                                            <input type="hidden" id="hdMinOrder" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtMinOrderOrder" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <%--  <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>--%>

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                            <div class="row">
                                                <%--<a onclick="SaveQty()" class="p-2 ml-auto mr-3" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Add New Qty</a>--%>
                                            </div>

                                            <table class="table table-sm table-hover mt-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelQtyOrder">
                                                <thead style="background-color: #172679; color: white; text-align: center;">
                                                    <tr>
                                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Qty Order</th>
                                                        <th scope="col" style="vertical-align: middle;">Order to Model</th>
                                                        <th scope="col" style="vertical-align: middle;">Order By (PIC)</th>
                                                        <th scope="col" style="vertical-align: middle;">Category</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="txtQty" runat="server" Width="60%" TextMode="Number" Text="1"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList runat="server" CssClass="form-control" Width="75%" ID="ddlModel">
                                                                <asp:ListItem>301</asp:ListItem>
                                                                <asp:ListItem>AUTO GUIDE CAP</asp:ListItem>
                                                                <asp:ListItem>AUTOPACK</asp:ListItem>
                                                                <asp:ListItem>BAIKAL</asp:ListItem>
                                                                <asp:ListItem>CARTONER</asp:ListItem>
                                                                <asp:ListItem>CISS</asp:ListItem>
                                                                <asp:ListItem>COMMON</asp:ListItem>
                                                                <asp:ListItem>COSTNER</asp:ListItem>
                                                                <asp:ListItem>CRAIG/LEGERO</asp:ListItem>
                                                                <asp:ListItem>FA</asp:ListItem>
                                                                <asp:ListItem>FOAM SUPPORT</asp:ListItem>
                                                                <asp:ListItem>FRASER</asp:ListItem>
                                                                <asp:ListItem>GAGA</asp:ListItem>
                                                                <asp:ListItem>GERE MOLLY</asp:ListItem>
                                                                <asp:ListItem>HAV 3D</asp:ListItem>
                                                                <asp:ListItem>HAV 3P</asp:ListItem>
                                                                <asp:ListItem>INK BLENDING</asp:ListItem>
                                                                <asp:ListItem>KUROBE</asp:ListItem>
                                                                <asp:ListItem>KUZURYU</asp:ListItem>
                                                                <asp:ListItem>LANTANA</asp:ListItem>
                                                                <asp:ListItem>LFP</asp:ListItem>
                                                                <asp:ListItem>LIONEL</asp:ListItem>
                                                                <asp:ListItem>MOLDING</asp:ListItem>
                                                                <asp:ListItem>NASUNO</asp:ListItem>
                                                                <asp:ListItem>NASUNO 3</asp:ListItem>
                                                                <asp:ListItem>NEYMAR</asp:ListItem>
                                                                <asp:ListItem>ORPHEUS</asp:ListItem>
                                                                <asp:ListItem>OTHER</asp:ListItem>
                                                                <asp:ListItem>SAKURA</asp:ListItem>
                                                                <asp:ListItem>SEALING</asp:ListItem>
                                                                <asp:ListItem>SHETLAND</asp:ListItem>
                                                                <asp:ListItem>SUB 1</asp:ListItem>
                                                                <asp:ListItem>SUB 2</asp:ListItem>
                                                                <asp:ListItem>TAKASE</asp:ListItem>
                                                                <asp:ListItem>TANIGAWA</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="txtOrderBy" runat="server" Width="60%"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList runat="server" CssClass="form-control" Width="75%" ID="ddlCategory">
                                                                <asp:ListItem>SPAREPART</asp:ListItem>
                                                                <asp:ListItem>ACTIVITY</asp:ListItem>

                                                            </asp:DropDownList>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <input type="hidden" id="hdPreOrderID" name="goods_code" runat="server" />
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 50px;">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <input type="hidden" id="hdnModel" name="goods_code" runat="server" />sidebar
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="hidden" id="tab_content" name="tab_content" runat="server" />
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal" <%--onclick="javascript:window.location.reload()"--%>>Close</button>
                                <asp:LinkButton ID="btnOrderfromDatabase" Text="Order Now" CssClass="btn btn-outline-primary text-center" OnClientClick="return cekKosong();" OnClick="btnOrderfromDatabase_Click" runat="server"></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Modal for displaying sparepart details -->
                <div class="modal fade" id="sparepartModal" tabindex="-1" role="dialog" aria-labelledby="sparepartModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="sparepartModalLabel">Sparepart Details</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p><strong>Goods Code:</strong> <span id="modalGoodsCode"></span></p>
                                <p><strong>Goods Name:</strong> <span id="modalGoodsName"></span></p>
                                <p><strong>Description:</strong> <span id="modalGoodsDesc"></span></p>
                                <p><strong>Maker:</strong> <span id="modalMaker"></span></p>
                                <p><strong>Model:</strong> <span id="modalModel"></span></p>
                                <p><strong>Now Stock:</strong> <span id="modalNowStock"></span></p>
                                <p><strong>Sub Keeping:</strong> <span id="modalSubKeeping"></span></p>
                                <p><strong>Status:</strong> <span id="modalStatus"></span></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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

        var counter = 1;

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

        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });


        $('#exampleModalCenter').on('shown.bs.modal', function () {
            $('#exampleModalCenter').focus()
        });


        $(document).ready(function () {
            // Ambil role dari sessionStorage
            var role = sessionStorage.getItem("role");
            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [" + sessionStorage.getItem("role") + "]";
            document.getElementById("A1").innerText = sessionStorage.getItem("name");
            console.log(document.getElementById("A1").innerText);

            if (role === null) {
                window.location.href = "Default.aspx";

                
            } else
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
                    $("#minimumStock").hide();
                    $("#zeroStock").hide();
                    
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
                    $("#minimumStock").hide();
                    $("#zeroStock").hide();
                } else if (role === "") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Akses Ditolak',
                        text: 'Role tidak valid. Anda akan diarahkan kembali ke halaman login.',
                    }).then((result) => {
                        window.location.href = "Default.aspx";
                    });
                }

            

            $('#loadingImg').show();

            loadSpareParts(currentPage);

            $.ajax({
                url: "/spi_databasepart.aspx/getAllSparepartMinimumStock",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable2 = $('#tabelMinimumStock tbody');
                    employeeTable2.empty();
                    $.each(json, function (index, itemMin) {
                        //employeeTable2.append('<tr><td>' + itemMin._goodsCode_minimumStock + '</td><td>' + itemMin._goodsName_minimumStock + '</td><td>' + itemMin._maker_minimumStock + '</td><td>' + itemMin._model_minimumStock + '</td><td>' + itemMin._rackName_minimumStock + '</td><td>' + itemMin._minStock_minimumStock + '</td><td>' + itemMin._nowStock_minimumStock + '</td><td>' + itemMin._minOrder_minimumStock + '</td><td>' + itemMin._status_minimumStock + '</td></tr>');
                        employeeTable2.append('<tr><td>' + itemMin._goodsCode_minimumStock + '</td><td>' + itemMin._goodsName_minimumStock + '</td><td>' + itemMin._maker_minimumStock + '</td><td>' + itemMin._model_minimumStock + '</td><td>' + itemMin._nowStock_minimumStock + '</td><td>' + itemMin._status_minimumStock + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tabelMinimumStock').dataTable({
                        deferRender: true,
                    });
                },
                complete: function () {
                    //$('#loadingImg').hide();
                },
                error: function (response) {
                    console.log(response);
                }
            });

            $.ajax({
                url: "/spi_databasepart.aspx/getAllSparepartZeroStock",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable3 = $('#tabelZeroStock tbody');
                    employeeTable3.empty();
                    $.each(json, function (index, itemMin) {
                        //employeeTable3.append('<tr><td>' + itemMin._goodsCode_zeroStock + '</td><td>' + itemMin._goodsName_zeroStock + '</td><td>' + itemMin._maker_zeroStock + '</td><td>' + itemMin._model_zeroStock + '</td><td>' + itemMin._rackName_zeroStock + '</td><td>' + itemMin._minStock_zeroStock + '</td><td>' + itemMin._nowStock_zeroStock + '</td><td>' + itemMin._minOrder_zeroStock + '</td><td>' + itemMin._status_zeroStock + '</td></tr>');
                        employeeTable3.append('<tr><td>' + itemMin._goodsCode_zeroStock + '</td><td>' + itemMin._goodsName_zeroStock + '</td><td>' + itemMin._maker_zeroStock + '</td><td>' + itemMin._model_zeroStock + '</td><td>' + itemMin._nowStock_zeroStock + '</td><td>' + itemMin._status_zeroStock + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tabelZeroStock').dataTable({
                        deferRender: true,
                    });
                },
                complete: function () {
                    // $('#loadingImg').hide();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        });

        function cekKosong() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var goodsCode = document.getElementById('<%= txtGoodsCodeOnebyOne.ClientID %>').value;
            var goodsDesc = document.getElementById('<%= txtGoodsDescOneByOne.ClientID %>').value;
            var goodsName = document.getElementById('<%= txtGoodsNameOneByOne.ClientID %>').value;
            var unitPrice = document.getElementById('<%= txtUnitPriceOneByOne.ClientID %>').value;
            var currency = document.getElementById('<%= txtCurrencyOneByOne.ClientID %>').value;
            var lineCell = document.getElementById('<%= txtLineCellOneByOne.ClientID %>').value;
            var maker = document.getElementById('<%= txtMakerOneByOne.ClientID %>').value;
            var model = document.getElementById('<%= txtModelOneByOne.ClientID %>').value;
            var maxStock = document.getElementById('<%= txtMaximumStockOneByOne.ClientID %>').value;
            var minStock = document.getElementById('<%= txtMinimumStockOneByOne.ClientID %>').value;
            var minOrder = document.getElementById('<%= txtMinimumOrderOneByOne.ClientID %>').value;
            var stockCategory = document.getElementById('<%= txtStockCategoryOneByOne.ClientID %>').value;
            var rackName = document.getElementById('<%= txtRackNameOneByOne.ClientID %>').value;
            var supplierName = document.getElementById('<%= txtSupplierNameOneByOne.ClientID %>').value;
            var nowStock = document.getElementById('<%= txtNowStockOneByOne.ClientID %>').value;

            if (goodsCode == "" || goodsDesc == "" || goodsName == "" || unitPrice == "" || currency == "" || lineCell == "" || maker == "" || model == "" || maxStock == "" || minStock == "" || minOrder == "" || stockCategory == "" || rackName == "" || supplierName == "" || nowStock == "") {
                alert("Data belum lengkap, silahkan lengkapi data terlebih dahulu.");
                return false;
            } else {
                document.forms[0].appendChild(confirm_value);
            }
        }

        $('#tabelMinimumStock').on('click', 'tr', function () {
            var getGoodsCode = $('td', this).eq(0).text();
            var getNowStock = $('td', this).eq(5).text();
            var getMinStock = $('td', this).eq(4).text();
            var getGoodsName = $('td', this).eq(1).text();
            var getMinOrder = $('td', this).eq(6).text();
            var getModel = $('td', this).eq(3).text();
            getGoodsCode = getGoodsCode.replace(/\s/g, '');
            getNowStock = getNowStock.replace(/\s/g, '');
            getMinStock = getMinStock.replace(/\s/g, '');
            getMinOrder = getMinOrder.replace(/\s/g, '');
            getGoodsName = getGoodsName.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');
            var selectedIndex;
            if (getModel == "301") {
                selectedIndex = 0;
            } else if (getModel == "AUTOGUIDECAP") {
                selectedIndex = 1;
            } else if (getModel == "AUTOPACK") {
                selectedIndex = 2;
            } else if (getModel == "BAIKAL") {
                selectedIndex = 3;
            } else if (getModel == "CARTONER") {
                selectedIndex = 4;
            } else if (getModel == "CISS") {
                selectedIndex = 5;
            } else if (getModel == "COMMON") {
                selectedIndex = 6;
            } else if (getModel == "COSTNER") {
                selectedIndex = 7;
            } else if (getModel == "CRAIG/LEGERO") {
                selectedIndex = 8;
            } else if (getModel == "FA") {
                selectedIndex = 9;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 10;
            } else if (getModel == "FRASER") {
                selectedIndex = 11;
            } else if (getModel == "GAGA") {
                selectedIndex = 12;
            } else if (getModel == "GEREMOLLY") {
                selectedIndex = 13;
            } else if (getModel == "HAV3D") {
                selectedIndex = 14;
            } else if (getModel == "HAV3P") {
                selectedIndex = 15;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 16;
            } else if (getModel == "KUROBE") {
                selectedIndex = 17;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 18;
            } else if (getModel == "LANTANA") {
                selectedIndex = 19;
            } else if (getModel == "LFP") {
                selectedIndex = 20;
            } else if (getModel == "LIONEL") {
                selectedIndex = 21;
            } else if (getModel == "MOLDING") {
                selectedIndex = 22;
            } else if (getModel == "NASUNO") {
                selectedIndex = 23;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 24;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 25;
            } else if (getModel == "ORPHEUS") {
                selectedIndex = 26;
            } else if (getModel == "OTHER") {
                selectedIndex = 27;
            } else if (getModel == "SAKURA") {
                selectedIndex = 28;
            } else if (getModel == "SEALING") {
                selectedIndex = 29;
            } else if (getModel == "SHETLAND") {
                selectedIndex = 30;
            } else if (getModel == "SUB1") {
                selectedIndex = 31;
            } else if (getModel == "SUB2") {
                selectedIndex = 32;
            } else if (getModel == "TAKASE") {
                selectedIndex = 33;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 34;
            } else { selectedIndex = 0 }
            $('#modalOrderQty').modal("show");
            var setGoodsCode = document.getElementById("<%=hdGoodsCode.ClientID%>");
            setGoodsCode.value = getGoodsCode;
            var goodsCode = document.getElementById("<%=txtGoodsCodeOrder.ClientID%>");
            var nowStock = document.getElementById("<%=txtNowStockOrder.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockOrder.ClientID%>");
            var goodsName = document.getElementById("<%=txtGoodsNameOrder.ClientID%>");
            var minOrder = document.getElementById("<%=txtMinOrderOrder.ClientID%>");
            var model = document.getElementById("<%=ddlModel.ClientID%>");
            goodsCode.value = getGoodsCode;
            nowStock.value = getNowStock;
            minStock.value = getMinStock;
            goodsName.value = getGoodsName;
            minOrder.value = getMinOrder;
            model.selectedIndex = selectedIndex;
        });

        $('#tabelZeroStock').on('click', 'tr', function () {
            var getGoodsCode = $('td', this).eq(0).text();
            var getNowStock = $('td', this).eq(5).text();
            var getMinStock = $('td', this).eq(4).text();
            var getGoodsName = $('td', this).eq(1).text();
            var getMinOrder = $('td', this).eq(6).text();
            var getModel = $('td', this).eq(3).text();
            getGoodsCode = getGoodsCode.replace(/\s/g, '');
            getNowStock = getNowStock.replace(/\s/g, '');
            getMinStock = getMinStock.replace(/\s/g, '');
            getMinOrder = getMinOrder.replace(/\s/g, '');
            getGoodsName = getGoodsName.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');

            var selectedIndex;
            if (getModel == "301") {
                selectedIndex = 0;
            } else if (getModel == "AUTOGUIDECAP") {
                selectedIndex = 1;
            } else if (getModel == "AUTOPACK") {
                selectedIndex = 2;
            } else if (getModel == "BAIKAL") {
                selectedIndex = 3;
            } else if (getModel == "CARTONER") {
                selectedIndex = 4;
            } else if (getModel == "CISS") {
                selectedIndex = 5;
            } else if (getModel == "COMMON") {
                selectedIndex = 6;
            } else if (getModel == "COSTNER") {
                selectedIndex = 7;
            } else if (getModel == "CRAIG/LEGERO") {
                selectedIndex = 8;
            } else if (getModel == "FA") {
                selectedIndex = 9;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 10;
            } else if (getModel == "FRASER") {
                selectedIndex = 11;
            } else if (getModel == "GAGA") {
                selectedIndex = 12;
            } else if (getModel == "GEREMOLLY") {
                selectedIndex = 13;
            } else if (getModel == "HAV3D") {
                selectedIndex = 14;
            } else if (getModel == "HAV3P") {
                selectedIndex = 15;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 16;
            } else if (getModel == "KUROBE") {
                selectedIndex = 17;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 18;
            } else if (getModel == "LANTANA") {
                selectedIndex = 19;
            } else if (getModel == "LFP") {
                selectedIndex = 20;
            } else if (getModel == "LIONEL") {
                selectedIndex = 21;
            } else if (getModel == "MOLDING") {
                selectedIndex = 22;
            } else if (getModel == "NASUNO") {
                selectedIndex = 23;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 24;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 25;
            } else if (getModel == "ORPHEUS") {
                selectedIndex = 26;
            } else if (getModel == "OTHER") {
                selectedIndex = 27;
            } else if (getModel == "SAKURA") {
                selectedIndex = 28;
            } else if (getModel == "SEALING") {
                selectedIndex = 29;
            } else if (getModel == "SHETLAND") {
                selectedIndex = 30;
            } else if (getModel == "SUB1") {
                selectedIndex = 31;
            } else if (getModel == "SUB2") {
                selectedIndex = 32;
            } else if (getModel == "TAKASE") {
                selectedIndex = 33;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 34;
            } else { selectedIndex = 0 }
            $('#modalOrderQty').modal("show");
            var setGoodsCode = document.getElementById("<%=hdGoodsCode.ClientID%>");
            setGoodsCode.value = getGoodsCode;
            var goodsCode = document.getElementById("<%=txtGoodsCodeOrder.ClientID%>");
            var nowStock = document.getElementById("<%=txtNowStockOrder.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockOrder.ClientID%>");
            var goodsName = document.getElementById("<%=txtGoodsNameOrder.ClientID%>");
            var minOrder = document.getElementById("<%=txtMinOrderOrder.ClientID%>");
            var model = document.getElementById("<%=ddlModel.ClientID%>");
            goodsCode.value = getGoodsCode;
            nowStock.value = getNowStock;
            minStock.value = getMinStock;
            goodsName.value = getGoodsName;
            minOrder.value = getMinOrder;
            model.value = getModel;

        });

        //$.ajax({
        //type: "POST",
        //url: "spi_databasepart.aspx/bindData",
        //data: dataValue,                
        //contentType: 'application/json; charset=utf-8',
        //dataType: 'json',
        //error: function (XMLHttpRequest, textStatus, errorThrown) {
        //    alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        //},
        //success: function (result) {
        //    alert("We returned: " + result);
        //}
        //});
        function SaveQty() {
            var myTab = document.getElementById('tabelQtyOrder');
            var empTab = document.getElementById('tabelQtyOrder');
            var rowCnt = empTab.rows.length;   // table row count.
            var tr = empTab.insertRow(rowCnt); // the table row.
            tr = empTab.insertRow(rowCnt);
            var arrValues = new Array();

            for (var c = 0; c < 5; c++) {
                var td = document.createElement('td'); // table definition.
                td = tr.insertCell(c);
                //$('td').css('background-color', 'transparent');
                td.style.backgroundColor = "white";
                if (c == 4) {      // the first column.
                    // add a button in every new row in the first column.
                    var button = document.createElement('input');

                    // set input attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's 'onclick' event.
                    button.setAttribute('onclick', 'removeRow(this)');

                    td.appendChild(button);
                }
                if (c == 0) {
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', '');
                    ele.setAttribute("class", "form-control");
                    ele.style.width = "60%";
                    td.appendChild(ele);
                    ele.value = 1;
                }
                if (c == 1) {
                    //var array = ["301","AUTO GUIDE CAP","AUTOPACK","CARTONER","CISS","COMMON","COSTNER","CRAIG/LEGERO","FA","FOAM SUPPORT","FRASER","GAGA","GERE MOLLY","HAV 3D","HAV 3P","INK BLENDING","KUROBE","KUZURYU","LANTANA","LFP","LIONEL","MOLDING","NASUNO","NASUNO 3","NEYMAR","ORPHEUS","OTHER","SAKURA","SEALING","SHETLAND","SUB 1","SUB 2","TAKASE","TANIGAWA"];
                    var array = ["AUTOPACK", "CARTONER", "BAIKAL", "CISS", "COMMON", "COSTNER/SAROMA", "FOAM SUPPORT", "GAGA", "HAV CRAIG", "HAV3D", "HAV3P", "INK BLENDING", "KUZURYU", "LEGGERO", "LFP", "NASUNO", "NASUNO 3", "NEYMAR", "OTHERS", "SAKURA", "SEALING", "SPI", "SUB", "TANIGAWA", "DEVICE", "301", "AUTO GUIDE CAP"];
                    //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                    //Create and append select list
                    var selectList = document.createElement("select");
                    selectList.id = "mySelect";
                    selectList.setAttribute("class", "form-control");
                    selectList.style.width = "75%";
                    //myParent.appendChild(selectList);

                    //Create and append the options
                    for (var i = 0; i < array.length; i++) {
                        var option = document.createElement("option");
                        option.value = array[i];
                        option.text = array[i];
                        selectList.appendChild(option);
                    }
                    td.appendChild(selectList); //ele.value = "asd";
                }
                if (c == 2) {
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', '');
                    ele.setAttribute("class", "form-control");
                    ele.style.width = "60%";
                    td.appendChild(ele);
                    //ele.value = 1;
                }
                if (c == 3) {
                    var array = ["SPAREPART", "ACTIVITY"];
                    //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                    //Create and append select list
                    var selectList = document.createElement("select");
                    selectList.id = "mySelect";
                    selectList.setAttribute("class", "form-control");
                    selectList.style.width = "75%";
                    //myParent.appendChild(selectList);

                    //Create and append the options
                    for (var i = 0; i < array.length; i++) {
                        var option = document.createElement("option");
                        option.value = array[i];
                        option.text = array[i];
                        selectList.appendChild(option);
                    }
                    td.appendChild(selectList); //ele.value = "asd";
                }
            }
            //document.getElementById("tab_content").value = arrValues;
            counter = counter + 1;
            console.log(counter);
        };

        function removeRow(oButton) {
            var empTab = document.getElementById('tabelQtyOrder');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counter = counter - 1;
            console.log(counter);
            //document.getElementById("rowCount").value = counter;
            //console.log(counter);
        }


        function saveDataOrderQty() {
            var myTab = document.getElementById('tabelQtyOrder');
            var qty1 = document.getElementById('txtQty').value;
            var pic1 = document.getElementById('txtOrderBy').value;
            var model1 = document.getElementById('ddlModel').value;
            var cat1 = document.getElementById('ddlCategory').value;
            var remove = "Remove";
            var arrValues = new Array();
            arrValues.push(qty1);
            arrValues.push(model1);
            arrValues.push(pic1);
            arrValues.push(cat1);
            arrValues.push(remove);
            for (row = 2; row < myTab.rows.length - 1; row++) {
                for (c = 0; c < myTab.rows[row].cells.length; c++) {
                    var element = myTab.rows.item(row).cells[c];
                    arrValues.push("" + element.childNodes[0].value + "");
                }
            }
            console.log(arrValues);
            //alert(arrValues);
            document.getElementById("tab_content").value = arrValues;

        }

        function cekKosong() {
            var qty = document.getElementById('<%= txtQty.ClientID %>').value;
            if (qty == "") {
                alert("Data Input Qty Order tidak boleh kosong.");
                return false;
            } else {
                //saveData();
            }
            saveDataOrderQty();
            //get();
        }

        function cekFile() {
            var qty = document.getElementById('<%= Upload.ClientID %>').value;
            if (qty == "") {
                alert("No file selected");
                return false;
            } else {
                //saveData();$('#loadingImg').show();
                $('#loadingImg').show();
            }
        }

        let currentPage = 1; // Halaman saat ini
        let searchTerm = ""; // Variabel untuk menyimpan kata kunci pencarian
        const pageSize = 10; // Jumlah item per halaman

        function loadSpareParts(page, search = "") {
            $.ajax({
                url: `/api/sparepart?page=${page}&pageSize=${pageSize}&searchTerm=${encodeURIComponent(search)}`,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    displayData(response.data); // Tampilkan data di tabel
                    setupPagination(response.total, response.totalPages, page); // Setup pagination
                    $('#loadingImg').hide();
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                }
            });
        }

        // Menangani pencarian
        $('#searchInput').on('input', function () {
            searchTerm = $(this).val(); // Simpan nilai pencarian
            currentPage = 1; // Reset ke halaman 1 saat melakukan pencarian
            loadSpareParts(currentPage, searchTerm); // Muat data berdasarkan pencarian
        });

        function displayData(spareParts) {
            // Bersihkan tabel sebelumnya
            $('#tabela tbody').empty();

            if (spareParts.length === 0) {
                // Jika tidak ada hasil, tampilkan pesan
                $('#tabela tbody').append(`
            <tr>
                <td colspan="9" class="text-center" style="color:red; font-weight:500;">No Sparepart Found</td>
            </tr>
        `);
            } else {
                // Tambahkan data ke tabel
                spareParts.forEach(sparePart => {
                    $('#tabela tbody').append(`
                <tr>
                    <td>${sparePart.GoodsCode}</td>
                    <td>${sparePart.GoodsName}</td>
                    <td>${sparePart.GoodsDesc}</td>
                    <td>${sparePart.Maker}</td>
                    <td>${sparePart.Model}</td>
                    <td>${sparePart.NowStock}</td>
                    <td>${sparePart.SubKeeping}</td>
                    <td>${sparePart.StockCategory}</td>
                    <td>
                        <!-- Tombol View dengan ikon -->
                        <button class="btn btn-outline-info btn-sm view-btn" data-id="${sparePart.GoodsCode}" title="View Sparepart">
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

            const goodsCode = $(this).data('id'); // Mendapatkan GoodsCode dari data-id

            // Membuka halaman detail sparepart dengan GoodsCode sebagai parameter
            //window.open(`spi_databasepart_detail.aspx?goodsCode=${goodsCode}`);
            window.location.href = `spi_databasepart_detail.aspx?goodsCode=${goodsCode}`;
        });

        //handle button view nantinya
        $('#tabela').on('click', '.edit-btn', function (e) {
            e.preventDefault();  // Mencegah reload halaman

            const goodsCode = $(this).data('id'); // Mendapatkan GoodsCode dari data-id

            // Membuka halaman detail sparepart dengan GoodsCode sebagai parameter
            //window.open(`spi_databasepart_detail.aspx?goodsCode=${goodsCode}`);
            window.location.href = `spi_databasepart_detail.aspx?goodsCode=${goodsCode}`;
        });

        function setupPagination(totalCount, totalPages, currentPage) {
            $('#pagination').empty(); // Bersihkan pagination sebelumnya

            // Tombol halaman pertama
            if (currentPage > 1) {
                $('#pagination').append(`
            <button class="page-button" data-page="1">1</button>
        `);
            }

            // Tombol sebelumnya
            if (currentPage > 1) {
                $('#pagination').append(`
            <button class="page-button" data-page="${currentPage - 1}">Prev</button>
        `);
            }

            // Menentukan batasan untuk menampilkan nomor halaman
            const startPage = Math.max(2, currentPage - 1); // Mulai dari 2 jika currentPage lebih dari 1
            const endPage = Math.min(totalPages - 1, currentPage + 1); // Hingga totalPages - 1 jika total lebih dari 1

            // Tambahkan nomor halaman
            for (let page = startPage; page <= endPage; page++) {
                $('#pagination').append(`
            <button class="page-button ${page === currentPage ? 'active' : ''}" data-page="${page}">${page}</button>
        `);
            }

            // Tombol berikutnya
            if (currentPage < totalPages) {
                $('#pagination').append(`
            <button class="page-button" data-page="${currentPage + 1}">Next</button>
        `);
            }

            // Tombol halaman terakhir
            if (currentPage < totalPages) {
                $('#pagination').append(`
            <button class="page-button" data-page="${totalPages}">${totalPages}</button>
        `);
            }

            // Mengikat event listener pada tombol pagination
            $('.page-button').off('click').on('click', function (event) {
                event.preventDefault();
                const page = $(this).data('page');
                currentPage = page;
                loadSpareParts(currentPage, searchTerm); // Muat data berdasarkan halaman dan kata kunci pencarian
            });
        }

    </script>
</body>
</html>
