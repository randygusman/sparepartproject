<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="sparepartproject.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

    <script src="Scripts/jquery-3.5.1.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            // Menghapus semua item dari session storage
            sessionStorage.clear();

            // Atau, menghapus item tertentu
            sessionStorage.removeItem('name');
            sessionStorage.removeItem('role');

            console.log('Session storage telah dihapus.');

            window.location.href = "default.aspx";
        });

    </script>
</body>
</html>
