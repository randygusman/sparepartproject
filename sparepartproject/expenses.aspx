<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="expenses.aspx.cs" Inherits="sparepartproject.expenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Sparepart Inventory - Pre Expenses</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <%--<link rel="stylesheet" href="Style/font-awesome.cs's" />--%>
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="Scripts/fontawesome.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />
    <link href="Style/select2.min.css" rel="stylesheet" />

    <style>
        #selectModel {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input */
            font-size: .8rem; /* Mengatur ukuran font pada input */
        }

        /* Mengatur font family dan ukuran font untuk dropdown select2 */
        .select2-container .select2-selection--single {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input dropdown */
            font-size: .8rem; /* Mengatur ukuran font pada input dropdown */
        }

        /* Mengatur font family dan ukuran font pada list dropdown */
        .select2-container .select2-results__option {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada pilihan dropdown */
            font-size: .8rem; /* Mengatur ukuran font pada pilihan dropdown */
        }

        .select2-container .select2-search__field {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input search */
            font-size: .8rem; /* Mengatur ukuran font pada input search */
        }

        #gvExpenses {
            font-size: .7rem;
        }

        #gvExpenses_Activity {
            font-size: .7rem;
        }

        #gvExpensesUncountingPart {
            font-size: .7rem;
        }

        #gvUncountingAct {
            font-size: .7rem;
        }

        #btnNewOrder {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
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

        .gvGrid:hover td, .even:hover td {
            background-color: #d4d4d4;
        }

        #btnExport {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnExport_Activity {
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

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Pre Expenses</h5>
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
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="row mt-3">
                    <div class="col-12">
                        <%--<asp:Button ID="btnNewOrder" CssClass="btn btn-primary text-center" runat="server" Text="New Order" data-toggle="modal" data-target="#modalNewOrder" />--%>
                        <button type="button" id="btnNewOrder" runat="server" class="btn btn-primary text-center" data-toggle="modal" data-target="#modalNewOrder">
                            New Order
                        </button>
                    </div>
                </div>

                <!-- modal insert new manual order -->
                <div class="modal fade" id="modalNewOrder">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Manual Order Part</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Part Name</label>
                                            <asp:TextBox CssClass="form-control" Enabled="true" ID="txtPartName" runat="server" Width="65%"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Order To Model</label>
                                            <%--<asp:DropDownList runat="server" ID="ddlModel" CssClass="form-control" Width="50%">
                                                <asp:ListItem>AUTOPACK</asp:ListItem>
                                                <asp:ListItem>CARTONER</asp:ListItem>
                                                <asp:ListItem>CISS</asp:ListItem>
                                                <asp:ListItem>COMMON</asp:ListItem>
                                                <asp:ListItem>COSTNER/SAROMA</asp:ListItem>
                                                <asp:ListItem>FOAM SUPPORT</asp:ListItem>
                                                <asp:ListItem>GAGA</asp:ListItem>
                                                <asp:ListItem>HAV CRAIG</asp:ListItem>
                                                <asp:ListItem>HAV3D</asp:ListItem>
                                                <asp:ListItem>HAV3P</asp:ListItem>
                                                <asp:ListItem>HOKUSAI</asp:ListItem>
                                                <asp:ListItem>INK BLENDING</asp:ListItem>
                                                <asp:ListItem>KUZURYU</asp:ListItem>
                                                <asp:ListItem>LANTANA</asp:ListItem>
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
                                            </asp:DropDownList>--%>
                                            <select class="form-control" id="selectModel" required>
                                                <option value="">-- Pilih Model --</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                            <%--<label class="lblModal">Issued Date</label>
                                            <div class="input-group date" data-provide="datepicker">
                                                <asp:TextBox CssClass="form-control" ID="txtTanggal" runat="server" Width="40%"></asp:TextBox>
                                                <div class="input-group-addon">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>--%>
                                            <label class="lblModal">Goods Desc</label>
                                            <asp:TextBox CssClass="form-control" Enabled="true" ID="txtGoodsDesc" runat="server" Width="65%"></asp:TextBox>

                                        </div>
                                        <div class="col-lg-3"></div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">

                                            <%--<label class="lblModal">Vendor</label>
                                            <asp:DropDownList runat="server" ID="ddlVendor" CssClass="form-control" Width="50%">
                                                <asp:ListItem>LOCAL</asp:ListItem>
                                                <asp:ListItem>OVERSEA</asp:ListItem>
                                            </asp:DropDownList>--%>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <label class="lblModal">Qty</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtQty" Enabled="true" runat="server" Width="20%"></asp:TextBox><br />

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtPartName" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Maker</label>
                                            <asp:TextBox CssClass="form-control" Enabled="true" ID="txtMaker" runat="server" Width="65%"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">PIC</label>
                                            <asp:TextBox CssClass="form-control" ID="txtPIC" Enabled="true" runat="server" Width="20%"></asp:TextBox><br />

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Category</label>
                                            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control" Width="50%">
                                                <asp:ListItem>ACTIVITY</asp:ListItem>
                                                <asp:ListItem>SPAREPART</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <label class="lblModal">Purpose</label>
                                                    <asp:TextBox CssClass="form-control" Style="height: 100px" ID="txtPurpose" Enabled="true" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtPartName" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>


                                        </div>
                                    </div>


                                    <div class="row mb-5">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <input type="radio" id="inputSparepart" name="fav_language" value="Sparepart" onchange="onCheckedTypePart();" />
                                            <label for="html">Sparepart</label>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                            <input type="radio" id="inputUncounting" name="fav_language" value="Uncounting Part" onchange="onCheckedTypePart();" />
                                            <label for="css">Uncounting Part</label>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnOrder" Text="Order Now" OnClick="btnOrder_Click" CssClass="btn btn-outline-primary text-center" OnClientClick="return cekKosong();" runat="server"></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="line"></div>
                <label style="margin-top: 0px; font-size: 1.5rem;">List Pre Expenses Data</label>

                <ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Sparepart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Activity</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="uncountingpart-tab" data-toggle="tab" href="#uncountingpart" role="tab" aria-controls="uncountingpart" aria-selected="false">Uncounting (Sparepart)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="uncountingpartact-tab" data-toggle="tab" href="#uncountingpartact" role="tab" aria-controls="uncountingact" aria-selected="false">Uncounting (Activity)</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row mt-3">
                            <asp:LinkButton OnClick="btnExport_Click" CssClass="nav-link btn-success ml-auto mb-3 mr-3" runat="server" ID="btnExport">Export Sparepart</asp:LinkButton>
                            <div class="col-12">
                                <asp:GridView RowStyle-CssClass="gvGrid" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvExpenses" AutoGenerateColumns="False" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#2A476B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    <Columns>
                                        <asp:BoundField DataField="orderID" HeaderStyle-ForeColor="white" HeaderText="Order ID" SortExpression="orderID" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsName" HeaderText="Goods Name" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsCode" HeaderText="Goods Code" SortExpression="goodsCode" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="goodsDesc" HeaderText="Goods Desc" SortExpression="goodsDesc" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="nowStock" HeaderText="Now Stock" SortExpression="nowStock" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="minStock" HeaderText="Min Stock" ItemStyle-HorizontalAlign="Center" SortExpression="minStock"></asp:BoundField>
                                        <asp:BoundField DataField="minOrder" ItemStyle-HorizontalAlign="Center" HeaderText="Min Order" SortExpression="minOrder"></asp:BoundField>
                                        <asp:BoundField DataField="qtyOrder" HeaderText="Qty Order" ItemStyle-HorizontalAlign="Center" SortExpression="qtyOrder"></asp:BoundField>
                                        <asp:BoundField DataField="orderToModel" HeaderText="Order to Model" ItemStyle-HorizontalAlign="Center" SortExpression="orderToModel"></asp:BoundField>
                                        <asp:BoundField DataField="maker" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="maker"></asp:BoundField>
                                        <asp:BoundField DataField="pic" HeaderText="PIC" ItemStyle-HorizontalAlign="Center" SortExpression="pic"></asp:BoundField>
                                        <asp:BoundField DataField="typeOrder" HeaderText="Type" ItemStyle-HorizontalAlign="Center" SortExpression="typeOrder"></asp:BoundField>
                                        <asp:BoundField DataField="category" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="category"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Vendor" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" HeaderStyle-ForeColor="White" AccessibleHeaderText="Vendor">


                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlDropDown" CssClass="form-control" Width="200px" runat="server" Font-Size="Smaller">
                                                    <asp:ListItem>LOCAL</asp:ListItem>
                                                    <asp:ListItem>OVERSEA</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="preDate" HeaderText="Order Date" ItemStyle-HorizontalAlign="Center" SortExpression="preDate"></asp:BoundField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
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
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row mt-3">
                            <asp:LinkButton OnClick="btnExport_Activity_Click" CssClass="nav-link btn-success ml-auto mb-3 mr-3" runat="server" ID="btnExport_Activity">Export Activity Part</asp:LinkButton>
                            <div class="col-12">
                                <asp:GridView RowStyle-CssClass="gvGrid" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvExpenses_Activity" AutoGenerateColumns="False" AllowSorting="True">
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
                                        <asp:BoundField DataField="orderID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="Order ID" SortExpression="orderID" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsCode" HeaderText="Goods Code" HeaderStyle-BackColor="#172679" SortExpression="goodsCode" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="goodsDesc" HeaderText="Goods Desc" HeaderStyle-BackColor="#172679" SortExpression="goodsDesc" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="nowStock" HeaderText="Now Stock" HeaderStyle-BackColor="#172679" SortExpression="nowStock" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="minStock" HeaderText="Min Stock" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="minStock"></asp:BoundField>
                                        <asp:BoundField DataField="minOrder" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Min Order" SortExpression="minOrder"></asp:BoundField>
                                        <asp:BoundField DataField="qtyOrder" HeaderStyle-BackColor="#172679" HeaderText="Qty Order" ItemStyle-HorizontalAlign="Center" SortExpression="qtyOrder"></asp:BoundField>
                                        <asp:BoundField DataField="orderToModel" HeaderStyle-BackColor="#172679" HeaderText="Order to Model" ItemStyle-HorizontalAlign="Center" SortExpression="orderToModel"></asp:BoundField>
                                        <asp:BoundField DataField="maker" HeaderStyle-BackColor="#172679" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="maker"></asp:BoundField>
                                        <asp:BoundField DataField="pic" HeaderStyle-BackColor="#172679" HeaderText="PIC" ItemStyle-HorizontalAlign="Center" SortExpression="pic"></asp:BoundField>
                                        <asp:BoundField DataField="typeOrder" HeaderStyle-BackColor="#172679" HeaderText="Type" ItemStyle-HorizontalAlign="Center" SortExpression="typeOrder"></asp:BoundField>
                                        <asp:BoundField DataField="category" HeaderStyle-BackColor="#172679" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="category"></asp:BoundField>
                                        <asp:TemplateField HeaderStyle-BackColor="#172679" HeaderText="Vendor" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" HeaderStyle-ForeColor="White" AccessibleHeaderText="Vendor">


                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlDropDown" CssClass="form-control" Width="200px" runat="server" Font-Size="Smaller">
                                                    <asp:ListItem>LOCAL</asp:ListItem>
                                                    <asp:ListItem>OVERSEA</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="preDate" HeaderStyle-BackColor="#172679" HeaderText="Order Date" ItemStyle-HorizontalAlign="Center" SortExpression="preDate"></asp:BoundField>
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

                    <div class="tab-pane fade" id="uncountingpart" role="tabpanel" aria-labelledby="uncountingpart-tab">
                        <div class="row mt-3">
                            <asp:LinkButton OnClick="btnSparepartUncountng_Click"  CssClass="nav-link btn-success ml-auto mb-3 mr-3" runat="server" ID="btnSparepartUncountng">Export Sparepart (Uncounting)</asp:LinkButton>
                            <div class="col-12">
                                <asp:GridView RowStyle-CssClass="gvGrid" runat="server" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvExpensesUncountingPart" AutoGenerateColumns="False" AllowSorting="True">
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
                                        <asp:BoundField DataField="orderID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="Order ID" SortExpression="orderID" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsCode" HeaderText="Goods Code" HeaderStyle-BackColor="#172679" SortExpression="goodsCode" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="goodsDesc" HeaderText="Goods Desc" HeaderStyle-BackColor="#172679" SortExpression="goodsDesc" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="nowStock" HeaderText="Now Stock" HeaderStyle-BackColor="#172679" SortExpression="nowStock" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="minStock" HeaderText="Min Stock" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="minStock"></asp:BoundField>
                                        <asp:BoundField DataField="minOrder" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Min Order" SortExpression="minOrder"></asp:BoundField>
                                        <asp:BoundField DataField="qtyOrder" HeaderStyle-BackColor="#172679" HeaderText="Qty Order" ItemStyle-HorizontalAlign="Center" SortExpression="qtyOrder"></asp:BoundField>
                                        <asp:BoundField DataField="orderToModel" HeaderStyle-BackColor="#172679" HeaderText="Order to Model" ItemStyle-HorizontalAlign="Center" SortExpression="orderToModel"></asp:BoundField>
                                        <asp:BoundField DataField="maker" HeaderStyle-BackColor="#172679" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="maker"></asp:BoundField>
                                        <asp:BoundField DataField="pic" HeaderStyle-BackColor="#172679" HeaderText="PIC" ItemStyle-HorizontalAlign="Center" SortExpression="pic"></asp:BoundField>
                                        <asp:BoundField DataField="typeOrder" HeaderStyle-BackColor="#172679" HeaderText="Type" ItemStyle-HorizontalAlign="Center" SortExpression="typeOrder"></asp:BoundField>
                                        <asp:BoundField DataField="category" HeaderStyle-BackColor="#172679" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="category"></asp:BoundField>
                                        <asp:TemplateField HeaderStyle-BackColor="#172679" HeaderText="Vendor" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" HeaderStyle-ForeColor="White" AccessibleHeaderText="Vendor">


                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlDropDown" CssClass="form-control" Width="200px" runat="server" Font-Size="Smaller">
                                                    <asp:ListItem>LOCAL</asp:ListItem>
                                                    <asp:ListItem>OVERSEA</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="preDate" HeaderStyle-BackColor="#172679" HeaderText="Order Date" ItemStyle-HorizontalAlign="Center" SortExpression="preDate"></asp:BoundField>
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

                    <div class="tab-pane fade" id="uncountingpartact" role="tabpanel" aria-labelledby="uncountingpartact-tab">
                        <div class="row mt-3">
                            <asp:LinkButton OnClick="LinkButton2_Click" CssClass="nav-link btn-success ml-auto mb-3 mr-3" runat="server" ID="LinkButton2">Export Activity (Uncounting)</asp:LinkButton>
                            <div class="col-xl-12">
                                <asp:GridView RowStyle-CssClass="gvGrid" runat="server" DataSourceID="SqlDataSource4" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ID="gvUncountingAct" AutoGenerateColumns="False" AllowSorting="True">
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
                                        <asp:BoundField DataField="orderID" HeaderStyle-ForeColor="white" HeaderStyle-BackColor="#172679" HeaderText="Order ID" SortExpression="orderID" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsName" HeaderText="Goods Name" HeaderStyle-BackColor="#172679" SortExpression="goodsName" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="goodsCode" HeaderText="Goods Code" HeaderStyle-BackColor="#172679" SortExpression="goodsCode" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="goodsDesc" HeaderText="Goods Desc" HeaderStyle-BackColor="#172679" SortExpression="goodsDesc" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="nowStock" HeaderText="Now Stock" HeaderStyle-BackColor="#172679" SortExpression="nowStock" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="minStock" HeaderText="Min Stock" HeaderStyle-BackColor="#172679" ItemStyle-HorizontalAlign="Center" SortExpression="minStock"></asp:BoundField>
                                        <asp:BoundField DataField="minOrder" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#172679" HeaderText="Min Order" SortExpression="minOrder"></asp:BoundField>
                                        <asp:BoundField DataField="qtyOrder" HeaderStyle-BackColor="#172679" HeaderText="Qty Order" ItemStyle-HorizontalAlign="Center" SortExpression="qtyOrder"></asp:BoundField>
                                        <asp:BoundField DataField="orderToModel" HeaderStyle-BackColor="#172679" HeaderText="Order to Model" ItemStyle-HorizontalAlign="Center" SortExpression="orderToModel"></asp:BoundField>
                                        <asp:BoundField DataField="maker" HeaderStyle-BackColor="#172679" HeaderText="Brand" ItemStyle-HorizontalAlign="Center" SortExpression="maker"></asp:BoundField>
                                        <asp:BoundField DataField="pic" HeaderStyle-BackColor="#172679" HeaderText="PIC" ItemStyle-HorizontalAlign="Center" SortExpression="pic"></asp:BoundField>
                                        <asp:BoundField DataField="typeOrder" HeaderStyle-BackColor="#172679" HeaderText="Type" ItemStyle-HorizontalAlign="Center" SortExpression="typeOrder"></asp:BoundField>
                                        <asp:BoundField DataField="category" HeaderStyle-BackColor="#172679" HeaderText="Category" ItemStyle-HorizontalAlign="Center" SortExpression="category"></asp:BoundField>
                                        <asp:TemplateField HeaderStyle-BackColor="#172679" HeaderText="Vendor" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px" HeaderStyle-ForeColor="White" AccessibleHeaderText="Vendor">


                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlDropDown" CssClass="form-control" Width="200px" runat="server" Font-Size="Smaller">
                                                    <asp:ListItem>LOCAL</asp:ListItem>
                                                    <asp:ListItem>OVERSEA</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="preDate" HeaderStyle-BackColor="#172679" HeaderText="Order Date" ItemStyle-HorizontalAlign="Center" SortExpression="preDate"></asp:BoundField>
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



            </form>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [orderID],[goodsCode],[goodsName],[goodsDesc],[nowStock],[minStock],[minOrder],[qtyOrder],[orderToModel],[maker],[preDate],[pic],[typeOrder],[category] FROM [sparepartworld].[dbo].[SPI_OrderPart] where statusExpenses = 'PRE' and CATEGORY = 'SPAREPART' and typePart = 'Sparepart'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [orderID],[goodsCode],[goodsName],[goodsDesc],[nowStock],[minStock],[minOrder],[qtyOrder],[orderToModel],[maker],[preDate],[pic],[typeOrder],[category] FROM [sparepartworld].[dbo].[SPI_OrderPart] where statusExpenses = 'PRE' and CATEGORY = 'ACTIVITY' and typePart = 'Sparepart'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [orderID],[goodsCode],[goodsName],[goodsDesc],[nowStock],[minStock],[minOrder],[qtyOrder],[orderToModel],[maker],[preDate],[pic],[typeOrder],[category] FROM [sparepartworld].[dbo].[SPI_OrderPart] where statusExpenses = 'PRE' and CATEGORY = 'SPAREPART' and typePart = 'Uncounting Part'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dashboardConnectionString %>" SelectCommand="SELECT [orderID],[goodsCode],[goodsName],[goodsDesc],[nowStock],[minStock],[minOrder],[qtyOrder],[orderToModel],[maker],[preDate],[pic],[typeOrder],[category] FROM [sparepartworld].[dbo].[SPI_OrderPart] where statusExpenses = 'PRE' and CATEGORY = 'ACTIVITY' and typePart = 'Uncounting Part'"></asp:SqlDataSource>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>
    <script src="Scripts/select2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#selectModel').select2({
                placeholder: '-- Pilih Model --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            function loadModelData() {
                //ambil data model
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetModel", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var models = JSON.parse(response.d);
                        var modelSelect = $('#selectModel');

                        // Kosongkan dropdown terlebih dahulu
                        modelSelect.empty();
                        modelSelect.append('<option value="">-- Pilih Model --</option>');

                        // Isi dropdown dengan data supplier
                        for (var i = 0; i < models.length; i++) {
                            modelSelect.append('<option value="' + models[i] + '">' + models[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        modelSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }

            loadModelData();

            var role = sessionStorage.getItem("role");
            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Role tidak valid. Anda akan diarahkan kembali ke halaman login.',
                }).then((result) => {
                    window.location.href = "Default.aspx";
                });
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

            $("#<%= gvExpenses.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvExpenses.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });

            $("#<%= gvExpenses_Activity.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvExpenses_Activity.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });

            $("#<%= gvExpensesUncountingPart.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvExpensesUncountingPart.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });

            $("#<%= gvUncountingAct.ClientID %> .headerCheckBox").change(function (e) {
                $("#<%= gvUncountingAct.ClientID %> .rowCheckBox input").each(function () {
                    $(this).prop("checked", $(e.target).prop("checked"));
                });
            });
        });

        $('#<%=gvExpenses.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvExpenses.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });


        $('#<%=gvExpenses_Activity.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvExpenses_Activity.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

        $('#<%=gvExpensesUncountingPart.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvExpensesUncountingPart.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

        $('#<%=gvUncountingAct.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvUncountingAct.ClientID%>").find("tr:first"))).DataTable({
            "order": [[0, 'desc']],
        });

        function cekKosong() {
            if (document.getElementById('txtMaker').value == '') {
                alert('Mohon isikan Maker');
                return false;
            }

            if (document.getElementById('txtPIC').value == '') {
                alert('Mohon isikan PIC');
                return false;
            }

            if (document.getElementById('txtPartName').value == '') {
                alert('Mohon isikan Part Name');
                return false;
            }

            if (document.getElementById('txtGoodsDesc').value == '') {
                alert('Mohon isikan Goods Desc');
                return false;
            }

            if (document.getElementById('txtPurpose').value == '') {
                alert('Mohon isikan Purpose');
                return false;
            }
            if (document.getElementById('txtQty').value == '') {
                alert('Mohon isikan Qty');
                return false;
            }

            if ((document.getElementById('inputSparepart').checked) || (document.getElementById('inputUncounting').checked)) {
                //Male radio button is checked
            } else {
                alert('Mohon pilih Sparepart atau Uncounting Part');
                return false;
            }


            if (confirm('Input data Expenses ?')) {
                var data = {
                    goods_name: document.getElementById('txtPartName').value.toLocaleUpperCase(),
                    goods_desc: document.getElementById('txtGoodsDesc').value.toLocaleUpperCase(),
                    maker: document.getElementById('txtMaker').value.toLocaleUpperCase(),
                    qty: document.getElementById('txtQty').value,
                    model: document.getElementById('selectModel').value,
                    pic: document.getElementById('txtPIC').value,
                    category: document.getElementById('ddlCategory').value,
                    type_part: check_type_part
                    
                }
                console.log(data);

                insertExpenses(data);
            } else {
                return false;
            }

            
        }

        function insertExpenses(data) {
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                url: "expenses.aspx/insertManualOrder",
                data: '{ goodsName: ' + JSON.stringify(data.goods_name) + ', goodsDesc: ' + JSON.stringify(data.goods_desc) + ', maker: ' + JSON.stringify(data.maker) + ', qty: ' + JSON.stringify(data.qty) + ', model: ' + JSON.stringify(data.model) + ', pic: ' + JSON.stringify(data.pic) + ',category: ' + JSON.stringify(data.category) + ',typePart: ' + JSON.stringify(data.type_part) + '}',
                success: function (data) {
                    alert('Berhasil Input Coming Part. ');

                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //alert('Failed. Please contact admin (Randy)');
                }

            })
        }

        var check_type_part = 'UNDEFINED';

        function onCheckedTypePart() {
            //check_type_part = '';
            if (document.getElementById('inputSparepart').checked == true) {
                check_type_part = document.getElementById('inputSparepart').value;
                console.log(check_type_part);
            } else if (document.getElementById('inputUncounting').checked == true) {
                check_type_part = document.getElementById('inputUncounting').value;
                console.log(check_type_part);

            }
        }
    </script>
</body>
</html>
