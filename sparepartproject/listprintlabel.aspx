<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listprintlabel.aspx.cs" Inherits="sparepartproject.listprintlabel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Sparepart Inventory - Print Label</title>
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

        #btnExport, #btnDownload, #btnClose {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnPartComingSPI {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
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
                            <a href="sparepartorder.aspx">Order Part</a>
                        </li>
                        <li>
                            <a href="comingpart.aspx">Coming Part</a>
                        </li>
                        <li>
                            <a href="listprintlabel.aspx" style="background-color: white; color: #172679;">List Print Label</a>
                        </li>
                        <li>
                            <a href="closedactivity.aspx">Closed Activity</a>
                        </li>
                        <li id="menuModifHistory">
                            <a href="modification_history.aspx">Modification History</a>
                        </li>
                    </ul>
                </li>
                <%--<li>
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

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px; font-weight:500;">List Print Label</h5>
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
                    <div class="col-12">
                        <label style="margin-top: 0px; font-size: 1.5rem; font-weight:500;">List All Activity</label>
                        <div class="row mt-3"></div>
                        <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tblprintlabel">
                            <thead style="background-color: #2A476B; color: white; text-align: center;">
                                <tr>
                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ID.</th>
                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ITEM DESCRIPTION</th>
                                    <th scope="col" style="vertical-align: middle;">PARTCODE</th>
                                    <th scope="col" style="vertical-align: middle;">PO</th>
                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                    <th scope="col" style="vertical-align: middle;">APPLY</th>
                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                    <th scope="col" style="vertical-align: middle;">RECEIVED SPI</th>
                                    <th scope="col" style="vertical-align: middle;">QTY</th>
                                    <th scope="col"  style="vertical-align: middle;">ACTION</th>
                                    <th scope="col"  style="vertical-align: middle;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--<tr>
                                    <td>
                                        <input type="checkbox" class="checkbox" /></td>
                                    <td>asdasd</td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-12">
                        <label style="margin-top: 0px; font-size: 1.5rem;" id="lblPrintLabel">List Print Label</label>
                        <div class="row mt-3"></div>
                        <div id="divConf">
                            <div class="col-lg-12" style="padding-left: 40px;">
                                <div style="padding: 10px 20px; width: 100%; color: #333; font-size: .8rem; text-decoration: none; border-left: 1px solid #ccc; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 0px; background: rgba(255,56,109,0.2)">Please Choose Item</div>
                            </div>
                        </div>
                        <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer;" id="tblFix">
                            <thead style="background-color: #2A476B; color: white; text-align: center;">
                                <tr>
                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ID.</th>
                                    <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">ITEM DESCRIPTION</th>
                                    <th scope="col" style="vertical-align: middle;">PARTCODE</th>
                                    <th scope="col" style="vertical-align: middle;">PO</th>
                                    <th scope="col" style="vertical-align: middle;">PURPOSE</th>
                                    <th scope="col" style="vertical-align: middle;">APPLY</th>
                                    <th scope="col" style="vertical-align: middle;">PIC</th>
                                    <th scope="col" style="vertical-align: middle;">RECEIVED SPI</th>
                                    <th scope="col" style="vertical-align: middle;">QTY</th>
                                    <th scope="col" style="vertical-align: middle;">ACTUAL PIC</th>
                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                    <th scope="col" style="vertical-align: middle;">ACTION</th>
                                    <%--<th scope="col" style="vertical-align: middle;">ACTION</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <%--<button id="btnPrint">Print</button>--%>
                        <input type="hidden" id="tabcontentclose" name="tab_content" runat="server" />
                        <input type="hidden" id="tab_content" name="tab_content" runat="server" />
                        <input type="hidden" id="rowCount" name="row_count" runat="server" />

                        <asp:Button CssClass="btn btn-success" runat="server" OnClientClick="return SaveTableData();" ID="btnDownload" OnClick="btnDownload_Click" Text="Export" />
                        <asp:Button CssClass="btn btn-success" runat="server" OnClientClick="return SaveTableDataClose();" ID="btnClose"  Text="Close" OnClick="btnClose_Click" />

                    </div>
                </div>


            </form>
        </div>
    </div>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">

        var counter = 0;
        var counterclose = 0;
        function SaveTableData() {

            var myTab = document.getElementById('tblFix');
            if (myTab.rows.length == 1) {
                alert('No Data on Table List Print Label');
                return false;
            } else {
                var arrValues = new Array();

                // loop through each row of the table.
                for (row = 1; row < myTab.rows.length - 1; row++) {
                    // loop through each cell in a row.
                    for (c = 0; c < myTab.rows[row].cells.length; c++) {
                        var element = myTab.rows.item(row).cells[c];
                        arrValues.push("" + element.childNodes[0].value.replace(/,/g, ' ') + "");
                    }
                }
                document.getElementById("tab_content").value = arrValues;
            }

            setTimeout(function () {
                window.location.reload(1);
            }, 3500);
        }


        function SaveTableDataClose() {

            var myTab = document.getElementById('tblFix');
            if (myTab.rows.length == 1) {
                alert('No Data on Table List Close Activity');
                return false;
            } else {
                var arrValues = new Array();

                // loop through each row of the table.
                for (row = 1; row < myTab.rows.length - 1; row++) {
                    // loop through each cell in a row.
                    for (c = 0; c < myTab.rows[row].cells.length; c++) {
                        var element = myTab.rows.item(row).cells[c];
                        arrValues.push("" + element.childNodes[0].value.replace(/,/g, ' ') + "");
                    }
                }
                document.getElementById("tabcontentclose").value = arrValues;
            }

            setTimeout(function () {
                window.location.reload(1);
            }, 3500);
        }

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

            getAllPrintLabel();
            $('#tblFix').hide();
            $('#btnDownload').hide();
            $('#btnClose').hide();
        })

        var a = [];
        function getData() {
            $('#tblprintlabel').on('click', 'tr', function () {
                a.push($('td', this).eq(0).text());
                console.log(a);
            })
        }

        var events = [];
        function getAllPrintLabel() {
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                url: "listprintlabel.aspx/GetEvents",
                success: function (data) {
                    var tblComingPart = $('#tblprintlabel tbody');
                    //tblComingPart.empty();
                    $.each(data.d, function (i, v) {
                        //untuk mendeteksi apakah ada datanya
                        events.push({
                            id: v.itemDescription
                        })

                        //membuat row dari setiap data part coming di table part coming <td><input type="checkbox" class="checkbox" onclick="getData()"/></td>

                        tblComingPart.append('<tr style="text-align:center;"><td>' + v.id + '</td><td>' + v.itemDescription + '</td><td>' + v.partcode + '</td><td>' + v.poNumber + '</td><td>' + v.purpose + '</td><td>' + v.apply + '</td><td>' + v.model + '</td><td>' + v.pic + '</td><td>' + v.receivedSPI + '</td><td>' + v.qtyNumber + '</td><td><a onClick="idna5(this)" class="p-1" style="cursor: pointer; color: white; font-weight: bold; background-color: darkblue; border-radius: 5px;">Print</a></td><td><a onClick="idna5close(this)" class="p-1" style="cursor: pointer; color: white; font-weight: bold; background-color: green; border-radius: 5px;">Close</a></td></tr>');
                    });
                    $('#tblprintlabel').dataTable({
                        deferRender: true,
                        "order": [[0, "desc"]]
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert('Something error. Please contact Randy.');
                }
            })
        }

        function idna5(el) {
            if (counter == 6) {
                alert('oops maksimum 6 list sparepart Activity sudah tercapai, mohon dihapus dulu salah satunya ya :)');
                return;
            }

            if (counterclose > 0) {
                alert('Ooppss data list Tabel Fix merupakan Data Close Activity. Silahkan hapus seluruh data terlebih dahulu untuk memasukkan List Print Label.');
                return;
            }
            document.getElementById('lblPrintLabel').innerText = 'List Print Label';

            //$('#lblPrintLabel').text = 'List Print Label';

            //ini untuk mendapatkan data id per row
            //var number = $(el).closest('tr').index();
            //console.log(number);

            var number = $(el).closest('tr').index();

            var empTab = document.getElementById('tblFix');
            var sourceTable = document.getElementById('tblprintlabel');
            var rowCnt = empTab.rows.length;   // table row count.
            var tr = empTab.insertRow(rowCnt); // the table row.
            tr = empTab.insertRow(rowCnt);



            //var number = $(el).closest('tr').index();

            //var empTab = document.getElementById('tblFix');
            //var sourceTable = document.getElementById('tblprintlabel');

            //var rowss = document.createElement('tr');
            //rowss = empTab.insertRow();

            var getID = $('td', sourceTable.rows[number + 1]).eq(0).text();
            var getDescrription = $('td', sourceTable.rows[number + 1]).eq(1).text();
            var getPartcode = $('td', sourceTable.rows[number + 1]).eq(2).text();
            var getPO = $('td', sourceTable.rows[number + 1]).eq(3).text();
            var getPurpose = $('td', sourceTable.rows[number + 1]).eq(4).text();
            var getApply = $('td', sourceTable.rows[number + 1]).eq(5).text();
            var getPIC = $('td', sourceTable.rows[number + 1]).eq(6).text();
            var getReceivedSPI = $('td', sourceTable.rows[number + 1]).eq(7).text();
            var getQty = $('td', sourceTable.rows[number + 1]).eq(8).text();

            for (var c = 0; c < 12; c++) {
            //for (var c = 0; c < 10; c++) {
                var td = document.createElement('td'); // table definition.
                td = tr.insertCell(c);
                //$('td').css('background-color', 'transparent');
                td.style.backgroundColor = "white";
                if (c == 11) {      // the first column.
                //if (c == 9) {      // the first column.
                    // add a button in every new row in the first column.
                    var button = document.createElement('input');

                    // set input attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's 'onclick' event.
                    button.setAttribute('onclick', 'removeRowConfirmation(this)');

                    td.appendChild(button);
                    td.width = "10%";
                }
                else
                    if (c == 0) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        td.width = "10%";
                        ele.value = getID;
                        ele.align = "center";
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                        ele.style.padding = '0px';

                        //td.innerText = getGoodsCode;
                    } else if (c == 1) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        td.width = "25%";
                        ele.value = getDescrription;
                        ele.width = "100%";
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    } else if (c == 2) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        td.appendChild(ele);
                        ele.readOnly = true;
                        ele.value = getPartcode;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    } else if (c == 3) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPO;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    }
                    else if (c == 4) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPurpose;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    }
                    else if (c == 5) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getApply;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 6) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPIC;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 7) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getReceivedSPI;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 8) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getQty;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    
            }

            counter = counter + 1;
            console.log(counter + 'counter fix label');
            $('#tblFix').show();
            $('#btnDownload').show();

            if (counter > 0) {
                $('#divConf').hide();
                $('#tblFix').show();
                $('#btnDownload').show();

            }
        }


        function idna5close(el) {
            if (counter > 0) {
                alert('Ooppss data list Tabel Fix merupakan Data Print Label. Silahkan hapus seluruh data terlebih dahulu untuk memasukkan List Close Activity.');
                return;
            }
            document.getElementById('lblPrintLabel').innerText = 'List Close Activity';
            

            
            //ini untuk mendapatkan data id per row
            //var number = $(el).closest('tr').index();
            //console.log(number);

            var number = $(el).closest('tr').index();

            var empTab = document.getElementById('tblFix');
            var sourceTable = document.getElementById('tblprintlabel');
            var rowCnt = empTab.rows.length;   // table row count.
            var tr = empTab.insertRow(rowCnt); // the table row.
            tr = empTab.insertRow(rowCnt);



            //var number = $(el).closest('tr').index();

            //var empTab = document.getElementById('tblFix');
            //var sourceTable = document.getElementById('tblprintlabel');

            //var rowss = document.createElement('tr');
            //rowss = empTab.insertRow();

            var getID = $('td', sourceTable.rows[number + 1]).eq(0).text();
            var getDescrription = $('td', sourceTable.rows[number + 1]).eq(1).text();
            var getPartcode = $('td', sourceTable.rows[number + 1]).eq(2).text();
            var getPO = $('td', sourceTable.rows[number + 1]).eq(3).text();
            var getPurpose = $('td', sourceTable.rows[number + 1]).eq(4).text();
            var getApply = $('td', sourceTable.rows[number + 1]).eq(5).text();
            var getPIC = $('td', sourceTable.rows[number + 1]).eq(7).text();
            var getReceivedSPI = $('td', sourceTable.rows[number + 1]).eq(8).text();
            var getQty = $('td', sourceTable.rows[number + 1]).eq(9).text();
            var getOriginalModel = $('td', sourceTable.rows[number + 1]).eq(6).text();

            for (var c = 0; c < 12; c++) {
            //for (var c = 0; c < 10; c++) {
                var td = document.createElement('td'); // table definition.
                td = tr.insertCell(c);
                //$('td').css('background-color', 'transparent');
                td.style.backgroundColor = "white";
                //if (c == 9) {      // the first column.
                if (c == 11) {      // the first column.
                    // add a button in every new row in the first column.
                    var button = document.createElement('input');

                    // set input attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's 'onclick' event.
                    button.setAttribute('onclick', 'removeRowConfirmationClose(this)');

                    td.appendChild(button);
                    td.width = "10%";
                }
                else
                    if (c == 0) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        td.width = "10%";
                        ele.value = getID;
                        ele.align = "center";
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                        ele.style.padding = '0px';

                        //td.innerText = getGoodsCode;
                    } else if (c == 1) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.readOnly = true;
                        td.appendChild(ele);
                        td.width = "25%";
                        ele.value = getDescrription;
                        ele.width = "100%";
                        ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';



                        //var ele = document.createElement('input');
                        //ele.setAttribute('type', 'text');
                        //ele.setAttribute('value', '');
                        //ele.readOnly = true;
                        //td.appendChild(ele);
                        //ele.value = getDescrription;
                        //ele.setAttribute("class", "form-control");
                    } else if (c == 2) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        td.appendChild(ele);
                        ele.readOnly = true;
                        ele.value = getPartcode;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    } else if (c == 3) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPO;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                    }
                    else if (c == 4) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPurpose;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 5) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getApply;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 6) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getPIC;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 7) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getReceivedSPI;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';


                    }
                    else if (c == 8) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        ele.value = getQty;

                        td.appendChild(ele);
                        ele.readOnly = true;
                        //ele.setAttribute("class", "form-control");
                        ele.style.backgroundColor = 'transparent';
                        ele.style.border = '0px';
                        ele.style.align = 'center';


                    }
                    else if (c == 9) {
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('value', '');
                        td.appendChild(ele);
                        ele.readOnly = false;
                        ele.style.backgroundColor = 'transparent';


                    }
                if (c == 10) {

                    var array = ["301", "AUTO GUIDE CAP", "AUTOPACK", "BAIKAL", "CARTONER", "CISS", "COMMON", "COSTNER", "CRAIG/LEGERO", "FA", "FOAM SUPPORT", "FRASER", "GAGA", "GERE MOLLY", "HAMANA GROW", "HAV 3D", "HAV 3P", "HOKUSAI", "INK BLENDING", "KUROBE", "KUZURYU", "LANTANA", "LFP", "LIONEL", "MOLDING", "NASUNO", "NASUNO 3", "NEYMAR", "ORPHEUS", "OTHER", "SAKURA", "SEALING", "SHETLAND", "SUB 1", "SUB 2", "TAKASE", "TANIGAWA", "TOYA"];

                    //var array = ["AUTOPACK", "CARTONER", "CISS", "COMMON", "COSTNER/SAROMA", "FOAM SUPPORT", "GAGA", "HAV CRAIG", "HAV3D", "HAV3P", "INK BLENDING", "KUZURYU", "LEGGERO", "LFP", "NASUNO", "NASUNO 3", "NEYMAR", "OTHERS", "SAKURA", "SEALING", "SPI", "SUB", "TANIGAWA", "DEVICE", "301", "AUTO GUIDE CAP"];
                    //var array = ["BAKER", "Cartoner", "CISS", "CRAIG / LEGERO", "Fraser", "GERE MOLLY", "Hav 3D", "Hav Large", "HAV3-P", "Ink Blending", "KUROBE", "KUZURYU", "LANTANA", "LFP", "MASHU", "NASUNO", "NASUNO 3", "NEYMAR", "NONE", "ORPHEUS", "Sakura", "SAROMA/COSTNER", "SHETLAND", "SUB 1", "SUB 2", "TAKASE"];
                    //Create and append select list
                    var selectList = document.createElement("select");
                    selectList.id = "mySelect";
                    //selectList.setAttribute("class", "form-control");
                    //myParent.appendChild(selectList);

                    //Create and append the options
                    for (var i = 0; i < array.length; i++) {
                        var option = document.createElement("option");
                        option.value = array[i];
                        option.text = array[i];
                        selectList.appendChild(option);
                    }

                    if (getOriginalModel == '301') {
                        selectList.selectedIndex = 0;
                    } else if (getOriginalModel == 'AUTO GUIDE CAP') {
                        selectList.selectedIndex = 1;
                    } else if (getOriginalModel == 'AUTOPACK') {
                        selectList.selectedIndex = 2;
                    } else if (getOriginalModel == 'BAIKAL') {
                        selectList.selectedIndex = 3;
                    } else if (getOriginalModel == 'CARTONER') {
                        selectList.selectedIndex = 4;
                    } else if (getOriginalModel == 'CISS') {
                        selectList.selectedIndex = 5;
                    } else if (getOriginalModel == 'COMMON') {
                        selectList.selectedIndex = 6;
                    } else if (getOriginalModel == 'COSTNER') {
                        selectList.selectedIndex = 7;
                    } else if (getOriginalModel == 'CRAIG/LEGERO') {
                        selectList.selectedIndex = 8;
                    } else if (getOriginalModel == 'FA') {
                        selectList.selectedIndex = 9;
                    } else if (getOriginalModel == 'FOAM SUPPORT') {
                        selectList.selectedIndex = 10;
                    } else if (getOriginalModel == 'FRASER') {
                        selectList.selectedIndex = 11;
                    } else if (getOriginalModel == 'GAGA') {
                        selectList.selectedIndex = 12;
                    } else if (getOriginalModel == 'GERE MOLLY') {
                        selectList.selectedIndex = 13;
                    } else if (getOriginalModel == 'HAMANA GROW') {
                        selectList.selectedIndex = 14;
                    } else if (getOriginalModel == 'HAV 3D') {
                        selectList.selectedIndex = 15;
                    } else if (getOriginalModel == 'HAV 3P') {
                        selectList.selectedIndex = 16;
                    } else if (getOriginalModel == 'HOKUSAI') {
                        selectList.selectedIndex = 17;
                    } else if (getOriginalModel == 'INK BLENDING') {
                        selectList.selectedIndex = 18;
                    } else if (getOriginalModel == 'KUROBE') {
                        selectList.selectedIndex = 19;
                    } else if (getOriginalModel == 'KUZURYU') {
                        selectList.selectedIndex = 20;
                    } else if (getOriginalModel == 'LANTANA') {
                        selectList.selectedIndex = 21;
                    } else if (getOriginalModel == 'LFP') {
                        selectList.selectedIndex = 22;
                    } else if (getOriginalModel == 'LIONEL') {
                        selectList.selectedIndex = 23;
                    } else if (getOriginalModel == 'MOLDING') {
                        selectList.selectedIndex = 24;
                    } else if (getOriginalModel == 'NASUNO') {
                        selectList.selectedIndex = 25;
                    } else if (getOriginalModel == 'NASUNO 3') {
                        selectList.selectedIndex = 26;
                    } else if (getOriginalModel == 'NEYMAR') {
                        selectList.selectedIndex = 27;
                    } else if (getOriginalModel == 'ORPHEUS') {
                        selectList.selectedIndex = 28;
                    } else if (getOriginalModel == 'OTHER') {
                        selectList.selectedIndex = 29;
                    } else if (getOriginalModel == 'SAKURA') {
                        selectList.selectedIndex = 30;
                    } else if (getOriginalModel == 'SEALING') {
                        selectList.selectedIndex = 31;
                    } else if (getOriginalModel == 'SHETLAND') {
                        selectList.selectedIndex = 32;
                    } else if (getOriginalModel == 'SUB 1') {
                        selectList.selectedIndex = 33;
                    } else if (getOriginalModel == 'SUB 2') {
                        selectList.selectedIndex = 34;
                    } else if (getOriginalModel == 'TAKASE') {
                        selectList.selectedIndex = 35;
                    } else if (getOriginalModel == 'TANIGAWA') {
                        selectList.selectedIndex = 36;
                    } else if (getOriginalModel == 'TOYA') {
                        selectList.selectedIndex = 37;
                    }
                    td.appendChild(selectList); //ele.value = "asd";
                }

            }

            counterclose = counterclose + 1;
            console.log(counterclose + 'counter fix label');
            $('#tblFix').show();
            $('#btnClose').show();

            if (counterclose > 0) {
                $('#divConf').hide();
                $('#tblFix').show();
                $('#btnClose').show();

            }
        }

        function removeRowConfirmation(oButton) {
            var empTab = document.getElementById('tblFix');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counter = counter - 1;
            if (counter == 0) {
                //$('#tblPartsListConfirmation').hide();
                $('#tblFix').hide();
                //tblPartsListConfirmation.append('<div class="col-lg-12 addPart" id="divAddPart" style="display:block; margin-bottom:3px; cursor:pointer; padding:5px 10px; color:#333; font-size:.8rem; text-decoration:none; border:1px solid #ccc; background:rgba(255,56,109,0.2)">No Sparepart Used in this Activity</div>');
                //$('#divConf').clear();
                //$('#divConf').append('<div class="col-lg-12" style="padding-left:40px;"><div style="padding:10px 20px;  width:100%; color:#333; font-size:.8rem; text-decoration:none; border-left:1px solid #ccc; border-top:1px solid #ccc; border-bottom:1px solid #ccc; border-right:0px; background:rgba(255,56,109,0.2)">Please Choose Item</div></div>');
                $('#divConf').show();
                $('#btnDownload').hide();

            } else {
                $('#tblFix').show();
                $('#btnDownload').show();

            }
        }

        function removeRowConfirmationClose(oButton) {
            var empTab = document.getElementById('tblFix');
            empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
            counterclose = counterclose - 1;
            if (counterclose == 0) {
                //$('#tblPartsListConfirmation').hide();
                $('#tblFix').hide();
                //tblPartsListConfirmation.append('<div class="col-lg-12 addPart" id="divAddPart" style="display:block; margin-bottom:3px; cursor:pointer; padding:5px 10px; color:#333; font-size:.8rem; text-decoration:none; border:1px solid #ccc; background:rgba(255,56,109,0.2)">No Sparepart Used in this Activity</div>');
                //$('#divConf').clear();
                //$('#divConf').append('<div class="col-lg-12" style="padding-left:40px;"><div style="padding:10px 20px;  width:100%; color:#333; font-size:.8rem; text-decoration:none; border-left:1px solid #ccc; border-top:1px solid #ccc; border-bottom:1px solid #ccc; border-right:0px; background:rgba(255,56,109,0.2)">Please Choose Item</div></div>');
                $('#divConf').show();
                $('#btnClose').hide();

            } else {
                $('#tblFix').show();
                $('#btnClose').show();

            }
        }

        $('#btnPrint').click(function () {
            alert('print');
        })
    </script>
</body>
</html>
