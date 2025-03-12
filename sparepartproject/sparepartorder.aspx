<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sparepartorder.aspx.cs" Inherits="sparepartproject.sparepartorder" EnableEventValidation="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>SPI Inventory - Spare Part Order</title>
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
        #btnAddPart {
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

        #txtDateFrom, #txtDateTo {
            font-size: .6rem;
            color: black;
        }

        #btnExport {
            font-size: .6rem;
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

        .input-group-text i {
            font-size: .8rem;
        }

        .input-group-text {
            cursor: pointer;
        }

        #tabela {
            font-size: .7rem;
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
<body style="font-family:Poppins;">

    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components" style="font-weight:500;">
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
                <li class="active">
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
                            <a href="loanlist.aspx">Loan List</a>
                        </li>
                        <li>
                            <a href="sparepartorder.aspx" style="background-color: white; color: #172679;">Order Part</a>
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
               <%-- <li>
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
                <li>
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

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Order Part</h5>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto" style="display: inline;">
                            <li class="nav-item active">
                                <a class="nav-link" id="user" runat="server">GUEST</a>
                            </li>
                            <%--<li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>--%>
                        </ul>
                    </div>
                </div>
            </nav>


            <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-12">
                            <%--<button type="button" id="btnAddPart" class="btn btn-primary text-center" data-toggle="modal" data-target="#modalNewOrderPart">
                                New Order Part
                            </button>--%>
                            <%--                            <button type="button" id="btnAddPartonebyone" class="btn btn-primary text-center" data-toggle="modal" data-target="#myModalonebyone">
                                Add Part
                            </button>--%>
                        </div>

                    </div>
                </div>

                <!-- modal upload data one by one-->
                <!-- The Modal -->
                <div class="modal fade" id="modalNewOrderPart">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">New Order Part (Manual Order)</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOrderPart" OnTextChanged="txtGoodsCodeOrderPart_TextChanged" AutoPostBack="true" runat="server" Width="75%" placeholder="SPI-XXX-XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="upd1" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Now Stock</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtNowStockOrderPart" Enabled="false" runat="server" Width="30%"></asp:TextBox>

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xu7l-6">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Goods Desc</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtGoodsDescOrderPart" Enabled="false" runat="server" Width="70%"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Min Stock</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtMinStockOrderPart" Enabled="false" runat="server" Width="20%"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Goods Name</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtGoodsNameOrderPart" Enabled="false" runat="server" Width="55%"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Min Order</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtMinOrderOrderPart2" Enabled="false" runat="server" Width="35%"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                <ContentTemplate>
                                                    <label class="lblModal">Unit Price</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtUnitPriceOrderPart" Enabled="false" runat="server" Width="65%"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <div class="row">
                                                <%--<a onclick="SaveTableDataManual()" class="p-2 ml-auto mr-3" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Add New Qty</a>--%>
                                            </div>

                                            <table class="table table-sm table-hover mt-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelAddQtyOrderManual">
                                                <thead style="background-color: #2A476B; color: white; text-align: center;">
                                                    <tr>
                                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Qty Order</th>
                                                        <th scope="col" style="vertical-align: middle;">Order to Model</th>

                                                        <th scope="col" style="vertical-align: middle;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="txtQtyOrder" runat="server" Width="60%" TextMode="Number"></asp:TextBox>
                                                            <%--<input type="number" id="TextBox8w" runat="server" value="sds" />--%>
                                                        </td>
                                                        <td>
                                                            <%--<select runat="server" id="sdsdsd">
                                                                <option>BAKER</option>
                                                                <option>Cartoner</option>
                                                                <option>CISS</option>
                                                                
                                                            </select>--%>
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
                                                        <%--<td>
                                                            <a onclick="addField(this)" class="p-1 mt-auto" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Add</a>
                                                        </td>--%>
                                                        <td>
                                                            <%--<a onclick="SomeDeleteRowFunction()" class="p-1 mt-auto" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Remove</a>--%>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <%--<div class="line"></div>
                                    <div class="row" style="margin-top: 50px;">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <div class="row" style="margin: 0;">
                                                        <label class="lblModal" style="float: left; font-size: .9rem; background: #172679; color: white; padding: 5px 10px; border-radius: 5px;">Order Summary </label>
                                                    </div>
                                                    <div class="row" style="margin: 0; margin-top: 20px;">
                                                        <label class="lblModal" style="float: left; font-size: 12px;">Unit Price :</label>
                                                        <label class="lblModal" style="float: left; font-size: 12px;" runat="server" id="lblUnitPrice">&nbsp;</label>
                                                    </div>
                                                    <div class="row" style="margin: 0;">
                                                        <label class="lblModal" style="float: left; font-size: 12px;">Qty Order :</label>
                                                        <label class="lblModal" style="float: left; font-size: 12px;" runat="server" id="lblQtyOrder"></label>
                                                    </div>
                                                    <div class="row" style="margin: 0;">
                                                        <label class="lblModal" style="float: left; font-size: 14px;">Total Price :</label>
                                                        <label class="lblModal" style="float: left; font-size: 14px;" runat="server" id="lblTotalPrice"></label>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtGoodsCodeOrderPart" EventName="TextChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="txtQtyOrder" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="hidden" id="tab_content_manual" name="tab_content_manual" runat="server" />
                                
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                <asp:LinkButton ID="btnOrder" Text="Order Now" CssClass="btn btn-outline-primary text-center" OnClientClick="return cekKosong();" OnClick="btnOrder_Click" runat="server"></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>


                <!--modal order one by one (input qty and line only-->
                <div class="modal fade" id="modalInputQtyAndLine">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">New Order Part (Below Stock Order After Transaction)</h4>
                                <button type="button" class="close" data-dismiss="modal" <%--onclick="javascript:window.location.reload()"--%>>&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Pre Order ID</label>
                                            <input type="hidden" id="hdPreOrderID_" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtPreOrderID" ReadOnly="true" runat="server" Width="45%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Max Stock</label>
                                            <input type="hidden" id="hdMaxStock" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtMaxStock" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <input type="hidden" id="hdGoodsCode" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsCodeReady" ReadOnly="true" runat="server" Width="45%" placeholder="SPI-XXX-XXX"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Now Stock</label>
                                            <input type="hidden" id="hdNowStock" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtNowStockReady" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Name</label>
                                            <input type="hidden" id="hdGoodsName" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsNameReady" ReadOnly="true" runat="server" Width="65%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Min Stock</label>
                                            <input type="hidden" id="hdMinStock" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtMinStockready" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Desc</label>
                                            <input type="hidden" id="hdGoodsDesc" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsDescReady" ReadOnly="true" runat="server" Width="75%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Min Order Qty</label>
                                            <input type="hidden" id="hdMinOrder" name="goods_code" runat="server" />
                                            <asp:TextBox CssClass="form-control" ID="txtMinOrderReady" ReadOnly="true" runat="server" Width="25%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xl-4">
                                        </div>--%>

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                                            <div class="row">
                                                <%--<a onclick="SaveTableData33()" class="p-2 ml-auto mr-3" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Add New Qty</a>--%>
                                            </div>

                                            <table class="table table-sm table-hover mt-3" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelAddQtyOrder">
                                                <thead style="background-color: #2A476B; color: white; text-align: center;">
                                                    <tr>
                                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Qty Order</th>
                                                        <th scope="col" style="vertical-align: middle;">Order to Model</th>
                                                        <th scope="col" style="vertical-align: middle;">Order By</th>
                                                        <th scope="col" style="vertical-align: middle;">Category</th>

                                                        <th scope="col" style="vertical-align: middle;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" Width="60%" TextMode="Number"></asp:TextBox>
                                                            <%--<input type="number" id="TextBox8w" runat="server" value="sds" />--%>
                                                        </td>
                                                        <td>
                                                            <%--<select runat="server" id="sdsdsd">
                                                                <option>BAKER</option>
                                                                <option>Cartoner</option>
                                                                <option>CISS</option>
                                                                
                                                            </select>--%>
                                                            <asp:DropDownList runat="server" CssClass="form-control" Width="75%" ID="DropDownList1">
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
                                                        <%--<td>
                                                            <a onclick="addField(this)" class="p-1 mt-auto" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Add</a>
                                                        </td>--%>
                                                        <td>
                                                            <asp:TextBox CssClass="form-control" ID="txtOrderBy" runat="server" Width="60%"></asp:TextBox>
                                                            <%--<a onclick="SomeDeleteRowFunction()" class="p-1 mt-auto" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Remove</a>--%>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList runat="server" CssClass="form-control" Width="75%" ID="ddlCategory">
                                                                <asp:ListItem>SPAREPART</asp:ListItem>
                                                                <asp:ListItem>ACTIVITY</asp:ListItem>
                                                                
                                                            </asp:DropDownList>
                                                        </td>
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
                                            <%--<label class="lblModal">Input Qty Order</label>--%>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 50px;">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <input type="hidden" id="hdnModel" name="goods_code" runat="server" />
                                            <%--<label class="lblModal">Order To Model</label>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <input type="hidden" id="tab_content" name="tab_content" runat="server" />
                                
                                <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal" <%--onclick="javascript:window.location.reload()"--%>>Close</button>
                                <asp:LinkButton ID="LinkButton2" Text="Delete" OnClick="LinkButton2_Click" CssClass="btn btn-outline-dark text-center" OnClientClick="return cekPreOrderID();" runat="server"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" Text="Order Now" OnClick="LinkButton1_Click" OnClientClick="return cekKosong2();" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>
                <%--<div class="line"></div>--%>
                <div class="col-12">
                    <div class="row align-items-end" style="margin-top: 20px; margin-bottom: 20px;">
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
                            <%--<label class="dataTables_length">View List by Date (Daily List)</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" AutoPostBack="true" ID="txtTanggal" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-lg-5"></div>
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
                            <%--<label class="dataTables_length" style="margin-right: 10px; color: transparent;">Date To</label>--%>
                            <asp:Button CssClass="btn btn-success" runat="server" ID="btnExport" OnClick="btnExport_Click"  Text="Export" />
                        </div>
                         
                    </div>
                    <div class="line"></div>
                    <div class="row">
                        <div class="col-12">
                            <label style="margin-top: 0px; font-size: 1.5rem; font-weight:500;">List Part Minimum Stock After Transaction : </label>
                            <div class="row mt-3"></div>
                            <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabela">
                                <thead style="background-color: #2A476B; color: white; text-align: center;">
                                    <tr>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Pre Order ID</th>
                                        
                                        <th scope="col" style="vertical-align: middle;">Transaction ID</th>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                        <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                        <th scope="col" style="vertical-align: middle;">Goods Desc</th>
                                        <th scope="col" style="vertical-align: middle;">Maker</th>
                                        <th scope="col" style="vertical-align: middle;">Max Stock</th>
                                        <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                        <th scope="col" style="vertical-align: middle;">Min Stock</th>
                                        <th scope="col" style="vertical-align: middle;">Min Order</th>
                                        <th scope="col" style="vertical-align: middle;">Pre Order Qty</th>
                                        <th scope="col" style="vertical-align: middle;">Model</th>
                                        <th scope="col" style="vertical-align: middle;">Issued Date</th>
                                        <%--                                        <th scope="col" style="vertical-align: middle;">Order To Model</th>--%>
                                        <th scope="col" style="vertical-align: middle;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int j = 0; j < dt.Rows.Count; j++)%>
                                    <%{%>
                                    <tr style="text-align: center">
                                        <td class="inputqty" style="width: 3%;">
                                            <%=dt.Rows[j]["preOrderID"]%>
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["SPI_IDissued"]%> 
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["goodsCode"]%>
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["goodsName"]%>
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["goodsDesc"]%>
                                        </td>
                                         <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["maker"]%>
                                        </td>
                                        <td class="inputqty" style="width: 5%;">
                                            <%=dt.Rows[j]["maxStock"]%>
                                        </td>
                                        <td class="inputqty" style="width: 5%;">
                                            <%=dt.Rows[j]["nowStock"]%>
                                        </td>
                                        <td class="inputqty" style="width: 5%;">
                                            <%=dt.Rows[j]["minStock"]%>
                                        </td>
                                        <td class="inputqty" style="width: 5%;">
                                            <%=dt.Rows[j]["minOrder"]%> 
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["preOrderQty"]%><%--&nbsp;&nbsp; &nbsp;<i class="p-1" style="font-size:.5rem; color:white; font-weight:bold; background-color:darkblue; border-radius:5px;">Edit</i>--%>
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["model"]%> 
                                        </td>
                                        <td class="inputqty" style="width: 10%;">
                                            <%=dt.Rows[j]["datePreOrder"]%> 
                                        </td>
                                        
                                        <%--<td>
                                            <input type="text" class="nr" name="qty" /></td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="sas">
                                                <asp:ListItem>BAKER</asp:ListItem>
                                                <asp:ListItem>Cartoner</asp:ListItem>
                                                <asp:ListItem>CISS</asp:ListItem>
                                                <asp:ListItem>CRAIG / LEGERO</asp:ListItem>
                                                <asp:ListItem>Fraser</asp:ListItem>
                                                <asp:ListItem>GERE MOLLY</asp:ListItem>
                                                <asp:ListItem>Hav 3D</asp:ListItem>
                                                <asp:ListItem>Hav Large</asp:ListItem>
                                                <asp:ListItem>HAV3-P</asp:ListItem>
                                                <asp:ListItem>Ink Blending</asp:ListItem>
                                                <asp:ListItem>KUROBE</asp:ListItem>
                                                <asp:ListItem>KUZURYU</asp:ListItem>
                                                <asp:ListItem>LANTANA</asp:ListItem>
                                                <asp:ListItem>LFP</asp:ListItem>
                                                <asp:ListItem>MASHU</asp:ListItem>
                                                <asp:ListItem>NASUNO</asp:ListItem>
                                                <asp:ListItem>NASUNO 3</asp:ListItem>
                                                <asp:ListItem>NEYMAR</asp:ListItem>
                                                <asp:ListItem>ORPHEUS</asp:ListItem>
                                                <asp:ListItem>Sakura</asp:ListItem>
                                                <asp:ListItem>SAROMA/COSTNER</asp:ListItem>
                                                <asp:ListItem>SHETLAND</asp:ListItem>
                                                <asp:ListItem>SUB 1</asp:ListItem>
                                                <asp:ListItem>SUB 2</asp:ListItem>
                                                <asp:ListItem>TAKASE</asp:ListItem>
                                            </asp:DropDownList>

                                        </td>--%>
                                        <td>
                                            <input type="hidden" id="row_value" name="row_value" runat="server" />
                                            <i class="fas fa-search p-1" style="color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;"></i>
                                            <%--OnClientClick="SaveTableData(this);" OnClick="btnOrderNow_Click"--%>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
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
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        var counter = 1;
        var counter2 = 1
        $(document).ready(function () {
            var role = sessionStorage.getItem("role");
            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
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

            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });

        $.fn.datepicker.defaults.format = "yyyy-mm-dd";
        $('.datepicker').datepicker({
            icons: {
                previous: "fas fa-chevron-left",
                next: "fas fa-chevron-right",
            },
            autoClose: true,

        });


        <%--function cekvalue() {
            alert(<%=txtGoodsCodeReady.Text %>);
        }--%>

        function cekKosong() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var goodsCode = document.getElementById('<%= txtGoodsCodeOrderPart.ClientID %>').value;
            var goodsDesc = document.getElementById('<%= txtGoodsDescOrderPart.ClientID %>').value;
            var goodsName = document.getElementById('<%= txtGoodsNameOrderPart.ClientID %>').value;
            var minOrder = document.getElementById('<%= txtMinOrderOrderPart2.ClientID %>').value;
            var minStock = document.getElementById('<%= txtMinStockOrderPart.ClientID %>').value;
            var nowStock = document.getElementById('<%= txtNowStockOrderPart.ClientID %>').value;
            var qtyOrder = document.getElementById('<%= txtQtyOrder.ClientID %>').value;
            var unitPrice = document.getElementById('<%= txtUnitPriceOrderPart.ClientID %>').value;

            if (goodsCode == "" || goodsDesc == "" || goodsName == "" || minStock == "" || nowStock == "" || qtyOrder == "" || unitPrice == "") {
                alert("Data belum lengkap, silahkan lengkapi data terlebih dahulu.");
                return false;
            } else {
                //if (minOrder > qtyOrder) {
                //    alert("Qty Order tidak boleh kurang dari Min Order");
                //    return false;
                //}
                
                //document.forms[0].appendChild(confirm_value);
            }
            saveDataManual();
        }

        function disposeTree(sender, args) {
            var elements = args.get_panelsUpdating();
            for (var i = elements.length - 1; i >= 0; i--) {
                var element = elements[i];
                var allnodes = element.getElementsByTagName('*'),
                    length = allnodes.length;
                var nodes = new Array(length)
                for (var k = 0; k < length; k++) {
                    nodes[k] = allnodes[k];
                }
                for (var j = 0, l = nodes.length; j < l; j++) {
                    var node = nodes[j];
                    if (node.nodeType === 1) {
                        if (node.dispose && typeof (node.dispose) === "function") {
                            node.dispose();
                        }
                        else if (node.control && typeof (node.control.dispose) === "function") {
                            node.control.dispose();
                        }

                        var behaviors = node._behaviors;
                        if (behaviors) {
                            behaviors = Array.apply(null, behaviors);
                            for (var k = behaviors.length - 1; k >= 0; k--) {
                                behaviors[k].dispose();
                            }
                        }
                    }
                }
                element.innerHTML = "";
            }
        }
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoading(disposeTree);

        $('#tabela').dataTable(
            {
                "order": [[0, "desc"]]
            });

        function SaveTableData(el) {
            var arrValues = new Array();
            var number = $(el).closest('tr').index();
            var sourceTable = document.getElementById('tabela');
            var getPreOrderID = $('td', sourceTable.rows[number + 1]).eq(0).text();
            var getGoodsCode = $('td', sourceTable.rows[number + 1]).eq(1).text();
            var getGoodsName = $('td', sourceTable.rows[number + 1]).eq(2).text();
            var getGoodsDesc = $('td', sourceTable.rows[number + 1]).eq(3).text();
            var getNowStock = $('td', sourceTable.rows[number + 1]).eq(4).text();
            var getMinStock = $('td', sourceTable.rows[number + 1]).eq(5).text();
            var getMinOrder = $('td', sourceTable.rows[number + 1]).eq(6).text();
            var getOrderQty = $(this).closest('tabela').find('.qty').val(); //  $('td', sourceTable.rows[number + 1]).eq(7).text(); 
            var getOrdertoModel = $('td', sourceTable.rows[number + 1]).eq(8).text();
            getPreOrderID = getPreOrderID.replace(/\s/g, '');
            getGoodsCode = getGoodsCode.replace(/\s/g, '');
            getGoodsName = getGoodsName.replace(/\s/g, '');
            getGoodsDesc = getGoodsDesc.replace(/\s/g, '');
            getNowStock = getNowStock.replace(/\s/g, '');
            getMinStock = getMinStock.replace(/\s/g, '');
            getMinOrder = getMinOrder.replace(/\s/g, '');
            getOrderQty = getOrderQty.replace(/\s/g, '');
            getOrdertoModel = getOrdertoModel.replace(/\s/g, '');
            arrValues.push(getPreOrderID, getGoodsCode, getGoodsName, getGoodsDesc, getNowStock, getMinStock, getMinOrder, getOrderQty, getOrdertoModel);
            alert(arrValues);


            //for (var c = 0; c < sourceTable.rows[number].cells.length; c++) {
            //    var element = sourceTable.rows.item(number).cells[c].value;
            //    ////element = element.replace(/\s/g, '');
            //    //arrValues.push("" + element.childNodes[c].value + "");
            //    alert(element);
            //}
            ////alert(arrValues);



            //for (var r = number, n = number; r = n; r++) {
            //    for (var c = 0, m = sourceTable.rows[r].cells.length; c < m; c++) {
            //        arrValues.push(sourceTable.rows[r].cells[c].childNodes[0].value);
            //    }
            //}
            //alert(arrValues);
            //sourceTable.rows[r].cells[c].innerHTML
            //var textboxVal = 
        };

        $('#tabela').on('click', 'tr', function () {
            var getPreOrderID = $('td', this).eq(0).text();
            var getGoodsCode = $('td', this).eq(2).text();
            var getGoodsName = $('td', this).eq(3).text();
            var getGoodsDesc = $('td', this).eq(4).text();
            var getNowStock = $('td', this).eq(7).text();
            var getMinStock = $('td', this).eq(8).text();
            var getMinOrder = $('td', this).eq(9).text();
            var getPreOrderQty = $('td', this).eq(10).text();
            var getModel = $('td', this).eq(11).text();
            var getMaxStock = $('td', this).eq(6).text();

            getMaxStock = getMaxStock.replace(/\s/g, '');
            getPreOrderID = getPreOrderID.replace(/\s/g, '');
            getGoodsCode = getGoodsCode.replace(/\s/g, '');
            getGoodsName = getGoodsName.replace(/\s/g, '');
            getGoodsDesc = getGoodsDesc.replace(/\s/g, '');
            getNowStock = getNowStock.replace(/\s/g, '');
            getMinStock = getMinStock.replace(/\s/g, '');
            getMinOrder = getMinOrder.replace(/\s/g, '');
            getPreOrderQty = getPreOrderQty.replace(/\s/g, '');
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


            $('#modalInputQtyAndLine').modal("show");

            var goodsCode = document.getElementById("<%=txtGoodsCodeReady.ClientID%>");
            var goodsName = document.getElementById("<%=txtGoodsNameReady.ClientID%>");
            var goodsDesc = document.getElementById("<%=txtGoodsDescReady.ClientID%>");
            var nowStock = document.getElementById("<%=txtNowStockReady.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockready.ClientID%>");
            var minOrder = document.getElementById("<%=txtMinOrderReady.ClientID%>");
            var preOrderQty = document.getElementById("<%=TextBox8.ClientID%>");
            var preOrderID = document.getElementById("<%=txtPreOrderID.ClientID%>");
            var maxStock = document.getElementById("<%=txtMaxStock.ClientID%>");


            var opt = document.createElement("option");
            opt.text = getModel;
            opt.value = getModel;
            var model = document.getElementById("<%=DropDownList1.ClientID%>");
            //.options.add(opt)


            var setModel = document.getElementById("<%=hdnModel.ClientID%>");

            maxStock.value = getMaxStock;
            model.selectedIndex = selectedIndex;
            preOrderID.value = getPreOrderID;
            goodsCode.value = getGoodsCode;
            goodsName.value = getGoodsName;
            goodsDesc.value = getGoodsDesc;
            nowStock.value = getNowStock;
            minStock.value = getMinStock;
            minOrder.value = getMinOrder;
            preOrderQty.value = getPreOrderQty;
            setModel.value = getModel;

            var setGoodsCode = document.getElementById("<%=hdGoodsCode.ClientID%>");
            var setGoodsName = document.getElementById("<%=hdGoodsName.ClientID%>");
            var setGoodsDesc = document.getElementById("<%=hdGoodsDesc.ClientID%>");
            var setNowStock = document.getElementById("<%=hdNowStock.ClientID%>");
            var setMinStock = document.getElementById("<%=hdMinStock.ClientID%>");
            var setMinOrder = document.getElementById("<%=hdMinOrder.ClientID%>");
            var setPreOrderID = document.getElementById("<%=hdPreOrderID.ClientID%>");
            var setPreOrderQty = document.getElementById("<%=hdMinOrder.ClientID%>");
            var setMaxStock = document.getElementById("<%=hdMaxStock.ClientID%>");
            var setOrderQty = document.getElementById("<%=TextBox8.ClientID%>");

            setPreOrderID.value = getPreOrderID;
            setGoodsCode.value = goodsCode.value;
            setGoodsName.value = goodsName.value;
            setGoodsDesc.value = goodsDesc.value;
            setNowStock.value = nowStock.value;
            setMinStock.value = minStock.value;
            setMinOrder.value = minOrder.value;
            setMaxStock.value = maxStock.value;

            var total;
            total = +maxStock.value - +nowStock.value;
            setOrderQty.value = total;
            console.log(total);

            //alert(setPreOrderID.value);
        });

        function cekKosong2() {
            var qty = document.getElementById('<%= TextBox8.ClientID %>').value;
            var orderBy =document.getElementById('<%= txtOrderBy.ClientID %>').value;
            var maxStock = document.getElementById('<%= txtMaxStock.ClientID %>').value;
            var nowStock =document.getElementById('<%= txtNowStockReady.ClientID %>').value;
            if (qty == "" || orderBy == "" ) {
                alert("Data Input Qty Order dan Order By tidak boleh kosong");
                //cekMaxStock();
                return false;
            } else {
           
            }
            saveData();
        }

        function cekMaxStock() {
            var qty = document.getElementById('<%= TextBox8.ClientID %>').value;
            var maxStock = document.getElementById('<%= txtMaxStock.ClientID %>').value;
            var nowStock =document.getElementById('<%= txtNowStockReady.ClientID %>').value;
            var total = Number(qty) + Number(nowStock);
            if (Number(total)> Number(maxStock)) {
                alert("Data Order Qty (Order Qty + Now Stock) tidak boleh melebihi Max Stock");
                return false;
            } else {
            }
        }

        function cekPreOrderID() {
            var qty = document.getElementById('<%= txtPreOrderID.ClientID %>').value;
            if (qty == "") {
                alert("Pre Order ID tidak boleh kosong");
                return false;
            } else {
                //saveData();
            }
            //saveData();
            //get();
        }

        function addField(n) {
            var tr = n.parentNode.parentNode.cloneNode(true);
            document.getElementById('tabelAddQtyOrder').appendChild(tr);
        }

        function SomeDeleteRowFunction() {
            // event.target will be the input element.
            var td = event.target.parentNode;
            var tr = td.parentNode; // the row to be removed
            tr.parentNode.removeChild(tr);
        }

        function SaveTableData33() {
            var myTab = document.getElementById('tabelAddQtyOrder');
            var empTab = document.getElementById('tabelAddQtyOrder');
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
                    var array = ["AUTOPACK","CARTONER","CISS","COMMON","COSTNER/SAROMA","FOAM SUPPORT","GAGA","HAV CRAIG","HAV3D","HAV3P","INK BLENDING","KUZURYU","LEGGERO","LFP","NASUNO","NASUNO 3","NEYMAR","OTHERS","SAKURA","SEALING","SPI","SUB","TANIGAWA","DEVICE","301","AUTO GUIDE CAP"];
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
                    var array = ["SPAREPART","ACTIVITY"];
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

        function SaveTableDataManual() {
            var myTab = document.getElementById('tabelAddQtyOrderManual');
            var empTab = document.getElementById('tabelAddQtyOrderManual');
            var rowCnt = empTab.rows.length;   // table row count.
            var tr = empTab.insertRow(rowCnt); // the table row.
            tr = empTab.insertRow(rowCnt);
            var arrValuesManual = new Array();

            for (var c = 0; c < 3; c++) {
                var td = document.createElement('td'); // table definition.
                td = tr.insertCell(c);
                //$('td').css('background-color', 'transparent');
                td.style.backgroundColor = "white";
                if (c == 2) {      // the first column.
                    // add a button in every new row in the first column.
                    var button = document.createElement('input');

                    // set input attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's 'onclick' event.
                    button.setAttribute('onclick', 'removeRowManual(this)');

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
                    var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
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
            //document.getElementById("tab_content_manual").value = arrValuesManual;
            counter2 = counter2 + 1;
            console.log(counter2);
        };

        function removeRow(oButton) {
            var empTab = document.getElementById('tabelAddQtyOrder');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counter = counter - 1;
            console.log(counter);
            //document.getElementById("rowCount").value = counter;
            //console.log(counter);
        }

        function removeRowManual(oButton) {
            var empTab = document.getElementById('tabelAddQtyOrderManual');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counter2 = counter2 - 1;
            console.log(counter2);
            //document.getElementById("rowCount").value = counter;
            //console.log(counter);
        }

        function saveData() {
            var myTab = document.getElementById('tabelAddQtyOrder');
            var qty1 = document.getElementById('TextBox8').value;
            var pic1 = document.getElementById('txtOrderBy').value;
            var cat1 = document.getElementById('ddlCategory').value;
            var model1 = document.getElementById('DropDownList1').value;
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
            document.getElementById("tab_content").value = arrValues;

        }

        function saveDataManual() {
            var myTab = document.getElementById('tabelAddQtyOrderManual');
            var qty1 = document.getElementById('txtQtyOrder').value;
            var model1 = document.getElementById('ddlModel').value;
            var remove = "Remove";
            var arrValuesManual = new Array();
            arrValuesManual.push(qty1);
            arrValuesManual.push(model1);
            arrValuesManual.push(remove);
            for (row = 2; row < myTab.rows.length - 1; row++) {
                for (c = 0; c < myTab.rows[row].cells.length; c++) {
                    var element = myTab.rows.item(row).cells[c];
                    arrValuesManual.push("" + element.childNodes[0].value + "");
                }
            }
            console.log(arrValuesManual);
            document.getElementById("tab_content_manual").value = arrValuesManual;

        }


        $('#modalInputQtyAndLine').on('hidden.bs.modal', function () {
            window.location.reload();
        })
    </script>
</body>
</html>
