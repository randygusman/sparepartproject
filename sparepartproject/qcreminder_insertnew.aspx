<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qcreminder_insertnew.aspx.cs" Inherits="sparepartproject.qcreminder_insertnew" %>

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
        .nav-tabs .nav-link .active{
                border-color: #007fff #007fff #fff;
                color:#007fff;
        }

        #btnApprovedd {
            font-size: .7rem;
            border-radius:5px;
        }

        #btnApproved2 {
            font-size: .7rem;
            border-radius:5px;
        }

        #btnReturn {
            font-size: .7rem;
            border-radius:5px;
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

        #ddlBulan {
            padding: 2px 4px;
            font-size: .8rem;
            margin: 0px;
        }

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
                        <li>
                            <a href="closedactivity.aspx">Closed Activity</a>
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
                <div class="row">

                    <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
                    <div class="col-12">

                        <button type="button" id="btnAddPart" class="btn btn-primary text-center" data-toggle="modal" data-target="#modalInsertData">
                            Insert Data
                        </button>

                        <%--<asp:Button ID="asd" runat="server" OnClick="asd_Click" Text="Export" />--%>
                        <%--<asp:Button CssClass="btn btn-danger" runat="server" ID="asdasd" OnClick="asdasd_Click" Text="asdasd" />--%>
                    </div>

                    <!-- The Modal -->
                    <div class="modal fade" id="modalInsertData">
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

                                                <label class="lblModal">Order By</label>
                                                <%--<asp:TextBox CssClass="form-control" AutoPostBack="true" runat="server" Width="40%" OnTextChanged="txtEmployeNo_TextChanged" ID="txtEmployeNo"></asp:TextBox>--%>
                                                <asp:DropDownList runat="server" ID="ddlSpv" CssClass="form-control" Width="50%">
                                                    <asp:ListItem>ADI SETIAWAN</asp:ListItem>
                                                    <asp:ListItem>AJI NUGROHO</asp:ListItem>
                                                    <asp:ListItem>ANDRE HERMAWAN</asp:ListItem>
                                                    <asp:ListItem>CAHYO NUGROHO</asp:ListItem>
                                                    <asp:ListItem>DAVID HERMANTO</asp:ListItem>
                                                    <asp:ListItem>DEDY NURROCHMAN</asp:ListItem>
                                                    <asp:ListItem>DENI ARI WIJAYA</asp:ListItem>
                                                    <asp:ListItem>DIDIK WAHYU HADI SETYAWAN</asp:ListItem>
                                                    <asp:ListItem>EKO HARTANTO</asp:ListItem>
                                                    <asp:ListItem>FIRDAUS</asp:ListItem>
                                                    <asp:ListItem>JOKO PRAMONO</asp:ListItem>
                                                    <asp:ListItem>MOH IKROM HADI</asp:ListItem>
                                                    <asp:ListItem>RIFQI USMAN</asp:ListItem>
                                                    <asp:ListItem>SOLFITRIANTO</asp:ListItem>
                                                    <asp:ListItem>SURYONO TALWIBOWO</asp:ListItem>
                                                    <asp:ListItem>WASCADI</asp:ListItem>
                                                    <asp:ListItem>YANUAR ALIF ANDRIANSYAH</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <label class="lblModal">PO Number</label>
                                                <asp:TextBox CssClass="form-control" Enabled="true" ID="txtPOnumber" runat="server" Width="65%"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">

                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <label class="lblModal">Qty</label>
                                                        <asp:TextBox CssClass="form-control" ID="txtQty" Enabled="true" runat="server" Width="20%"></asp:TextBox><br />

                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="txtGoodsName" EventName="TextChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>



                                        <div class="row mb-5">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <label class="lblModal">Purpose</label>
                                                        <asp:TextBox CssClass="form-control" Style="height: 100px" ID="txtPurpose" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
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
                                    <asp:LinkButton ID="btnOrder" Text="Insert Now" OnClick="btnOrder_Click" CssClass="btn btn-outline-primary text-center" OnClientClick="return cekKosong();" runat="server"></asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row align-items-end" style="margin-top: 20px; margin-bottom: 20px;">
                    <div class="col-lg-2 ml-auto">
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
                        <asp:Button CssClass="btn btn-success" runat="server" ID="btnExport" OnClick="asd_Click" Text="Export" />
                    </div>

                </div>
                <div class="line"></div>
                <div class="col-12">
                    <div class="row mt-4">
                        <div class="col-12">
                            <label style="margin-top:0px; font-size:1.5rem;" class="mb-3">List QC Data</label>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Progress</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="return-tab" data-toggle="tab" href="#return" role="tab" aria-controls="return" aria-selected="false">Return</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Complete</a>
                                </li>
                                <li class="ml-auto">
                                    
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row mt-3">
                                        <asp:LinkButton CssClass="nav-link btn-primary ml-auto mb-3 mr-2" OnClick="asdasd_Click" runat="server" ID="btnApprovedd">Approve</asp:LinkButton>
                                        <asp:LinkButton CssClass="nav-link btn-warning ml-2 mb-3 mr-3" runat="server" ID="btnReturn" OnClick="btnReturn_Click">Return</asp:LinkButton>
                                        <div class="col-12">
                                            <asp:GridView runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvDataProgress" AutoGenerateColumns="False" AllowSorting="True">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                <Columns>
                                                    <asp:BoundField DataField="QC_ID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="ID" SortExpression="QC_ID" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="po_number" HeaderText="PO No" HeaderStyle-BackColor="#172679" SortExpression="po_number" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="model" HeaderText="Model" HeaderStyle-BackColor="#172679" SortExpression="model" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="insertDate" HeaderText="Insert Date" HeaderStyle-BackColor="#172679" SortExpression="insertDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="orderBy" HeaderText="Order By" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="orderBy"></asp:BoundField>
                                                    <asp:BoundField DataField="qty" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Qty" SortExpression="qty"></asp:BoundField>
                                                    <asp:BoundField DataField="purpose" ItemStyle-Width="700px" HeaderStyle-BackColor="#172679" HeaderText="Purpose" ItemStyle-HorizontalAlign="Center" SortExpression="purpose"></asp:BoundField>
                                                    <asp:TemplateField HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="headerCheckBox" Text="Select All" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox2" runat="server" CssClass="rowCheckBox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                <%--COMPLETE SECTION--%>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <asp:GridView runat="server" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvCompleteData" AutoGenerateColumns="False" AllowSorting="True">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                <Columns>
                                                    <asp:BoundField DataField="QC_ID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="ID" SortExpression="QC_ID" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="po_number" HeaderText="PO No" HeaderStyle-BackColor="#172679" SortExpression="po_number" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="model" HeaderText="Model" HeaderStyle-BackColor="#172679" SortExpression="model" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="insertDate" HeaderText="Insert Date" HeaderStyle-BackColor="#172679" SortExpression="insertDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="orderBy" HeaderText="Order By" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="orderBy"></asp:BoundField>
                                                    <asp:BoundField DataField="qty" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Qty" SortExpression="qty"></asp:BoundField>
                                                    <asp:BoundField DataField="purpose" ItemStyle-Width="700px" HeaderStyle-BackColor="#172679" HeaderText="Purpose" ItemStyle-HorizontalAlign="Center" SortExpression="purpose"></asp:BoundField>
                                                    <asp:BoundField DataField="completeDate" HeaderStyle-BackColor="#172679" HeaderText="Complete Date" ItemStyle-HorizontalAlign="Center" SortExpression="completeDate"></asp:BoundField>

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                 <%--COMPLETE SECTION--%>
                                <div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
                                    <div class="row mt-3">
                                        <asp:LinkButton CssClass="nav-link btn-primary ml-auto mb-3 mr-3" OnClick="btnApproved2_Click" runat="server" ID="btnApproved2">Approve</asp:LinkButton>
                                        <div class="col-12">
                                            <asp:GridView runat="server" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvReturn" AutoGenerateColumns="False" AllowSorting="True">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                <Columns>
                                                    <asp:BoundField DataField="QC_ID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="ID" SortExpression="QC_ID" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="po_number" HeaderText="PO No" HeaderStyle-BackColor="#172679" SortExpression="po_number" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="model" HeaderText="Model" HeaderStyle-BackColor="#172679" SortExpression="model" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="insertDate" HeaderText="Insert Date" HeaderStyle-BackColor="#172679" SortExpression="insertDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="orderBy" HeaderText="Order By" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="orderBy"></asp:BoundField>
                                                    <asp:BoundField DataField="qty" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Qty" SortExpression="qty"></asp:BoundField>
                                                    <asp:BoundField DataField="purpose" ItemStyle-Width="700px" HeaderStyle-BackColor="#172679" HeaderText="Purpose" ItemStyle-HorizontalAlign="Center" SortExpression="purpose"></asp:BoundField>
                                                    <asp:TemplateField HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="headerCheckBox" Text="Select All" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox2" runat="server" CssClass="rowCheckBox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>

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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [QC_ID], [goodsName], [model], [insertDate], [orderBy], [qty],[PO_number], [purpose] FROM [SPI_QC_CheckReminder] WHERE ([status] = 'PROGRESS') ORDER BY QC_ID ASC"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [QC_ID], [completeDate], [goodsName], [model], [insertDate], [orderBy],[PO_number], [qty], [purpose] FROM [SPI_QC_CheckReminder] WHERE ([status] = 'COMPLETE') ORDER BY QC_ID DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [QC_ID], [completeDate], [goodsName], [model], [insertDate], [orderBy],[PO_number], [qty], [purpose] FROM [SPI_QC_CheckReminder] WHERE ([status] = 'RETURN') ORDER BY QC_ID DESC"></asp:SqlDataSource>
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


        function cekKosong() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            var goodsName = document.getElementById('<%= txtGoodsName.ClientID %>').value;
            var tanggal = document.getElementById('<%= txtTanggal.ClientID %>').value;
            
            var qty = document.getElementById('<%= txtQty.ClientID %>').value;
            var purpose = document.getElementById('<%= txtPurpose.ClientID %>').value;

            var ponumber = document.getElementById('<%= txtPOnumber.ClientID %>').value;

            if (goodsName == "" || tanggal == "" ||/* empNo == "" ||*/ qty == "" || purpose == "" || ponumber == "") {
                alert("Data belum lengkap, mohon lengkapi data terlebih dahulu");
                return false;
            } else {

            }
            //if (confirm("Close problem " + problem + " on " + model + " line " + line + " ? ")) {
            //    confirm_value.value = "Yes";
            //    alert("Close problem success");
            //    //return true;
            //} else {
            //    confirm_value.value = "No";
            //    return false;
            //}
            document.forms[0].appendChild(confirm_value);

        }


        $('#<%=gvDataProgress.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvDataProgress.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

        $('#<%=gvCompleteData.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCompleteData.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

        $('#<%=gvReturn.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvReturn.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

       <%-- $(document).ready(function () {
            $("#<%= gvDataProgress.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvDataProgress.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });
        });--%>

        $(document).ready(function () {
            $("#<%= gvDataProgress.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvDataProgress.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });

            $("#<%= gvReturn.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvReturn.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });
        });
    </script>


</body>
</html>
