<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mongoDB.aspx.cs" Inherits="sparepartproject.mongoDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>MDP Loan Integration</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <script src="Scripts/fontawesome.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="Content/bootstrap-datepicker.min.css" />

    <style>
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

        /*.dataTables_filter {
            float: left !important;
            margin-left: 20px;
        }*/

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

        #btnExport {
            font-size: .7rem;
            border-radius: 5px;
        }

        #btnPartComingSPI, #btnSendMail {
            font-size: .8rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
        }

        #btnSendMail {
            font-size: .7rem;
            float: left;
            margin-bottom: 5px;
            margin-right: 10px;
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
        }
            .overlay::before {
                margin: auto;
                display: block;
                text-align: center;
                content: url('loading.gif');
            }
    </style>
</head>
<body>
    <label id="lbl1"></label>
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
                <li class="active">
                    <a href="#mdpSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">MDP</a>
                    <ul class="collapse list-unstyled" id="mdpSubmenu">
                        <li>
                            <a href="mdp_database.aspx">MDP Database</a>
                        </li>
                        <li>
                            <a href="mongoDB.aspx">MDP Loan</a>
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
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">MDP Loan</h5>
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
                <asp:UpdateProgress ID="UpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                            <p>Processing data, please wait...</p>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <div class="row">
                        <div class="col-12">
                            <label style="margin-top: 0px; font-size: 1.5rem;">List Waiting Approval MDP Loan</label>
                            <div class="row mt-3"></div>
                            <table class="table table-sm table-hover" style="font-size: .7rem; font-family: Tahoma; cursor: pointer; text-align: center;" id="tblTransacPart">
                                <thead style="background-color: #172679; color: white; text-align: center;">
                                    <tr>
                                        <th scope="col" style="vertical-align: middle;" title="MDP Req No">Req No</th>
                                        <th scope="col" style="vertical-align: middle;" title="MDP Req No">Req Date</th>
                                        <th scope="col" style="vertical-align: middle;" title="SPI Goods Code">Req By</th>
                                        <th scope="col" style="vertical-align: middle;">SPV Name</th>
                                        <th scope="col" style="vertical-align: middle;">SPV Approval Status</th>
                                        <th scope="col" style="vertical-align: middle;">MGR Name</th>
                                        <th scope="col" style="vertical-align: middle;">MGR Approval Status</th>
                                        <th scope="col" style="vertical-align: middle;">GM Name</th>
                                        <th scope="col" style="vertical-align: middle;">GM Approval Status</th>
                                    </tr>
                                </thead>
                                <tbody>
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
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        var listLoans = [];
        $(document).ready(function () {
            getTransactionData();
        });

        function getTransactionData(data) {
            var updateProgress = $get("<%= UpdateProgress.ClientID %>");
            $('#UpdateProgress').show();
            $.ajax({
                type: "POST",
                dataType: "json",
                async: false,
                contentType: "application/json; charset=utf-8",
                url: 'mongodb.aspx/getTransactionParts',
                data: '',
                success: function (data) {

                    $.each(data.d, function (i, v) {
                        listLoans.push({
                            reqNo: v.reqNo,
                            employeeId: v.requestedBy,
                            reqDate: v.reqDate,
                            approverSpvId: v.approverSpv.id,
                            approverSpvStatus: v.approverSpv.isApproved,
                            approverMgrId: v.approverManager.id,
                            approverMgrStatus: v.approverManager.isApproved,
                            approverGMId: v.approverGMManager.id,
                            approverGMStatus: v.approverGMManager.isApproved,
                            approverSPVName: v.approverSpv.Name,
                            approverManagerName: v.approverManager.Name,
                            approverGMName: v.approverGMManager.Name,
                        });
                    });
                    console.log(listLoans);
                    var employeeTable = $('#tblTransacPart tbody');
                    employeeTable.empty();
                    for (var i = 0; i < listLoans.length; i++) {
                        var getDate = new Date(parseInt(listLoans[i].reqDate.substr(6)));
                        var fixDate = new Date(getDate).toISOString().slice(0, 10);
                        employeeTable.append('<tr><td>' + listLoans[i].reqNo + '</td><td>' + fixDate + '</td><td>' + listLoans[i].employeeId + '</td><td>' + listLoans[i].approverSPVName + '</td><td>' + listLoans[i].approverSpvStatus + '</td><td>' + listLoans[i].approverManagerName + '</td><td>' + listLoans[i].approverMgrStatus + '</td><td>' + listLoans[i].approverGMName + '</td><td>' + listLoans[i].approverGMStatus + '</td></tr>');
                    };
                    $('#tblTransacPart').dataTable({
                        deferRender: true,
                        "order": [[1, 'desc']],
                    });
                    $('#UpdateProgress').hide();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Status: " + textStatus); alert("Error: " + XMLHttpRequest.responseText);
                }
            })
        }
    </script>
</body>
</html>
