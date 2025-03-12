<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registernew.aspx.cs" Inherits="sparepartproject.registernew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - Register Part</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <%--<link rel="stylesheet" href="Style/font-awesome.css" />--%>
    <%--<link href="Style/all.min.css" rel="stylesheet" />--%>
    <link href="Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="Scripts/fontawesome.min.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />
    <!-- Add Select2 CSS -->
    <link href="Style/select2.min.css" rel="stylesheet" />
    <link href="Style/notyf.min.css" rel="stylesheet" />

    <!-- Add jQuery and Select2 JS -->



    <style>
        /* Mengatur posisi container notifikasi Notyf */
        .notyf-container {
            position: fixed !important; /* Menetapkan posisi tetap */
            top: 10px !important; /* Jarak sedikit dari atas */
            right: 10px !important; /* Jarak sedikit dari kanan */
            z-index: 9999 !important; /* Pastikan notifikasi ada di atas */
        }

        /* Gaya untuk dropdown suggestions */
        .suggestionnew {
            position: absolute; /* Letakkan dropdown di posisi yang absolut */
            background-color: white;
            border: 1px solid #ccc;
            width: 100%; /* Sesuaikan lebar dropdown dengan lebar input */
            max-height: 200px;
            overflow-y: auto;
            display: none; /* Sembunyikan secara default */
            z-index: 9999; /* Pastikan dropdown muncul di atas konten lainnya */
            padding: 0; /* Hapus padding default */
            margin: 0; /* Hapus margin default */
            list-style-type: none; /* Hapus bullet */
        }

            /* Gaya untuk setiap item dalam dropdown */
            .suggestionnew li {
                padding: 8px;
                cursor: default; /* Set cursor to default, showing no-click pointer */
                color: #8a8a8a; /* Warna teks item */
                /*pointer-events: none;*/ /* Nonaktifkan klik pada item */
                cursor: pointer;
            }

                /* Efek hover untuk item dalam dropdown */
                .suggestionnew li:hover {
                    background-color: #f1f1f1;
                    color: #333; /* Mengubah warna teks menjadi lebih gelap saat hover */
                }

        /* Menambahkan position relative pada form-group */
        .form-group {
            position: relative; /* Menjadikan form-group sebagai referensi posisi */
        }


        #registerForm input,
        #registerForm select,
        #registerForm textarea {
            font-size: 0.8rem; /* Ukuran font menjadi 0.8rem */
            font-weight: normal; /* Menghilangkan bold pada font */
        }

        /* Mengatur ukuran font pada dropdown dan hasil pilihan di select2 */
        .select2-container .select2-selection__rendered {
            font-family: Calibri;
            font-size: 0.8rem !important; /* Ukuran font untuk teks yang dipilih */
        }

        .select2-container .select2-dropdown {
            font-family: Calibri;
            font-size: 0.8rem !important; /* Ukuran font untuk dropdown */
        }

        .select2-container .select2-results__option {
            font-size: 0.8rem !important; /* Ukuran font untuk item dalam dropdown */
            font-family: Calibri;
        }

        #btnAddPart, #btnExportToExcel {
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

        .overlay {
            position: fixed;
            left: 0px;
            margin-top: 200px;
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
                content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');
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

        #imageContainer {
            display: none; /* Menyembunyikan image container saat halaman pertama kali dimuat */
        }

        #sparepartImage {
            transition: transform 0.3s ease; /* Membuat transisi halus saat zoom */
            cursor: pointer; /* Menambahkan cursor pointer untuk menunjukkan bahwa gambar bisa diperbesar */
        }
            /* Efek zoom saat hover */
            #sparepartImage:hover {
                transform: scale(1.5); /* Memperbesar gambar hingga 1.5x saat hover */
                z-index: 9999;
            }
    </style>
</head>
<body style="font-family: Poppins;">
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
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">SPI</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="registernew.aspx" style="background-color: white; color: #172679;">Register Part</a>
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
    </div>

    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span></span>
                </button>
                <h5 style="margin-bottom: 0px; margin-left: 20px;">Register New Part</h5>
                <%--<div class="garisJudul"></div>--%>
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

        <div class="container mt-5" style="font-family: Calibri">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 style="font-weight: bold;">Registrasi Sparepart</h3>
                    <i class="fas fa-times" style="cursor: pointer; color: red; font-size: 1.5rem;" onclick="closeCard()"></i>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <asp:ScriptManager runat="server"></asp:ScriptManager>

                        <div class="form-row mb-3">
                            <!-- Kolom 1 -->
                            <div class="form-group col-md-6">
                                <label for="stockistName" style="font-weight: 600;">Stockist Name</label>
                                <input type="text" class="form-control" value="IK-Spare Part" disabled id="stockistName" style="cursor: not-allowed; width: 70%;" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="goodsCode" style="font-weight: 600;">Goods Code (SPI Code)</label>
                                <input type="text" class="form-control" id="goodsCode" style="text-transform: uppercase; width: 70%;" required />
                                <!-- Update dropdown ID menjadi suggestionnew -->
                                <ul id="suggestionnew" class="suggestionnew"></ul>
                            </div>

                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 2 -->
                            <div class="form-group col-md-6">
                                <label for="goodsName" style="font-weight: 600;">Goods Name</label>
                                <input type="text" class="form-control" id="goodsName" style="width: 70%;" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="goodsDesc" style="font-weight: 600;">Goods Description</label>
                                <input type="text" class="form-control" id="goodsDesc" style="width: 70%;" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 3 -->
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Currency</label>
                                <select class="form-control" id="currency" required>
                                    <option value="">-- Pilih Currency --</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Goods Unit</label>
                                <select class="form-control" id="goodsUnit" required>
                                    <option value="">-- Pilih Unit --</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 4 -->
                            <div class="form-group col-md-6">
                                <label for="unitPrice" style="font-weight: 600;">Unit Price</label>
                                <input type="number" step="0.01" value="0" class="form-control" style="width: 70%;" id="unitPrice" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Maker</label>
                                <select class="form-control" id="maker" required>
                                    <option value="">-- Pilih Maker --</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 5 -->
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Model</label>
                                <select class="form-control" id="model" required>
                                    <option value="">-- Pilih Model --</option>
                                </select>
                            </div>
                            <%--<div class="form-group col-md-6">
                                <label for="suppName">Supplier Name</label>
                                <select class="form-control" id="suppName" required style="cursor: pointer">
                                    <option value="">-- Pilih Supplier --</option>
                                </select>
                            </div>--%>
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Supplier Name</label>
                                <select class="form-control" id="suppName" required>
                                    <option value="">-- Pilih Supplier --</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 6 -->
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Keeping (Cabinet)</label>
                                <select class="form-control" id="keeping" required>
                                    <option value="">-- Pilih Keeping --</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Sub Keeping (Drawer)</label>
                                <select class="form-control" id="drawer" required>
                                    <option value="">-- Pilih Sub Keeping --</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 7 -->
                            <div class="form-group col-md-6">
                                <label for="maxStock" style="font-weight: 600;">Max Stock</label>
                                <input type="number" class="form-control" value="0" style="width: 70%;" id="maxStock" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="minStock" style="font-weight: 600;">Min Stock</label>
                                <input type="number" class="form-control" value="0" style="width: 70%;" id="minStock" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 8 -->
                            <div class="form-group col-md-6">
                                <label for="nowStock" style="font-weight: 600;">Now Stock</label>
                                <input type="number" class="form-control" value="0" style="width: 70%;" id="nowStock" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="minOrder" style="font-weight: 600;">Min Order</label>
                                <input type="number" class="form-control" value="0" style="width: 70%;" id="minOrder" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 9 -->

                            <div class="form-group col-md-6">
                                <label for="suppName" style="font-weight: 600;">Category Part</label>
                                <select class="form-control" id="categoryPart" required>
                                    <option value="">-- Pilih Category Part --</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="PO_Doc" style="font-weight: 600;">PO Document</label>
                                <input type="text" class="form-control" id="PO_Doc" style="width: 70%;" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 10 -->
                            <div class="form-group col-md-6">
                                <label for="attcFile_Picture" style="font-weight: 600;">Attachment Picture</label>
                                <input type="file" class="form-control" id="attcFile_Picture" style="width: 70%;" name="attcFile_Picture" accept="image/*" required />
                            </div>

                            <div class="form-group col-md-6">
                                <label for="attcFile_Document" style="font-weight: 600;">Attachment Document</label>
                                <input type="file" class="form-control" id="attcFile_Document" style="width: 70%;" name="attcFile_Document" accept=".pdf, .doc, .docx, .xls, .xlsx" required />
                            </div>
                        </div>
                        <div class="form-row mb-5">
                            <div class="form-group col-md-6">

                                <!-- Menyimpan link gambar lama (sebelum diganti) -->
                                <input type="hidden" id="oldImageUrl" name="oldImageUrl" value="" />

                                <!-- Tempat untuk menampilkan gambar -->
                                <div id="imageContainer">
                                    <img id="sparepartImage" src="" alt="Gambar Sparepart" style="max-width: 300px; max-height: 300px;" />
                                </div>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <!-- Kolom 11 -->
                            <div class="form-group col-md-6">
                                <label for="stockCategory" style="font-weight: 600;">Stock Category</label>
                                <input type="text" class="form-control" id="stockCategory" style="width: 70%;" value="ACTIVE" required />
                            </div>

                            <div class="form-group col-md-6">
                                <label for="movingStatus" style="font-weight: 600;">Moving Status</label>
                                <input type="text" class="form-control" id="movingStatus" style="width: 70%;" value="Slow Moving" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 12 -->
                            <div class="form-group col-md-6">
                                <%--<label for="lastUpdateBy">Last Update By</label>
                                <input type="text" class="form-control" id="lastUpdateBy" required>--%>
                            </div>
                            <div class="form-group col-md-6">
                                <%--<label for="lastUpdateDate">Last Update Date</label>
                                <input type="datetime-local" class="form-control" id="lastUpdateDate" required>--%>
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 13 -->
                            <div class="form-group col-md-6">
                                <%--<label for="insert_date">Insert Date</label>
                                <input type="datetime-local" class="form-control" id="insert_date" required>--%>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="remark" style="font-weight: 600;">Remark</label>
                                <input type="text" class="form-control" id="remark" style="width: 70%;" required />
                            </div>
                        </div>
                        <div class="form-row mb-3">
                            <!-- Kolom 14 -->
                            <div class="form-group col-md-6">
                                <label for="predictiveMaintenance" style="font-weight: 600;">Predictive Maintenance</label>
                                <input type="number" class="form-control" id="predictiveMaintenance" style="width: 70%;" value="0" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="poGoods" style="font-weight: 600;">PO Goods</label>
                                <input type="text" class="form-control" id="poGoods" style="width: 70%;" required />
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-block" id="btnSubmit">Daftar Sparepart</button>
                        <div id="responseMessage"></div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <script src="Scripts/jquery-3.5.1.min.js"></script>

    <%--<script src="Scripts/popper.min.js"></script>--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>

    <script src="Scripts/select2.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>
    <script src="Scripts/notyf.min.js"></script>

    <script>
        $(document).ready(function () {
            // Membuat objek Notyf dengan konfigurasi
            const notyf = new Notyf({
                duration: 3000, // Durasi notifikasi muncul
                position: {
                    x: 'right', // Posisi horizontal di kanan
                    y: 'top'    // Posisi vertikal di atas
                }
            });

            // Ambil role dari sessionStorage
            var role = sessionStorage.getItem("role");

            if (role === null) {
                window.location.href = "Default.aspx";

            } else if (role === "SPV") {
                // Tampilkan SweetAlert
                Swal.fire({
                    icon: 'warning',
                    title: 'Akses Ditolak',
                    text: 'Anda tidak memiliki izin untuk mengakses halaman ini.',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    // Redirect ke halaman sebelumnya
                    window.history.back();
                });
            } else if (role === "STAFF") {
                // Tampilkan SweetAlert
                Swal.fire({
                    icon: 'warning',
                    title: 'Akses Ditolak',
                    text: 'Anda tidak memiliki izin untuk mengakses halaman ini.',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    // Redirect ke halaman sebelumnya
                    window.history.back();
                });
            } else if (role === "ADMIN") {
                // Jika role adalah ADMIN, lanjutkan dengan logika halaman
                console.log("Akses diizinkan untuk ADMIN");
                // ... Kode lain untuk halaman ini ...
            }
            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";

            $('#goodsCode').focus();

            $('#maker').select2({
                placeholder: '-- Pilih Maker --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#suppName').select2({
                placeholder: '-- Pilih Supplier --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#currency').select2({
                placeholder: '-- Pilih Currency --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#model').select2({
                placeholder: '-- Pilih Model --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#goodsUnit').select2({
                placeholder: '-- Pilih Unit --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#keeping').select2({
                placeholder: '-- Pilih Keeping --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#drawer').select2({
                placeholder: '-- Pilih Sub Keeping --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#categoryPart').select2({
                placeholder: '-- Pilih Category Part --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            // Event listener untuk perubahan pada dropdown currency
            $('#currency').on('change', function () {
                var selectedCurrency = $(this).val(); // Ambil nilai currency yang dipilih
                console.log("Currency yang dipilih: " + selectedCurrency);
                // Lakukan sesuatu dengan nilai yang dipilih
            });

            // Menangani input pengguna di kolom GoodsCode
            $('#goodsCode').on('keyup', function () {
                var searchTerm = $(this).val().trim().toUpperCase();  // Ambil input, pastikan uppercase

                if (searchTerm.length >= 2) {
                    // Kirimkan request AJAX untuk mencari data berdasarkan input pengguna
                    $.ajax({
                        type: "POST",
                        url: "registernew.aspx/GetGoodsCodeSuggestions",  // Ganti dengan WebMethod yang sesuai
                        data: JSON.stringify({ prefixText: searchTerm }),  // Kirim parameter
                        contentType: "application/json; charset=utf-8",  // Format data yang dikirim
                        dataType: "json",  // Format data yang diterima
                        success: function (response) {
                            var suggestions = response.d;  // Ambil data saran dari response
                            console.log("Suggestions:", suggestions);  // Debugging log

                            var suggestionsList = $('#suggestionnew');  // List untuk saran
                            suggestionsList.empty();  // Hapus data lama

                            // Jika ada saran, tampilkan, jika tidak sembunyikan
                            if (suggestions.length > 0) {
                                suggestionsList.show();  // Tampilkan dropdown saran
                                suggestions.forEach(function (item) {
                                    suggestionsList.append('<li class="suggestion-item" data-code="' + item + '">' + item + '</li>');  // Tambahkan item ke list
                                });
                            } else {
                                suggestionsList.hide();  // Sembunyikan jika tidak ada saran
                            }
                        },
                        error: function () {
                            alert("Error occurred while fetching suggestions.");
                        }
                    });
                } else {
                    $('#suggestionnew').hide();  // Jika input terlalu pendek, sembunyikan saran
                }
            });


            var subKeepingGlobal;
            $(document).on("click", ".suggestion-item", function () {
                var selectedGoodsCode = $(this).data('code');  // Ambil GoodsCode yang dipilih
                //alert(selectedGoodsCode);
                $('#goodsCode').val(selectedGoodsCode);  // Isi input dengan GoodsCode yang dipilih
                $('#suggestionnew').hide();  // Sembunyikan dropdown saran

                // Menonaktifkan textbox GoodsCode
                $('#goodsCode').prop('disabled', true);
                $('#goodsName').focus();
                // Ganti tombol menjadi "Edit Sparepart"
                $('#btnSubmit').text('Edit Sparepart');  // Ganti teks tombol

                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetGoodsData",
                    data: JSON.stringify({ goodsCode: selectedGoodsCode }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var data = JSON.parse(response.d);  // Ambil data lengkap sparepart
                        if (data) {
                            console.log("Parsed Data:", data);

                            // Isi form dengan data yang diterima
                            $('#goodsName').val(data.goodsName);
                            $('#goodsDesc').val(data.goodsDesc);
                            $('#unitPrice').val(data.unitPrice);
                            $('#goodsUnit').val(data.goodsUnit);
                            $('#maxStock').val(data.maxStock);
                            $('#minStock').val(data.minStock);
                            $('#nowStock').val(data.nowStock);
                            $('#minOrder').val(data.minOrder);
                            $('#categoryPart').val(data.categoryPart);
                            $('#PO_Doc').val(data.poDoc);
                            $('#stockCategory').val(data.stockCategory);
                            $('#movingStatus').val(data.movingStatus);
                            $('#remark').val(data.remark);
                            $('#predictiveMaintenance').val(data.predictiveMaintenance);
                            $('#poGoods').val(data.poGoods);

                            // Menampilkan gambar sesuai URL yang ada di database
                            var imageUrl = data.attcFile_Picture ? data.attcFile_Picture : '';  // Ambil URL gambar
                            console.log("URL Gambar:", imageUrl);

                            // Menampilkan gambar pada elemen <img> dan mengatur elemen lainnya
                            if (imageUrl) {
                                // Menampilkan gambar dari database
                                $('#sparepartImage').attr('src', imageUrl);  // Set src gambar dari database
                                $('#imageContainer').show();  // Menampilkan container gambar
                                $('#oldImageUrl').val(imageUrl);  // Simpan URL gambar lama di hidden input
                                console.log("Gambar Lama Diset:", $('#oldImageUrl').val());  // Verifikasi link gambar di hidden input

                                // Reset input file upload setelah gambar dari database ditampilkan
                                $('#attcFile_Picture').val('');  // Reset input file untuk gambar
                            } else {
                                // Jika tidak ada gambar, sembunyikan container gambar dan reset URL gambar lama
                                $('#imageContainer').hide();  // Sembunyikan container gambar
                                $('#oldImageUrl').val('');  // Reset nilai URL gambar lama
                                console.log("Tidak ada gambar, reset URL gambar lama.");

                                // Menetapkan gambar default jika tidak ada gambar
                                $('#sparepartImage').attr('src', 'path_to_default_image.jpg'); // Gambar default
                                $('#imageContainer').show();  // Tampilkan container gambar
                            }
                            // Menyesuaikan nilai currency pada dropdown
                            var selectedCurrency = data.currency ? data.currency.trim() : "";
                            console.log("Currency yang diterima:", selectedCurrency);

                            // Pastikan bahwa opsi untuk currency sudah ada di dropdown
                            var currencySelect = $('#currency');
                            var foundCurrency = false;

                            // Cek apakah currency yang diterima ada dalam dropdown
                            currencySelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedCurrency.toLowerCase()) {
                                    foundCurrency = true;
                                    return false;  // Hentikan iterasi jika ditemukan
                                }
                            });

                            // Jika currency ditemukan, set nilai dropdown
                            if (foundCurrency) {
                                currencySelect.val(selectedCurrency).trigger('change');  // Update dropdown menggunakan Select2
                                console.log("Currency dipilih:", selectedCurrency);
                            } else {
                                console.log("Currency yang dipilih tidak ada dalam daftar dropdown:", selectedCurrency);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedCurrency);

                            }

                            // Jika currency tidak ditemukan, pastikan untuk memilih pilihan kosong atau yang pertama
                            if (!foundCurrency) {
                                currencySelect.val('').trigger('change');  // Set kosong jika tidak ditemukan
                                console.log("Currency tidak ditemukan, reset ke kosong");
                            }


                            //model start
                            // Menyesuaikan nilai model pada dropdown
                            var selectedModel = data.model ? data.model.trim() : "";
                            var modelSelect = $('#model');
                            var foundModel = false;

                            modelSelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedModel.toLowerCase()) {
                                    foundModel = true;
                                    modelSelect.val($(this).val()).trigger('change');
                                    console.log("Model dipilih:", selectedModel);
                                    return false;
                                }
                            });

                            // Jika model tidak ditemukan, reset ke kosong
                            if (!foundModel) {
                                console.log("Model yang dipilih tidak ada dalam daftar dropdown:", selectedModel);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedModel);

                            }


                            //category part start 
                            // Menyesuaikan nilai Category Part pada dropdown
                            var selectedCategoryPart = data.categoryPart ? data.categoryPart.trim() : "";
                            var categorySelect = $('#categoryPart');
                            var foundCategory = false;

                            categorySelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedCategoryPart.toLowerCase()) {
                                    foundCategory = true;
                                    categorySelect.val($(this).val()).trigger('change');
                                    console.log("Category Part dipilih:", selectedCategoryPart);
                                    return false;
                                }
                            });

                            // Jika Category Part tidak ditemukan, reset ke kosong
                            if (!foundCategory) {
                                console.log("Category Part yang dipilih tidak ada dalam daftar dropdown:", selectedCategoryPart);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedCategoryPart);

                            }


                            //goods unit start
                            // Menyesuaikan nilai Goods Unit pada dropdown
                            var selectedGoodsUnit = data.goodsUnit ? data.goodsUnit.trim() : "";
                            var goodsUnitSelect = $('#goodsUnit');
                            var foundGoodsUnit = false;

                            goodsUnitSelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedGoodsUnit.toLowerCase()) {
                                    foundGoodsUnit = true;
                                    goodsUnitSelect.val($(this).val()).trigger('change');
                                    console.log("Goods Unit dipilih:", selectedGoodsUnit);
                                    return false;
                                }
                            });

                            // Jika Goods Unit tidak ditemukan, reset ke kosong
                            if (!foundGoodsUnit) {
                                console.log("Goods Unit yang dipilih tidak ada dalam daftar dropdown:", selectedGoodsUnit);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedGoodsUnit);

                            }

                            //maker start
                            // Menyesuaikan nilai Maker pada dropdown
                            var selectedMaker = data.maker ? data.maker.trim() : "";
                            var makerSelect = $('#maker');
                            var foundMaker = false;

                            makerSelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedMaker.toLowerCase()) {
                                    foundMaker = true;
                                    makerSelect.val($(this).val()).trigger('change');
                                    console.log("Maker dipilih:", selectedMaker);
                                    return false;
                                }
                            });

                            // Jika Maker tidak ditemukan, reset ke kosong
                            if (!foundMaker) {
                                console.log("Maker yang dipilih tidak ada dalam daftar dropdown:", selectedMaker);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedMaker);

                            }

                            //supplier
                            // Ambil data supplier dari response
                            var selectedSupplier = data.suppName ? data.suppName.trim() : "";
                            var supplierSelect = $('#suppName');
                            var foundSupplier = false;

                            // Cek apakah Supplier tersedia di dropdown
                            supplierSelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedSupplier.toLowerCase()) {
                                    foundSupplier = true;
                                    supplierSelect.val($(this).val()).trigger('change');  // Set nilai dropdown dan trigger change
                                    console.log("Supplier dipilih:", $(this).val());
                                    return false;  // Hentikan loop setelah ditemukan
                                }
                            });

                            // Jika Supplier tidak ditemukan, reset ke kosong
                            if (!foundSupplier) {
                                console.log("Supplier yang dipilih tidak ada dalam daftar dropdown:", selectedSupplier);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedSupplier);

                            }

                            // Menyesuaikan nilai Keeping dan Subkeeping
                            var selectedKeeping = data.keeping;
                            var keepingSelect = $('#keeping');
                            var foundKeeping = false; var subkeepingSelect = $('#drawer');
                            subKeepingGlobal = data.subKeeping;

                            keepingSelect.find('option').each(function () {
                                if ($(this).val().toLowerCase() === selectedKeeping.toLowerCase()) {
                                    foundKeeping = true;
                                    keepingSelect.val($(this).val()).trigger('change');
                                    console.log("Keeping dipilih:", selectedKeeping);
                                    return false;
                                }
                            });

                            if (!foundKeeping) {
                                console.log("Keeping yang dipilih tidak ada dalam daftar dropdown:", selectedKeeping);
                                notyf.error("Maker yang dipilih tidak ada dalam daftar dropdown: " + selectedKeeping);

                            }

                            // Update Subkeeping saat Keeping dipilih
                            if (foundKeeping) {
                                //updateSubkeeping(selectedKeeping);  // Panggil fungsi untuk mengambil data Subkeeping
                                subkeepingSelect.val(subKeepingGlobal).trigger('change');

                            }
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error occurred while fetching goods data:", error);
                    }
                });
            });

            // Fungsi untuk mengambil data Subkeeping dan mengupdate dropdown
            function updateSubkeeping(selectedKeeping) {
                var subkeepingSelect = $('#drawer');

                // Clear dropdown Subkeeping terlebih dahulu
                subkeepingSelect.empty();
                subkeepingSelect.append('<option value="">-- Pilih Subkeeping --</option>');  // Opsi default

                // Lakukan AJAX request untuk mengambil data Subkeeping dari server
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetSubKeeping",  // Sesuaikan dengan URL untuk mengambil data Subkeeping
                    data: JSON.stringify({ cabinet: selectedKeeping }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var subkeepings = JSON.parse(response.d);  // Mengambil data Subkeeping (misalnya array)
                        console.log("Subkeeping diupdate:", subkeepings);  // Periksa data yang diterima

                        if (subkeepings && subkeepings.length > 0) {
                            // Menambahkan data Subkeeping ke dropdown
                            subkeepings.forEach(function (subkeeping) {
                                subkeepingSelect.append('<option value="' + subkeeping + '">' + subkeeping + '</option>');
                            });

                            // Coba untuk mengambil nilai Subkeeping yang dipilih (fallback ke yang pertama jika tidak ada nilai sebelumnya)
                            var selectedSubkeeping = getSelectedSubkeeping(); // Ambil nilai yang sudah dipilih sebelumnya

                            if (selectedSubkeeping) {
                                subkeepingSelect.val(selectedSubkeeping).trigger('change');  // Set nilai dan trigger perubahan dropdown
                                console.log("Subkeeping dipilih:", selectedSubkeeping);
                            } else {
                                // Jika tidak ada nilai Subkeeping yang dipilih, set ke pilihan default atau yang pertama
                                subkeepingSelect.val(subkeepings[0]).trigger('change');
                                console.log("Subkeeping diatur ke yang pertama:", subkeepings[0]);
                            }

                            //set value subKeeping yang dari database
                            subkeepingSelect.val(subKeepingGlobal).trigger('change');


                            // Memastikan dropdown Select2 diperbarui
                            subkeepingSelect.trigger('change');
                            console.log("Dropdown Subkeeping terupdate.");
                        } else {
                            // Jika tidak ada Subkeeping yang ditemukan
                            console.log("Tidak ada Subkeeping untuk Keeping yang dipilih.");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Terjadi error saat mengambil data Subkeeping:", error);
                    }
                });
            }

            // Fungsi untuk mendapatkan nilai Subkeeping yang dipilih (misalnya dari form atau variabel lain)
            function getSelectedSubkeeping() {
                // Misalnya kita simpan nilai Subkeeping di form atau variabel lain
                // Anda bisa mengganti ini dengan cara yang sesuai dengan aplikasi Anda
                var savedSubkeeping = $("#subkeeping").val();  // Ambil nilai yang dipilih dari dropdown
                return savedSubkeeping || ""; // Jika tidak ada, kembalikan nilai kosong
            }

            // Menyembunyikan dropdown saran jika pengguna klik di luar
            $(document).click(function (event) {
                if (!$(event.target).closest('#goodsCode, #suggestionnew').length) {
                    $('#suggestionnew').hide();
                }
            });

            // Ambil data supplier dari server menggunakan AJAX dengan delay
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetSuppliers", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var suppliers = JSON.parse(response.d);
                        var supplierSelect = $('#suppName');

                        // Kosongkan dropdown terlebih dahulu
                        supplierSelect.empty();
                        supplierSelect.append('<option value="">-- Pilih Supplier --</option>');

                        // Isi dropdown dengan data supplier
                        for (var i = 0; i < suppliers.length; i++) {
                            supplierSelect.append('<option value="' + suppliers[i] + '">' + suppliers[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        supplierSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }, 100); // Delay 1 detik

            // Ambil data currency dengan delay
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetCurrency",  // Pastikan URL ini sesuai dengan yang benar
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var currencies = JSON.parse(response.d);  // Data currency yang diterima

                        var currencySelect = $('#currency');

                        // Kosongkan dropdown terlebih dahulu
                        currencySelect.empty();
                        currencySelect.append('<option value="">-- Pilih Currency --</option>');

                        // Isi dropdown dengan data currency
                        for (var i = 0; i < currencies.length; i++) {
                            currencySelect.append('<option value="' + currencies[i] + '">' + currencies[i] + '</option>');
                        }

                        // Pastikan dropdown sudah diupdate
                        currencySelect.trigger('change');  // Re-inisialisasi select2 setelah data dimuat
                    },
                    error: function (xhr, status, error) {
                        console.error("Error occurred while fetching currencies:", error);
                    }
                });
            }, 150); // Delay 2 detik

            // Ambil data maker dengan delay
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetMaker", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var makers = JSON.parse(response.d);
                        var makerSelect = $('#maker');

                        // Kosongkan dropdown terlebih dahulu
                        makerSelect.empty();
                        makerSelect.append('<option value="">-- Pilih Maker --</option>');

                        // Isi dropdown dengan data supplier
                        for (var i = 0; i < makers.length; i++) {
                            makerSelect.append('<option value="' + makers[i] + '">' + makers[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        makerSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }, 200); // Delay 3 detik

            // Ambil data model dengan delay
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetModel", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var models = JSON.parse(response.d);
                        var modelSelect = $('#model');

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
            }, 250); // Delay 4 detik


            ////ambil data unit
            //$.ajax({
            //    type: "POST",
            //    url: "registernew.aspx/GetUnit", // Gantilah dengan nama file dan method backend
            //    data: '{}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (response) {
            //        // Pastikan kita melakukan JSON.parse pada response.d
            //        var units = JSON.parse(response.d);
            //        var unitsSelect = $('#goodsUnit');

            //        // Kosongkan dropdown terlebih dahulu
            //        unitsSelect.empty();
            //        unitsSelect.append('<option value="">-- Pilih Unit --</option>');

            //        // Isi dropdown dengan data supplier
            //        for (var i = 0; i < units.length; i++) {
            //            unitsSelect.append('<option value="' + units[i] + '">' + units[i] + '</option>');
            //        }

            //        // Re-inisialisasi select2 setelah data dimuat
            //        unitsSelect.trigger('change');
            //    },
            //    error: function (xhr, status, error) {
            //        console.error("Error: " + error);
            //    }
            //});

            // Ambil data unit dengan delay 1 detik
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetUnit", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var units = JSON.parse(response.d);
                        var unitsSelect = $('#goodsUnit');

                        // Kosongkan dropdown terlebih dahulu
                        unitsSelect.empty();
                        unitsSelect.append('<option value="">-- Pilih Unit --</option>');

                        // Isi dropdown dengan data unit
                        for (var i = 0; i < units.length; i++) {
                            unitsSelect.append('<option value="' + units[i] + '">' + units[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        unitsSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }, 50); // Delay 1 detik (1000 ms)

            ////ambil data keeping
            //$.ajax({
            //    type: "POST",
            //    url: "registernew.aspx/GetKeeping", // Gantilah dengan nama file dan method backend
            //    data: '{}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (response) {
            //        // Pastikan kita melakukan JSON.parse pada response.d
            //        var keepings = JSON.parse(response.d);
            //        var keepingSelect = $('#keeping');

            //        // Kosongkan dropdown terlebih dahulu
            //        keepingSelect.empty();
            //        keepingSelect.append('<option value="">-- Pilih Keeping --</option>');

            //        // Isi dropdown dengan data supplier
            //        for (var i = 0; i < keepings.length; i++) {
            //            keepingSelect.append('<option value="' + keepings[i] + '">' + keepings[i] + '</option>');
            //        }

            //        // Re-inisialisasi select2 setelah data dimuat
            //        keepingSelect.trigger('change');
            //    },
            //    error: function (xhr, status, error) {
            //        console.error("Error: " + error);
            //    }
            //});

            // Ambil data keeping dengan delay
            setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "registernew.aspx/GetKeeping", // Gantilah dengan nama file dan method backend
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // Pastikan kita melakukan JSON.parse pada response.d
                        var keepings = JSON.parse(response.d);
                        var keepingSelect = $('#keeping');

                        // Kosongkan dropdown terlebih dahulu
                        keepingSelect.empty();
                        keepingSelect.append('<option value="">-- Pilih Keeping --</option>');

                        // Isi dropdown dengan data keeping
                        for (var i = 0; i < keepings.length; i++) {
                            keepingSelect.append('<option value="' + keepings[i] + '">' + keepings[i] + '</option>');
                        }

                        // Re-inisialisasi select2 setelah data dimuat
                        keepingSelect.trigger('change');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }, 300); // Delay 5 detik


            $(document).on("change", "#keeping", function () {
                var selectedKeeping = $(this).val(); // Ambil nilai Keeping yang dipilih
                console.log("Keeping dipilih:", selectedKeeping);

                if (selectedKeeping) {
                    // Panggil fungsi untuk mengupdate Subkeeping berdasarkan nilai Keeping
                    updateSubkeeping(selectedKeeping);
                } else {
                    // Reset dropdown Subkeeping jika tidak ada Keeping yang dipilih
                    $('#drawer').empty();
                    $('#drawer').append('<option value="">-- Pilih Subkeeping --</option>');
                    $('#drawer').trigger('change');
                    console.log("Subkeeping direset.");
                }
            });

            //ambil data categorypart
            $.ajax({
                type: "POST",
                url: "registernew.aspx/GetCategoryPart", // Gantilah dengan nama file dan method backend
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Pastikan kita melakukan JSON.parse pada response.d
                    var categoryparts = JSON.parse(response.d);
                    var categorypartsSelect = $('#categoryPart');

                    // Kosongkan dropdown terlebih dahulu
                    categorypartsSelect.empty();
                    categorypartsSelect.append('<option value="">-- Pilih Category Part --</option>');

                    // Isi dropdown dengan data supplier
                    for (var i = 0; i < categoryparts.length; i++) {
                        categorypartsSelect.append('<option value="' + categoryparts[i] + '">' + categoryparts[i] + '</option>');
                    }

                    // Re-inisialisasi select2 setelah data dimuat
                    categorypartsSelect.trigger('change');
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });

            $('#btnSubmit').on('click', function () {
                var buttonText = $('#btnSubmit').text(); // Ambil teks tombol

                // Jika teks tombol adalah "Edit Sparepart", lakukan proses edit
                if (buttonText === 'Edit Sparepart') {
                    // Tampilkan konfirmasi sebelum edit sparepart
                    Swal.fire({
                        title: 'Konfirmasi',
                        text: 'Apakah Anda yakin ingin mengedit sparepart ini?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Ya, Edit',
                        cancelButtonText: 'Batal',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Jika pengguna klik Ok, lanjutkan proses edit
                            editSparepart();
                        } else if (result.isDismissed) {
                            // Jika pengguna klik Cancel, tampilkan notifikasi pembatalan
                            Swal.fire({
                                title: 'Dibatalkan',
                                text: 'Proses edit sparepart dibatalkan.',
                                icon: 'info',
                            });
                        }
                    });
                } else {
                    // Jika teks tombol adalah "Daftar Sparepart", lakukan proses pendaftaran
                    Swal.fire({
                        title: 'Konfirmasi',
                        text: 'Apakah Anda yakin ingin mendaftar sparepart baru ini?',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Ya, Daftar',
                        cancelButtonText: 'Batal',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Jika pengguna klik Ok, lanjutkan proses register
                            registerSparepart();
                        } else if (result.isDismissed) {
                            // Jika pengguna klik Cancel, tampilkan notifikasi pembatalan
                            Swal.fire({
                                title: 'Dibatalkan',
                                text: 'Proses pendaftaran sparepart dibatalkan.',
                                icon: 'info',
                            });
                        }
                    });
                }
            });


            // Fungsi untuk mendaftar sparepart baru
            function registerSparepart() {
                var goodsCode = $('#goodsCode').val();
                var attcFile = $('#attcFile_Picture')[0].files[0];  // Ambil file gambar
                var reader = new FileReader();

                reader.onloadend = function () {
                    var base64Picture = reader.result.split(',')[1]; // Ambil base64 string dari file

                    $.ajax({
                        type: 'POST',
                        url: 'registernew.aspx/UploadPicture',
                        data: JSON.stringify({
                            goodsCode: goodsCode,
                            picture: base64Picture,  // Gambar baru dalam format base64
                            stockistName: $('#stockistName').val(),
                            goodsName: $('#goodsName').val(),
                            goodsDesc: $('#goodsDesc').val(),
                            currency: $('#currency').val(),
                            goodsUnit: $('#goodsUnit').val(),
                            unitPrice: $('#unitPrice').val(),
                            maker: $('#maker').val(),
                            model: $('#model').val(),
                            suppName: $('#suppName').val(),
                            keeping: $('#keeping').val(),
                            subKeeping: $('#drawer').val(),
                            maxStock: $('#maxStock').val(),
                            minStock: $('#minStock').val(),
                            nowStock: $('#nowStock').val(),
                            minOrder: $('#minOrder').val(),
                            categoryPart: $('#categoryPart').val(),
                            poDoc: $('#poGoods').val(),
                            stockCategory: $('#stockCategory').val(),
                            movingStatus: $('#movingStatus').val(),
                            remark: $('#remark').val(),
                            predictiveMaintenance: $('#predictiveMaintenance').val(),
                            poGoods: $('#poGoods').val()
                        }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            console.log("Server Response: ", response.d);
                            alert('Data berhasil diupload');
                            window.location.href = "catalog.aspx";  // Redirect ke halaman sparepart
                        },
                        error: function (xhr, status, error) {
                            console.log("AJAX Error: ", error);
                            alert('Terjadi kesalahan saat mengupload data');
                        }
                    });
                };

                reader.readAsDataURL(attcFile); // Membaca file gambar menjadi base64
            }

            function editSparepart2() {
                var goodsCode = $('#goodsCode').val();
                var attcFile = $('#attcFile_Picture')[0].files[0];  // Ambil file gambar baru jika ada
                var base64Picture = null;

                // Cek apakah ada file gambar yang dipilih
                if (attcFile) {
                    var reader = new FileReader();

                    reader.onloadend = function () {
                        base64Picture = reader.result.split(',')[1]; // Ambil base64 string dari file
                        var oldImageUrl_ = $('#oldImageUrl').val();
                        // Proses pengeditan sparepart dengan gambar baru
                        updateSparepart(goodsCode, base64Picture, oldImageUrl_);
                    };

                    reader.readAsDataURL(attcFile); // Membaca file gambar menjadi base64
                } else {
                    // Jika tidak ada gambar yang dipilih, gunakan gambar lama (URL)
                    var oldImageUrl = $('#oldImageUrl').val();
                    updateSparepart(goodsCode, null, oldImageUrl); // Tidak perlu gambar baru, gunakan gambar lama
                }
            }

            function editSparepart() {
                var goodsCode = $('#goodsCode').val();
                var attcFile = $('#attcFile_Picture')[0].files[0];
                var base64Picture = null;
                var username = sessionStorage.getItem('name'); // Ambil username dari sessionStorage
                var role = sessionStorage.getItem('role'); // Ambil role dari sessionStorage

                if (attcFile) {
                    var reader = new FileReader();

                    reader.onloadend = function () {
                        base64Picture = reader.result.split(',')[1];
                        var oldImageUrl_ = $('#oldImageUrl').val();
                        updateSparepart(goodsCode, base64Picture, oldImageUrl_, username, role); // Sertakan username dan role
                    };

                    reader.readAsDataURL(attcFile);
                } else {
                    var oldImageUrl = $('#oldImageUrl').val();
                    updateSparepart(goodsCode, null, oldImageUrl, username, role); // Sertakan username dan role
                }
            }

            // Fungsi untuk mengupdate sparepart (termasuk gambar)
            function updateSparepart2(goodsCode, base64Picture, oldImageUrl) {
                $.ajax({
                    type: 'POST',
                    url: 'registernew.aspx/EditSparepart',
                    data: JSON.stringify({
                        goodsCode: goodsCode,
                        picture: base64Picture,  // Gambar baru dalam format base64 (null jika tidak ada perubahan gambar)
                        oldImageUrl: oldImageUrl, // URL gambar lama, digunakan jika gambar tidak diganti
                        stockistName: $('#stockistName').val(),
                        goodsName: $('#goodsName').val(),
                        goodsDesc: $('#goodsDesc').val(),
                        currency: $('#currency').val(),
                        goodsUnit: $('#goodsUnit').val(),
                        unitPrice: $('#unitPrice').val(),
                        maker: $('#maker').val(),
                        model: $('#model').val(),
                        suppName: $('#suppName').val(),
                        keeping: $('#keeping').val(),
                        subKeeping: $('#drawer').val(),
                        maxStock: $('#maxStock').val(),
                        minStock: $('#minStock').val(),
                        nowStock: $('#nowStock').val(),
                        minOrder: $('#minOrder').val(),
                        categoryPart: $('#categoryPart').val(),
                        poDoc: $('#PO_Doc').val(),
                        stockCategory: $('#stockCategory').val(),
                        movingStatus: $('#movingStatus').val(),
                        remark: $('#remark').val(),
                        predictiveMaintenance: $('#predictiveMaintenance').val(),
                        poGoods: $('#poGoods').val()
                    }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        console.log("Sparepart berhasil diupdate:", response.d);
                        alert('Sparepart berhasil diupdate');
                        window.location.href = "catalog.aspx";  // Redirect ke halaman sparepart
                    },
                    error: function (xhr, status, error) {
                        console.error("Error occurred while updating sparepart:", error);
                        alert('Terjadi kesalahan saat mengupdate sparepart');
                    }
                });
            }

            function updateSparepart(goodsCode, base64Picture, oldImageUrl, username, role) {
                $.ajax({
                    type: 'POST',
                    url: 'registernew.aspx/EditSparepart',
                    data: JSON.stringify({
                        goodsCode: goodsCode,
                        picture: base64Picture,
                        oldImageUrl: oldImageUrl,
                        stockistName: $('#stockistName').val(),
                        goodsName: $('#goodsName').val(),
                        goodsDesc: $('#goodsDesc').val(),
                        currency: $('#currency').val(),
                        goodsUnit: $('#goodsUnit').val(),
                        unitPrice: $('#unitPrice').val(),
                        maker: $('#maker').val(),
                        model: $('#model').val(),
                        suppName: $('#suppName').val(),
                        keeping: $('#keeping').val(),
                        subKeeping: $('#drawer').val(),
                        maxStock: $('#maxStock').val(),
                        minStock: $('#minStock').val(),
                        nowStock: $('#nowStock').val(),
                        minOrder: $('#minOrder').val(),
                        categoryPart: $('#categoryPart').val(),
                        poDoc: $('#PO_Doc').val(),
                        stockCategory: $('#stockCategory').val(),
                        movingStatus: $('#movingStatus').val(),
                        remark: $('#remark').val(),
                        predictiveMaintenance: $('#predictiveMaintenance').val(),
                        poGoods: $('#poGoods').val(),
                        username: username, // Kirim username
                        role: role      // Kirim role
                    }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        console.log("Sparepart berhasil diupdate:", response.d);
                        alert('Sparepart berhasil diupdate');
                        window.location.href = "catalog.aspx";
                    },
                    error: function (xhr, status, error) {
                        console.error("Error occurred while updating sparepart:", error);
                        alert('Terjadi kesalahan saat mengupdate sparepart');
                    }
                });
            }


        });

        function closeCard() {
            window.location.href = "catalog.aspx"; // Redirect ke halaman spi_databasepart.aspx
        }

        // Menangani perubahan pada input file gambar (attcFile_Picture)
        $('#attcFile_Picture').on('change', function (e) {
            var file = e.target.files[0];  // Ambil file gambar yang dipilih

            if (file) {
                // Gunakan FileReader untuk membaca file
                var reader = new FileReader();
                reader.onload = function (event) {
                    // Menampilkan gambar baru pada elemen gambar (sparepartImage)
                    $('#sparepartImage').attr('src', event.target.result);

                    // Juga dapat mengubah gaya atau memberikan efek lainnya jika diperlukan
                    $('#imageContainer').show();  // Pastikan kontainer gambar terlihat
                };
                reader.readAsDataURL(file);  // Membaca file menjadi base64
            }
        });

    </script>
</body>
</html>
