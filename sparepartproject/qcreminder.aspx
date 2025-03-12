<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qcreminder.aspx.cs" Inherits="sparepartproject.qcreminder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>SPI Inventory - QC Reminder</title>
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

        #ddlBulan {
            padding: 2px 4px;
            font-size: .8rem;
            margin: 0px;
        }

        #btnInsertData {
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

        #btnExport {
            font-size: .6rem;
        }

        .input-group-text {
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
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components">
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
                    </ul>
                </li>
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
                <li class="active">
                    <a href="qcreminder.aspx">QC Check Reminder</a>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">QC Check Reminder</h5>
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
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-12">
                        <button type="button" id="btnInsertData" class="btn btn-primary text-center" onclick="window.location.href = 'qcreminder_insertnew.aspx'">
                            Insert Data
                        </button>
                    </div>
                    <!-- The Modal -->
                    <%--<div class="modal fade" id="modalInsertData">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">QC Check Reminder - Insert New Data</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <label class="lblModal">Goods Name</label>
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtGoodsName" runat="server" Width="65%"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <label class="lblModal">Issued To Model</label>
                                                <asp:DropDownList runat="server" ID="ddlModel" CssClass="form-control" Width="50%">
                                                    <asp:ListItem>CISS</asp:ListItem>
                                                    <asp:ListItem>NASUNO</asp:ListItem>
                                                    <asp:ListItem>NASUNO 3</asp:ListItem>
                                                    <asp:ListItem>HAV 3P</asp:ListItem>
                                                    <asp:ListItem>HAV 3D</asp:ListItem>
                                                    <asp:ListItem>301</asp:ListItem>
                                                    <asp:ListItem>LFP</asp:ListItem>
                                                    <asp:ListItem>SAKURA</asp:ListItem>
                                                    <asp:ListItem>GAGA</asp:ListItem>
                                                    <asp:ListItem>KUZURYU</asp:ListItem>
                                                    <asp:ListItem>SAROMA</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                                <label class="lblModal">Issued Date</label>
                                                <div class="input-group date" data-provide="datepicker">
                                                    <asp:TextBox CssClass="form-control" ID="txtTanggal" runat="server" Width="40%"></asp:TextBox>
                                                    <div class="input-group-addon">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3"></div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <label class="lblModal">Order By</label>
                                                        <asp:TextBox CssClass="form-control" ID="txtMinStockIssuedPart" Enabled="true" runat="server" Width="40%"></asp:TextBox>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtGoodsName" EventName="TextChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row mb-5">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <label class="lblModal">Qty</label>
                                                        <asp:TextBox CssClass="form-control" ID="txtGoodsNameIssuedPart" Enabled="true" runat="server" Width="20%"></asp:TextBox>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtGoodsName" EventName="TextChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <label class="lblModal">Purpose</label>
                                                        <asp:TextBox CssClass="form-control" style="height:100px" ID="txtMinOrderissuedPart" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtGoodsName" EventName="TextChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-danger text-center" data-dismiss="modal">Close</button>
                                   
                                    <asp:LinkButton ID="btnOrder" Text="Issued Now" CssClass="btn btn-outline-primary text-center" runat="server"></asp:LinkButton>

                                </div>

                            </div>
                        </div>
                    </div>--%>
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
    <script type="text/javascript">
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    </script>


</body>
</html>
