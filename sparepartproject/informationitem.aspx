<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="informationitem.aspx.cs" Inherits="sparepartproject.informationitem" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Contactor</title>
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


    <style>
        .nav-tabs .nav-link .active {
            border-color: #007fff #007fff #fff;
            color: #007fff;
        }

        #btnApprovedd {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnApproved2 {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnReturn {
            font-size: .7rem;
            border-radius: 5px;
        }

        #gvDataProgress {
            font-size: .7rem;
        }

        #gvReturn {
            font-size: .7rem;
        }

        #gvCompleteData {
            font-size: .7rem;
        }

        #btnSearch {
            font-size: .7rem;
        }

        #ddlBulan {
            padding: 2px 4px;
            font-size: .8rem;
            margin: 0px;
        }

        #btnAddInformation {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
        }

        #ddlModelSearch {
            font-size: .7rem;
        }

        #dateFrom {
            font-size: .7rem;
        }

        #dateTo {
            font-size: .7rem;
        }

        div.ui-datepicker {
            font-size: 10px;
        }

        #gvExpenses_Activity, #gvOpen, #gvHistory {
            font-size: .7rem;
        }

        #btnAddPartonebyone {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
        }

        #btnExport {
            font-size: .6rem;
        }

        .input-group-text, #gvOpen {
            cursor: pointer;
        }

        #txtTanggal, #txtDateFrom, #txtDateTo {
            font-size: .6rem;
            color: black;
        }

        .input-group-text i {
            font-size: .8rem;
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

        .datepicker {
            font-size: 10px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
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
                    <a href="home.aspx" style="display: none;">Home</a>
                </li>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" style="cursor: not-allowed">SPI</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="spi_databasepart.aspx" style="display: none;">Database Part</a>
                        </li>
                        <li>
                            <a href="dailyissuedpart.aspx" style="display: none;">Daily Issued Part</a>
                        </li>
                        <li>
                            <a href="sparepartorder.aspx" style="display: none;">Order Part</a>
                        </li>
                        <li>
                            <a href="comingpart.aspx" style="display: none;">Coming Part</a>
                        </li>
                        <li>
                            <a href="listprintlabel.aspx" style="display: none;">List Print Label</a>
                        </li>
                        <li>
                            <a href="closedactivity.aspx" style="display: none;">Closed Activity</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#ExpensesSubmenu" data-toggle="collapse" style="cursor: not-allowed" aria-expanded="false" class="dropdown-toggle">Expenses</a>
                    <ul class="collapse list-unstyled" id="ExpensesSubmenu">
                        <li>
                            <a href="expenses.aspx" style="display: none;">Pre Expenses</a>
                        </li>
                        <li>
                            <a href="expenseslist.aspx" style="display: none;">Expenses</a>
                        </li>
                        <li>
                            <a href="expenseslist_uncounting.aspx">Expenses (Uncounting)</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="qcreminder_insertnew.aspx" style="display: none;">QC Check Reminder</a>
                </li>
                <li class="active">
                    <a href="informationitem.aspx">Contactor</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="home.aspx" class="article" style="display: none;">Login</a>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Contactor</h5>
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


                <div class="row">

                    <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
                    <div class="col-12">

                        <button type="button" style="visibility: hidden;" id="btnAddInformation" class="btn btn-primary text-center" data-toggle="modal" data-target="#modalInsertInformation">
                            Insert Contactor
                        </button>

                        <%--<asp:Button ID="asd" runat="server" OnClick="asd_Click" Text="Export" />--%>
                        <%--<asp:Button CssClass="btn btn-danger" runat="server" ID="asdasd" OnClick="asdasd_Click" Text="asdasd" />--%>
                    </div>
                    <div class="modal fade" id="modalInsertInformation">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Insert New Information</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">

                                                <label class="lblModal">Model</label>
                                                <asp:DropDownList runat="server" ID="ddlModel" CssClass="form-control" Width="80%">
                                                    <asp:ListItem>CISS</asp:ListItem>
                                                    <asp:ListItem>CRAIG / LEGGERO</asp:ListItem>
                                                    <asp:ListItem>FRASER</asp:ListItem>
                                                    <asp:ListItem>GERE MOLLY</asp:ListItem>
                                                    <asp:ListItem>HAV 3D</asp:ListItem>
                                                    <asp:ListItem>HAV 3P</asp:ListItem>
                                                    <asp:ListItem>INK BLENDING</asp:ListItem>
                                                    <asp:ListItem>KUROBE</asp:ListItem>
                                                    <asp:ListItem>KUZURYU</asp:ListItem>
                                                    <asp:ListItem>LANTANA</asp:ListItem>
                                                    <asp:ListItem>LFP</asp:ListItem>
                                                    <asp:ListItem>MASHU</asp:ListItem>
                                                    <asp:ListItem>NASUNO</asp:ListItem>
                                                    <asp:ListItem>NASUNO 3</asp:ListItem>
                                                    <asp:ListItem>NEYMAR</asp:ListItem>
                                                    <asp:ListItem>NONE</asp:ListItem>
                                                    <asp:ListItem>ORPHEUS</asp:ListItem>
                                                    <asp:ListItem>SAKURA</asp:ListItem>
                                                    <asp:ListItem>SAROMA/COSTNER</asp:ListItem>
                                                    <asp:ListItem>SHETLAND</asp:ListItem>
                                                    <asp:ListItem>SUB 1</asp:ListItem>
                                                    <asp:ListItem>SUB 2</asp:ListItem>
                                                    <asp:ListItem>TAKASE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <label class="lblModal">Proposed By</label>
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtPurposeBy" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="row" style="margin-top: 25px;">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <label class="lblModal">Item Information</label>
                                                <asp:TextBox CssClass="form-control" Style="height: 100px" ID="txtActivityInformation" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>


                                            </div>

                                        </div>
                                        <div class="row" style="margin-top: 25px;">
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                <label class="lblModal">Line</label>
                                                <asp:TextBox CssClass="form-control" ID="txtLine" runat="server" Width="80%"></asp:TextBox>
                                                <%--<label class="lblModal">Issued Date</label>
                                                <div class="input-group date" data-provide="datepicker">
                                                    <asp:TextBox CssClass="form-control" ID="txtTanggal" runat="server" Width="40%"></asp:TextBox>
                                                    <div class="input-group-addon">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>--%>
                                            </div>
                                            <div class="col-lg-3">
                                                <label class="lblModal">Cell</label>
                                                <asp:TextBox CssClass="form-control" ID="txtCell" runat="server" Width="80%"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">

                                                <label class="lblModal">PIC By</label>
                                                <asp:TextBox CssClass="form-control" ID="txtPIC" runat="server" Width="80%"></asp:TextBox>
                                            </div>
                                        </div>



                                        <div class="row" style="margin-top: 25px;">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xl-6">
                                                <label class="lblModal">Cause</label>
                                                <asp:TextBox CssClass="form-control" Style="height: 100px" ID="txtCause" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>

                                                <%--<asp:TextBox CssClass="form-control" ID="txtActivityInformation" Enabled="true" runat="server" Width="100%" TextMode="MultiLine" Height="80px" Rows="15"></asp:TextBox>--%>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <label class="lblModal">Reason</label>
                                                <asp:TextBox CssClass="form-control" Style="height: 100px" ID="txtReason" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>


                                            </div>

                                        </div>



                                        <div class="row" style="margin-top: 25px;">

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">

                                                <label class="lblModal">Attachment</label>
                                                <%--<asp:TextBox CssClass="form-control" ID="txtPurpose" Enabled="true" runat="server"></asp:TextBox>--%>
                                                <asp:FileUpload ID ="fileUpload1" runat="server" Width="100%" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <asp:LinkButton ID="btnOrder" Text="Add Data" CssClass="btn btn-outline-primary text-center" OnClick="btnOrder_Click" runat="server"></asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>

               

                    <div class="modal fade" id="modalClose" tabindex="-1" aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">CONTACTOR CLOSE FORM SUBMISSION</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <%--style="background-color: #afe2ff"--%>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                                <label class="lblModal">ID</label>
                                                <%--                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOnebyOne" runat="server" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>--%>
                                            </div>
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                                <%--<label class="lblModal">Goods Name</label>--%>
                                                <asp:TextBox CssClass="form-control" ID="txtID" Enabled="false" runat="server" Width="30%"></asp:TextBox>
                                                <input type="hidden" id="hdID" name="exp_ID" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                                <label class="lblModal">ASSET NO</label>
                                            </div>
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                                <asp:TextBox CssClass="form-control" ID="txtAssetNo" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                <input type="hidden" id="hdAssetNo" name="partName" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                                <label class="lblModal">MACHINE NO</label>
                                            </div>
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                                <asp:TextBox CssClass="form-control" ID="txtMachineNo" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                <input type="hidden" id="hdMachineNo" name="partcode" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xl-2">
                                                <label class="lblModal">SERIAL NO. MACHINE</label>
                                            </div>
                                            <div class="col-lg-10 col-md-10 col-sm-10 col-xl-10">
                                                <asp:TextBox CssClass="form-control" ID="txtSerialNo" Enabled="false" runat="server" Width="85%"></asp:TextBox>
                                                <input type="hidden" id="hdSerialNo" name="partcode" runat="server" />
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-2">
                                                    <label class="lblModal">MODEL</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <input type="hidden" id="hdmodell" name="exp_ID" runat="server" />

                                                    <asp:DropDownList runat="server" ID="ddlModell" Enabled="true" CssClass="form-control" Width="75%">
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
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xl-3">
                                                <div class="col-lg-2">
                                                    <label class="lblModal">LINE</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <input type="hidden" id="hdlinee" name="exp_ID" runat="server" />

                                                    <asp:DropDownList runat="server" ID="ddlLine" Enabled="true" CssClass="form-control" Width="75%">
                                                        <asp:ListItem>MA</asp:ListItem>
                                                        <asp:ListItem>NA</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MB</asp:ListItem>
                                                        <asp:ListItem>NB</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MC</asp:ListItem>
                                                        <asp:ListItem>NC</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MD</asp:ListItem>
                                                        <asp:ListItem>ND</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>ME</asp:ListItem>
                                                        <asp:ListItem>NE</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MF</asp:ListItem>
                                                        <asp:ListItem>NF</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MG</asp:ListItem>
                                                        <asp:ListItem>NG</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MH</asp:ListItem>
                                                        <asp:ListItem>NH</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MI</asp:ListItem>
                                                        <asp:ListItem>NI</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MJ</asp:ListItem>
                                                        <asp:ListItem>NJ</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>MK</asp:ListItem>
                                                        <asp:ListItem>NK</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-6">
                                                    <label class="lblModal">CONTACTOR TYPE</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <input type="hidden" name="exp_ID" runat="server" />

                                                    <asp:TextBox CssClass="form-control" ID="txtContactorType" Enabled="true" runat="server" Width="65%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
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
                                            </div>--%>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                            </div>
                                        </div>
                                        <div class="line"></div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-12">
                                                    <label class="lblModal">CONTACTOR CAPACITY</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <asp:TextBox CssClass="form-control" ID="txtContactorCapacity" Enabled="true" runat="server" Width="90%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-12">
                                                    <label class="lblModal">CONTACTOR TYPE (BEFORE)</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <asp:TextBox CssClass="form-control" ID="txtContactorTypeBefore" Enabled="true" runat="server" Width="70%"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-12">
                                                    <label class="lblModal">CONTACTOR TYPE (AFTER)</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <asp:TextBox CssClass="form-control" ID="txtContactorTypeAfter" Enabled="true" runat="server" Width="70%"></asp:TextBox>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-12">
                                                    <label class="lblModal">CURRENT DUE DATE</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <input type="hidden" id="hdduedate" name="exp_ID" runat="server" />

                                                    <asp:TextBox CssClass="form-control" ID="txtDueDate" Enabled="false" runat="server" Width="70%"></asp:TextBox>
                                                </div>

                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                                <div class="col-lg-12">
                                                    <label class="lblModal">FILE REPORT</label>

                                                </div>
                                                <div class="col-lg-12">
                                                    <asp:FileUpload ID="fileuploadcontactor" runat="server" Width="100%" />
                                                </div>
                                            </div>


                                        </div>
                                        <div class="line"></div>
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
                                    </div>


                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <%--<asp:LinkButton ID="LinkButton3" Text="Cancel Order" OnClientClick="return ConfirmCancel();" CssClass="btn btn-outline-dark text-center" runat="server"></asp:LinkButton>--%>
                                    <button type="button" class="btn btn-outline-danger text-center"  id="btnDeleteContactor">Delete Contactor</button>
                                    <%--<asp:LinkButton runat="server" ID="btnDeleteContactor" CssClass="btn btn-outline-danger text-center">Delete Contactor</asp:LinkButton>--%>
                                    <%--<button type="button" class="btn btn-outline-warning text-center" data-dismiss="modal">Close Form</button>--%>
                                    <%--<asp:Button ID="btnInsertDataOnebyOne" runat="server" CssClass="btn btn-outline-primary text-center" Text="Insert Data" OnClick="btnInsertDataOnebyOne_Click" />--%>
                                    <asp:LinkButton ID="btnSave" OnClientClick="return cekKosong();" OnClick="btnSave_Click" Text="Update Contactor" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">FORM DELETE CONTACTOR</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="loadingImg" style="display: none;" class="m-auto mt-9">
                        <img src="images/load.gif" height="120" width="240" />
                    </div>

                    <%--<div class="col-12">
                        <table class="table table-sm table-hover mt-3 mb-3" style="font-size: .7rem; font-family: Arial; visibility: hidden; cursor: pointer;" id="tblInformation">
                            <thead style="background-color: darkblue; color: white; text-align: left; font-family: Arial; font-size: 11px;">
                                <tr>
                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">NO</th>
                                    <th scope="col" style="vertical-align: middle; width: 200px; padding: 0">DATE / TIME</th>
                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                    <th scope="col" style="vertical-align: middle;">LINE</th>
                                    <th scope="col" style="vertical-align: middle;">CELL</th>
                                    <th scope="col" style="vertical-align: middle;">ITEM INFORMATION</th>
                                    <th scope="col" style="vertical-align: middle;">CAUSE</th>
                                    <th scope="col" style="vertical-align: middle;">REASON</th>
                                    <th scope="col" style="vertical-align: middle;">PURPOSE BY</th>
                                    <th scope="col" style="vertical-align: middle;">PIC BY</th>
                                    <th scope="col" style="vertical-align: middle;">ATTACHMENT</th>


                                    <%--<th scope="col" style="vertical-align: middle;">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>--%>

                    <div class="col-12">
                        <label style="margin-top: 0px; font-size: 1.5rem; display: none" class="mb-3">Search Criteria</label>
                    </div>

                    <div class="col-12 mr-0" id="divSearch" style="margin-bottom: 40px; border-radius: 50px; vertical-align: middle; font-size: .7rem; display: none">
                        <div style="width: 100%; background-color: #f2f2f2; height: 50px; border-radius: 5px; box-shadow: 1px 1px 3px rgb(0 0 0 / 10%);">
                            <div class="col-lg-12 form-inline" style="top: 10px;">
                                <label class="lblModal" style="margin-right: 5px;">Model</label>
                                <asp:DropDownList runat="server" ID="ddlModelSearch" CssClass="form-control">
                                    <asp:ListItem>ALL</asp:ListItem>
                                    <asp:ListItem>CISS</asp:ListItem>
                                    <asp:ListItem>CRAIG / LEGGERO</asp:ListItem>
                                    <asp:ListItem>FRASER</asp:ListItem>
                                    <asp:ListItem>GERE MOLLY</asp:ListItem>
                                    <asp:ListItem>HAV 3D</asp:ListItem>
                                    <asp:ListItem>HAV 3P</asp:ListItem>
                                    <asp:ListItem>INK BLENDING</asp:ListItem>
                                    <asp:ListItem>KUROBE</asp:ListItem>
                                    <asp:ListItem>KUZURYU</asp:ListItem>
                                    <asp:ListItem>LANTANA</asp:ListItem>
                                    <asp:ListItem>LFP</asp:ListItem>
                                    <asp:ListItem>MASHU</asp:ListItem>
                                    <asp:ListItem>NASUNO</asp:ListItem>
                                    <asp:ListItem>NASUNO 3</asp:ListItem>
                                    <asp:ListItem>NEYMAR</asp:ListItem>
                                    <asp:ListItem>NONE</asp:ListItem>
                                    <asp:ListItem>ORPHEUS</asp:ListItem>
                                    <asp:ListItem>SAKURA</asp:ListItem>
                                    <asp:ListItem>SAROMA/COSTNER</asp:ListItem>
                                    <asp:ListItem>SHETLAND</asp:ListItem>
                                    <asp:ListItem>SUB 1</asp:ListItem>
                                    <asp:ListItem>SUB 2</asp:ListItem>
                                    <asp:ListItem>TAKASE</asp:ListItem>
                                </asp:DropDownList>

                                <label class="lblModal" style="margin-right: 5px; margin-left: 70px;">Date From</label>
                                <div class="input-group date" data-provide="datepicker">
                                    <asp:TextBox runat="server" ID="dateFrom" CssClass="form-control"></asp:TextBox>
                                    <div class="input-group-addon">
                                        <div class="input-group-text"><i class="fa fa-calendar" style="cursor: pointer; font-size: 17px"></i></div>
                                    </div>
                                </div>

                                <label class="lblModal" style="margin-right: 5px; margin-left: 70px;">Date To</label>
                                <div class="input-group date" data-provide="datepicker">
                                    <asp:TextBox runat="server" ID="dateTo" CssClass="form-control"></asp:TextBox>
                                    <div class="input-group-addon">
                                        <div class="input-group-text"><i class="fa fa-calendar" style="cursor: pointer; font-size: 17px"></i></div>
                                    </div>
                                </div>

                                <label class="lblModal" style="margin-right: 5px; margin-left: 70px; visibility: hidden;">Date To</label>
                                <asp:LinkButton runat="server" ID="btnSearch" CssClass="btn btn-success" OnClientClick="return cekDate()" OnClick="btnSearch_Click">Search</asp:LinkButton>

                                <label class="lblModal" style="margin-right: 5px; margin-left: 70px; visibility: hidden;">Date To</label>
                                <asp:LinkButton runat="server" ID="btnExport" CssClass="btn btn-success" OnClientClick="return cekDate()" OnClick="btnExport_Click">Export</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="line"></div>
                    </div>
                    <div class="col-12">
                        <label style="margin-top: 0px; font-size: 1.5rem;" class="mb-3"></label>
                        <label style="margin-top: 0px; font-size: 1.5rem;" class="mb-3">List Contactor</label>

                    </div>



                    <div class="row">
                        <label></label>
                    </div>

                    <div class="col-lg-12">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Open</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Close</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">History</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row mt-3"></div>
                                <asp:GridView RowStyle-CssClass="gvGrid" ShowHeaderWhenEmpty="true" EmptyDataText="No Information Available" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvOpen" AutoGenerateColumns="False" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="DarkBlue" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="ID" HeaderText="ID" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="assetNo" HeaderText="Asset No." />
                                        <%--<asp:BoundField ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd}" DataField="dateTime" HeaderText="DATE (Year-Month-Date)" />--%>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="machineNo" HeaderText="Machine No." />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="serialnomc" HeaderText="Serial No. MC" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="model" HeaderText="Model" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="line" HeaderText="Line" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="typecontactor" HeaderText="Contactor Type" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactorcapacity" HeaderText="Contactor Capacity" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypebefore" HeaderText="Contactor Type (Before)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypeafter" HeaderText="Contactor Type (After)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="lastChangeDate" HeaderText="Last Change Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="year" HeaderText="Current Due Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="status" HeaderText="status" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="row mt-3"></div>
                                <asp:GridView RowStyle-CssClass="gvGrid" ShowHeaderWhenEmpty="true" EmptyDataText="No Information Available" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvExpenses_Activity" AutoGenerateColumns="False" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="DarkBlue" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Id" HeaderText="ID" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="assetNo" HeaderText="Asset No." />
                                        <%--<asp:BoundField ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd}" DataField="dateTime" HeaderText="DATE (Year-Month-Date)" />--%>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="machineNo" HeaderText="Machine No." />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="serialnomc" HeaderText="Serial No. MC" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="model" HeaderText="Model" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="line" HeaderText="Line" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="typecontactor" HeaderText="Contactor Type" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactorcapacity" HeaderText="Contactor Capacity" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypebefore" HeaderText="Contactor Type (Before)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypeafter" HeaderText="Contactor Type (After)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="lastChangeDate" HeaderText="Last Change Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="status" HeaderText="status" />
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Blue">
                                            <HeaderTemplate>
                                                ATTACHMENT
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                                                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                                <div class="row mt-3"></div>
                                <asp:GridView RowStyle-CssClass="gvGrid" ShowHeaderWhenEmpty="true" EmptyDataText="No Information Available" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvHistory" AutoGenerateColumns="False" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="DarkBlue" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Id" HeaderText="ID" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="assetNo" HeaderText="Asset No." />
                                        <%--<asp:BoundField ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd}" DataField="dateTime" HeaderText="DATE (Year-Month-Date)" />--%>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="machineNo" HeaderText="Machine No." />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="serialnomc" HeaderText="Serial No. MC" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="model" HeaderText="Model" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="line" HeaderText="Line" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="typecontactor" HeaderText="Contactor Type" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactorcapacity" HeaderText="Contactor Capacity" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypebefore" HeaderText="Contactor Type (Before)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="contactortypeafter" HeaderText="Contactor Type (After)" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="remark" HeaderText="Remarks" />

                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="status" HeaderText="status" />
                                        <%--<asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="status" HeaderText="status" />--%>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>

                       <%--<asp:Button runat="server" ID="btnTestMail" Text="Mail" OnClick="btnTestMail_Click" />--%>
                    </div>


                </div>
        </div>
    </div>
    </form>


    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('.dateFrom').datepicker({
            format: 'yyyy-mm-dd',
            startDate: '-1d',
            autoclose: true
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });

        $('#<%=gvExpenses_Activity.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvExpenses_Activity.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'DESC']],
        });

        $('#<%=gvOpen.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvOpen.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'asc']],
        });

        //$.ajax({
        //    url: "/informationitem.aspx/getInformationItem",
        //    method: 'post',
        //    contentType: "application/json; charset=utf-8",
        //    success: function (data) {
        //        var json = JSON.parse(data.d);
        //        var employeeTable = $('#tblInformation tbody');
        //        employeeTable.empty();
        //        $.each(json, function (index, item) {
        //            employeeTable.append('<tr><td>' + item._model + '</td><td>' + item._dateTime + '</td><td>' + item._model + '</td><td>' + item._line + '</td><td>' + item._cell + '</td><td>' + item._informationItem + '</td><td>' + item._cause + '</td><td>' + item._cause + '</td><td>' + item._purposeBy + '</td><td>' + item._pic + '</td><td></td></tr>');
        //            //console.log(item);
        //        });
        //        $('#tblInformation').dataTable({
        //            deferRender: true,
        //            "order": [[0, 'desc']],
        //        });
        //    },
        //    complete: function () {
        //        $('#loadingImg').hide();
        //    },
        //    error: function (response) {
        //        console.log(response);
        //    }
        //});

        function cekKosong() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            var cause = document.getElementById('<%= txtCause.ClientID %>').value;
            var file = document.getElementById('<%= fileUpload1.ClientID %>').value;
            var purpose = document.getElementById('<%= txtPurposeBy.ClientID %>').value;
            var reason = document.getElementById('<%= txtReason.ClientID %>').value;
            var line = document.getElementById('<%= txtLine.ClientID %>').value;
            var cell = document.getElementById('<%= txtCell.ClientID %>').value;
            var pic = document.getElementById('<%= txtPIC.ClientID %>').value;
            var itemInformation = document.getElementById('<%= txtActivityInformation.ClientID %>').value;


            if (cause == "" || file == "" || purpose == "" || reason == "" || line == "" || cell == "" || pic == "" || itemInformation == "") {
                alert("Mohon lengkapi seluruh data sebelum upload.");
                return false;
            } else {

            }
            document.forms[0].appendChild(confirm_value);

        }

        function cekDate() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            var dateFrom = document.getElementById('<%= dateFrom.ClientID %>').value;
            var dateTo = document.getElementById('<%= dateTo.ClientID %>').value;



            if (dateFrom == "" || dateTo == "") {
                alert("Mohon isi Date From dan Date To dengan lengkap.");
                return false;
            } else if (dateTo <= dateFrom) {
                alert("Date To harus lebih besar dari Date From");
                return false;
            } else {

            }

            document.forms[0].appendChild(confirm_value);
        }


        $('#gvOpen').on('click', 'tr', function () {
            var getID = $('td', this).eq(0).text();
            var getAssetNo = $('td', this).eq(1).text();
            var getMachineNo = $('td', this).eq(2).text();
            var getSerialNo = $('td', this).eq(3).text();
            var getModel = $('td', this).eq(4).text();
            var getLine = $('td', this).eq(5).text();
            var getContactorType = $('td', this).eq(6).text();
            var getContactorCapacity = $('td', this).eq(7).text();
            var getContactorTypeBefore = $('td', this).eq(8).text();
            var getContactorTypeAfter = $('td', this).eq(9).text();
            var getDueDate = $('td', this).eq(11).text();

            getID = getID.replace(/\s/g, '');
            getAssetNo = getAssetNo.replace(/\s/g, '');
            getMachineNo = getMachineNo.replace(/\s/g, '');
            getSerialNo = getSerialNo.replace(/\s/g, '');
            getModel = getModel.replace(/\s/g, '');
            getLine = getLine.replace(/\s/g, '');
            getContactorType = getContactorType.replace(/\s/g, '');
            getContactorCapacity = getContactorCapacity.replace(/\s/g, '');
            getContactorTypeBefore = getContactorTypeBefore.replace(/\s/g, '');
            getContactorTypeAfter = getContactorTypeAfter.replace(/\s/g, '');
            getDueDate = getDueDate.replace(/\s/g, '');

            $('#modalClose').modal("show");

            var setID = document.getElementById("<%=txtID.ClientID%>");
            var setHDidD = document.getElementById("<%=hdID.ClientID%>");
            var setAssetNo = document.getElementById("<%=txtAssetNo.ClientID%>");
            var setHDAssetNo = document.getElementById("<%=hdAssetNo.ClientID%>");
            var setMachineno = document.getElementById("<%=hdMachineNo.ClientID%>");
            var setMachineno2 = document.getElementById("<%=txtMachineNo.ClientID%>");
            var setSerialNo = document.getElementById("<%=hdSerialNo.ClientID%>");
            var setSerialNo2 = document.getElementById("<%=txtSerialNo.ClientID%>");
            var setModel = document.getElementById("<%=ddlModell.ClientID%>");
            var setLine = document.getElementById("<%=ddlLine.ClientID%>");
            var setContactorType = document.getElementById("<%=txtContactorType.ClientID%>");
            var setContactorCapacity = document.getElementById("<%=txtContactorCapacity.ClientID%>");
            var setContactorTypeBefore = document.getElementById("<%=txtContactorTypeBefore.ClientID%>");
            var setContactorTypeAfter = document.getElementById("<%=txtContactorTypeAfter.ClientID%>");
            var setDueDate = document.getElementById("<%=txtDueDate.ClientID%>");
            var setHDduedate = document.getElementById("<%=hdduedate.ClientID%>");


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

            setID.value = getID;
            setHDidD.value = getID;
            setAssetNo.value = getAssetNo;
            setHDAssetNo.value = getAssetNo;
            setMachineno.value = getMachineNo;
            setMachineno2.value = getMachineNo;
            setSerialNo.value = getSerialNo;
            setSerialNo2.value = getSerialNo;
            setModel.selectedIndex = selectedIndex;
            //setLine.value = getLine;
            setContactorType.value = getContactorType;
            setContactorCapacity.value = getContactorCapacity;
            setContactorTypeBefore.value = getContactorTypeBefore;
            setContactorTypeAfter.value = getContactorTypeAfter;
            setDueDate.value = getDueDate;
            setHDduedate.value = getDueDate;
        })

        function cekKosong() {

            var contactorType = document.getElementById('<%= txtContactorType.ClientID %>').value;
            var file = document.getElementById('<%= fileuploadcontactor.ClientID %>').value;



            if (contactorType == "" || file == "") {
                alert("Data tidak boleh kosong.");
                return false;
            } else {

            }

        }

        $('#btnDeleteContactor').click(function () {
            //$(#).show();
            var remark = document.getElementById('<%= txtRemarks.ClientID %>').value;
            var id = document.getElementById('<%= txtID.ClientID %>').value;
            var setHDidD = document.getElementById("<%=hdID.ClientID%>").value;

            if (remark == "") {
                alert('Mohon isi Remark sebelum delete');
                return;
            } else {
                if (confirm('Delete Contactor?')) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        url: 'informationitem.aspx/delete',
                        data: '{ id: ' + JSON.stringify(id) + ', remarks: ' + JSON.stringify(remark) + '}',
                        //data: '{ id: ' + setHDidD + ',remarks: ' + remark + '}',
                        success: function (data, status, xhr) {
                            alert('success delete contactor');
                        },
                        error: function (xhr, status, error) {
                            console.log('fail');
                            alert(xhr.responseText);
                        }
                    })
                } else {

                }
            }


        })



    </script>
</body>
</html>
