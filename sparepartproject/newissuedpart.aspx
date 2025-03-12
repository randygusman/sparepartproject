<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newissuedpart.aspx.cs" Inherits="sparepartproject.newissuedpart" %>

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

        .suggestion-box {
            position: inherit;
            border: 1px solid #ccc;
            background-color: white;
            z-index: 9999;
            max-height: 150px;
            overflow-y: auto;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
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
                /*content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');*/
                content: url('loading.gif');
            }

        #ddlBulan {
            padding: 2px 4px;
            font-size: .8rem;
            margin: 0px;
        }

        .close {
            color: red;
            font-size: 30px;
        }

        #btnCheck {
            font-size: .6rem;
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

        .lblModal {
            font-size: 1rem;
            padding: 3px;
            /*background-color:#4e73df !important;*/
            color: black;
            border-radius: 3px;
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
<body style="font-family: 'Poppins';">
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components" style="font-weight: 500;">
                <li>
                    <a href="#configSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">System Config</a>
                    <ul class="collapse list-unstyled" id="configSubmenu">
                        <li>
                            <a href="systemconfig/spi_model.aspx">Model</a>
                        </li>
                        <li>
                            <a href="systemconfig/spi_line.aspx">Line</a>
                        </li>
                        <li onclick="alert('Coming Soon');">
                            <a href="#">Cell</a>
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
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">SPI</a>
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
                            <a href="dailyissuedpart.aspx" style="background-color: white; color: #172679;">Daily Issued Part</a>
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
            <form runat="server" id="form1">
                <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
                <asp:UpdateProgress ID="UpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                            <p>Processing data, please wait...</p>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="fas fa-align-left"></i>
                            <span></span>
                        </button>
                        <h5 style="margin-bottom: 0px; margin-left: 20px;">Daily Issued Part - New Issued</h5>
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
                <!-- The Modal -->
                <div <%--class="modal fade"--%> id="modalNewOrderPart">
                    <div class="col-12" style="width: 100%">


                        <div class="modal-dialog" style="max-width: 1700px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">New Issued Part</h4>
                                    <button type="button" class="close" aria-label="Close" onclick="window.location.href = 'dailyissuedpart.aspx'">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div style="width: 90%; margin: auto;">
                                        <%--aslinya div class container--%>
                                        <div class="row align-items-end">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
                                                <label class="lblModal px-2" style="font-size: 1.2rem;">Search Sparepart By</label>
                                                <asp:DropDownList runat="server" ID="ddlGoodsCodeOrGoodsName" CssClass="form-control">
                                                    <asp:ListItem>Goods Code</asp:ListItem>
                                                    <asp:ListItem>Goods Name</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6" style="padding: 0">
                                                <label class="lblModal" style="visibility: hidden;">Search By</label>
                                                <asp:TextBox CssClass="form-control" ID="txtGoodsCodeOrGoodsName" runat="server" Text="SPI-A"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 " style="padding: 0; margin-left: 20px;">
                                                <asp:LinkButton ID="btnCheck" Text="Search Sparepart" OnClick="btnCheck_Click" CssClass="btn btn-primary text-center m-0" runat="server"></asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 mt-3" id="colTable" runat="server">
                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                    <ContentTemplate>
                                                        <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma;" id="tabel3Parts">
                                                            <thead style="background-color: #2A476B; color: white; text-align: center;">
                                                                <tr>
                                                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">SPI Goods Code</th>
                                                                    <th scope="col" style="vertical-align: middle;">Goods Name</th>
                                                                    <th scope="col" style="vertical-align: middle;">Min Stock</th>
                                                                    <th scope="col" style="vertical-align: middle;">Now Stock</th>
                                                                    <th scope="col" style="vertical-align: middle;">Drawer</th>
                                                                    <th scope="col" style="vertical-align: middle;"></th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%for (int j = 0; j < dtTop3.Rows.Count; j++)%>
                                                                <%{%>
                                                                <tr style="text-align: center">
                                                                    <td class="goodsCode" style="width: 10%;">
                                                                        <%=dtTop3.Rows[j]["goodsCode"]%>
                                                                    </td>
                                                                    <td class="inputqty goodsName" style="width: 10%;">
                                                                        <%=dtTop3.Rows[j]["goodsName"]%>
                                                                    </td>
                                                                    <td class="inputqty" style="width: 10%;">
                                                                        <%=dtTop3.Rows[j]["minStock"]%>
                                                                    </td>
                                                                    <td class="inputqty" style="width: 10%;">
                                                                        <%=dtTop3.Rows[j]["nowStock"]%>
                                                                    </td>
                                                                    <td class="inputqty" style="width: 10%; background-color: lightgoldenrodyellow; padding: 5px 5px 3px 3px; font-weight: bold;">
                                                                        <%=dtTop3.Rows[j]["subKeeping"]%>
                                                                    </td>
                                                                    <td class="inputqty" style="width: 10%;">
                                                                        <a onclick="idna5(this)" class="p-1" style="cursor: pointer; color: white; font-family: Tahoma; font-size: .6rem; font-weight: normal; background-color: darkblue; border-radius: 5px;">ADD</a></td>
                                                                    </td>
                                                                
                                                                </tr>
                                                                <%}%>
                                                            </tbody>
                                                        </table>
                                                        <asp:Label runat="server" ID="lblTable"></asp:Label>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnCheck" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="line"></div>
                                        <div class="row mt-50">
                                            <div class="col-12" id="Div1" runat="server">
                                                <div class="row align-items-end">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <label class="lblModal px-2" style="font-size: 1.2rem;">List Issued Sparepart</label>
                                                    </div>
                                                </div>
                                                <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tabelFix">
                                                    <thead style="background-color: #2A476B; color: white; text-align: center;">
                                                        <tr>
                                                            <th scope="col" style="vertical-align: middle; width: 120px;" title="SPI Goods Code">SPI Goods Code</th>
                                                            <th scope="col" style="vertical-align: middle; width: 150px;">Goods Name</th>
                                                            <th scope="col" style="vertical-align: middle; width: 70px;">Min Stock</th>
                                                            <th scope="col" style="vertical-align: middle; width: 70px;">Now Stock</th>

                                                            <th scope="col" style="vertical-align: middle; width: 70px;">Qty Issued</th>
                                                            <th scope="col" style="vertical-align: middle; width: 150px;">Model</th>
                                                            <th scope="col" style="vertical-align: middle; width: 150px;">Line</th>
                                                            <th scope="col" style="vertical-align: middle; width: 100px;">Cell</th>
                                                            <th scope="col" style="vertical-align: middle; width: 100px;">Reason</th>
                                                            <th scope="col" style="vertical-align: middle; width: 150px;">Issued By</th>
                                                            <th scope="col" style="vertical-align: middle; width: 150px;">Date Issued</th>

                                                            <th scope="col" style="vertical-align: middle;"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                                <asp:Label runat="server" ID="Label1"></asp:Label>

                                            </div>
                                        </div>
                                    </div>


                                </div>


                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <input type="hidden" id="tab_content" name="tab_content" runat="server" />
                                    <input type="hidden" id="rowCount" name="row_count" runat="server" />
                                    <asp:LinkButton ID="btnOrder" Text="Issued Now" CssClass="btn btn-primary text-center" OnClick="btnOrder_Click" OnClientClick="return SaveTableData();" runat="server"></asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%--  </div>--%>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Scripts/jquery-ui.min.css" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script>
        var counter = 0;
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });

        $(function () {
            bindDataTable(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
        });


        function SaveTableData() {

            var myTab = document.getElementById('tabelFix');
            if (myTab.rows.length == 1) {
                alert('No Data on Table List Issued Sparepart');
                return false;
            } else {
                var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                updateProgress.style.display = 'block';
                var arrValues = new Array();

                // loop through each row of the table.
                for (row = 1; row < myTab.rows.length - 1; row++) {
                    // loop through each cell in a row.
                    for (c = 0; c < myTab.rows[row].cells.length; c++) {
                        var element = myTab.rows.item(row).cells[c];
                        //if (element.childNodes[0].getAttribute('type') == 'text') {
                        arrValues.push("" + element.childNodes[0].value.replace(/,/g, ' ') + "");

                    }
                }
                document.getElementById("tab_content").value = arrValues;
            }

        }

        function bindDataTable() {

            $(document).ready(function () {
                $('#tabel3Parts').dataTable({
                    deferRender: true,
                });
            });
        }

        function removeRow(oButton) {
            setTimeout(function () {
                $('#UpdateProgress').show();

                /// wait 3 seconds
                setTimeout(function () {
                    $('#UpdateProgress').hide();
                }, 200);
            }, 0);
            var empTab = document.getElementById('tabelFix');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counter = counter - 1;

            document.getElementById("rowCount").value = counter;
            //console.log(counter);

        }


        function idna5(el) {
            setTimeout(function () {
                $('#UpdateProgress').show();

                /// wait 3 seconds
                setTimeout(function () {
                    $('#UpdateProgress').hide();
                }, 200);
            }, 0);
            var number = $(el).closest('tr').index();

            var empTab = document.getElementById('tabelFix');
            var sourceTable = document.getElementById('tabel3Parts');
            var rowCnt = empTab.rows.length;   // table row count.
            var tr = empTab.insertRow(rowCnt); // the table row.
            tr = empTab.insertRow(rowCnt);
            var getGoodsCode = $('td', sourceTable.rows[number + 1]).eq(0).text();
            var getGoodsName = $('td', sourceTable.rows[number + 1]).eq(1).text();
            var getMinStock = $('td', sourceTable.rows[number + 1]).eq(2).text();
            var getNowStock = $('td', sourceTable.rows[number + 1]).eq(3).text();
            getGoodsCode = getGoodsCode.replace(/\s/g, '');
            getGoodsName = getGoodsName.replace(/\s/g, '');
            getGoodsName = getGoodsName.split(',').join('');
            getMinStock = getMinStock.replace(/\s/g, '');
            getNowStock = getNowStock.replace(/\s/g, '');

            //valueArray = ['', 'Employee Name', 'Designation', 'Age'];
            for (var c = 0; c < 12; c++) {
                var td = document.createElement('td'); // table definition.
                td = tr.insertCell(c);
                //$('td').css('background-color', 'transparent');
                td.style.backgroundColor = "white";
                if (c == 11) {      // the first column.
                    // add a button in every new row in the first column.
                    var button = document.createElement('input');

                    // set input attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's 'onclick' event.
                    button.setAttribute('onclick', 'removeRow(this)');
                    td.appendChild(button);
                }
                else
                    if (c == 0) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        ele.value = getGoodsCode;
                        ele.setAttribute("class", "form-control");
                    } else if (c == 1) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        ele.value = getGoodsName;
                        ele.setAttribute("class", "form-control");
                    } else if (c == 2) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        td.appendChild(ele);
                        ele.readOnly = true;
                        ele.value = getMinStock;
                        ele.setAttribute("class", "form-control");
                    } else if (c == 3) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        td.appendChild(ele);
                        ele.readOnly = true;
                        ele.value = getNowStock;
                        ele.setAttribute("class", "form-control");
                    } else
                        if (c == 4) {
                            var ele = document.createElement('input');
                            ele.setAttribute('type', 'text');
                            ele.setAttribute('value', '1');
                            ele.id = "txtQty";
                            td.appendChild(ele);
                            ele.setAttribute("class", "form-control");
                        }
                        else
                            if (c == 5) {

                                var array = ["301", "AUTO GUIDE CAP", "AUTOPACK", "BAIKAL", "CARTONER", "CISS", "COMMON", "COSTNER", "CRAIG/LEGERO", "FA", "FOAM SUPPORT", "FRASER", "GAGA", "GERE MOLLY", "HAV 3D", "HAV 3P", "HOKUSAI", "INK BLENDING", "KUROBE", "KUZURYU", "LANTANA", "LFP", "LIONEL", "MOLDING", "NASUNO", "NASUNO 3", "NEYMAR", "ORPHEUS", "OTHER", "SAKURA", "SEALING", "SHETLAND", "SUB 1", "SUB 2", "TAKASE", "TANIGAWA"];

                                //var array = ["AUTOPACK", "CARTONER", "CISS", "COMMON", "COSTNER/SAROMA", "FOAM SUPPORT", "GAGA", "HAV CRAIG", "HAV3D", "HAV3P", "INK BLENDING", "KUZURYU", "LEGGERO", "LFP", "NASUNO", "NASUNO 3", "NEYMAR", "OTHERS", "SAKURA", "SEALING", "SPI", "SUB", "TANIGAWA", "DEVICE", "301", "AUTO GUIDE CAP"];
                                //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                                //Create and append select list
                                var selectList = document.createElement("select");
                                selectList.id = "mySelect";
                                selectList.setAttribute("class", "form-control");
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
                            else
                                if (c == 6) {


                                    var array = ["Line NA", "Line MA", "", "Line NB", "Line MB", "", "Line NC", "Line MC", "", "Line ND", "Line MD", "", "Line NE", "Line ME", "", "Line NF", "Line MF", "", "Line NG", "Line MG", "", "Line NH", "Line MH", "", "Line NI", "Line MI", "", "Line NJ", "Line MJ", "", "Line NK", "Line MK", "", "Line NL", "Line ML", "", "Line NM", "Line MM", "", "Line NN", "Line MN", "", "Line NO", "Line MO", "", "Line NP", "Line MP", "", "Line NQ", "Line MQ", "", "Line NR", "Line MR", "", "Line NS", "Line MS", "", "Line NT", "Line MT", "", "Line NU", "Line MU", "", "Line NV", "Line MV", "", "Line NW", "Line MW", "", "Line NX", "Line MX", "", "Line NY", "Line MY", "", "Line MV", "", "Line NZ", "Line MZ"];
                                    //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                                    //Create and append select list
                                    var selectList = document.createElement("select");
                                    selectList.id = "mySelect";
                                    selectList.setAttribute("class", "form-control");
                                    //myParent.appendChild(selectList);

                                    //Create and append the options
                                    for (var i = 0; i < array.length; i++) {
                                        var option = document.createElement("option");
                                        option.value = array[i];
                                        option.text = array[i];
                                        selectList.appendChild(option);
                                    }
                                    td.appendChild(selectList); //ele.value = "asd";
                                } else
                                    if (c == 7) {


                                        var array = ["0", "1", "2", "3", "3.5", "4", "5", "5.5", "6", "7", "8", "9", "10", "11", "12", "13", "14"];
                                        //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                                        //Create and append select list
                                        var selectList = document.createElement("select");
                                        selectList.id = "mySelect";
                                        selectList.setAttribute("class", "form-control");
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
                                    // Menambahkan autocomplete di kolom "Issued By"
                                    else if (c == 8) { // Kolom untuk Issued By (Textbox dengan Autocomplete)
                                        var ele = document.createElement('input');

                                        ele.setAttribute('type', 'text');

                                        td.appendChild(ele);
                                        ele.setAttribute("class", "form-control");
                                    }
                                    else
                                        if (c == 9) {


                                            var ele = document.createElement('input');
                                            ele.setAttribute('type', 'text');
                                            ele.setAttribute('placeholder', '');
                                            td.appendChild(ele);
                                            ele.setAttribute("class", "form-control");

                                            // Menambahkan event listener untuk menangani ketikan
                                            ele.addEventListener('input', function () {
                                                console.log('Input detected in column 9');  // Debugging log

                                                var query = this.value.toLowerCase();  // Menggunakan this.value untuk mengambil inputan pengguna
                                                console.log('User input: ', query);  // Debugging log

                                                var suggestions = [];  // Variabel suggestions di dalam event listener

                                                // Jika lebih dari 3 karakter, tampilkan saran
                                                if (query.length >= 3) {
                                                    suggestions = names.filter(function (name) {
                                                        return name.toLowerCase().includes(query); // Filter nama berdasarkan input
                                                    });

                                                    console.log('Suggestions: ', suggestions); // Debugging log untuk melihat hasil saran

                                                    if (suggestions.length > 0) {
                                                        // Hapus saran sebelumnya terlebih dahulu, lalu tampilkan yang baru
                                                        clearSuggestions();
                                                        // Menampilkan saran
                                                        showSuggestions(suggestions, ele);
                                                    } else {
                                                        console.log("No suggestions found");  // Debugging log jika tidak ada saran
                                                        clearSuggestions();
                                                    }
                                                } else {
                                                    // Hapus saran jika kurang dari 3 karakter
                                                    clearSuggestions();
                                                }
                                            });
                                        } else if (c == 10) {
                                            var x = document.createElement("INPUT");
                                            x.setAttribute("type", "datetime");
                                            td.appendChild(x);
                                            x.setAttribute("class", "form-control");
                                            var today = new Date();
                                            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                                            //var time = today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds();
                                            //var gabung = date + ' ' + time
                                            x.setAttribute('value', date);
                                        }
            }
            counter = counter + 1;
            document.getElementById("rowCount").value = counter;
            console.log(counter);

        }

        // Daftar nama yang bisa disarankan
        var names = [
            "SUPRAYITNO", "HENDRA PRASETYA", "TANGGUH WISANTO", "NANANG SETIAWAN", "AGUNG PRASETYO",
            "HERMAWAN RISTRIANTORO", "IMAM MU'TI", "DENI ARI WIJAYA", "DESI DIAN KAUTSAR", "MOHAMMAD FAISAL AFIF",
            "DAVID HERMANTO", "MOH IKROM HADI", "M SYAHRUL M", "EKO HARTANTO", "SOLFITRIANTO",
            "SUPARJO", "SURYADI", "SURYONO TALWIBOWO", "MUHAMMAD FAISHOL HUSNI", "FERDINAN NDJURUMANA",
            "KHAFID MASYUDI", "WAHDI DARLIS", "TEGUH TRI MARTONO", "AGUS PRASETYO", "MUNJAROH",
            "DENNY SHALIHAT", "ABU NA'IM", "CAHYO NUGROHO", "BAGUS HENDRO WIBOWO", "TIKA ROSITA NUR AENI",
            "AGUNG HARYADI", "MUH ANNAS NUR KHOLIQ", "DEDY NURROCHMAN", "ERWIN IMANSYAH", "LALANG KRISTIAWAN",
            "DIDIK WAHYU HADI SETYAWAN", "SUTARNO", "WAWAN SETIAWAN", "SURYADI SAHAR", "PONIMAN",
            "AMRI GUNAWAN", "BAMBANG JUWITO", "INDRA CAHYA", "SEPRIO", "CHAHYADI",
            "TONI CANDRA", "ADE AULIA ADHAR", "ANDESTA HERMAN", "ANDRE HERMAWAN", "NUR FAIZAL MUNJI MUFTI",
            "HENDRA TRIGA PUTRA", "BASYIRUL FALAKH", "MUKHAMAD ASHARI", "NANANG WAHYUNIANTO", "WAHYU ENDRA RUKMANA",
            "BENNY CHRISANDY", "RIFQI USMAN", "BAGUS SETYAWAN", "PONGKI HARTANTO", "ALVIAN",
            "HASANAL FAJRI", "RIO MARTEN", "SULARTI", "ERMAWAN HERINANTO", "WASCADI",
            "ROIS SUGONDO", "ILHAM MARDHATILLAH", "ARIEF FEBRIANTO", "SUPRIATNO", "ANTONI FAJAR",
            "AGUSTINUS ARY NOPRIYANTO", "GALIH TIRTA DWI ATMA", "HARRY MULYADI", "SUYOTO", "SUPRIYADI",
            "ZULFAJRI", "NADHYA FARISHI", "MARILI KARTIKA SANDRA DEWI", "DERI ANOTHA", "FARIZ RIDHA",
            "MANGARANAP SIMATUPANG", "WAHID HUSIN", "ANGGI MELLYANTO NASRA", "YOSSI WIDIATMOKO", "DIAN SETIAWAN",
            "MOHAMAD ILHAM DARMAWAN", "HARY HARYONO", "RADIUS PERDANA", "YUDI PRANATA", "ADI FIRMANSYAH",
            "LUGAS GRAFITY", "AGUNG WIRANATA", "ALBABETO BOBY MADYAN", "FIRDAUS",
            "IBNU SADDAM ALPARMISI", "RAHIM WAHYUDI", "YOSEPTIA WARMAN", "OKI FITRA KASMAYUDI", "VERI FERNANDO",
            "ANDRECO BAYU AKSANA PUTRA", "RAMADHANI", "DANY YUNATA", "ELY BUDIONO", "MOCHAMMAD YUSUF ADITYA",
            "MUHAIMIN", "NURHUDA", "BAYU REMA PUTRA", "HARI WIJAYA", "NIKO NOVIANDRI", "RINALDI",
            "DAME ARI RANGKUTI", "IRFAN FAISAL", "AFRIANDRA", "KAMARUZZAMAN", "REGGI FEBRIANDY",
            "AGUNG DWI PRASETYO", "DEDI IRAWAN", "ADIANSYAH", "AFNIZAR MALIK AMRULLOH", "FRENKY BAYU SAPUTRA",
            "RIZAL RIWAYANTO", "MUSTOFA EKA SETYO BUDI", "ICHWANUL MUSLIMIN", "SUKANTA", "IBNU SHOLIHAN",
            "AL HADRIL", "ANGGA YUDHA PRATAMA", "FAIZAL ROZY", "M DEHEN WIJAYA", "M RANU ROBANNY",
            "RIYAN ALAMSYAH", "WISNU WICAKSONO", "YODDY ANDESMAN", "ALPLINTO P KELIAT", "ABDULLAH M",
            "WINDI MUHSIN", "SHEIRLY WIARTY", "ANDI PRASETYO", "RANDY GUSMAN", "ELDIYUDHA RYAN NUWARY",
            "RIZKY AFDHAL", "EKO KURNIAWAN", "RIZKI GUNAWAN", "NOVITA ANDIKASARI", "AGA EKA PRAYITNA",
            "FERDIANSYAH MARJA", "ANDRI TRISWARI", "IPENSIUS TUA SIMORANGKIR", "MUHAMMAD ADRIAN ARIOWIBOWO",
            "HADI SUPRIYADI", "ILYAS LUKMANUL HAKIM", "GUNAWAN ADI SAPUTRA", "MUIZZ RYANNANDA HARIYANTO",
            "NALURI NIKA DWI JAYA", "MANDALA PUTRA", "RAHMAT SURYADI", "RIO GAUTAMA",
            "ZAKIA FARADESMA SAHARANI", "IRMAN MAULANA YUSUP", "MUHAMMAD RIDHO ALAMSYAH PUTRA",
            "RONI SAPUTRA TANDUNI", "RIZKI FEBRIYADI", "ABILLYO RAFLI", "MUHAMMAD ZAQI MUHAYAT",
            "RAFKI FERNANDA", "IBNU WAHAB SIDIQ", "KELFIN ILFERDO", "ANDIKA MUHARDIANSYAH",
            "MUHAMAT ARTHA JAILANDI LINTANG", "ROZA JUNITA", "FERNANDA WAHYU PRATAMA", "VIKY YANDRA",
            "MUHAMAD RICHARDSON BANGUN", "ARDIE YOGA PRATAMA", "LOBY LITA NELAZ", "ADHERA PRABU NOEGROHO",
            "ARYA PUTRA SETYAWAN", "DEDEN RIZKY PRATAMA", "DIENO TRY NUGRAHA", "JULIANSYAH", "AFAN PRIANTO",
            "AZIS YOGA PRATAMA", "WIDSON", "SYLFANY DELLA SAGITA", "JERRY FARENZA",
            "VILONA FITRI ALFIONITA", "MIFTAHUL AIN UBAIDILLAH", "RISQI DWI ANUGRAHA",
            "MUHAMMAD NAUFAL HARIS SANTOSO", "GERY RETANUBUN", "YOGA PUNANDA HIDAYAT", "RIDWAN ZEEN",
            "NOVELLA PUTRI", "ALDHA FEBRIYAN SEMBIRING", "ENDRA GUNAWAN", "ANISA FITRIANTI",
            "ALFANDI", "MUHAMMAD SULAIMAN BALYA", "DIAN PRANATA", "ACHMAD YOGA SETIAWAN",
            "NAUFAL DWI CAHYA", "RAHMAD VADLY", "MUHAMMAD RAFA SUMARTO", "PENDRA AMRIL",
            "MUHAMMAD WISNU KHADAPI", "MUH HAFIDZ ALI MUSTOFA", "YUSUF ARIQ SURYA HARAHAP", "ADI KURNIAWAN",
            "M HASBI AGUS", "ZARGION HIDAYAT", "EDI SUGIONO", "MUHAMAD ARSYAD", "MHD ZAINAL FIKRI",
            "WAHYU NUR ACHMAD SAPUTRA", "HABIL FIRSTANTONO", "MUHAMMAD RIDDHO TRI WAHYUDI RAHMAN",
            "FAKHRUR REZA", "RIO KRISMA RIAWAN", "ADE NURAVITA", "FRENGKY JANURDI", "FHADILAH ARIEF",
            "CYRILLUS RUDI SORU", "DAFFA EL FARAS", "VEGA MAGHFIRA", "JACKY ARMANSYAH", "ADI BAYU SAPUTRO"
        ];

        function showSuggestions(suggestions, inputElem) {
            console.log("showSuggestions called");

            if (suggestions.length > 0) {
                var suggestionBox = document.createElement('div');
                suggestionBox.setAttribute('class', 'suggestion-box');
                suggestionBox.style.position = 'inherit';
                suggestionBox.style.border = '1px solid #ccc';
                suggestionBox.style.backgroundColor = '#fff';
                suggestionBox.style.maxHeight = '150px';
                suggestionBox.style.overflowY = 'auto';
                suggestionBox.style.width = inputElem.offsetWidth + 'px';
                suggestionBox.style.zIndex = 9999;

                // Menentukan posisi suggestionBox dengan lebih eksplisit
                var rect = inputElem.getBoundingClientRect();

                // Posisi dropdown tepat di bawah input
                suggestionBox.style.top = rect.bottom + window.scrollY + 'px'; // Tempatkan di bawah input
                suggestionBox.style.left = rect.left + window.scrollX + 'px';  // Sesuaikan dengan lebar input

                inputElem.parentNode.appendChild(suggestionBox);

                suggestions.forEach(function (suggestion) {
                    var suggestionItem = document.createElement('div');
                    suggestionItem.textContent = suggestion;
                    suggestionItem.style.padding = '8px';
                    suggestionItem.style.cursor = 'pointer';
                    suggestionItem.style.color = '#000';
                    suggestionItem.style.backgroundColor = '#fff';

                    suggestionItem.addEventListener('mouseover', function () {
                        suggestionItem.style.backgroundColor = '#e0e0e0';
                    });

                    suggestionItem.addEventListener('mouseout', function () {
                        suggestionItem.style.backgroundColor = '#fff';
                    });

                    suggestionItem.addEventListener('click', function () {
                        inputElem.value = suggestion;
                        clearSuggestions();
                    });

                    suggestionBox.appendChild(suggestionItem);
                });

                console.log("Suggestion box added");
            } else {
                console.log("No suggestions to display");
            }
        }


        // Fungsi untuk menghapus saran
        function clearSuggestions() {
            var existingSuggestions = document.querySelectorAll('.suggestion-box');
            existingSuggestions.forEach(function (suggestionBox) {
                suggestionBox.remove();
            });
            console.log("Suggestions cleared");
        }



    </script>


</body>

</html>
