<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="closedactivity.aspx.cs" Inherits="sparepartproject.closedactivity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Sparepart Inventory - Closed Activity</title>
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
                            <a href="spi_databasepart.aspx">Database Part</a>
                        </li>
                        <li>
                            <a href="dailyissuedpart.aspx">Daily Issued Part</a>
                        </li>
                        <li id="menuLoanList">
                            <a href="loanlist.aspx">Loan List</a>
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
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">List Print Label</h5>
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
                        <label style="margin-top: 0px; font-size: 1.5rem;">List Closed Activity</label>
                        <div class="row mt-3"></div>
                        <table class="table table-sm table-hover" style="font-size: .8rem; font-family:Calibri; cursor: pointer;" id="tblClosedActivity">
                            <thead style="background-color: #172679; color: white; text-align: center;">
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
                                    <th scope="col" style="vertical-align: middle;">CLOSED DATE</th>
                                    <th scope="col" style="vertical-align: middle;">TAKEN BY</th>
                                    <th scope="col" style="vertical-align: middle;">MODEL</th>
                                    <th scope="col" style="vertical-align: middle;">LOCATION</th>
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

        $(document).ready(function () {
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
            getAllClosedActivity();
        });

        var events = [];
        function getAllClosedActivity() {
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                url: "closedactivity.aspx/GetEvents",
                success: function (data) {
                    var tblComingPart = $('#tblClosedActivity tbody');
                    //tblComingPart.empty();
                    $.each(data.d, function (i, v) {
                        //untuk mendeteksi apakah ada datanya
                        events.push({
                            id: v.itemDescription
                        })

                        //membuat row dari setiap data part coming di table part coming <td><input type="checkbox" class="checkbox" onclick="getData()"/></td>

                        tblComingPart.append('<tr style="text-align:center;"><td>' + v.id + '</td><td>' + v.itemDescription + '</td><td>' + v.partcode + '</td><td>' + v.poNumber + '</td><td>' + v.purpose + '</td><td>' + v.apply + '</td><td>' + v.pic + '</td><td>' + v.receivedSPI + '</td><td>' + v.qtyNumber + '</td><td>' + v.dateClosed + '</td><td>' + v.takenBy + '</td><td>' + v.model + '</td><td>' + v.location + '</td></tr>');
                    });
                    $('#tblClosedActivity').dataTable({
                        deferRender: true,
                        "order": [[0, "desc"]]
                    });

                    //checking jika row = 0 maka display no data available
                    //if (events.length == 0) {
                    //    tblComingPart.append('<tr><td colspan="20" style="background-color:#dedede;">No Data Available</td></tr>');
                    //} else {

                    //}
                    //updateProgress.style.display = "none";
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest);
                    alert('Something error. Please contact Randy.');
                }
            })
        }
    </script>
</body>
</html>
