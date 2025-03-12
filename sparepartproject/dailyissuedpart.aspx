<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dailyissuedpart.aspx.cs" EnableEventValidation="true" Inherits="sparepartproject.dailyissuedpart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>SPI Inventory - Daily Issued Part</title>
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
                /*content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');*/
                content: url('loading.gif');
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
<body style="font-family: 'Poppins';">

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
                            <a href="dailyissuedpart.aspx" style="background-color: white; color: #172679;">Daily Issued Part</a>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Daily Issued Part</h5>
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
                <asp:UpdateProgress ID="UpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                            <p>Processing data, please wait...</p>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row align-items-end" style="margin-top: 20px; margin-bottom: 20px;">
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
                            <%--<label class="dataTables_length">View List by Date (Daily List)</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" AutoPostBack="true" ID="txtTanggal" OnTextChanged="txtTanggal_TextChanged" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>--%>
                        </div>
                        <div class="col-lg-5"></div>
                        <div class="col-lg-2">
                            <label class="dataTables_length" style="margin-right: 10px; font-weight: 500;">Date From</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" ID="txtDateFrom" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <label class="dataTables_length" style="margin-right: 10px; font-weight: 500;">Date To</label>
                            <div class="input-group date" data-provide="datepicker">
                                <asp:TextBox CssClass="form-control" ID="txtDateTo" runat="server"></asp:TextBox>
                                <div class="input-group-addon">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-1">
                            <%--<label class="dataTables_length" style="margin-right: 10px; color: transparent;">Date To</label>--%>
                            <asp:Button CssClass="btn btn-success" runat="server" ID="btnExport" OnClientClick="return jsShowHideProgress()" OnClick="btnExport_Click" Text="Export" />
                        </div>

                    </div>
                    <div class="line"></div>
                    <%--   <div class="overlay" id="loadingImg">
                        <p>Processing data, please wait...</p>
                    </div>--%>
                    <div class="row">
                        <div class="col-12">
                            <label style="margin-top: 0px; font-size: 1.5rem; font-weight: 500;">List Daily Issued Sparepart </label>
                            <div class="row mt-3"></div>
                            <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabela">
                                <thead style="background-color: #2A476B; color: white; text-align: center;">
                                    <tr>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ID Issued</th>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                        <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                        <th scope="col" style="vertical-align: middle;">Maker</th>
                                        <th scope="col" style="vertical-align: middle;">Model</th>
                                        <th scope="col" style="vertical-align: middle;">Line</th>
                                        <th scope="col" style="vertical-align: middle;">Cell</th>
                                        <th scope="col" style="vertical-align: middle;">Qty Issued</th>
                                        <th scope="col" style="vertical-align: middle;">Min Stock</th>
                                        <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                        <th scope="col" style="vertical-align: middle;">Reason</th>
                                        <th scope="col" style="vertical-align: middle;">Issued By</th>
                                        <th scope="col" style="vertical-align: middle;">Issued Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- modal upload data one by one-->
                <!-- The Modal -->
                <div class="modal fade" id="modalEditAndDelete">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Issued Qty</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Code</label>
                                            <asp:TextBox CssClass="form-control" Enabled="false" ID="txtGoodsCodeIssuedPart" runat="server" Width="75%"></asp:TextBox>
                                            <input type="hidden" id="hdIssuedID" name="goods_code" runat="server" />
                                            <input type="hidden" id="hdGoodsCode" name="goods_code" runat="server" />
                                            <input type="hidden" id="hdQtyIssued" name="goods_code" runat="server" />
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Now Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtNowStockIssuedPart" Enabled="false" runat="server" Width="30%"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Goods Name</label>
                                            <asp:TextBox CssClass="form-control" ID="txtGoodsNameIssuedPart" Enabled="false" runat="server" Width="55%"></asp:TextBox>

                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Min Stock</label>
                                            <asp:TextBox CssClass="form-control" ID="txtMinStockIssuedPart" Enabled="false" runat="server" Width="20%"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Model</label>
                                            <asp:TextBox CssClass="form-control" ID="txtModelIssuedPart" Enabled="false" runat="server" Width="55%"></asp:TextBox>


                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Qty Issued</label>
                                            <asp:TextBox CssClass="form-control" ID="txtQtyIssued" runat="server" Width="15%" TextMode="Number"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Line</label>
                                            <asp:TextBox CssClass="form-control" ID="txtLineIssuedPart" Enabled="false" runat="server" Width="65%"></asp:TextBox>


                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Issued By</label>
                                            <asp:TextBox CssClass="form-control" ID="txtIssuedByIssuedPart" Enabled="false" runat="server" Width="35%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-bottom: 50px;">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Cell</label>
                                            <asp:TextBox CssClass="form-control" ID="txtCellIssuedPart" Enabled="false" runat="server" Width="65%"></asp:TextBox>


                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xl-6">
                                            <label class="lblModal">Reason</label>
                                            <asp:TextBox CssClass="form-control" ID="txtReasonIssuedPart" Enabled="false" runat="server" Width="35%"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-warning text-center" data-dismiss="modal">CLOSE</button>
                                <asp:LinkButton ID="btnOrder" Text="UPDATE QTY" CssClass="btn btn-outline-success text-center" OnClick="btnOrder_Click" OnClientClick="return cekKosong2();" runat="server"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" Text="DELETE" OnClientClick="return cekKosong();" CssClass="btn btn-outline-dark text-center" OnClick="Button1_Click" runat="server"></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </div>

            </form>
        </div>

    </div>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">

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
                $("#menuModifHistory").hide();
                $("#menuLoanList").hide();

            }

            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
                window.location.href = "Default.aspx";

                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                
            } else if (role === "SPV") {
                hideAllMenus(); // Sembunyikan semua menu

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDailyIssuedPart").show();
                $("#menuDatabasePart").show();

                setTitleHeader();
                // ... tambahkan menu lain yang diizinkan untuk STAFF
            } else if (role === "STAFF") {
                hideAllMenus(); // Sembunyikan semua menu

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDatabasePart").show();
                $("#menuDailyIssuedPart").show();
                setTitleHeader();

            }
            else if (role === "ADMIN") {
                setTitleHeader();
                // ... tambahkan menu lain yang diizinkan untuk STAFF
            }

            function setTitleHeader() {
                document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";
            }

            $('#UpdateProgress').show();

            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });

            $.ajax({
                url: "/dailyissuedpart.aspx/getAllDailyIssued",
                method: 'post',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tabela tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item._SPI_IDIssued + '</td><td>' + item._goodsCode + '</td><td>' + item._goodsName + '</td><td>' + item._maker + '</td><td>' + item._model + '</td><td style="text-align:center;">' + item._lineName + '</td><td style="text-align:center;">' + item._cell + '</td><td style="text-align:center;">' + item._qtyIssued + '</td><td style="text-align:center;">' + item._minStock + '</td><td style="text-align:center;">' + item._nowStock + '</td><td style="text-align:center;">' + item._reason + '</td><td>' + item._issuedByName + '</td><td>' + item._IssuedDate + '</td></tr>');
                        //console.log(item);
                    });
                    $('#tabela').dataTable({
                        deferRender: true,
                        "order": [[0, "desc"]]
                    });
                },
                complete: function () {
                    $('#UpdateProgress').hide();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        });

        $.fn.datepicker.defaults.format = "yyyy-mm-dd";
        $('.datepicker').datepicker({
            icons: {
                previous: "fas fa-chevron-left",
                next: "fas fa-chevron-right",
            },
            autoclose: true
        });

        $(function () {
            //bindDataTable();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
        });
        function bindDataTable() {
            var topProductsTable = $('#tabela').dataTable(
                {
                    "order": [[0, "desc"]]
                });

            $('#tabel3Parts').on('click', 'tr', function () {
                var getGoodsCode = $('td', this).eq(0).text();
                var getGoodsName = $('td', this).eq(1).text();
                var getNowStock = $('td', this).eq(3).text();
                var getMinStock = $('td', this).eq(2).text();
                getGoodsCode = getGoodsCode.replace(/\s/g, '');
                getGoodsName = getGoodsName.replace(/\s/g, '');
                getNowStock = getNowStock.replace(/\s/g, '');
                getMinStock = getMinStock.replace(/\s/g, '');
                var goodsCode = document.getElementById("<%=txtGoodsCodeIssuedPart.ClientID%>");
                var goodsName = document.getElementById("<%=txtGoodsNameIssuedPart.ClientID%>");
                var nowStock = document.getElementById("<%=txtNowStockIssuedPart.ClientID%>");
                var minStock = document.getElementById("<%=txtMinStockIssuedPart.ClientID%>");
                goodsCode.value = getGoodsCode;
                goodsName.value = getGoodsName;
                nowStock.value = getNowStock;
                minStock.value = getMinStock;
            });
        }

        function cekKosong() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var goodsCode = document.getElementById('<%= txtGoodsCodeIssuedPart.ClientID %>').value;
            var qtyIssued = document.getElementById('<%= txtQtyIssued.ClientID %>').value;

            if (goodsCode == "" || qtyIssued == "") {
                alert("Data not complete, please try again.");
                return false;
            } else {
                if (confirm("Delete Issued Data dengan GoodsCode = " + goodsCode + " dan Qty = " + qtyIssued + " ? ")) {
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

        function cekKosong2() {

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var goodsCode = document.getElementById('<%= txtGoodsCodeIssuedPart.ClientID %>').value;
            var qtyIssued = document.getElementById('<%= txtQtyIssued.ClientID %>').value;


            if (goodsCode == "" || qtyIssued == "") {
                alert("Data not complete, please try again.");
                return false;
            } else {
                if (confirm("Update Issued Data dengan GoodsCode = " + goodsCode + " dan Qty = " + qtyIssued + " ? ")) {
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




        $('#tabela').on('click', 'tr', function () {
            var role = sessionStorage.getItem("role");

            if (role === "SPV") {
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Anda tidak dapat akses.',
                }).then((result) => {
                    //window.location.href = "Default.aspx";
                });
            } else if (role === "STAFF") {
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Anda tidak dapat akses.',
                }).then((result) => {
                    //window.location.href = "Default.aspx";
                });
            } else {
                $('#modalEditAndDelete').modal("show");
                var getIssuedID = $('td', this).eq(0).text();
                var getGoodsCode = $('td', this).eq(1).text();
                var getGoodsName = $('td', this).eq(2).text();
                var getModel = $('td', this).eq(4).text();
                var getLine = $('td', this).eq(5).text();
                var getCell = $('td', this).eq(6).text();
                var getQtyIssued = $('td', this).eq(7).text();
                var getMinStock = $('td', this).eq(8).text();
                var getNowStock = $('td', this).eq(9).text();
                var getIssuedBy = $('td', this).eq(11).text();
                var getReason = $('td', this).eq(10).text();

                getIssuedID = getIssuedID.replace(/\s/g, '');
                getGoodsCode = getGoodsCode.replace(/\s/g, '');
                getGoodsName = getGoodsName.replace(/\s/g, '');
                getModel = getModel.replace(/\s/g, '');
                getLine = getLine.replace(/\s/g, '');
                getCell = getCell.replace(/\s/g, '');
                getNowStock = getNowStock.replace(/\s/g, '');
                getMinStock = getMinStock.replace(/\s/g, '');
                getQtyIssued = getQtyIssued.replace(/\s/g, '');
                getIssuedBy = getIssuedBy.replace(/\s/g, '');
                getReason = getReason.replace(/\s/g, '');

                var goodsCode = document.getElementById("<%=txtGoodsCodeIssuedPart.ClientID%>");
                var goodsName = document.getElementById("<%=txtGoodsNameIssuedPart.ClientID%>");
                var model = document.getElementById("<%=txtModelIssuedPart.ClientID%>");
                var line = document.getElementById("<%=txtLineIssuedPart.ClientID%>");
                var cell = document.getElementById("<%=txtCellIssuedPart.ClientID%>");
                var nowStock = document.getElementById("<%=txtNowStockIssuedPart.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockIssuedPart.ClientID%>");
            var qtyIssued = document.getElementById("<%=txtQtyIssued.ClientID%>");
            var issuedBy = document.getElementById("<%=txtIssuedByIssuedPart.ClientID%>");
            var reason = document.getElementById("<%=txtReasonIssuedPart.ClientID%>");
            var issuedID = document.getElementById("<%=hdIssuedID.ClientID%>");

            goodsCode.value = getGoodsCode;
            goodsName.value = getGoodsName;
            model.value = getModel;
            line.value = getLine;
            cell.value = getCell;
            nowStock.value = getNowStock;
            minStock.value = getMinStock;
            qtyIssued.value = getQtyIssued;
            issuedBy.value = getIssuedBy;
            reason.value = getReason;
            issuedID.value = getIssuedID;
            //nowStock.value = getNowStock;
            <%--var getPreOrderID = $('td', this).eq(0).text();
            var getGoodsCode = $('td', this).eq(1).text();
            var getGoodsName = $('td', this).eq(2).text();
            var getGoodsDesc = $('td', this).eq(3).text();
            var getNowStock = $('td', this).eq(4).text();
            var getMinStock = $('td', this).eq(5).text();
            var getMinOrder = $('td', this).eq(6).text();
            var getPreOrderQty = $('td', this).eq(7).text();
            var getModel = $('td', this).eq(8).text();

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
            if (getModel == "AUTOPACK") {
                selectedIndex = 0;
            } else if (getModel == "CARTONER") {
                selectedIndex = 1;
            } else if (getModel == "CISS") {
                selectedIndex = 2;
            } else if (getModel == "COMMON") {
                selectedIndex = 3;
            } else if (getModel == "COSTNER/SAROMA") {
                selectedIndex = 4;
            } else if (getModel == "FOAMSUPPORT") {
                selectedIndex = 5;
            } else if (getModel == "GAGA") {
                selectedIndex = 6;
            } else if (getModel == "HAVCRAIG") {
                selectedIndex = 7;
            } else if (getModel == "HAV3D") {
                selectedIndex = 8;
            } else if (getModel == "HAV3P") {
                selectedIndex = 9;
            } else if (getModel == "INKBLENDING") {
                selectedIndex = 10;
            } else if (getModel == "KUZURYU") {
                selectedIndex = 11;
            } else if (getModel == "LEGGERO") {
                selectedIndex = 12;
            } else if (getModel == "LFP") {
                selectedIndex = 13;
            } else if (getModel == "NASUNO") {
                selectedIndex = 14;
            } else if (getModel == "NASUNO3") {
                selectedIndex = 15;
            } else if (getModel == "NEYMAR") {
                selectedIndex = 16;
            } else if (getModel == "OTHERS") {
                selectedIndex = 17;
            } else if (getModel == "SAKURA") {
                selectedIndex = 18;
            } else if (getModel == "SEALING") {
                selectedIndex = 19;
            } else if (getModel == "SPI") {
                selectedIndex = 20;
            } else if (getModel == "SUB") {
                selectedIndex = 21;
            } else if (getModel == "TANIGAWA") {
                selectedIndex = 22;
            } else if (getModel == "301") {
                selectedIndex = 23;
            } else if (getModel == "TAKASE") {
                selectedIndex = 24;
            } else { selectedIndex = 0 }


            

            var goodsCode = document.getElementById("<%=txtGoodsCodeReady.ClientID%>");
            var goodsName = document.getElementById("<%=txtGoodsNameReady.ClientID%>");
            var goodsDesc = document.getElementById("<%=txtGoodsDescReady.ClientID%>");
            var nowStock = document.getElementById("<%=txtNowStockReady.ClientID%>");
            var minStock = document.getElementById("<%=txtMinStockready.ClientID%>");
            var minOrder = document.getElementById("<%=txtMinOrderReady.ClientID%>");
            var preOrderQty = document.getElementById("<%=TextBox8.ClientID%>");


            var opt = document.createElement("option");
            opt.text = getModel;
            opt.value = getModel;
            var model = document.getElementById("<%=DropDownList1.ClientID%>");
            //.options.add(opt)


            var setModel = document.getElementById("<%=hdnModel.ClientID%>");

            model.selectedIndex = selectedIndex;

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

            setPreOrderID.value = getPreOrderID;
            setGoodsCode.value = goodsCode.value;
            setGoodsName.value = goodsName.value;
            setGoodsDesc.value = goodsDesc.value;
            setNowStock.value = nowStock.value;
            setMinStock.value = minStock.value;
            setMinOrder.value = minOrder.value;--%>
            }
            

        });

        //untuk loading gif export excel
        function jsShowHideProgress() {
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
    </script>
</body>
</html>
