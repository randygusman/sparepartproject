<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajaxcall.aspx.cs" Inherits="sparepartproject.ajaxcall" %>

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
                <li class="active">
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
                            <a href="comingpart.aspx">Coming part</a>
                        </li>
                    </ul>
                </li>

                <%--<li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
                </li>--%>
                <li>
                    <a href="expenses.aspx">Expenses</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="Logout.aspx" class="article">Logout</a>
                </li>
            </ul>
        </nav>

    </div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <h3 class="text-uppercase text-center">How to retrive data using ajax in asp.net</h3>
            <table id="tblEmployee" class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </form>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>

    <script type="text/javascript">  
        //$(document).ready(function () {  
        //    $.ajax({  
        //        url: 'ajaxcall.aspx/GetAllEmployee',  
        //        dataType: "JSON.stringify(data)",
        //        method: 'post',  
        //        success: function (data) {  
        //            var employeeTable = $('#tblEmployee tbody');  
        //            employeeTable.empty();  
        //            $(data).each(function (index, emp) {  
        //                employeeTable.append('<tr><td>' + emp.ID + '</td><td>'  
        //                    + emp.Name + '</td><td>' + emp.Position + '</td><td>' + emp.Office  
        //                    + '</td><td>' + emp.Age + '</td><td>' + emp.Salary + '</td></tr>');  
        //            });  
        //        },  
        //        error: function (err) {  
        //            alert(Response);  

        //        }  
        //    });  
        //});  


        //$.ajax({    
        //    type: "POST",
        //    url: "/ajaxcall.aspx/Testing",
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {
        //        alert(data.d);
        //    },
        //    failure: function (response) {
        //        alert(response.d);
        //    }
        //});
        $(document).ready(function () {
            $.ajax({
                url: "/ajaxcall.aspx/GetAllEmployee",
                method: 'post',
                contentType: "application/json; charset=utf-8",

                success: function (data) {
                    var json = JSON.parse(data.d);
                    var employeeTable = $('#tblEmployee tbody');
                    employeeTable.empty();
                    $.each(json, function (index, item) {
                        employeeTable.append('<tr><td>' + item.ID + '</td><td>' + item.Name + '</td><td>' + item.Position + '</td><td>' + item.Office + '</td><td>' + item.Age + '</td><td>' + item.Salary + '</td></tr>');
                        console.log(item);
                    });
                },
                error: function (response) {
                    console.log(response);
                }
            });
        });

    </script>
</body>
</html>
