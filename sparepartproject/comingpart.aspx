<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comingpart.aspx.cs" Inherits="sparepartproject.comingpart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Sparepart Inventory - Coming Part</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <%--<link rel="stylesheet" href="Style/font-awesome.css" />--%>
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="Scripts/fontawesome.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="Content/bootstrap-datepicker.min.css" />
    <link href="Style/select2.min.css" rel="stylesheet" />

    <style>
        .select2-container .select2-selection__rendered {
            font-family: Calibri;
            font-size: 0.8rem !important; /* Ukuran font untuk teks yang dipilih */
        }

        .select2-container .select2-dropdown {
            font-family: Calibri;
            font-size: 0.8rem !important; /* Ukuran font untuk dropdown */
        }

        .select2-container .select2-results__option {
            font-size: 0.8rem !important; /* Ukuran font untuk item dalam dropdown */
            font-family: Calibri;
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

        #gvExpenses {
            font-size: .7rem;
        }

        .datepicker {
            font-size: .7rem;
            cursor: pointer;
        }

        .input-group-text {
            cursor: pointer;
            font-size: .8rem;
        }

        .dataTables_filter {
            float: left !important;
            margin-left: 20px;
        }

        .modal-header {
            padding: .5rem;
        }

        .hidden {
            background-color: transparent;
            border-color: transparent;
        }

        .scrolling-wrapper {
            overflow-x: auto;
        }

        .dataTables_info {
            font-size: 10px;
        }

        .form-inline label {
            justify-content: flex-start;
        }

        .form-control {
            font-size: .6rem;
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

        .gvGrid:hover td, .even:hover td {
            background-color: #d4d4d4;
        }

        #btnExport {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnPartComingSPI, #btnSendMail {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
        }

        #btnSendMail {
            font-size: .7rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
        }

        .overlay {
            position: fixed;
            left: 0px;
            margin-top: 300px;
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
                content: url('loading.gif');
                /*content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');*/
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
                            <a href="loanlist.aspx">Loan List</a>
                        </li>
                        <li id="menuOrderPart">
                            <a href="sparepartorder.aspx">Order Part</a>
                        </li>
                        <li id="menuComingPart">
                            <a href="comingpart.aspx" style="background-color: white; color: #172679;">Coming Part</a>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Coming Part</h5>
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
                <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
                <asp:UpdateProgress ID="UpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                            <p>Processing data, please wait...</p>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-6">
                            <button type="button" id="btnPartComingSPI" class="btn btn-primary text-center" <%-- onclick="goToPage()"--%>>
                                Part Coming SPI
                            </button>
                        </div>
                        <div class="col-lg-6 ml-auto">
                            <asp:HiddenField runat="server" ID="hdnIDR" />
                            <asp:HiddenField runat="server" ID="hdnUSD" />
                            <asp:HiddenField runat="server" ID="hdnJPY" />
                            <asp:HiddenField runat="server" ID="hdnSGD" />
                            <label style="margin-top: 0px; font-size: 1.2rem;" class="mb-1">Currency ($1 USD =)</label>
                            <table class="table table-bordered" id="tblExchange" style="font-size: .7rem; font-family: monsterrat; cursor: pointer;">
                                <thead class="thead-dark">
                                    <tr class="table-info">
                                        <td>SGD</td>
                                        <td>JPY</td>
                                        <td>IDR</td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="line"></div>
                    <div class="row align-items-end" style="margin-top: 20px; margin-bottom: 20px;">
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
                        </div>
                        <div class="col-lg-4"></div>
                        <div class="col-lg-2">
                            <label class="dataTables_length" style="margin-right: 10px;">Date From</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" ID="txtDateFrom" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <label class="dataTables_length" style="margin-right: 10px;">Date To</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" ID="txtDateTo" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <button type="button" id="btnSendMail" class="btn btn-primary text-center" <%-- onclick="goToPage()"--%>>
                                Send Mail
                            </button>
                        </div>
                        <div class="col-lg-1">
                            <asp:Button CssClass="btn btn-success" runat="server" ID="btnExport" OnClientClick="return downloadExcel()" OnClick="btnExport_Click" Text="Export" />

                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="row">
                        <div class="col-12">
                            <label style="margin-top: 0px; font-size: 1.5rem; font-weight: 500;">List Coming Part </label>
                            <div class="row mt-3"></div>
                            <table class="table table-sm table-hover" style="font-size: .6rem; font-family: Tahoma; cursor: pointer;" id="tblComingPart">
                                <thead style="background-color: #2A476B; color: white; text-align: center;">
                                    <tr>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ID.</th>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ITEM DESCRIPTION</th>
                                        <th scope="col" style="vertical-align: middle;">PARTCODE</th>
                                        <th scope="col" style="vertical-align: middle;">VENDOR</th>
                                        <th scope="col" style="vertical-align: middle;">GROUP NAME</th>
                                        <th scope="col" style="vertical-align: middle;">COST CENTER</th>
                                        <th scope="col" style="vertical-align: middle;">PROFIT CENTER</th>
                                        <th scope="col" style="vertical-align: middle;">Qty</th>
                                        <th scope="col" style="vertical-align: middle;">CURRENCY</th>
                                        <th scope="col" style="vertical-align: middle;">PRICE</th>
                                        <th scope="col" style="vertical-align: middle;">USD</th>
                                        <th scope="col" style="vertical-align: middle;">SUM</th>
                                        <th scope="col" style="vertical-align: middle;">PO</th>
                                        <th scope="col" style="vertical-align: middle;">DO NUMBER</th>
                                        <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                        <th scope="col" style="vertical-align: middle;">APPLY</th>
                                        <th scope="col" style="vertical-align: middle;">PIC</th>
                                        <th scope="col" style="vertical-align: middle;">RECEIVED DO</th>
                                        <th scope="col" style="vertical-align: middle;">RECEIVED SPI</th>
                                        <th scope="col" style="vertical-align: middle;">LOCATION</th>
                                        <th scope="col" style="vertical-align: middle;">DUE DATE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="myModalInputComingPart" tabindex="-1" aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModsalLabel">Input Part Coming</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="container">
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Item Description</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtItemDesc" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Qty</label>
                                            </div>
                                            <div class="col-1">
                                                <asp:TextBox CssClass="form-control" ID="txtQty" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-2">
                                                <%--<select class="form-control" style="width: 100%;" id="ddlQtySatuan">
                                                    <option>PCS</option>
                                                    <option>BOX</option>
                                                    <option>UNIT</option>
                                                    <option>PACK</option>
                                                    <option>SET</option>
                                                </select>--%>
                                                <select class="form-control" id="ddlQtySatuan2" name="qtySatuan2" style="font-size:.7rem;">
                                                    <option value="">-- Pilih Unit --</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Partcode</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtPartcode" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-1">
                                                <select id="selectType" style="font-size: .8rem;">
                                                    <option value="Partcode">Partcode
                                                    </option>
                                                    <option value="SPI Code">SPI Code
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-1">
                                                <input type="button" id="btnCheckSparepart" value="check" style="font-size: .6rem;" /></div>
                                            <div class="col-1" style="text-align: left;">
                                                <label class="lblModal">Currency</label>
                                            </div>
                                            <div class="col-2">
                                                <select class="form-control" style="width: 50%;" id="ddlCurrency">
                                                    <option selected>USD</option>
                                                    <option>IDR</option>
                                                    <option>SGD</option>
                                                    <option>JPY</option>
                                                </select>
                                            </div>
                                            <%--<div class="col-1">--%>
                                            <label id="lblDetailsCurrency" style="font-size: .8rem; margin-top: 2px;"></label>

                                            <%--</div>--%>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Vendor</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtVendor" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Price</label>
                                            </div>
                                            <div class="col-2">
                                                <input type="text" class="form-control" id="txtPricee" onchange="getUSDPrice" />
                                            </div>

                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <%--<label class="lblModal">Group Name</label>--%>
                                            </div>
                                            <div class="col-3">
                                                <%--<select class="form-control">
                                            <option>Office Supply </option>
                                            <option selected>R&M Exp(P&M)</option>
                                            <option>R&M Exp(Serv-T/F/F)</option>
                                            <option>R&M Exp(T/F/F)</option>
                                            <option>TC-PURCH (Oth)-Fix</option>
                                            <option>MACH & EQUIP-OWN</option>
                                        </select>--%>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">USD</label>
                                            </div>
                                            <div class="col-2">
                                                <asp:TextBox CssClass="form-control" ID="txtPriceUSD" disabled runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Group Name</label>
                                            </div>
                                            <div class="col-3">
                                                <select class="form-control" id="ddlGroupName">
                                                    <option>Office Supply </option>
                                                    <option selected>R&M Exp(P&M)</option>
                                                    <option>R&M Exp(Serv-T/F/F)</option>
                                                    <option>R&M Exp(T/F/F)</option>
                                                    <option>TC-PURCH (Oth)-Fix</option>
                                                    <option>MACH & EQUIP-OWN</option>
                                                    <option>Books & Data Prcs</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">SUM</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtSUM" disabled runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Cost Center</label>
                                            </div>
                                            <div class="col-3">
                                                <select class="form-control" id="ddlCostCenter">
                                                    <option>410VIKM005</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">PO</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtPoNo" runat="server"></asp:TextBox>
                                            </div>
                                            <%--<div class="col-1"><input type="button" id="btnCheckPO" value="check" style="font-size:.6rem;" /></div>--%>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">
                                                    Profit Center
                                                </label>
                                            </div>
                                            <div class="col-3">
                                                <select class="form-control" id="ddlProfitCenter">
                                                    <option>410VK1</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Data Order</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtDoNo" runat="server"></asp:TextBox>
                                                <%--<div class="input-group date" data-provide="datepicker">
                                            <asp:TextBox CssClass="form-control" ID="txtDoNo" runat="server"></asp:TextBox>
                                            <div class="input-group-addon">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>--%>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">PIC</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtPIC" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Received DO</label>
                                            </div>
                                            <div class="col-3">
                                                <%--<asp:TextBox CssClass="form-control" ID="txtReceivedDO" runat="server"></asp:TextBox>--%>
                                                <div class="input-group date" data-provide="datepicker">
                                                    <asp:TextBox CssClass="form-control" ID="txtReceivedDO" runat="server"></asp:TextBox>
                                                    <div class="input-group-addon">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Purpose</label>
                                            </div>
                                            <div class="col-3">
                                                <select class="form-control" id="ddlPurpose">
                                                    <option value="SPAREPART">SPARE PART</option>
                                                    <option value="ACTIVITY">ACTIVITY</option>
                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Received SPI</label>
                                            </div>
                                            <div class="col-3">
                                                <%--<asp:TextBox CssClass="form-control" ID="" runat="server"></asp:TextBox>--%>
                                                <div class="input-group date" data-provide="datepicker">
                                                    <asp:TextBox CssClass="form-control" ID="txtReceivedSPI" runat="server"></asp:TextBox>
                                                    <div class="input-group-addon">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal" id="lblModel" style="display: none;">Model</label>
                                            </div>
                                            <div class="col-3">
                                                <select class="form-control" id="ddlModel" style="display: none;">
                                                    <option>301</option>
                                                    <option>AUTO GUIDE CAP</option>
                                                    <option>AUTOPACK</option>
                                                    <option>BAIKAL</option>
                                                    <option>CARTONER</option>
                                                    <option>CISS</option>
                                                    <option>COMMON</option>
                                                    <option>COSTNER</option>
                                                    <option>CRAIG/LEGERO</option>
                                                    <option>FA</option>
                                                    <option>FOAM SUPPORT</option>
                                                    <option>FRASER</option>
                                                    <option>GAGA</option>
                                                    <option>GERE MOLLY</option>
                                                    <option>HAMANA GROW</option>

                                                    <option>HAV 3D</option>
                                                    <option>HAV 3P</option>
                                                    <option>HOKUSAI</option>
                                                    <option>INK BLENDING</option>
                                                    <option>KUROBE</option>
                                                    <option>KUZURYU</option>
                                                    <option>LANTANA</option>
                                                    <option>LFP</option>
                                                    <option>LIONEL</option>
                                                    <option>MOLDING</option>
                                                    <option>NASUNO</option>
                                                    <option>NASUNO 3</option>
                                                    <option>NEYMAR</option>
                                                    <option>ORPHEUS</option>
                                                    <option>OTHER</option>
                                                    <option>SAKURA</option>
                                                    <option>SEALING</option>
                                                    <option>SHETLAND</option>
                                                    <option>SUB 1</option>
                                                    <option>SUB 2</option>
                                                    <option>TAKASE</option>
                                                    <option>TANIGAWA</option>
                                                    <option>TOYA</option>

                                                </select>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">PIC Received</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtReceivedPIC" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Location</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtLocation" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-1"></div>
                                            <div class="col-2" style="text-align: right;">
                                                <label class="lblModal">Apply</label>
                                            </div>
                                            <div class="col-3">
                                                <asp:TextBox CssClass="form-control" ID="txtApply" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn" data-dismiss="modal" style="background-color: black; font-size: .8rem; color: white;">Close</button>
                                <button type="button" class="btn btn-secondary" id="btnReset" style="font-size: .8rem;">Reset</button>
                                <button type="button" class="btn btn-primary" id="btnSave" style="font-size: .8rem;">Save</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModalExchange">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">UPDATE CURRENCY</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <label class="lblModal mb-3" style="font-size: 1.2rem">1 USD = </label>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">SGD</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtSGD"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">JPY</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtJPY"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">IDR</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtIDR"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <%--<asp:LinkButton ID="btnUpdateExchangeRate" Text="Update" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>--%>
                                <button type="button" class="btn btn-outline-primary text-center" id="btnUpdateExchangeRate">Update</button>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modalUpdateOrDelete" style="font-family: Tahoma">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <label id="selectedID" style="display: none;">a</label>
                                <h4 class="modal-title" id="lblChooseAction" style="font-family: Tahoma">Choose Action</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <%--<label class="lblModal mb-3" style="font-size: 1.2rem">1 USD = </label>--%>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">Partcode</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtPartcodeEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">Item Desc</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtItemDescEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">Currency</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtCurrencyEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <label class="lblModal" style="font-size: .8rem">Qty</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtQtyEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="lblModal" style="font-size: .8rem">Original Price</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtOriginalPriceEdit" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="lblModal" style="font-size: .8rem; color: blue" id="lblSetUSDPrice">USD Price</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtUSDPriceEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="lblModal" style="font-size: .8rem">Total USD Price</label>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtTotalPriceEdit" Enabled="false" Style="cursor: not-allowed;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary text-center" id="btnUpdateComingPart">Update</button>
                                <button type="button" class="btn btn-outline-secondary text-center" id="btnDeleteComingPart">Delete</button>
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </form>


        </div>


        <script src="Scripts/jquery-3.5.1.min.js"></script>
        <script src="Scripts/popper.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="Scripts/bootstrap-datepicker.min.js"></script>
        <script src="Scripts/myCustomScrollbar.js"></script>
        <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
        <script src="Scripts/select2.min.js"></script>
        <script src="Scripts/sweetalert.js"></script>

        <script type="text/javascript">
            var usd, totalPrice, price;
            $.fn.datepicker.defaults.format = "yyyy-mm-dd";
            $('.datepicker').datepicker({
                icons: {
                    previous: "fas fa-chevron-left",
                    next: "fas fa-chevron-right",
                },
                autoclose: true

            });

            $(document).ready(function () {

                // Ambil role dari sessionStorage
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
                    $("#menuLoanList").hide();
                }

                console.log(role);
                // Periksa apakah role bukan ADMIN
                if (role === null) {
                    window.location.href = "Default.aspx";

                } else if (role === "SPV") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Akses Ditolak',
                        text: 'Anda akan diarahkan kembali ke halaman home.',
                    }).then((result) => {
                        window.location.href = "home.aspx";
                    });

                    // ... tambahkan menu lain yang diizinkan untuk STAFF
                } else if (role === "STAFF") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Akses Ditolak',
                        text: 'Anda akan diarahkan kembali ke halaman home.',
                    }).then((result) => {
                        window.location.href = "home.aspx";
                    });

                    // ... tambahkan menu lain yang diizinkan untuk STAFF
                }


                $('#ddlQtySatuan2').select2({
                    placeholder: '-- Pilih Unit --',
                    width: '100%',  // Pastikan dropdown seleksi penuh
                });

                //ambil data unit
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetUnit", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var units = JSON.parse(response.d);
                        var unitsSelect = $('#ddlQtySatuan2');

                        // Kosongkan dropdown terlebih dahulu
                        unitsSelect.empty();
                        unitsSelect.append('<option value="">-- Pilih Unit --</option>');

                        // Isi dropdown dengan data supplier
                        for (var i = 0; i < units.length; i++) {
                            unitsSelect.append('<option value="' + units[i] + '">' + units[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        unitsSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });


                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });
                getFullComingPart();

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });

                $.ajax({
                    url: "/expenseslist.aspx/getAllNewExpenses_Coming",
                    method: 'post',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var json = JSON.parse(data.d);
                        var employeeTable = $('#tblComing tbody');
                        employeeTable.empty();
                        $.each(json, function (index, item) {
                            employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._currency + '</td><td>' + item._price + '</td><td>' + item._amount + '</td><td>' + item._amountUSD + '</td><td>' + item._receivedDate + '</td><td>' + item._receivedQty + '</td><td>' + item._balance + '</td><td>' + item._quotationNo + '</td><td>' + item._leadTime + '</td><td>' + item._PRno + '</td><td>' + item._PRdate + '</td><td>' + item._POno + '</td><td>' + item._POdate + '</td><td>' + item._costCenter + '</td><td>' + item._profitCenter + '</td><td>' + item._category + '</td><td>' + item._status + '</td><td>' + item._PIC + '</td><td>' + item._purpose + '</td><td>' + item._ordertoModel + '</td><td>' + item._purposeRemark + '</td><td>' + item._target + '</td><td>' + item._month + '</td><td>' + item._controlDateRemaining + '</td><td>' + item._rangeReceive + '</td><td>' + item._status + '</td><td>' + item._controlMonthly + '</td><td>' + item._statusMonthly + '</td><td><input type="checkbox" id="myCheck" onclick="myFunction()"></td></tr>');
                            //console.log(item);
                        });
                        $('#tblComing').dataTable({
                            deferRender: true,
                            "order": [[0, 'desc']],
                        });
                    },
                    complete: function () {
                        $('#loadingImg').hide();
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
            });

            function goToPage() {
                var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                //setTimeout(function () { updateProgress.style.display = 'block'; }, 200);
                setTimeout(function () {
                    $('#UpdateProgress').show();

                    /// wait 3 seconds
                    setTimeout(function () {
                        $('#UpdateProgress').hide();
                    }, 800);
                }, 0);
                window.location.href = 'newissuedpart.aspx';
            }

            $("#btnPartComingSPI").click(function () {
                $('#myModalInputComingPart').modal();
            });

            $('#ddlPurpose').change(function () {
                if (this.selectedIndex == 0) {
                    document.getElementById('lblModel').style.display = 'none';
                    document.getElementById('ddlModel').style.display = 'none';
                } else {
                    document.getElementById('lblModel').style.display = 'inline';
                    document.getElementById('ddlModel').style.display = 'inline';
                }
            });

            //untuk loading currency
            $.ajax({
                url: "/expenseslist.aspx/getExchangeRate",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblExchange tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._SGD + '</td><td>' + item._JPY + '</td><td>' + item._IDR + '</td></tr>');
                        console.log(item);
                        var a = item._JPY;
                        var b = item._SGD;
                        var c = item._IDR;
                        document.getElementById('hdnJPY').value = item._JPY;
                        document.getElementById('hdnSGD').value = item._SGD;
                        document.getElementById('hdnIDR').value = item._IDR;
                    });
                },
                complete: function () {
                    //$('#loadingImg').hide();
                },
                error: function (response) {
                    console.log(response);
                }
            });

            //untuk edit currency
            $('#tblExchange').on('click', 'tr', function () {
                var getJPY = $('td', this).eq(1).text();
                var getSGD = $('td', this).eq(0).text();
                var getIDR = $('td', this).eq(2).text();
                $('#myModalExchange').modal("show");
                var JPY = document.getElementById("<%=txtJPY.ClientID%>");
                var IDR = document.getElementById("<%=txtIDR.ClientID%>");
                var SGD = document.getElementById("<%=txtSGD.ClientID%>");
                JPY.value = getJPY;
                SGD.value = getSGD;
                IDR.value = getIDR;
            });

            $('#btnUpdateExchangeRate').click(function () {
                if (document.getElementById("<%=txtJPY.ClientID%>").value == "") {
                    alert('Mohon isikan JPY value');
                    return;
                } else if (document.getElementById("<%=txtIDR.ClientID%>").value == "") {
                    alert('Mohon isikan IDR value');
                    return;
                } else if (document.getElementById("<%=txtSGD.ClientID%>").value == "") {
                    alert('Mohon isikan SGD value');
                    return;
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: 'comingpart.aspx/insertExchange',
                    data: '{ JPY: ' + JSON.stringify(document.getElementById("<%=txtJPY.ClientID%>").value) + ', IDR: ' + JSON.stringify(document.getElementById("<%=txtIDR.ClientID%>").value) + ', SGD: ' + JSON.stringify(document.getElementById("<%=txtSGD.ClientID%>").value) + '}',
                success: function (data, status, xhr) {
                    alert('Success Update Exchange Rate');
                    location.reload();
                },
                error: function (xhr, status, error) {
                    console.log('fail');
                    alert(xhr.responseText);
                }
            })
            });

            function getUSDPrice() {
                //var a = "asdasd,";
                //var b = a.replace(",", "1");
                //console.log(b);
                //if (document.getElementById('txtPricee').value.includes(',')) {
                //    document.getElementById('txtPricee').value = document.getElementById('txtPricee').value.replace(',', '.');
                //}       
                if (document.getElementById('ddlCurrency').value == "SGD") {
                    document.getElementById('txtPriceUSD').value = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnSGD').value).toFixed(2));
                    usd = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnSGD').value).toFixed(2));
                    document.getElementById('lblDetailsCurrency').innerText = "1 USD = " + document.getElementById('hdnSGD').value + " SGD";
                    price = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "")));
                } else if (document.getElementById('ddlCurrency').value == "JPY") {
                    document.getElementById('txtPriceUSD').value = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnJPY').value).toFixed(2));
                    document.getElementById('lblDetailsCurrency').innerText = "1 USD = " + document.getElementById('hdnJPY').value + " JPY";
                    usd = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnJPY').value).toFixed(2));
                    price = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "")));
                } else if (document.getElementById('ddlCurrency').value == "IDR") {
                    document.getElementById('txtPriceUSD').value = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnIDR').value).toFixed(2));
                    document.getElementById('lblDetailsCurrency').innerText = "1 USD = " + document.getElementById('hdnIDR').value + " IDR";
                    usd = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnIDR').value).toFixed(2));
                    price = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "")));
                } else {
                    document.getElementById('txtPriceUSD').value = (document.getElementById('txtPricee').value.replace(/(^\&)|,/g, ""));
                    usd = (document.getElementById('txtPricee').value).replace(/(^\&)|,/g, "");
                    price = Number((document.getElementById('txtPricee').value.replace(/(^\&)|,/g, "")));
                    document.getElementById('lblDetailsCurrency').innerText = "";
                }
            }

            $('#txtPricee').change(function () {
                getUSDPrice();
                hitungTotalPrice();
            });


            $('#txtQty').change(function () {
                getUSDPrice();
                hitungTotalPrice();
            });

            function hitungTotalPrice() {
                document.getElementById('txtSUM').value = (document.getElementById('txtQty').value * document.getElementById('txtPriceUSD').value).toFixed(2);
                totalPrice = document.getElementById('txtQty').value * document.getElementById('txtPriceUSD').value;
            }

            $(document).on('change', "#ddlCurrency", function () {
                getUSDPrice();
                hitungTotalPrice();
            })


            var events = [];
            function getFullComingPart() {
                $('#UpdateProgress').show();

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "comingpart.aspx/GetEvents",
                    success: function (data) {
                        var tblComingPart = $('#tblComingPart tbody');
                        tblComingPart.empty();
                        $.each(data.d, function (i, v) {
                            //untuk mendeteksi apakah ada datanya
                            events.push({
                                id: v.itemDescription
                            })

                            //membuat row dari setiap data part coming di table part coming
                            tblComingPart.append('<tr style="text-align:center;"><td>' + v.id + '</td><td>' + v.itemDescription + '</td><td>' + v.partcode + '</td><td>' + v.vendor + '</td><td>' + v.groupName + '</td><td>' + v.costCenter + '</td><td>' + v.profitCenter + '</td><td>' + v.qtyNumber + '</td><td>' + v.originalCurrency + '</td><td>' + v.originalPrice + '</td><td>' + v.usdPrice + '</td><td>' + v.totalPrice + '</td><td>' + v.poNumber + '</td><td>' + v.dateOrder + '</td><td>' + v.purpose + '</td><td>' + v.apply + '</td><td>' + v.pic + '</td><td>' + v.receivedDateOrder + '</td><td>' + v.receivedSPI + '</td><td>' + v.location + '</td><td style="background-color:yellow;">' + v.dueDate + '</td></tr>');
                        });
                        $('#tblComingPart').dataTable({
                            deferRender: true,
                            "order": [[0, "desc"]]
                        });

                        //checking jika row = 0 maka display no data available
                        if (events.length == 0) {
                            tblComingPart.append('<tr><td colspan="20" style="background-color:#dedede;">No Data Available</td></tr>');
                        } else {

                        }
                        $('#UpdateProgress').hide();

                        //updateProgress.style.display = "none";
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert('Something error. Please contact Randy.');
                    }
                })

                $('#btnSave').click(function () {
                    console.log(document.getElementById('txtItemDesc').value);
                    console.log(totalPrice);
                    addComingPart();
                    //console
                })


                function addComingPart() {
                    $('#UpdateProgress').show();

                    var modelForOriginalModel;
                    if (document.getElementById('ddlPurpose').selectedIndex == 0) {
                        modelForOriginalModel = '';
                    } else {
                        modelForOriginalModel = document.getElementById('ddlModel').value;
                    }

                    var receiveddo = $('#txtReceivedDO').val().trim();
                    var receivedspi = $('#txtReceivedSPI').val().trim();
                    var valuetype = document.getElementById('selectType').value;
                    var valuetypeActivity = document.getElementById('ddlPurpose').value;

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: 'comingpart.aspx/insertPartComing',
                        data: '{ itemDescription: ' + JSON.stringify(document.getElementById('txtItemDesc').value) + ', partcode: ' + JSON.stringify(document.getElementById('txtPartcode').value) + ', vendor: ' + JSON.stringify(document.getElementById('txtVendor').value) + ', groupName: ' + JSON.stringify(document.getElementById('ddlGroupName').value) + ', costCenter: ' + JSON.stringify(document.getElementById('ddlCostCenter').value) + ', profitCenter: ' + JSON.stringify(document.getElementById('ddlProfitCenter').value) + ', qty: ' + JSON.stringify(document.getElementById('txtQty').value) + ', currency: ' + JSON.stringify(document.getElementById('ddlCurrency').value) + ',price: ' + JSON.stringify(price) + ',usd: ' + JSON.stringify(usd) + ',sum :' + JSON.stringify(totalPrice) + ', po:' + JSON.stringify(document.getElementById('txtPoNo').value) + ',donumber:' + JSON.stringify(document.getElementById('txtDoNo').value) + ',purpose:' + JSON.stringify(document.getElementById('ddlPurpose').value) + ',apply:' + JSON.stringify(document.getElementById('txtApply').value) + ',pic:' + JSON.stringify(document.getElementById('txtPIC').value) + ',receivedDO:' + JSON.stringify(receiveddo) + ',receivedSPI:' + JSON.stringify(receivedspi) + ',receivedPIC:' + JSON.stringify(document.getElementById('txtReceivedPIC').value) + ',status:' + JSON.stringify('open') + ',qtySatuan:' + JSON.stringify(document.getElementById('ddlQtySatuan2').value) + ',location:' + JSON.stringify(document.getElementById('txtLocation').value) + ', originalModel: ' + JSON.stringify(modelForOriginalModel) + ', _type: ' + JSON.stringify(valuetype) + '}',
                        success: function (data, status, xhr) {
                            alert('Success Add Data');
                            location.reload();
                            $('#UpdateProgress').hide();

                            //updateProgress.style.display = "hide";
                        },
                        error: function (xhr, status, error) {
                            console.log('fail');
                            alert(xhr.responseText);
                        }
                    })
                }


            }

            $('#btnDeleteComingPart').click(function () {
                if (confirm('Delete Coming Part dengan ID ' + document.getElementById('selectedID').innerHTML + '?')) {
                    $('#UpdateProgress').show();

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: 'comingpart.aspx/DeleteComingPart',
                        data: '{ id: ' + JSON.stringify(document.getElementById('selectedID').innerHTML) + '}',
                        success: function (data, status, xhr) {
                            alert('Success Delete Data');
                            location.reload();
                            $('#UpdateProgress').hide();

                            //updateProgress.style.display = "hide";
                        },
                        error: function (xhr, status, error) {
                            console.log('fail');
                            alert(xhr.responseText);
                            $('#UpdateProgress').hide();

                        }
                    })
                } else {
                    return false;
                }
            })

            $('#btnUpdateComingPart').click(function () {
                if (confirm('Update Coming Part dengan ID ' + document.getElementById('selectedID').innerHTML + '?')) {
                    $('#UpdateProgress').show();

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: 'comingpart.aspx/UpdateComingPart',
                        data: '{ id: ' + JSON.stringify(document.getElementById('selectedID').innerHTML) + ', originaprice: ' + JSON.stringify(document.getElementById('txtOriginalPriceEdit').value) + ', usdprice: ' + JSON.stringify(document.getElementById('txtUSDPriceEdit').value) + ' , totalprice: ' + JSON.stringify(document.getElementById('txtTotalPriceEdit').value) + ' }',
                        success: function (data, status, xhr) {
                            alert('Success Update Data');
                            location.reload();
                            $('#UpdateProgress').hide();

                            //updateProgress.style.display = "hide";
                        },
                        error: function (xhr, status, error) {
                            console.log('fail');
                            alert(xhr.responseText);
                            $('#UpdateProgress').hide();

                        }
                    })
                } else {
                    return false;
                }
            })

            $('#tblComingPart').on('click', 'tr', function () {

                var getIssuedID = $('td', this).eq(0).text();
                getIssuedID = getIssuedID.replace(/\s/g, '');

                var getPartcode = $('td', this).eq(2).text();
                getPartcode = getPartcode.replace(/\s/g, '');

                var getItemDesc = $('td', this).eq(1).text();
                getItemDesc = getItemDesc.replace(/\s/g, '');

                var getCurrency = $('td', this).eq(8).text();
                getCurrency = getCurrency.replace(/\s/g, '');

                var getQty = $('td', this).eq(7).text();
                getQty = getQty.replace(/\s/g, '');

                var getOriginalPrice = $('td', this).eq(9).text();
                getOriginalPrice = getOriginalPrice.replace(/\s/g, '');

                var getUSDPrice = $('td', this).eq(10).text();
                getUSDPrice = getUSDPrice.replace(/\s/g, '');

                var getSUMPrice = $('td', this).eq(11).text();
                getSUMPrice = getSUMPrice.replace(/\s/g, '');

                $('#modalUpdateOrDelete').modal("show");

                document.getElementById('lblChooseAction').innerHTML = 'Selected Coming Part ID : ' + getIssuedID;
                document.getElementById('selectedID').innerHTML = getIssuedID;
                document.getElementById('txtPartcodeEdit').value = getPartcode;
                document.getElementById('txtItemDescEdit').value = getItemDesc;
                document.getElementById('txtCurrencyEdit').value = getCurrency;
                document.getElementById('txtQtyEdit').value = getQty;
                document.getElementById('txtOriginalPriceEdit').value = getOriginalPrice;
                document.getElementById('txtUSDPriceEdit').value = getUSDPrice;
                document.getElementById('txtTotalPriceEdit').value = getSUMPrice;
            })

            function setUSDPriceNew() {
                if (document.getElementById('txtCurrencyEdit').value == 'USD') {
                    document.getElementById('txtUSDPriceEdit').value = document.getElementById('txtOriginalPriceEdit').value;
                    document.getElementById('lblSetUSDPrice').innerHTML = 'USD Price';
                } else if (document.getElementById('txtCurrencyEdit').value == 'IDR') {
                    document.getElementById('lblSetUSDPrice').innerHTML = 'USD Price | ' + '1 USD = ' + document.getElementById('hdnIDR').value + ' IDR';
                    document.getElementById('txtUSDPriceEdit').value = Number((document.getElementById('txtOriginalPriceEdit').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnIDR').value).toFixed(2));;
                } else if (document.getElementById('txtCurrencyEdit').value == 'JPY') {
                    document.getElementById('lblSetUSDPrice').innerHTML = 'USD Price | ' + '1 USD = ' + document.getElementById('hdnJPY').value + ' JPY';
                    document.getElementById('txtUSDPriceEdit').value = Number((document.getElementById('txtOriginalPriceEdit').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnJPY').value).toFixed(2));;
                } else if (document.getElementById('txtCurrencyEdit').value == 'SGD') {
                    document.getElementById('lblSetUSDPrice').innerHTML = 'USD Price | ' + '1 USD = ' + document.getElementById('hdnSGD').value + ' SGD';
                    document.getElementById('txtUSDPriceEdit').value = Number((document.getElementById('txtOriginalPriceEdit').value.replace(/(^\&)|,/g, "") / document.getElementById('hdnSGD').value).toFixed(2));;
                }
                document.getElementById('txtTotalPriceEdit').value = Number((document.getElementById('txtQtyEdit').value.replace(/(^\&)|,/g, "") * document.getElementById('txtUSDPriceEdit').value).toFixed(2));
            }

            $('#txtOriginalPriceEdit').change(function () {
                setUSDPriceNew();
            });

            $('#txtCurrencyEdit').change(function () {
                setUSDPriceNew();
            });

            $('#btnSendMail').click(function () {

                if ($('#txtDateFrom').val().trim() == "") {
                    alert('Mohon isikan Date From');
                    return;
                }
                if ($('#txtDateTo').val().trim() == "") {
                    alert('Mohon isikan Date To');
                    return;
                }

                if (confirm('Send Email Part Datang?')) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        url: "comingpart.aspx/sendMailPartComing",
                        data: '{ datefrom: ' + JSON.stringify(document.getElementById('txtDateFrom').value) + ', dateto: ' + JSON.stringify(document.getElementById('txtDateTo').value) + '}',
                        success: function (data) {
                            alert('Email notifikasi sukses terkirim.');
                        },
                        error: function (xhr, status, error) {
                            alert('Email Notifikasi gagal terkirim. Hubungi Randy.');
                            updateProgress.style.display = "none";

                            alert(xhr.responseText);
                        }
                    })
                } else {
                    return;
                }
            })

            //$('#btnExport').click(function () {

            //    if ($('#txtDateFrom').val().trim() == "") {
            //        alert('Mohon isikan Date From');
            //        return;
            //    }
            //    if ($('#txtDateTo').val().trim() == "") {
            //        alert('Mohon isikan Date To');
            //        return;
            //    }

            //    if (confirm('Download Excel?')) {
            //        $.ajax({
            //                type: "POST",
            //                dataType: "json",
            //                async: false,
            //                contentType: "application/json; charset=utf-8",
            //                url: "comingpart.aspx/exportExcel",
            //                data: '{ datefrom: ' + JSON.stringify(document.getElementById('txtDateFrom').value) + ', dateto: ' + JSON.stringify(document.getElementById('txtDateTo').value) + '}',
            //                success: function (data) {
            //                    alert('Excel Terdownload.');
            //                },
            //                error: function (xhr, status, error) {
            //                    alert('Gagal download. Hubungi Randy.');
            //                    //updateProgress.style.display = "none";

            //                    alert(xhr.responseText);
            //                }
            //            })
            //    } else {
            //        return;
            //    }
            //})

            function sendMail() {

            }

            function downloadExcel() {
                var qty = document.getElementById('<%= txtDateFrom.ClientID %>').value;
                var to = document.getElementById('<%= txtDateTo.ClientID %>').value;
                if (qty == "" || to == "") {
                    alert('Please Select Date From and Date To properly');
                    return false;
                } else {
                    var updateProgress = $get("<%= UpdateProgress.ClientID %>");

                    setTimeout(function () { updateProgress.style.display = 'block'; }, 200);
                    deleteCookie();

                    var timeInterval = 500; // milliseconds (checks the cookie for every half second )

                    var loop = setInterval(function () {
                        if (IsCookieValid()) {
                            updateProgress.style.display = 'none'; clearInterval(loop)
                        }

                    }, timeInterval);
                }


            }

            function deleteCookie() {
                var cook = getCookie('ExcelDownloadFlag');
                if (cook != "") {
                    document.cookie = "ExcelDownloadFlag=; Path = /; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                }
            }

            function IsCookieValid() {
                var cook = getCookie('ExcelDownloadFlag');
                return cook != '';
            }

            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            var dataSparepart = [];
            var dataKeeping = [];
            var keepingasobjectid;

            $('#btnCheckSparepart').on('click', function (e) {
                cariSparepartAwal();
            });

            function cariSparepartAwal() {
                var value = document.getElementById('txtPartcode').value;
                var valuetype = document.getElementById('selectType').value;
                if (value != '') {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        url: 'comingpart.aspx/getSubKeeping',
                        data: '{ _goodsName: ' + JSON.stringify(value) + ', _type: ' + JSON.stringify(valuetype) + '}',
                        success: function (data) {
                            console.log(data.d);

                            var json = JSON.parse(data.d);
                            console.log(json);

                            if (json.length > 0) {
                                document.getElementById('txtLocation').value = '';
                                document.getElementById('txtLocation').value = json[0].subKeepig;
                                document.getElementById('txtItemDesc').value = '';
                                document.getElementById('txtItemDesc').value = json[0].goodsDesc;
                                document.getElementById('txtPartcode').value = '';
                                document.getElementById('txtPartcode').value = json[0].goodsName;
                            }
                            else {
                                document.getElementById('txtLocation').value = "";
                                document.getElementById('txtItemDesc').value = '';

                                alert('Oops data sparepart dengan partcode tersebut tidak ditemukan. mohon input manual saja ya location dan description nya :)');
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                        }
                    })
                } else {
                    return false;
                }
            }


            function cariSparepartAwal2() {
                var value = document.getElementById('txtPartcode').value;
                if (value != '') {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        url: 'comingpart.aspx/getTransactionParts',
                        data: '{ "partcode" : "' + value + '"}',
                        success: function (data) {
                            $.each(data.d, function (i, v) {
                                console.log(v);
                                dataSparepart.push({
                                    code: v.code,
                                    keeping: v.convertedKeeping,
                                    subkeeping: v.convertedSubKeeping,
                                    originalkeeping: v.keeping,
                                    description: v.description
                                });
                            });

                            console.log(dataSparepart);


                            if (dataSparepart.length > 0) {
                                if (dataSparepart[0].keeping != '') {
                                    cariDrawernya();
                                } else {
                                    alert('Oops data sparepart dengan partcode tersebut tidak ditemukan. mohon input manual saja ya location nya :)');

                                }
                            } else {
                                alert('Oops data sparepart dengan partcode tersebut tidak ditemukan. mohon input manual saja ya location nya :)');
                            }

                            dataSparepart = [];
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                        }
                    })
                } else {
                    return false;
                }
            }


            function cariDrawernya() {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    url: 'comingpart.aspx/getKeeping',
                    data: '{ "keeping" : "' + dataSparepart[0].keeping + '","subkeeping" : "' + dataSparepart[0].subkeeping + '"}',
                    success: function (data) {
                        $.each(data.d, function (i, v) {
                            console.log(v);
                            dataKeeping.push({
                                name: v.name,
                            });
                        });

                        //console.log(data);


                        if (dataKeeping.length > 0) {
                            document.getElementById('txtLocation').value = "";
                            document.getElementById('txtItemDesc').value = ""

                            alert('Data Drawer dan Description ditemukan. Silahkan lanjut :)');
                            document.getElementById('txtLocation').value = dataKeeping[0].name;
                            document.getElementById('txtItemDesc').value = dataSparepart[0].description;


                        } else {
                            document.getElementById('txtLocation').value = ""
                            document.getElementById('txtPartcode').value = ""
                            document.getElementById('txtItemDesc').value = ""
                            alert('Oops data sparepart dengan partcode tersebut tidak ditemukan. mohon input manual saja ya location dan description nya :)');
                        }

                        dataKeeping = [];
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                    }
                })

            }

            function checkPO() {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    url: "comingpart.aspx/checkExistPOfromExpenses",
                    data: '{ pono: ' + JSON.stringify(document.getElementById('txtPoNo').value) + '}',
                    success: function (data) {
                        alert('PO Terdeteksi.');
                    },
                    error: function (xhr, status, error) {
                        alert('Email Notifikasi gagal terkirim. Hubungi Admin.');
                        alert(xhr.responseText);
                    }
                })
            }
        </script>
    </div>

</body>
</html>
