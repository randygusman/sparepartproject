<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="informationitem_summary.aspx.cs" Inherits="sparepartproject.informationitem_summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Information Item - Summary</title>
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

        #gvExpenses_Activity {
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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
</body>
</html>
