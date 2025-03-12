<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="expenseslist.aspx.cs" Inherits="sparepartproject.expenseslist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Sparepart Inventory - Expenses List</title>
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

    <style>
        #gvExpenses {
            font-size: .7rem;
        }

        .dataTables_filter {
            float: left !important;
            margin-left: 20px;
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
    </style>


</head>
<body>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="#configSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">System Config</a>
                    <ul class="collapse list-unstyled" id="configSubmenu">
                        <li>
                            <a href="systemconfig/spi_model.aspx">Model</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_line.aspx">Line</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_cell.aspx">Cell</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_keeping.aspx">Keeping & Sub Keeping</a>
                        </li>
                        <li onclick="alert('Coming Soon');">
                            <a href="#">Currency</a>
                        </li>
                        <li onclick="alert('Coming Soon');">
                            <a href="#">Employee</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_vendor.aspx">Vendor</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_maker.aspx">Maker</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_unit.aspx">Unit</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="home.aspx">Home</a>
                </li>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">SPI</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="registernew.aspx">Register Part</a>
                        </li>
                        <li>
                            <a href="catalog.aspx">Catalog</a>
                        </li>
                        <li>
                            <a href="spi_databasepart.aspx">Database Part</a>
                        </li>
                        <li>
                            <a href="dailyissuedpart.aspx">Daily Issued Part</a>
                        </li>
                        <li>
                            <a href="sparepartorder.aspx">Order Part</a>
                        </li>
                        <li>
                            <a href="comingpart.aspx">Coming Part</a>
                        </li>
                        <li>
                            <a href="listprintlabel.aspx">List Print Label</a>
                        </li>
                        <li>
                            <a href="closedactivity.aspx">Closed Activity</a>
                        </li>
                        <li id="menuModifHistory">
                            <a href="modification_history.aspx">Modification History</a>
                        </li>
                    </ul>
                </li>
                <%--      <li>
                    <a href="#mdpSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">MDP</a>
                    <ul class="collapse list-unstyled" id="mdpSubmenu">
                        <li>
                            <a href="mdp_database.aspx">MDP Database</a>
                        </li>
                        <li>
                            <a href="mongoDB.aspx">MDP Loan</a>
                        </li>

                    </ul>
                </li>--%>
                <li class="active">
                    <a href="#ExpensesSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Expenses</a>
                    <ul class="collapse list-unstyled" id="ExpensesSubmenu">
                        <li>
                            <a href="expenses.aspx">Pre Expenses</a>
                        </li>
                        <li>
                            <a href="expenseslist.aspx">Expenses</a>
                        </li>
                        <li>
                            <a href="expenseslist_uncounting.aspx">Expenses (Uncounting)</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="qcreminder_insertnew.aspx">QC Check Reminder</a>
                </li>
                <li>
                    <a href="informationitem.aspx">Contactor</a>
                </li>
            </ul>
            <ul class="list-unstyled CTAs">
                <li>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Expenses</h5>
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
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row">
                        <div class="col-lg-6 ml-auto">
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

                    <div class="row">
                        <div class="col-12">

                            <div class="row mt-3">
                                <div class="col-2">
                                    <asp:Label ID="lblDateFrom" runat="server" Text="Date From:" style="font-size:.8rem;"></asp:Label>
                                    <asp:TextBox ID="txtDateFrom" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-2">
                                    <asp:Label ID="lblDateTo" runat="server" Text="Date To:" style="font-size:.8rem;"></asp:Label>
                                    <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-2">
                                    <asp:Label ID="lblType" runat="server" Text="Type:" style="font-size:.8rem;"></asp:Label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="LOCAL">LOCAL</asp:ListItem>
                                        <asp:ListItem Value="OVERSEA">OVERSEA</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                                <div class="col-2 d-inline-flex align-items-center">
                                    

                                    <asp:Button ID="btnExport" runat="server" Text="Export to Excel" style="margin-top:22px;" CssClass="btn btn-success" OnClick="btnExport_Click" />
                                </div>
                            </div>

                        </div>
                    </div>



                    <div class="line"></div>
                    <div class="row">
                        <div class="col-12">
                            <label style="margin-top: 0px; font-size: 1.5rem;" class="mb-3">List Expenses Data</label>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <%--<li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">New Data</a>
                                </li>--%>
                                <li class="nav-item">
                                    <a class="nav-link active" id="local-tab" data-toggle="tab" href="#local" role="tab" aria-controls="local" aria-selected="false">Local</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="oversea-tab" data-toggle="tab" href="#oversea" role="tab" aria-controls="oversea" aria-selected="false">Oversea</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="cancel-tab" data-toggle="tab" href="#cancel" role="tab" aria-controls="cancel" aria-selected="false">Cancel</a>
                                </li>
                                <%--<li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Progress</a>
                                </li>--%>

                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Coming</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <%--local table--%>
                                <div class="tab-pane fade show active" id="local" role="tabpanel" aria-labelledby="local-tab">
                                    <div class="row mt-3"></div>
                                    <div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
                                        <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Arial; cursor: pointer;" id="tblNew">
                                            <thead style="background-color: #2A476B; color: white; text-align: left; font-family: Arial; font-size: 11px;">
                                                <tr>
                                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">EXPENSES ID</th>
                                                    <th scope="col" style="vertical-align: middle; width: 1000px; padding: 0">PART NAME</th>
                                                    <th scope="col" style="vertical-align: middle;">PART CODE</th>
                                                    <th scope="col" style="vertical-align: middle;">MAKER</th>
                                                    <th scope="col" style="vertical-align: middle;">VENDOR</th>
                                                    <th scope="col" style="vertical-align: middle; text-align: right;">QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">UNIT</th>
                                                    <th scope="col" style="vertical-align: middle;">ORDER DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">CURRENCY</th>
                                                    <th scope="col" style="vertical-align: middle;">PRICE</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT (USD)</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">BALANCE</th>
                                                    <th scope="col" style="vertical-align: middle;">QUOTATION NO</th>
                                                    <%--SAMPE SINI--%>
                                                    <th scope="col" style="vertical-align: middle;">LEAD TIME</th>
                                                    <th scope="col" style="vertical-align: middle;">PR NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PR DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">PO NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PO DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">COST CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">PROFIT CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">CATEGORY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE/REMARK</th>
                                                    <th scope="col" style="vertical-align: middle;">TARGET</th>
                                                    <th scope="col" style="vertical-align: middle;">MONTH</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL DATE REMAINING</th>
                                                    <th scope="col" style="vertical-align: middle;">RANGE RECEIVE</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL MONTHLY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS MONTHLY</th>

                                                    <%--<th scope="col" style="vertical-align: middle;">Status</th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%--oversea table--%>
                                <div class="tab-pane fade" id="oversea" role="tabpanel" aria-labelledby="local-tab">
                                    <div class="row mt-3"></div>
                                    <div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
                                        <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Arial; cursor: pointer;" id="tblNewOversea">
                                            <thead style="background-color: #2A476B; color: white; text-align: left; font-family: Arial; font-size: 11px;">
                                                <tr>
                                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">EXPENSES ID</th>
                                                    <th scope="col" style="vertical-align: middle; width: 1000px; padding: 0">PART NAME</th>
                                                    <th scope="col" style="vertical-align: middle;">PART CODE</th>
                                                    <th scope="col" style="vertical-align: middle;">MAKER</th>
                                                    <th scope="col" style="vertical-align: middle;">VENDOR</th>
                                                    <th scope="col" style="vertical-align: middle; text-align: right;">QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">UNIT</th>
                                                    <th scope="col" style="vertical-align: middle;">ORDER DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">CURRENCY</th>
                                                    <th scope="col" style="vertical-align: middle;">PRICE</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT (USD)</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">BALANCE</th>
                                                    <th scope="col" style="vertical-align: middle;">QUOTATION NO</th>
                                                    <%--SAMPE SINI--%>
                                                    <th scope="col" style="vertical-align: middle;">LEAD TIME</th>
                                                    <th scope="col" style="vertical-align: middle;">PR NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PR DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">PO NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PO DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">COST CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">PROFIT CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">CATEGORY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE/REMARK</th>
                                                    <th scope="col" style="vertical-align: middle;">TARGET</th>
                                                    <th scope="col" style="vertical-align: middle;">MONTH</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL DATE REMAINING</th>
                                                    <th scope="col" style="vertical-align: middle;">RANGE RECEIVE</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL MONTHLY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS MONTHLY</th>

                                                    <%--<th scope="col" style="vertical-align: middle;">Status</th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%--cancel table--%>
                                <div class="tab-pane fade" id="cancel" role="tabpanel" aria-labelledby="local-tab">
                                    <div class="row mt-3"></div>
                                    <div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
                                        <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Arial; cursor: pointer;" id="tblCancel">
                                            <thead style="background-color: #2A476B; color: white; text-align: left; font-family: Arial; font-size: 11px;">
                                                <tr>
                                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">EXPENSES ID</th>
                                                    <th scope="col" style="vertical-align: middle; width: 1000px; padding: 0">PART NAME</th>
                                                    <th scope="col" style="vertical-align: middle;">PART CODE</th>
                                                    <th scope="col" style="vertical-align: middle;">MAKER</th>
                                                    <th scope="col" style="vertical-align: middle;">VENDOR</th>
                                                    <th scope="col" style="vertical-align: middle; text-align: right;">QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">UNIT</th>
                                                    <th scope="col" style="vertical-align: middle;">ORDER DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">CURRENCY</th>
                                                    <th scope="col" style="vertical-align: middle;">PRICE</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT (USD)</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">BALANCE</th>
                                                    <th scope="col" style="vertical-align: middle;">QUOTATION NO</th>
                                                    <%--SAMPE SINI--%>
                                                    <th scope="col" style="vertical-align: middle;">LEAD TIME</th>
                                                    <th scope="col" style="vertical-align: middle;">PR NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PR DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">PO NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PO DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">COST CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">PROFIT CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">CATEGORY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE/REMARK</th>
                                                    <th scope="col" style="vertical-align: middle;">TARGET</th>
                                                    <th scope="col" style="vertical-align: middle;">MONTH</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL DATE REMAINING</th>
                                                    <th scope="col" style="vertical-align: middle;">RANGE RECEIVE</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL MONTHLY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS MONTHLY</th>

                                                    <%--<th scope="col" style="vertical-align: middle;">Status</th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                    <div class="row mt-3"></div>
                                    <div class="scrolling-wrapper row flex-row flex-nowrap mt-4 pb-4 pt-2">
                                        <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Arial; cursor: pointer;" id="tblComing">
                                            <thead style="background-color: #2A476B; color: white; text-align: left; font-family: Arial; font-size: 11px;">
                                                <tr>
                                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">EXPENSES ID</th>
                                                    <th scope="col" style="vertical-align: middle; width: 1000px; padding: 0">PART NAME</th>
                                                    <th scope="col" style="vertical-align: middle;">PART CODE</th>
                                                    <th scope="col" style="vertical-align: middle;">MAKER</th>
                                                    <th scope="col" style="vertical-align: middle;">VENDOR</th>
                                                    <th scope="col" style="vertical-align: middle; text-align: right;">QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">UNIT</th>
                                                    <th scope="col" style="vertical-align: middle;">ORDER DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">CURRENCY</th>
                                                    <th scope="col" style="vertical-align: middle;">PRICE</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT</th>
                                                    <th scope="col" style="vertical-align: middle;">AMOUNT (USD)</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">RECEIVED QTY</th>
                                                    <th scope="col" style="vertical-align: middle;">BALANCE</th>
                                                    <th scope="col" style="vertical-align: middle;">QUOTATION NO</th>
                                                    <%--SAMPE SINI--%>
                                                    <th scope="col" style="vertical-align: middle;">LEAD TIME</th>
                                                    <th scope="col" style="vertical-align: middle;">PR NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PR DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">PO NO</th>
                                                    <th scope="col" style="vertical-align: middle;">PO DATE</th>
                                                    <th scope="col" style="vertical-align: middle;">COST CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">PROFIT CENTER</th>
                                                    <th scope="col" style="vertical-align: middle;">CATEGORY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                                    <th scope="col" style="vertical-align: middle;">PURPOSE/REMARK</th>
                                                    <th scope="col" style="vertical-align: middle;">TARGET</th>
                                                    <th scope="col" style="vertical-align: middle;">MONTH</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL DATE REMAINING</th>
                                                    <th scope="col" style="vertical-align: middle;">RANGE RECEIVE</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS</th>
                                                    <th scope="col" style="vertical-align: middle;">CONTROL MONTHLY</th>
                                                    <th scope="col" style="vertical-align: middle;">STATUS MONTHLY</th>

                                                    <%--<th scope="col" style="vertical-align: middle;">Status</th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="loadingImg" style="display: none;" class="m-auto mt-9">
                            <img src="images/load.gif" height="120" width="240" />
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="myModalPO">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">QUOTATION NUMBER CONFIRMATION FORM</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <%--style="background-color: #afe2ff"--%>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">EXPENSES ID</label>
                                            <%--                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOnebyOne" runat="server" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>--%>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <%--<label class="lblModal">Goods Name</label>--%>
                                            <asp:TextBox CssClass="form-control" ID="txtExpensesID" Enabled="false" runat="server" Width="30%"></asp:TextBox>
                                            <input type="hidden" id="hdExpensesID" name="exp_ID" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">PART NAME</label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <asp:TextBox CssClass="form-control" ID="txtPartName" Enabled="true" runat="server" Width="85%"></asp:TextBox>
                                            <input type="hidden" id="hdPartName" name="partName" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">PART CODE / DRAWING NO</label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <asp:TextBox CssClass="form-control" ID="txtPartCode" Enabled="true" runat="server" Width="85%"></asp:TextBox>
                                            <input type="hidden" id="hdPartCode" name="partcode" runat="server" />
                                        </div>
                                    </div>
                                    <hr />
                                    <%--<div class="row mt-4">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xl-">
                                            <label class="lblModal">Maker</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <asp:TextBox CssClass="form-control" ID="txtMaker" runat="server" Width="100%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xl-">
                                            <label class="lblModal">Vendor</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <asp:TextBox CssClass="form-control" ID="txtVendor" runat="server" Width="100%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>--%>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">MAKER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtMaker" Enabled="true" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xl-8">
                                            <div class="col-lg-2">
                                                <label class="lblModal">VENDOR</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtVendor" Enabled="true" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">QTY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" TextMode="Number" OnTextChanged="txtQty_TextChanged" ID="txtQty" Enabled="true" AutoPostBack="true" runat="server" Width="65%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">UNIT</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlUnit" Enabled="true" CssClass="form-control" Width="75%">
                                                    <asp:ListItem>Pcs</asp:ListItem>
                                                    <asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>
                                                    <asp:ListItem>Set</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">ORDER DATE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtOrderDate" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">Currency :</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="lblModal">SGD</label>
                                                <label class="lblModal" id="lblSGD" runat="server"></label>
                                                <label class="lblModal">|   JPY</label>
                                                <label class="lblModal" id="lblJPY" runat="server"></label>
                                                <label class="lblModal">|   IDR</label>
                                                <label class="lblModal" id="lblIDR" runat="server"></label>
                                            </div>

                                        </div>
                                        <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">Unit</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-2">
                                                <label class="lblModal">CURRENCY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged" CssClass="form-control" Enabled="true" Width="75%">
                                                    <asp:ListItem>USD</asp:ListItem>
                                                    <asp:ListItem>SGD</asp:ListItem>
                                                    <asp:ListItem>JPY</asp:ListItem>
                                                    <asp:ListItem>IDR</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-6">
                                                <label class="lblModal">UNIT PRICE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtUnitPrice" Text="0" OnTextChanged="txtUnitPrice_TextChanged" TextMode="Number" AutoPostBack="true" Enabled="true" runat="server" Width="70%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-2">
                                                <label class="lblModal">AMOUNT</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:UpdatePanel runat="server" ID="ggfg">
                                                    <ContentTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtAmount" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="hdAmount" />
                                                        <asp:HiddenField runat="server" ID="hdAmountUSD" />
                                                        <asp:HiddenField runat="server" ID="hdUnitPrice" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtQty" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="txtUnitPrice" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />

                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-6">
                                                <label class="lblModal">AMOUNT (USD)</label>
                                            </div>

                                            <div class="col-lg-12">

                                                <asp:UpdatePanel runat="server" ID="dsdf">
                                                    <ContentTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtAmountUSD" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="hdnSGD" />
                                                        <asp:HiddenField runat="server" ID="hdnJPY" />
                                                        <asp:HiddenField runat="server" ID="hdnIDR" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtQty" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="txtUnitPrice" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />

                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                            <div class="col-lg-2">
                                                <label class="lblModal">REMARK</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtRemarks" Enabled="true" runat="server" Width="100%" TextMode="MultiLine" Height="80px" Rows="15"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">COST CENTER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCostCenter" Enabled="true" Width="75%">
                                                    <asp:ListItem>410VIKM005</asp:ListItem>
                                                    <%--<asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PROFIT CENTER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlProfitCenters" Enabled="true" Width="75%">
                                                    <asp:ListItem>410VK1</asp:ListItem>
                                                    <%--<asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">CATEGORY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" Enabled="true" Width="75%">
                                                    <asp:ListItem>Book & Data Prcs</asp:ListItem>
                                                    <asp:ListItem>Educ & Training Exp</asp:ListItem>
                                                    <asp:ListItem>OS (Comp Access)</asp:ListItem>
                                                    <asp:ListItem>OS (Computer) </asp:ListItem>
                                                    <asp:ListItem>OS (Furniture)</asp:ListItem>
                                                    <asp:ListItem>OS (Oth)</asp:ListItem>
                                                    <asp:ListItem>OS (Printer)</asp:ListItem>
                                                    <asp:ListItem>OS (Software)</asp:ListItem>
                                                    <asp:ListItem>OS (Stationery)</asp:ListItem>
                                                    <asp:ListItem>Prof Fee (Ext)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Bld)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(HW-Serv)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(P&M)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Serv-P&M)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Serv-T/F/F)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Software) </asp:ListItem>
                                                    <asp:ListItem>R&M Exp(T/F/F)</asp:ListItem>
                                                    <asp:ListItem>TC-PURCH (Oth)-Fix</asp:ListItem>
                                                    <asp:ListItem>Misc. Exp (Oth)</asp:ListItem>
                                                    <%--<asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">PIC ORDER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtPICOrder" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PURPOSE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlPurpose" Enabled="true" Width="75%">
                                                    <asp:ListItem>ACTIVITY</asp:ListItem>
                                                    <asp:ListItem>SPAREPART</asp:ListItem>
                                                    <%--<asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">MODEL</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlModelExpenses" CssClass="form-control" Enabled="true" Width="75%">
                                                    <asp:ListItem>AUTOPACK</asp:ListItem>
                                                    <asp:ListItem>BAIKAL</asp:ListItem>
                                                    <asp:ListItem>CARTONER</asp:ListItem>
                                                    <asp:ListItem>CISS</asp:ListItem>
                                                    <asp:ListItem>COMMON</asp:ListItem>
                                                    <asp:ListItem>COSTNER/SAROMA</asp:ListItem>
                                                    <asp:ListItem>FOAM SUPPORT</asp:ListItem>
                                                    <asp:ListItem>GAGA</asp:ListItem>
                                                    <asp:ListItem>HAV CRAIG</asp:ListItem>
                                                    <asp:ListItem>HAV3D</asp:ListItem>
                                                    <asp:ListItem>HAV3P</asp:ListItem>
                                                    <asp:ListItem>INK BLENDING</asp:ListItem>
                                                    <asp:ListItem>KUZURYU</asp:ListItem>
                                                    <asp:ListItem>LEGGERO</asp:ListItem>
                                                    <asp:ListItem>LFP</asp:ListItem>
                                                    <asp:ListItem>NASUNO</asp:ListItem>
                                                    <asp:ListItem>NASUNO 3</asp:ListItem>
                                                    <asp:ListItem>NEYMAR</asp:ListItem>
                                                    <asp:ListItem>OTHERS</asp:ListItem>
                                                    <asp:ListItem>SAKURA</asp:ListItem>
                                                    <asp:ListItem>SEALING</asp:ListItem>
                                                    <asp:ListItem>SPI</asp:ListItem>
                                                    <asp:ListItem>SUB</asp:ListItem>
                                                    <asp:ListItem>TANIGAWA</asp:ListItem>
                                                    <asp:ListItem>301</asp:ListItem>
                                                    <asp:ListItem>TAKASE</asp:ListItem>
                                                    <asp:ListItem>SEAL CAP</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">QUOTATION NUMBER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtQuotNo" runat="server" Width="90%"></asp:TextBox>
                                                <asp:HiddenField runat="server" ID="hdQuotNo" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">LEAD TIME</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="true" TextMode="Number" ID="txtLeadTime" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <%--<label class="lblModal">LEAD TIME</label>--%>
                                            </div>
                                            <div class="col-lg-12">
                                                <%--<asp:TextBox CssClass="form-control" Enabled="true" ID="TextBox9" runat="server" Width="90%"></asp:TextBox>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">PR NO</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtPRNo" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PR Date</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtPRDate" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <%--<label class="lblModal">LEAD TIME</label>--%>
                                            </div>
                                            <div class="col-lg-12">
                                                <%--<asp:TextBox CssClass="form-control" Enabled="true" ID="TextBox9" runat="server" Width="90%"></asp:TextBox>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">PO NO</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtPONo" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PO Date</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtPODate" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">TARGET</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtTarget" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <asp:LinkButton ID="LinkButton3" Text="Cancel Order" OnClientClick="return ConfirmCancel();" OnClick="LinkButton3_Click" CssClass="btn btn-outline-dark text-center" runat="server"></asp:LinkButton>
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close Form</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <asp:LinkButton ID="btnSave" OnClientClick="return cekKosong();" OnClick="btnSave_Click" Text="Update Order" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>

                            </div>

                        </div>
                    </div>
                </div>



                <div class="modal fade" id="myComingCancel">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">FORM CANCEL ORDER</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <%--style="background-color: #afe2ff"--%>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">EXPENSES ID</label>
                                            <%--                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOnebyOne" runat="server" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>--%>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <%--<label class="lblModal">Goods Name</label>--%>
                                            <asp:TextBox CssClass="form-control" ID="txtExpID_ComingCancel" Enabled="false" runat="server" Width="30%"></asp:TextBox>
                                            <input type="hidden" id="hdExpID_ComingCancel" name="exp_ID" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">PART NAME</label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <asp:TextBox CssClass="form-control" ID="txtPartName_ComingCancel" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                            <input type="hidden" id="hdPartName_ComingCancel" name="partName" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                            <label class="lblModal">PART CODE / DRAWING NO</label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                            <asp:TextBox CssClass="form-control" ID="txtPartCode_ComingCancel" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                            <input type="hidden" id="hdPartCode_ComingCancel" name="partcode" runat="server" />
                                        </div>
                                    </div>
                                    <hr />
                                    <%--<div class="row mt-4">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xl-">
                                            <label class="lblModal">Maker</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <asp:TextBox CssClass="form-control" ID="txtMaker" runat="server" Width="100%" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xl-">
                                            <label class="lblModal">Vendor</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <asp:TextBox CssClass="form-control" ID="txtVendor" runat="server" Width="100%" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>--%>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">MAKER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtMaker_ComingCancel" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xl-8">
                                            <div class="col-lg-2">
                                                <label class="lblModal">VENDOR</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtVendor_ComingCancel" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">QTY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" TextMode="Number" ID="txtQty_ComingCancel" Enabled="false" AutoPostBack="false" runat="server" Width="65%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">UNIT</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlUnit_ComingCancel" Enabled="false" CssClass="form-control" Width="75%">
                                                    <asp:ListItem>Pcs</asp:ListItem>
                                                    <asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>
                                                    <asp:ListItem>Set</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">ORDER DATE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtOrderDate_ComingCancel" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">Currency :</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="lblModal">SGD</label>
                                                <label class="lblModal" id="Label1" runat="server"></label>
                                                <label class="lblModal">|   JPY</label>
                                                <label class="lblModal" id="Label2" runat="server"></label>
                                                <label class="lblModal">|   IDR</label>
                                                <label class="lblModal" id="Label3" runat="server"></label>
                                            </div>

                                        </div>
                                        <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">Unit</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-2">
                                                <label class="lblModal">CURRENCY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlCurrency_ComingCancel" AutoPostBack="false" CssClass="form-control" Enabled="false" Width="75%">
                                                    <asp:ListItem>USD</asp:ListItem>
                                                    <asp:ListItem>SGD</asp:ListItem>
                                                    <asp:ListItem>JPY</asp:ListItem>
                                                    <asp:ListItem>IDR</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-6">
                                                <label class="lblModal">UNIT PRICE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtUnitPrice_ComingCancel" Text="0" TextMode="Number" AutoPostBack="false" Enabled="false" runat="server" Width="70%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-2">
                                                <label class="lblModal">AMOUNT</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                    <ContentTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtAmount_ComingCancel" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="HiddenField1" />
                                                        <asp:HiddenField runat="server" ID="HiddenField2" />
                                                        <asp:HiddenField runat="server" ID="HiddenField3" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtQty" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="txtUnitPrice" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />

                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                            <div class="col-lg-6">
                                                <label class="lblModal">AMOUNT (USD)</label>
                                            </div>

                                            <div class="col-lg-12">

                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                    <ContentTemplate>
                                                        <asp:TextBox CssClass="form-control" ID="txtAmountUSD_ComingCancel" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                        <asp:HiddenField runat="server" ID="HiddenField4" />
                                                        <asp:HiddenField runat="server" ID="HiddenField5" />
                                                        <asp:HiddenField runat="server" ID="HiddenField6" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtQty" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="txtUnitPrice" EventName="TextChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />

                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                            <div class="col-lg-2">
                                                <label class="lblModal">REMARK</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtRemark_ComingCancel" Enabled="false" runat="server" Width="100%" TextMode="MultiLine" Height="80px" Rows="15"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">COST CENTER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCostCenter_ComingCancel" Enabled="false" Width="75%">
                                                    <asp:ListItem>410VIKM005</asp:ListItem>
                                                    <%--<asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PROFIT CENTER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlProfitCenter" Enabled="false" Width="75%">
                                                    <asp:ListItem>410VK1</asp:ListItem>
                                                    <%--<asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">CATEGORY</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCategory_ComingCancel" Enabled="false" Width="75%">
                                                    <asp:ListItem>Book & Data Prcs</asp:ListItem>
                                                    <asp:ListItem>Educ & Training Exp</asp:ListItem>
                                                    <asp:ListItem>OS (Comp Access)</asp:ListItem>
                                                    <asp:ListItem>OS (Computer) </asp:ListItem>
                                                    <asp:ListItem>OS (Furniture)</asp:ListItem>
                                                    <asp:ListItem>OS (Oth)</asp:ListItem>
                                                    <asp:ListItem>OS (Printer)</asp:ListItem>
                                                    <asp:ListItem>OS (Software)</asp:ListItem>
                                                    <asp:ListItem>OS (Stationery)</asp:ListItem>
                                                    <asp:ListItem>Prof Fee (Ext)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Bld)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(HW-Serv)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(P&M)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Serv-P&M)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Serv-T/F/F)</asp:ListItem>
                                                    <asp:ListItem>R&M Exp(Software) </asp:ListItem>
                                                    <asp:ListItem>R&M Exp(T/F/F)</asp:ListItem>
                                                    <asp:ListItem>TC-PURCH (Oth)-Fix</asp:ListItem>
                                                    <asp:ListItem>Misc. Exp (Oth)</asp:ListItem>
                                                    <%--<asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-4">
                                                <label class="lblModal">PIC ORDER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtPICorder_ComingCancel" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PURPOSE</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlPurpose_ComingCancel" Enabled="false" Width="75%">
                                                    <asp:ListItem>ACTIVITY</asp:ListItem>
                                                    <asp:ListItem>SPAREPART</asp:ListItem>
                                                    <%--<asp:ListItem>Item</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-2">
                                                <label class="lblModal">MODEL</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:DropDownList runat="server" ID="ddlModel_ComingCancel" CssClass="form-control" Enabled="false" Width="75%">
                                                    <asp:ListItem>AUTOPACK</asp:ListItem>
                                                    <asp:ListItem>BAIKAL</asp:ListItem>
                                                    <asp:ListItem>CARTONER</asp:ListItem>
                                                    <asp:ListItem>CISS</asp:ListItem>
                                                    <asp:ListItem>COMMON</asp:ListItem>
                                                    <asp:ListItem>COSTNER/SAROMA</asp:ListItem>
                                                    <asp:ListItem>FOAM SUPPORT</asp:ListItem>
                                                    <asp:ListItem>GAGA</asp:ListItem>
                                                    <asp:ListItem>HAV CRAIG</asp:ListItem>
                                                    <asp:ListItem>HAV3D</asp:ListItem>
                                                    <asp:ListItem>HAV3P</asp:ListItem>
                                                    <asp:ListItem>INK BLENDING</asp:ListItem>
                                                    <asp:ListItem>KUZURYU</asp:ListItem>
                                                    <asp:ListItem>LEGGERO</asp:ListItem>
                                                    <asp:ListItem>LFP</asp:ListItem>
                                                    <asp:ListItem>NASUNO</asp:ListItem>
                                                    <asp:ListItem>NASUNO 3</asp:ListItem>
                                                    <asp:ListItem>NEYMAR</asp:ListItem>
                                                    <asp:ListItem>OTHERS</asp:ListItem>
                                                    <asp:ListItem>SAKURA</asp:ListItem>
                                                    <asp:ListItem>SEALING</asp:ListItem>
                                                    <asp:ListItem>SPI</asp:ListItem>
                                                    <asp:ListItem>SUB</asp:ListItem>
                                                    <asp:ListItem>TANIGAWA</asp:ListItem>
                                                    <asp:ListItem>301</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">QUOTATION NUMBER</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" ID="txtQuotationNumber_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                                <asp:HiddenField runat="server" ID="HiddenField7" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">LEAD TIME</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" TextMode="Number" ID="txtLeadTime_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <%--<label class="lblModal">LEAD TIME</label>--%>
                                            </div>
                                            <div class="col-lg-12">
                                                <%--<asp:TextBox CssClass="form-control" Enabled="true" ID="TextBox9" runat="server" Width="90%"></asp:TextBox>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">PR NO</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" ID="txtPRno_ComingCancel" Enabled="false" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PR Date</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" ID="txtPRdate_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <%--<label class="lblModal">LEAD TIME</label>--%>
                                            </div>
                                            <div class="col-lg-12">
                                                <%--<asp:TextBox CssClass="form-control" Enabled="true" ID="TextBox9" runat="server" Width="90%"></asp:TextBox>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-8">
                                                <label class="lblModal">PO NO</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" ID="txtPOno_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">PO Date</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" ID="txtPOdate_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            <div class="col-lg-6">
                                                <label class="lblModal">TARGET</label>
                                            </div>
                                            <div class="col-lg-12">
                                                <asp:TextBox CssClass="form-control" Enabled="false" ID="txtTarget_ComingCancel" runat="server" Width="90%"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnCancelOrder_ComingCancel" Text="Cancel Order" OnClientClick="return ConfirmCancel_ComingCancel();" OnClick="btnCancelOrder_ComingCancel_Click" CssClass="btn btn-outline-dark text-center" runat="server"></asp:LinkButton>
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close Form</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <%--<asp:LinkButton ID="LinkButton5" OnClientClick="return cekKosong();" OnClick="btnSave_Click" Text="Update Order" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>--%>
                            </div>

                        </div>
                    </div>
                </div>



                <div class="modal fade" id="myModalProgress">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">PO CONFIRMATION FORM</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <asp:LinkButton ID="LinkButton1" Text="Save" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>

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
                                            <label class="lblModal" style="font-size: .8rem">JPY</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtJPY"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">IDR</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtIDR"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="lblModal" style="font-size: .8rem">SGD</label>
                                            <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" ID="txtSGD"></asp:TextBox>
                                        </div>


                                    </div>
                                </div>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" Text="Update" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>

                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>



    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var role = sessionStorage.getItem("role");
            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                window.location.href = "Default.aspx";

            }
            else if (role !== "ADMIN") {
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Anda akan diarahkan kembali ke halaman home.',
                }).then((result) => {
                    window.location.href = "home.aspx";
                });

                // ... tambahkan menu lain yang diizinkan untuk STAFF
            }

            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";


            var btnSave = document.getElementById('<%= btnSave.ClientID %>').value;
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });

            $('#loadingImg').show();
            $.ajax({
                url: "/expenseslist.aspx/getAllNewExpenses",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblNew tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._currency + '</td><td>' + item._price + '</td><td>' + item._amount + '</td><td>' + item._amountUSD + '</td><td>' + item._receivedDate + '</td><td>' + item._receivedQty + '</td><td>' + item._balance + '</td><td>' + item._quotationNo + '</td><td>' + item._leadTime + '</td><td>' + item._PRno + '</td><td>' + item._PRdate + '</td><td>' + item._POno + '</td><td>' + item._POdate + '</td><td>' + item._costCenter + '</td><td>' + item._profitCenter + '</td><td>' + item._category + '</td><td>' + item._status + '</td><td>' + item._PIC + '</td><td>' + item._purpose + '</td><td>' + item._ordertoModel + '</td><td>' + item._purposeRemark + '</td><td>' + item._target + '</td><td>' + item._month + '</td><td>' + item._controlDateRemaining + '</td><td>' + item._rangeReceive + '</td><td>' + item._status + '</td><td>' + item._controlMonthly + '</td><td>' + item._statusMonthly + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tblNew').dataTable({
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

            $.ajax({
                url: "/expenseslist.aspx/getAllNewExpenses_Oversea",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblNewOversea tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._currency + '</td><td>' + item._price + '</td><td>' + item._amount + '</td><td>' + item._amountUSD + '</td><td>' + item._receivedDate + '</td><td>' + item._receivedQty + '</td><td>' + item._balance + '</td><td>' + item._quotationNo + '</td><td>' + item._leadTime + '</td><td>' + item._PRno + '</td><td>' + item._PRdate + '</td><td>' + item._POno + '</td><td>' + item._POdate + '</td><td>' + item._costCenter + '</td><td>' + item._profitCenter + '</td><td>' + item._category + '</td><td>' + item._status + '</td><td>' + item._PIC + '</td><td>' + item._purpose + '</td><td>' + item._ordertoModel + '</td><td>' + item._purposeRemark + '</td><td>' + item._target + '</td><td>' + item._month + '</td><td>' + item._controlDateRemaining + '</td><td>' + item._rangeReceive + '</td><td>' + item._status + '</td><td>' + item._controlMonthly + '</td><td>' + item._statusMonthly + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tblNewOversea').dataTable({
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

            $.ajax({
                url: "/expenseslist.aspx/getAllNewExpenses_Cancel",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblCancel tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._currency + '</td><td>' + item._price + '</td><td>' + item._amount + '</td><td>' + item._amountUSD + '</td><td>' + item._receivedDate + '</td><td>' + item._receivedQty + '</td><td>' + item._balance + '</td><td>' + item._quotationNo + '</td><td>' + item._leadTime + '</td><td>' + item._PRno + '</td><td>' + item._PRdate + '</td><td>' + item._POno + '</td><td>' + item._POdate + '</td><td>' + item._costCenter + '</td><td>' + item._profitCenter + '</td><td>' + item._category + '</td><td>' + item._status + '</td><td>' + item._PIC + '</td><td>' + item._purpose + '</td><td>' + item._ordertoModel + '</td><td>' + item._purposeRemark + '</td><td>' + item._target + '</td><td>' + item._month + '</td><td>' + item._controlDateRemaining + '</td><td>' + item._rangeReceive + '</td><td>' + item._status + '</td><td>' + item._controlMonthly + '</td><td>' + item._statusMonthly + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tblCancel').dataTable({
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

            $.ajax({
                url: "/expenseslist.aspx/getAllNewExpenses_Coming",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblComing tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._currency + '</td><td>' + item._price + '</td><td>' + item._amount + '</td><td>' + item._amountUSD + '</td><td>' + item._receivedDate + '</td><td>' + item._receivedQty + '</td><td>' + item._balance + '</td><td>' + item._quotationNo + '</td><td>' + item._leadTime + '</td><td>' + item._PRno + '</td><td>' + item._PRdate + '</td><td>' + item._POno + '</td><td>' + item._POdate + '</td><td>' + item._costCenter + '</td><td>' + item._profitCenter + '</td><td>' + item._category + '</td><td>' + item._status + '</td><td>' + item._PIC + '</td><td>' + item._purpose + '</td><td>' + item._ordertoModel + '</td><td>' + item._purposeRemark + '</td><td>' + item._target + '</td><td>' + item._month + '</td><td>' + item._controlDateRemaining + '</td><td>' + item._rangeReceive + '</td><td>' + item._status + '</td><td>' + item._controlMonthly + '</td><td>' + item._statusMonthly + '</td></tr>');
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

            $.ajax({
                url: "/expenseslist.aspx/getAllExpensesQuotationNumber",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblProgress tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._expensesID + '</td><td>' + item._descriptionName + '</td><td>' + item._partCode + '</td><td>' + item._maker + '</td><td>' + item._suppName + '</td><td style=text-align:right;>' + item._orderQty + '</td><td>' + item._unit + '</td><td>' + item._orderDate + '</td><td>' + item._ordertoModel + '</td><td style=background-color:#FFFD98>' + item._quotNo + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tblProgress').dataTable({
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

                        var hdSGD2 = document.getElementById("<%=lblSGD.ClientID%>");
                        var hdJPY = document.getElementById("<%=lblJPY.ClientID%>");
                        var hdIDR = document.getElementById("<%=lblIDR.ClientID%>");

                        var hiddensgd = document.getElementById("<%=hdnSGD.ClientID%>");
                        var hiddenidr = document.getElementById("<%=hdnIDR.ClientID%>");
                        var hiddenjpy = document.getElementById("<%=hdnJPY.ClientID%>");



                        hdSGD2.innerText = b;
                        hdJPY.innerText = a;
                        hdIDR.innerText = c;
                        hiddensgd.value = b;
                        hiddenjpy.value = a;
                        hiddenidr.value = c;
                        console.log(hdSGD);
                        console.log(hdSGD2);
                    });


                    //$('#tblProgress').dataTable({
                    //    deferRender: true,
                    //    "order": [[0, 'desc']],
                    //});
                },
                complete: function () {
                    $('#loadingImg').hide();
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

            var quotNo = document.getElementById('<%= txtQuotNo.ClientID %>').value;
            var amount = document.getElementById('<%= txtQuotNo.ClientID %>').value;
            var amountUSD = document.getElementById('<%= txtQuotNo.ClientID %>').value;
            var unitPrice = document.getElementById('<%= txtUnitPrice.ClientID %>').value;


            if (unitPrice == "") {
                alert("Data Unit Price tidak boleh kosong.");
                return false;
            } else {

            }
            document.forms[0].appendChild(confirm_value);

        }


        $('#tblNew').on('click', 'tr', function () {
            btnSave.removeAttribute("disabled");
            <%=txtQuotNo.Text=string.Empty%>
            var getExpID = $('td', this).eq(0).text();
            var getPartName = $('td', this).eq(1).text();
            var getPartCode = $('td', this).eq(2).text();
            var getMaker = $('td', this).eq(3).text();
            var getVendor = $('td', this).eq(4).text();
            var getQty = $('td', this).eq(5).text();
            var getOrderDate = $('td', this).eq(7).text();
            var getPICOrder = $('td', this).eq(25).text();
            var getModel = $('td', this).eq(27).text();
            var getPurpose = $('td', this).eq(23).text();
            var getUnit = $('td', this).eq(6).text();
            var getQuotNo = $('td', this).eq(15).text();
            var getPrice = $('td', this).eq(9).text();
            var getAmount = $('td', this).eq(10).text();
            var getAmountUSD = $('td', this).eq(11).text();
            var getCurrency = $('td', this).eq(8).text();
            var getLeadTime = $('td', this).eq(16).text();
            var getPurpose = $('td', this).eq(23).text();
            var getPRno = $('td', this).eq(17).text();
            var getPOno = $('td', this).eq(19).text();
            getExpID = getExpID.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');
            //getPurpose = getPurpose.replace(/\s/g, '');
            getUnit = getUnit.replace(/\s/g, '');
            getQuotNo = getQuotNo.replace(/\s/g, '');
            getPrice = getPrice.replace(/\s/g, '');
            //getPrice = getPrice.replace(/\s/g, '');
            $('#myModalPO').modal("show");
            var setExpID = document.getElementById("<%=hdExpensesID.ClientID%>");
            var expID = document.getElementById("<%=txtExpensesID.ClientID%>");
            var partName = document.getElementById("<%=txtPartName.ClientID%>");
            var partName2 = document.getElementById("<%=hdPartName.ClientID%>");
            var partCode = document.getElementById("<%=txtPartCode.ClientID%>");
            var partCode2 = document.getElementById("<%=hdPartCode.ClientID%>");
            var maker = document.getElementById("<%=txtMaker.ClientID%>");
            var vendor = document.getElementById("<%=txtVendor.ClientID%>");
            var qty = document.getElementById("<%=txtQty.ClientID%>");
            var orderDate = document.getElementById("<%=txtOrderDate.ClientID%>");
            var PICOrder = document.getElementById("<%=txtPICOrder.ClientID%>");
            var model = document.getElementById("<%=ddlModelExpenses.ClientID%>");
            var purpose = document.getElementById("<%=ddlPurpose.ClientID%>");
            var unit = document.getElementById("<%=ddlUnit.ClientID%>");
            var quotNo = document.getElementById("<%=txtQuotNo.ClientID%>");
            var price = document.getElementById("<%=txtUnitPrice.ClientID%>");
            var amount = document.getElementById("<%=txtAmount.ClientID%>");
            var amountUSD = document.getElementById("<%=txtAmountUSD.ClientID%>");
            var currency = document.getElementById("<%=ddlCurrency.ClientID%>");
            var leadTime = document.getElementById("<%=txtLeadTime.ClientID%>");
            //var purpose = document.getElementById("<%=txtRemarks.ClientID%>");
            var PRno = document.getElementById("<%=txtPRNo.ClientID%>");
            var POno = document.getElementById("<%=txtPONo.ClientID%>");

            //untuk kebutuhan update price
            var fixUnitPrice = document.getElementById("<%=hdUnitPrice.ClientID%>");
            var fixAmount = document.getElementById("<%=hdAmount.ClientID%>");
            var fixAmountUSD = document.getElementById("<%=hdAmountUSD.ClientID%>");
            var fixQuotNo = document.getElementById("<%=hdQuotNo.ClientID%>");

            var selectedIndex;
            if (getModel == "AUTOPACK") {
                selectedIndex = 0;
            } else if (getModel == "BAIKAL") {
                selectedIndex = 1;
            } else if (getModel == "CARTONER") {
                selectedIndex = 2;
            } else if (getModel == "CISS") {
                selectedIndex = 3;
            } else if (getModel == "COMMON") {
                selectedIndex = 4;
            } else if (getModel == "COSTNER/SAROMA") {
                selectedIndex = 5;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 6;
            } else if (getModel == "GAGA") {
                selectedIndex = 7;
            } else if (getModel == "HAVCRAIG") {
                selectedIndex = 8;
            } else if (getModel == "HAV3D") {
                selectedIndex = 9;
            } else if (getModel == "HAV3P") {
                selectedIndex = 10;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 11;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 12;
            } else if (getModel == "LEGGERO") {
                selectedIndex = 13;
            } else if (getModel == "LFP") {
                selectedIndex = 14;
            } else if (getModel == "NASUNO") {
                selectedIndex = 15;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 16;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 17;
            } else if (getModel == "OTHERS") {
                selectedIndex = 18;
            } else if (getModel == "SAKURA") {
                selectedIndex = 19;
            } else if (getModel == "SEALING") {
                selectedIndex = 20;
            } else if (getModel == "SPI") {
                selectedIndex = 21;
            } else if (getModel == "SUB") {
                selectedIndex = 22;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 23;
            } else if (getModel == "301") {
                selectedIndex = 24;
            } else if (getModel == "TAKASE") {
                selectedIndex = 25;
            } else if (getModel == "SEAL CAP") {
                selectedIndex = 26;
            } else { selectedIndex = 0 }

            var selectedIndex2;
            if (getPurpose == "ACTIVITY") {
                selectedIndex2 = 0;
            } else if (getPurpose == "SPAREPART") {
                selectedIndex2 = 1;
            }

            var selectedIndex3;
            if (getUnit == "Pcs") {
                selectedIndex3 = 0;
            } else if (getUnit == "Box") {
                selectedIndex3 = 1;
            } else if (getUnit == "Item") {
                selectedIndex3 = 2;
            } else if (getUnit == "Set") {
                selectedIndex3 = 3;
            }

            var selectedIndex4;
            if (getCurrency == "USD") {
                selectedIndex4 = 0;
            } else if (getCurrency == "SGD") {
                selectedIndex4 = 1;
            } else if (getCurrency == "JPY") {
                selectedIndex4 = 2;
            } else if (getCurrency == "IDR") {
                selectedIndex4 = 3;
            }


            console.log(getPrice);
            model.selectedIndex = selectedIndex;
            unit.selectedIndex = selectedIndex3
            currency.selectedIndex = selectedIndex4;
            purpose.selectedIndex = selectedIndex2;
            setExpID.value = getExpID;
            expID.value = getExpID;
            partName.value = getPartName;
            partCode.value = getPartCode;
            partName2.value = getPartName;
            partCode2.value = getPartCode;
            maker.value = getMaker;
            vendor.value = getVendor;
            qty.value = getQty;
            orderDate.value = getOrderDate;
            PICOrder.value = getPICOrder;
            quotNo.value = getQuotNo;
            price.value = getPrice;
            if (getPrice != 0) {
                price.setAttribute("disabled", true);
                currency.setAttribute("disabled", true);
            } else if (getPrice == 0) {
                price.removeAttribute("disabled");
                currency.removeAttribute("disabled");
            }

            if (getQuotNo == 0 || getQuotNo == '') {

                quotNo.removeAttribute("disabled");
            } else if (getQuotNo != 0) {
                quotNo.setAttribute("disabled", false);
            }

            fixUnitPrice.value = getPrice;
            fixAmount.value = getAmount;
            fixAmountUSD.value = getAmountUSD;
            fixQuotNo.value = getQuotNo;
            amount.value = getAmount;
            amountUSD.value = getAmountUSD;
            leadTime.value = getLeadTime;
            PRno.value = getPRno;
            POno.value = getPOno;
            console.log(getPrice);
            console.log(getQuotNo);
            console.log(getAmount);
            console.log(getAmountUSD);
        });


        $('#tblNewOversea').on('click', 'tr', function () {
            btnSave.removeAttribute("disabled");
            <%=txtQuotNo.Text=string.Empty%>
            var getExpID = $('td', this).eq(0).text();
            var getPartName = $('td', this).eq(1).text();
            var getPartCode = $('td', this).eq(2).text();
            var getMaker = $('td', this).eq(3).text();
            var getVendor = $('td', this).eq(4).text();
            var getQty = $('td', this).eq(5).text();
            var getOrderDate = $('td', this).eq(7).text();
            var getPICOrder = $('td', this).eq(25).text();
            var getModel = $('td', this).eq(27).text();
            var getPurpose = $('td', this).eq(23).text();
            var getUnit = $('td', this).eq(6).text();
            var getQuotNo = $('td', this).eq(15).text();
            var getPrice = $('td', this).eq(9).text();
            var getAmount = $('td', this).eq(10).text();
            var getAmountUSD = $('td', this).eq(11).text();
            var getCurrency = $('td', this).eq(8).text();
            var getLeadTime = $('td', this).eq(16).text();
            var getPurpose = $('td', this).eq(23).text();
            var getPRno = $('td', this).eq(17).text();
            var getPOno = $('td', this).eq(19).text();
            getExpID = getExpID.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');
            //getPurpose = getPurpose.replace(/\s/g, '');
            getUnit = getUnit.replace(/\s/g, '');
            getQuotNo = getQuotNo.replace(/\s/g, '');
            getPrice = getPrice.replace(/\s/g, '');
            //getPrice = getPrice.replace(/\s/g, '');
            $('#myModalPO').modal("show");
            var setExpID = document.getElementById("<%=hdExpensesID.ClientID%>");
            var expID = document.getElementById("<%=txtExpensesID.ClientID%>");
            var partName = document.getElementById("<%=txtPartName.ClientID%>");
            var partName2 = document.getElementById("<%=hdPartName.ClientID%>");
            var partCode = document.getElementById("<%=txtPartCode.ClientID%>");
            var partCode2 = document.getElementById("<%=hdPartCode.ClientID%>");
            var maker = document.getElementById("<%=txtMaker.ClientID%>");
            var vendor = document.getElementById("<%=txtVendor.ClientID%>");
            var qty = document.getElementById("<%=txtQty.ClientID%>");
            var orderDate = document.getElementById("<%=txtOrderDate.ClientID%>");
            var PICOrder = document.getElementById("<%=txtPICOrder.ClientID%>");
            var model = document.getElementById("<%=ddlModelExpenses.ClientID%>");
            var purpose = document.getElementById("<%=ddlPurpose.ClientID%>");
            var unit = document.getElementById("<%=ddlUnit.ClientID%>");
            var quotNo = document.getElementById("<%=txtQuotNo.ClientID%>");
            var price = document.getElementById("<%=txtUnitPrice.ClientID%>");
            var amount = document.getElementById("<%=txtAmount.ClientID%>");
            var amountUSD = document.getElementById("<%=txtAmountUSD.ClientID%>");
            var currency = document.getElementById("<%=ddlCurrency.ClientID%>");
            var leadTime = document.getElementById("<%=txtLeadTime.ClientID%>");
            //var purpose = document.getElementById("<%=txtRemarks.ClientID%>");
            var PRno = document.getElementById("<%=txtPRNo.ClientID%>");
            var POno = document.getElementById("<%=txtPONo.ClientID%>");

            //untuk kebutuhan update price
            var fixUnitPrice = document.getElementById("<%=hdUnitPrice.ClientID%>");
            var fixAmount = document.getElementById("<%=hdAmount.ClientID%>");
            var fixAmountUSD = document.getElementById("<%=hdAmountUSD.ClientID%>");
            var fixQuotNo = document.getElementById("<%=hdQuotNo.ClientID%>");

            var selectedIndex;
            if (getModel == "AUTOPACK") {
                selectedIndex = 0;
            } else if (getModel == "BAIKAL") {
                selectedIndex = 1;
            } else if (getModel == "CARTONER") {
                selectedIndex = 2;
            } else if (getModel == "CISS") {
                selectedIndex = 3;
            } else if (getModel == "COMMON") {
                selectedIndex = 4;
            } else if (getModel == "COSTNER/SAROMA") {
                selectedIndex = 5;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 6;
            } else if (getModel == "GAGA") {
                selectedIndex = 7;
            } else if (getModel == "HAVCRAIG") {
                selectedIndex = 8;
            } else if (getModel == "HAV3D") {
                selectedIndex = 9;
            } else if (getModel == "HAV3P") {
                selectedIndex = 10;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 11;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 12;
            } else if (getModel == "LEGGERO") {
                selectedIndex = 13;
            } else if (getModel == "LFP") {
                selectedIndex = 14;
            } else if (getModel == "NASUNO") {
                selectedIndex = 15;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 16;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 17;
            } else if (getModel == "OTHERS") {
                selectedIndex = 18;
            } else if (getModel == "SAKURA") {
                selectedIndex = 19;
            } else if (getModel == "SEALING") {
                selectedIndex = 20;
            } else if (getModel == "SPI") {
                selectedIndex = 21;
            } else if (getModel == "SUB") {
                selectedIndex = 22;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 23;
            } else if (getModel == "301") {
                selectedIndex = 24;
            } else if (getModel == "TAKASE") {
                selectedIndex = 25;
            } else { selectedIndex = 0 }

            var selectedIndex2;
            if (getPurpose == "ACTIVITY") {
                selectedIndex2 = 0;
            } else if (getPurpose == "SPAREPART") {
                selectedIndex2 = 1;
            }

            var selectedIndex3;
            if (getUnit == "Pcs") {
                selectedIndex3 = 0;
            } else if (getUnit == "Box") {
                selectedIndex3 = 1;
            } else if (getUnit == "Item") {
                selectedIndex3 = 2;
            } else if (getUnit == "Set") {
                selectedIndex3 = 3;
            }

            var selectedIndex4;
            if (getCurrency == "USD") {
                selectedIndex4 = 0;
            } else if (getCurrency == "SGD") {
                selectedIndex4 = 1;
            } else if (getCurrency == "JPY") {
                selectedIndex4 = 2;
            } else if (getCurrency == "IDR") {
                selectedIndex4 = 3;
            }


            console.log(getPrice);
            model.selectedIndex = selectedIndex;
            unit.selectedIndex = selectedIndex3
            currency.selectedIndex = selectedIndex4;
            purpose.selectedIndex = selectedIndex2;
            setExpID.value = getExpID;
            expID.value = getExpID;
            partName.value = getPartName;
            partCode.value = getPartCode;
            partName2.value = getPartName;
            partCode2.value = getPartCode;
            maker.value = getMaker;
            vendor.value = getVendor;
            qty.value = getQty;
            orderDate.value = getOrderDate;
            PICOrder.value = getPICOrder;
            quotNo.value = getQuotNo;
            price.value = getPrice;
            if (getPrice != 0) {
                price.setAttribute("disabled", true);
                currency.setAttribute("disabled", true);
            } else if (getPrice == 0) {
                price.removeAttribute("disabled");
                currency.removeAttribute("disabled");
            }

            if (getQuotNo == 0 || getQuotNo == '') {

                quotNo.removeAttribute("disabled");
            } else if (getQuotNo != 0) {
                quotNo.setAttribute("disabled", false);
            }

            fixUnitPrice.value = getPrice;
            fixAmount.value = getAmount;
            fixAmountUSD.value = getAmountUSD;
            fixQuotNo.value = getQuotNo;
            amount.value = getAmount;
            amountUSD.value = getAmountUSD;
            leadTime.value = getLeadTime;
            PRno.value = getPRno;
            POno.value = getPOno;
            console.log(getPrice);
            console.log(getQuotNo);
            console.log(getAmount);
            console.log(getAmountUSD);
        });

        $('#tblProgress').on('click', 'tr', function () {
            var getExpID = $('td', this).eq(0).text();
            var getPartName = $('td', this).eq(1).text();
            var getPartCode = $('td', this).eq(2).text();
            var getQuotation = $('td', this).eq(9).text();
            //var getVendor = $('td', this).eq(4).text();
            //var getQty = $('td', this).eq(5).text();
            //var getOrderDate = $('td', this).eq(7).text();
            //var getGoodsName = $('td', this).eq(1).text();
            //var getMinOrder = $('td', this).eq(6).text();
            //getGoodsCode = getGoodsCode.replace(/\s/g, '');
            //getExpID = getExpID.replace(/\s/g, '');
            //getMinStock = getMinStock.replace(/\s/g, '');
            //getMinOrder = getMinOrder.replace(/\s/g, '');
            //getGoodsName = getGoodsName.replace(/\s/g, '');
            //$('#myModalProgress').modal("show");
          <%--  var expID = document.getElementById("<%=txtExpensesID2.ClientID%>");
            var partName = document.getElementById("<%=txtPartName2.ClientID%>");
            var PartCode = document.getElementById("<%=txtPartCode2.ClientID%>");
            var QuotationNo = document.getElementById("<%=txtQuotationNumber2.ClientID%>");--%>
            expID.value = getExpID;
            partName.value = getPartName;
            PartCode.value = getPartCode;
            QuotationNo.value = getQuotation;
           <%-- var setExpID = document.getElementById("<%=hdExpensesID.ClientID%>");
            var expID = document.getElementById("<%=txtExpensesID.ClientID%>");
            var partName = document.getElementById("<%=txtPartName.ClientID%>");
            var partCode = document.getElementById("<%=txtPartCode.ClientID%>");
            var maker = document.getElementById("<%=txtMaker.ClientID%>");
            var vendor = document.getElementById("<%=txtVendor.ClientID%>");
            var qty = document.getElementById("<%=txtQty.ClientID%>");
            var orderDate = document.getElementById("<%=txtOrderDate.ClientID%>");
            setExpID.value = getExpID;
            expID.value = getExpID;
            partName.value = getPartName;
            partCode.value = getPartCode;
            maker.value = getMaker;
            vendor.value = getVendor;
            qty.value = getQty;
            orderDate.value = getOrderDate;--%>
            <%--var setGoodsCode = document.getElementById("<%=hdGoodsCode.ClientID%>");
            setGoodsCode.value = getGoodsCode;
            var goodsCode = document.getElementById("<%=txtGoodsCodeOrder.ClientID%>");
            var nowStock = document.getElementById("<%=txtNowStockOrder.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockOrder.ClientID%>");
            var goodsName = document.getElementById("<%=txtGoodsNameOrder.ClientID%>");
            var minOrder = document.getElementById("<%=txtMinOrderOrder.ClientID%>");
            goodsCode.value = getGoodsCode;
            nowStock.value = getNowStock;
            minStock.value = getMinStock;
            goodsName.value = getGoodsName;
            minOrder.value = getMinOrder;--%>
        });


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

        $('#tblComing').on('click', 'tr', function () {
            //btnSave.setAttribute("disabled", true);
            var getExpID = $('td', this).eq(0).text();
            var getPartName = $('td', this).eq(1).text();
            var getPartCode = $('td', this).eq(2).text();
            var getMaker = $('td', this).eq(3).text();
            var getVendor = $('td', this).eq(4).text();
            var getQty = $('td', this).eq(5).text();
            var getOrderDate = $('td', this).eq(7).text();
            var getPICOrder = $('td', this).eq(25).text();
            var getModel = $('td', this).eq(27).text();
            var getPurpose = $('td', this).eq(23).text();
            var getUnit = $('td', this).eq(6).text();
            var getQuotNo = $('td', this).eq(15).text();
            var getPrice = $('td', this).eq(9).text();
            var getAmount = $('td', this).eq(10).text();
            var getAmountUSD = $('td', this).eq(11).text();
            var getCurrency = $('td', this).eq(8).text();
            var getLeadTime = $('td', this).eq(16).text();
            var getPurpose = $('td', this).eq(23).text();
            var getPRno = $('td', this).eq(17).text();
            var getPOno = $('td', this).eq(19).text();
            getExpID = getExpID.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');
            //getPurpose = getPurpose.replace(/\s/g, '');
            getUnit = getUnit.replace(/\s/g, '');
            getQuotNo = getQuotNo.replace(/\s/g, '');
            getPrice = getPrice.replace(/\s/g, '');
            //getPrice = getPrice.replace(/\s/g, '');
            $('#myComingCancel').modal("show");
            var setExpID = document.getElementById("<%=hdExpID_ComingCancel.ClientID%>");
            var expID = document.getElementById("<%=txtExpID_ComingCancel.ClientID%>");
            var partName = document.getElementById("<%=txtPartName_ComingCancel.ClientID%>");
            var partName2 = document.getElementById("<%=hdPartName_ComingCancel.ClientID%>");
            var partCode = document.getElementById("<%=txtPartCode_ComingCancel.ClientID%>");
            var partCode2 = document.getElementById("<%=hdPartCode_ComingCancel.ClientID%>");
            var maker = document.getElementById("<%=txtMaker_ComingCancel.ClientID%>");
            var vendor = document.getElementById("<%=txtVendor_ComingCancel.ClientID%>");
            var qty = document.getElementById("<%=txtQty_ComingCancel.ClientID%>");
            var orderDate = document.getElementById("<%=txtOrderDate_ComingCancel.ClientID%>");
            var PICOrder = document.getElementById("<%=txtPICorder_ComingCancel.ClientID%>");
            var model = document.getElementById("<%=ddlModel_ComingCancel.ClientID%>");
            var purpose = document.getElementById("<%=ddlPurpose_ComingCancel.ClientID%>");
            var unit = document.getElementById("<%=ddlUnit_ComingCancel.ClientID%>");
            var quotNo = document.getElementById("<%=txtQuotationNumber_ComingCancel.ClientID%>");
            var price = document.getElementById("<%=txtUnitPrice_ComingCancel.ClientID%>");
            var amount = document.getElementById("<%=txtAmount_ComingCancel.ClientID%>");
            var amountUSD = document.getElementById("<%=txtAmountUSD_ComingCancel.ClientID%>");
            var currency = document.getElementById("<%=ddlCurrency_ComingCancel.ClientID%>");
            var leadTime = document.getElementById("<%=txtLeadTime_ComingCancel.ClientID%>");
            //var purpose = document.getElementById("<%=txtRemark_ComingCancel.ClientID%>");
            var PRno = document.getElementById("<%=txtPRno_ComingCancel.ClientID%>");
            var POno = document.getElementById("<%=txtPOno_ComingCancel.ClientID%>");

            //untuk kebutuhan update price
            var fixUnitPrice = document.getElementById("<%=hdUnitPrice.ClientID%>");
            var fixAmount = document.getElementById("<%=hdAmount.ClientID%>");
            var fixAmountUSD = document.getElementById("<%=hdAmountUSD.ClientID%>");
            var fixQuotNo = document.getElementById("<%=hdQuotNo.ClientID%>");

            var selectedIndex;
            if (getModel == "AUTOPACK") {
                selectedIndex = 0;
            } else if (getModel == "BAIKAL") {
                selectedIndex = 1;
            } else if (getModel == "CARTONER") {
                selectedIndex = 2;
            } else if (getModel == "CISS") {
                selectedIndex = 3;
            } else if (getModel == "COMMON") {
                selectedIndex = 4;
            } else if (getModel == "COSTNER/SAROMA") {
                selectedIndex = 5;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 6;
            } else if (getModel == "GAGA") {
                selectedIndex = 7;
            } else if (getModel == "HAVCRAIG") {
                selectedIndex = 8;
            } else if (getModel == "HAV3D") {
                selectedIndex = 9;
            } else if (getModel == "HAV3P") {
                selectedIndex = 10;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 11;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 12;
            } else if (getModel == "LEGGERO") {
                selectedIndex = 13;
            } else if (getModel == "LFP") {
                selectedIndex = 14;
            } else if (getModel == "NASUNO") {
                selectedIndex = 15;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 16;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 17;
            } else if (getModel == "OTHERS") {
                selectedIndex = 18;
            } else if (getModel == "SAKURA") {
                selectedIndex = 19;
            } else if (getModel == "SEALING") {
                selectedIndex = 20;
            } else if (getModel == "SPI") {
                selectedIndex = 21;
            } else if (getModel == "SUB") {
                selectedIndex = 22;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 23;
            } else if (getModel == "301") {
                selectedIndex = 24;
            } else if (getModel == "TAKASE") {
                selectedIndex = 25;
            } else { selectedIndex = 0 }

            var selectedIndex2;
            if (getPurpose == "ACTIVITY") {
                selectedIndex2 = 0;
            } else if (getPurpose == "SPAREPART") {
                selectedIndex2 = 1;
            }

            var selectedIndex3;
            if (getUnit == "Pcs") {
                selectedIndex3 = 0;
            } else if (getUnit == "Box") {
                selectedIndex3 = 1;
            } else if (getUnit == "Item") {
                selectedIndex3 = 2;
            } else if (getUnit == "Set") {
                selectedIndex3 = 3;
            }

            var selectedIndex4;
            if (getCurrency == "USD") {
                selectedIndex4 = 0;
            } else if (getCurrency == "SGD") {
                selectedIndex4 = 1;
            } else if (getCurrency == "JPY") {
                selectedIndex4 = 2;
            } else if (getCurrency == "IDR") {
                selectedIndex4 = 3;
            }


            console.log(getPrice);
            model.selectedIndex = selectedIndex;
            unit.selectedIndex = selectedIndex3
            currency.selectedIndex = selectedIndex4;
            purpose.selectedIndex = selectedIndex2;
            setExpID.value = getExpID;
            expID.value = getExpID;
            partName.value = getPartName;
            partCode.value = getPartCode;
            partName2.value = getPartName;
            partCode2.value = getPartCode;
            maker.value = getMaker;
            vendor.value = getVendor;
            qty.value = getQty;
            orderDate.value = getOrderDate;
            PICOrder.value = getPICOrder;
            quotNo.value = getQuotNo;
            price.value = getPrice;



            fixUnitPrice.value = getPrice;
            fixAmount.value = getAmount;
            fixAmountUSD.value = getAmountUSD;
            fixQuotNo.value = getQuotNo;
            amount.value = getAmount;
            amountUSD.value = getAmountUSD;
            leadTime.value = getLeadTime;
            PRno.value = getPRno;
            POno.value = getPOno;
            console.log(getPrice);
            console.log(getQuotNo);
            console.log(getAmount);
            console.log(getAmountUSD);
        });


        function ConfirmCancel() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var ID = document.getElementById('<%= hdExpensesID.ClientID %>').value;
            var partName = document.getElementById('<%= hdPartName.ClientID %>').value;
            var partCode = document.getElementById('<%= hdPartCode.ClientID %>').value;


            if (ID == "") {
                alert("Data not complete, please try again.");
                return false;
            } else {
                if (confirm("Cancel order dengan ID " + ID + ", Part Name " + partName + ", dan Part Code " + partCode + " ? ")) {
                    confirm_value.value = "Yes";
                    //alert("Close problem success");
                    //return true;
                } else {
                    confirm_value.value = "No";
                    return false;
                }
                document.forms[0].appendChild(confirm_value);
            }
        }


        function ConfirmCancel_ComingCancel() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var ID = document.getElementById('<%= hdExpID_ComingCancel.ClientID %>').value;
            var partName = document.getElementById('<%= hdPartName_ComingCancel.ClientID %>').value;
            var partCode = document.getElementById('<%= hdPartCode_ComingCancel.ClientID %>').value;


            if (ID == "") {
                alert("Data not complete, please try again.");
                return false;
            } else {
                if (confirm("Cancel order dengan ID " + ID + ", Part Name " + partName + ", dan Part Code " + partCode + " ? ")) {
                    confirm_value.value = "Yes";
                    //alert("Close problem success");
                    //return true;
                } else {
                    confirm_value.value = "No";
                    return false;
                }
                document.forms[0].appendChild(confirm_value);
            }
        }

        function exportToExcel() {
            var dateFrom = document.getElementById("dateFrom").value;
            var dateTo = document.getElementById("dateTo").value;
            var type = document.getElementById("type").value;

            $.ajax({
                type: "POST",
                url: "expenseslist.aspx/exportToExcel",
                data: JSON.stringify({ dateFrom: dateFrom, dateTo: dateTo, type: type }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    // Lakukan sesuatu dengan data yang dikembalikan
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
        }
    </script>
</body>
</html>
