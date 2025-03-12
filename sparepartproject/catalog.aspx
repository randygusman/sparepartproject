<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catalog.aspx.cs" Inherits="sparepartproject.catalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - Sparepart Catalog</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="Style/style.css" />
    <link href="Style/all.min.css" rel="stylesheet" />
    <!-- Font Awesome JS -->
    <script src="Scripts/fontawesome.min.js"></script>
    <link rel="stylesheet" href="Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="Content/DataTables/css/jquery.dataTables.min.css" />

    <!-- Add Select2 CSS -->
    <link href="Style/select2.min.css" rel="stylesheet" />
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />--%>

    <!-- Notyf CSS -->
    <%--<link href="https://cdn.jsdelivr.net/npm/notyf@3.6.0/notyf.min.css" rel="stylesheet" />--%>
    <link href="Style/notyf.min.css" rel="stylesheet" />

    <%--<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />--%>

    <style>
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

        /* Font Poppins Regular */
        /*.poppins-light {
            font-family: "Poppins", serif;
            font-weight: 300;
            font-style: normal;
        }

        .poppins-regular {
            font-family: 'Poppins', sans-serif;
            font-weight: 400;
            font-style: normal;
        }*/

        /* Font Poppins Medium */
        /*.poppins-medium {
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-style: normal;
        }*/

        /* Font Poppins Semibold */
        /*.poppins-semibold {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-style: normal;
        }

        /* Mengatur posisi container notifikasi Notyf */
        .notyf-container {
            position: fixed !important; /* Menetapkan posisi tetap */
            top: 10px !important; /* Jarak sedikit dari atas */
            right: 10px !important; /* Jarak sedikit dari kanan */
            z-index: 9999 !important; /* Pastikan notifikasi ada di atas */
        }

        textarea {
            font-family: 'Poppins', sans-serif;
            font-size: 12px !important;
            height: 100px !important; /* Menentukan tinggi textarea, Anda bisa menyesuaikan angkanya */
            resize: vertical !important; /* Memungkinkan pengguna untuk menyesuaikan ukuran textarea secara vertikal */
            box-sizing: border-box !important; /* Agar padding dan border dihitung dalam tinggi dan lebar */
        }

        #rataKiri {
            padding-left: 30px; /* Menambahkan padding kiri untuk gambar */
            padding-right: 15px; /* Menambahkan padding kanan agar tidak terlalu rapat */
        }

        #modalImage {
            width: 100%; /* Makes the image fill the container's width */
            height: 270px; /* Set the height to 200px */
            object-fit: cover; /* Ensures the image covers the area without distortion */
            padding-left: 30px; /* Padding on the left */
            /*padding-right: 15px;*/ /* Padding on the right */
        }

        .separator {
            display: block;
            width: 1px;
            background-color: #ddd;
            min-height: 100%; /* Memastikan garis pemisah mengikuti tinggi kolom */
            height: auto; /* Menggunakan auto agar tinggi sesuai konten */
            margin: 0 auto; /* Pusatkan pemisah secara horizontal */
        }

        #searchInput {
            font-size: .8rem; /* Menyesuaikan ukuran font menjadi lebih kecil */
        }

        #loadMoreBtn {
            font-size: .8rem; /* Mengatur ukuran font lebih kecil */
            /*padding: 5px 10px;*/ /* Mengatur padding untuk membuat tombol lebih kecil */
            /*height: 35px;*/ /* Menyesuaikan tinggi tombol */
        }

        .btn-view {
            float: right; /* Menempatkan tombol di sebelah kanan */
        }
        /* Styling untuk goodsCode */
        .goods-code {
            font-size: 12px; /* Ukuran font lebih kecil */
            color: #007BFF; /* Warna biru */
            font-weight: bold;
            margin-bottom: 5px; /* Mengurangi jarak bawah */
        }

        /* Styling untuk goodsName */
        .card-title {
            font-size: 16px; /* Ukuran font lebih besar untuk judul */
            color: #333; /* Warna teks lebih gelap */
            font-weight: bold;
            margin-bottom: 5px; /* Mengurangi jarak bawah */
        }

        /* Styling untuk Sub Keeping */
        .sub-keeping {
            font-size: 12px; /* Ukuran font lebih kecil */
            color: #6c757d; /* Warna abu-abu untuk sub-keeping */
            font-style: italic;
            margin-bottom: 10px; /* Mengurangi jarak bawah */
        }

        /* Styling untuk teks dalam card */
        .card-text {
            font-size: 13px; /* Ukuran font yang lebih nyaman dibaca */
            margin-bottom: 5px; /* Mengurangi jarak bawah antar teks */
        }

        /* Styling untuk tombol 'View' */
        /*.btn-info {
            background-color: #007BFF;*/ /* Warna biru tombol */
        /*border-color: #007BFF;
            font-size: 12px;*/ /* Ukuran font tombol */
        /*}*/

        /* Hover effect untuk tombol */
        /*.btn-info:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }*/

        #btnAddPart, #btnExportToExcel, #btnReg {
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


        /*loading image*/
        /* CSS untuk spinner lds-ripple */
        .lds-ripple {
            color: #1c4c5b; /* Warna spinner, bisa Anda sesuaikan */
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
        }

            .lds-ripple div {
                position: absolute;
                border: 4px solid currentColor;
                opacity: 1;
                border-radius: 50%;
                animation: lds-ripple 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
            }

                .lds-ripple div:nth-child(2) {
                    animation-delay: -0.5s;
                }

        @keyframes lds-ripple {
            0% {
                top: 36px;
                left: 36px;
                width: 8px;
                height: 8px;
                opacity: 0;
            }

            4.9% {
                top: 36px;
                left: 36px;
                width: 8px;
                height: 8px;
                opacity: 0;
            }

            5% {
                top: 36px;
                left: 36px;
                width: 8px;
                height: 8px;
                opacity: 1;
            }

            100% {
                top: 0;
                left: 0;
                width: 80px;
                height: 80px;
                opacity: 0;
            }
        }

        /* Tambahkan margin atau styling lain jika perlu */
        #loadingImg {
            display: none;
            text-align: center;
            margin-top: 10px;
            position: fixed; /* Menggunakan fixed position agar spinner selalu di atas */
            top: 50%; /* Menempatkan spinner di tengah vertikal */
            left: 50%; /* Menempatkan spinner di tengah horizontal */
            transform: translate(-50%, -50%); /* Memastikan spinner tepat di tengah */
            z-index: 1050; /* Pastikan spinner berada di atas modal */
        }

        #selectModel {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input */
            font-size: .7rem; /* Mengatur ukuran font pada input */
        }

        /* Mengatur font family dan ukuran font untuk dropdown select2 */
        .select2-container .select2-selection--single {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input dropdown */
            font-size: .7rem; /* Mengatur ukuran font pada input dropdown */
        }

        /* Mengatur font family dan ukuran font pada list dropdown */
        .select2-container .select2-results__option {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada pilihan dropdown */
            font-size: .7rem; /* Mengatur ukuran font pada pilihan dropdown */
        }

        .select2-container .select2-search__field {
            font-family: 'Poppins', sans-serif; /* Mengatur font family pada input search */
            font-size: .7rem; /* Mengatur ukuran font pada input search */
        }

        .btn-outline-secondary {
            padding-left: 10px;
            padding-right: 10px;
        }

        #increaseQty, #decreaseQty {
            padding: 0px 10px 0px 10px;
        }



        /* CSS untuk gambar agar tidak terpotong saat di-zoom */
        .card-img-top {
            transition: transform 0.5s ease, filter 0.3s ease; /* Animasi halus untuk zoom dan efek filter */
            object-fit: contain; /* Menjaga gambar tetap utuh tanpa terpotong */
            width: 100%; /* Pastikan gambar mengambil 100% lebar kontainer */
            height: 200px; /* Atur tinggi sesuai kebutuhan */
        }

            .card-img-top:hover {
                transform: scale(1.2); /* Zoom in saat hover */
                object-position: center; /* Posisikan gambar di tengah saat zoom */
                filter: brightness(1.2); /* Sedikit terang untuk menambah efek visual */
                cursor: pointer;
                z-index: 1000;
            }

        /* CSS untuk memastikan 5 kolom per row */
        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .col {
            flex: 0 0 20%; /* Membuat setiap kolom memiliki lebar 20% */
            max-width: 20%; /* Membatasi kolom agar tidak lebih dari 20% */
            padding: 0 10px; /* Menambahkan sedikit ruang di antara kolom */
        }


        /* CSS Responsif */
        @media (max-width: 768px) {
            .col {
                flex: 0 0 33.33%; /* 3 kolom per baris untuk layar lebih kecil */
                max-width: 33.33%;
            }
        }

        @media (max-width: 480px) {
            .col {
                flex: 0 0 50%; /* 2 kolom per baris untuk layar sangat kecil */
                max-width: 50%;
            }
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
                            <a href="catalog.aspx" style="background-color: white; color: #172679;">Catalog</a>
                        </li>
                        <li id="menuDatabasePart">
                            <a href="spi_databasepart.aspx">Database Part</a>
                        </li>
                        <li id="menuDailyIssuedPart">
                            <a href="dailyissuedpart.aspx">Daily Issued Part</a>
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
        <div id="content" style="background-color: #fafafa;">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Sparepart Catalog</h5>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto" style="display: inline;">
                            <li class="nav-item active">
                                <a class="nav-link" id="user">GUEST</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <form id="form2" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
            </form>

            <div class="container-fluid mt-5">
                <!-- Row untuk input pencarian -->
                <div class="row mb-3">
                    <div class="col-md-12">
                        <input type="text" id="searchInput" class="form-control mb-3 poppins-light" placeholder="Search by Goods Code, Name, or Description" />
                    </div>
                </div>

                <!-- Container untuk catalog sparepart -->
                <div id="sparepartCatalog" class="row"></div>
                <div id="noSparepartsFound" style="display: none; text-align: center; font-weight: bold; font-size: 1.3rem; color: #888;">
                    No Sparepart Found
                </div>

                <!-- Tombol load more -->
                <div class="text-center mt-4">
                    <button id="loadMoreBtn" class="btn btn-outline-info btn-sm poppins-medium">Load More</button>
                </div>

                <!-- Loading spinner yang menggunakan lds-ripple -->
                <div id="loadingImg" style="display: none; text-align: center; margin-top: 10px;">
                    <div class="lds-ripple">
                        <div></div>
                        <div></div>
                    </div>
                </div>

            </div>

            <!-- Modal -->
            <div class="modal fade" id="sparepartModal" tabindex="-1" aria-labelledby="sparepartModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-6">
                                <div>
                                    <h4 id="sparepartModalLabel" style="padding-left: 15px; font-weight: 500; margin-bottom: 0;">Sparepart Details</h4>
                                </div>
                            </div>
                            <!-- Tombol close yang kompatibel dengan Bootstrap 4 -->
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <!-- Kolom Kiri: Gambar dan Informasi Sparepart -->
                                <div class="col-md-6">
                                    <div>
                                        <img id="modalImage" src="" class="img-fluid" alt="Sparepart Image" style="width: 100%; object-fit: cover;" />
                                    </div>
                                    <div class="mt-3" id="rataKiri" style="font-family: Calibri;">
                                        <h5 id="modalGoodsName" style="font-weight: 600; font-size: 1.5rem;"></h5>
                                        <p class="card-text" id="modalGoodsCode" style="font-size: 1rem; font-weight: 400;"></p>
                                        <p class="card-text" id="modalGoodsDesc" style="font-size: 1rem; font-weight: 400;"></p>
                                        <p class="card-text" id="modalSubKeeping" style="font-size: 1rem; font-weight: 500;"></p>
                                        <p style="margin-bottom: 5px;"><span id="modalStock">Now Stock : <a id="strong" style="font-size: 1rem;"></a></span></p>
                                        <p class="card-text" id="modalVendor" style="font-size: 1rem; font-weight: 400;"></p>
                                    </div>
                                </div>

                                <!-- Pemisah -->
                                <div class="separator"></div>

                                <!-- Kolom Kanan: Input Fields -->
                                <div class="col-md-5">
                                    <div class="row" style="margin-top: 0; padding-right: 30px;">
                                        <div class="col-12 mb-3">
                                            <label for="suppName" style="font-size: .9rem; font-weight: 500;">Issued to Model</label>
                                            <select class="form-control" id="selectModel" required>
                                                <option value="">-- Pilih Model --</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="suppName" style="font-size: .9rem; font-weight: 500;">Line</label>
                                            <select class="form-control" id="selectLine" required>
                                                <option value="">-- Pilih Line --</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="suppName" style="font-size: .9rem; font-weight: 500;">Cell</label>
                                            <select class="form-control" id="selectCell" required>
                                                <option value="">-- Pilih Cell --</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="suppName" style="font-size: .9rem; font-weight: 500;">Issued by</label>
                                            <select class="form-control" id="selectEmployee" required>
                                                <option value="">-- Pilih Issued by --</option>
                                            </select>
                                        </div>
                                        <!-- Input Qty (Quantity) -->
                                        <div class="col-12 mb-3">
                                            <label for="qtyInput" class="form-label" style="font-size: .9rem; font-weight: 500;">Quantity</label>
                                            <div class="input-group">
                                                <button class="btn btn-outline-secondary" type="button" id="decreaseQty">-</button>
                                                <input type="number" id="qtyInput" class="form-control text-center" value="1" min="1" readonly />
                                                <button class="btn btn-outline-secondary" type="button" id="increaseQty">+</button>
                                            </div>
                                        </div>
                                        <!-- Menambahkan textarea di bawah input -->
                                        <div class="col-12 mb-3">
                                            <label for="additionalNotes" class="form-label" style="font-size: .9rem; font-weight: 500;">Reason</label>
                                            <textarea class="form-control" id="additionalNotes" rows="4" style="text-transform: uppercase;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-info" id="btnLoan">Loan</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btnIssuedNow">Issued Now</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Baru -->
            <div class="modal fade" id="modalLoan" tabindex="-1" role="dialog" aria-labelledby="modalLoanLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 id="sparepartLoanTitle" style="padding-left: 15px; font-weight: 500; margin-bottom: 0;">Sparepart Loan</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="file" id="inputGambar" accept=".pdf" />
                            <br />
                            <div id="previewGambar"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btnLoanNow">Loan</button>

                        </div>
                    </div>
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
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>--%>
    <!-- Notyf JS -->
    <script src="Scripts/notyf.min.js"></script>
    <%--<script src="https://cdn.jsdelivr.net/npm/notyf@3.6.0/notyf.min.js"></script>--%>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        $('#btnLoan').click(function () {
            //$('#modalUtama').modal('hide'); // Tutup modal utama
            var nowStock = $('#strong').text(); // Ambil nilai stok dari modal
            var isValid = true; // Flag untuk mengecek validasi form
            var missingFields = []; // Menyimpan field yang belum diisi

            // Mengecek setiap field di modal untuk memastikan semuanya terisi
            $('#selectModel, #selectLine, #selectCell, #selectEmployee, #additionalNotes').each(function () {
                if ($(this).val() === '' || $(this).val() === null) {
                    isValid = false; // Tandai jika ada field yang kosong
                    missingFields.push($(this).prev('label').text()); // Menyimpan label field yang kosong
                }
            });

            if (isValid) {
                if (parseInt(nowStock) > 0) {
                    $('#modalLoan').modal('show');
                } else {
                    Swal.fire({
                        title: "Sparepart Kosong!",
                        text: "Sparepart is out of stock!",
                        icon: "warning",
                        reverseButtons: true
                    });
                }
            } else {
                // Menampilkan notifikasi error jika ada field yang kosong
                var errorMsg = 'Mohon isikan data ' + missingFields.join(', ') + '.';
                notyf.error(errorMsg); // Menampilkan error dengan daftar field yang belum diisi
            }

            
            //$('#modalLoan').modal('show'); // Tampilkan modal loan
        });

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
                $("#btnLoan").hide();
                $("#menuLoanList").hide();

            }

            console.log(role);
            // Periksa apakah role bukan ADMIN
            if (role === null) {
                // Role tidak dikenal atau tidak ada
                // Redirect ke halaman login atau tampilkan pesan error
                window.location.href = "Default.aspx";

            } else if (role === "SPV") {
                hideAllMenus(); // Sembunyikan semua menu

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDatabasePart").show();
                $("#menuDailyIssuedPart").show();
                setTitleHeader();
            } else if (role === "ADMIN") {
                setTitleHeader();
                $("#btnLoan").show();

            } else if (role === "STAFF") {
                hideAllMenus(); // Sembunyikan semua menu
                $("#menuDatabasePart").show();

                // Tampilkan hanya menu yang diizinkan untuk STAFF
                $("#menuHome").show();
                $("#menuSPI").show();
                $("#menuCatalog").show(); // Contoh: SPV boleh melihat catalog
                $("#menuLogout").show();
                $("#menuDailyIssuedPart").show();
                setTitleHeader();

            }

            $('#selectModel').select2({
                placeholder: '-- Pilih Model --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectEmployee').select2({
                placeholder: '-- Pilih Issued by --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectLine').select2({
                placeholder: '-- Pilih Line --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectCell').select2({
                placeholder: '-- Pilih Cell --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            function setTitleHeader() {
                document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";
            }

            //$('#inputGambar').on('change', function () {
            //    var input = this;
            //    if (input.files && input.files[0]) {
            //        var reader = new FileReader();
            //        reader.onload = function (e) {
            //            $('#previewGambar').html('<img src="' + e.target.result + '" width="100%" height="auto">');
            //        }
            //        reader.readAsDataURL(input.files[0]);
            //    }
            //});

            $('#inputGambar').on('change', function () {
                var input = this;
                if (input.files && input.files[0]) {
                    try {
                        if (input.files[0].type === "application/pdf") {
                            var fileURL = URL.createObjectURL(input.files[0]);
                            $('#previewGambar').html('<iframe src="' + fileURL + '" width="100%" height="500"></iframe>');
                        } else {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#previewGambar').html('<img src="' + e.target.result + '" width="100%" height="auto">');
                            };
                            reader.onerror = function () {
                                console.error('Error reading file');
                                alert('Error reading file');
                            };
                            reader.readAsDataURL(input.files[0]);
                        }
                    } catch (error) {
                        console.error('Error handling file', error);
                        alert('Error handling file');
                    }
                }
            });

            //halaman pagination sparepart
            var page = 1;
            var pageSize = 8;
            var searchQuery = ''; // Untuk menyimpan query pencarian

            // Fungsi untuk mengambil data sparepart
            function getSpareparts() {
                $('#loadingImg').show();
                $.ajax({
                    url: "/catalog.aspx/getAllSparepart",
                    method: 'post',
                    data: JSON.stringify({ page: page, pageSize: pageSize, search: searchQuery }), // Mengirim page, pageSize, dan search query
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var json = JSON.parse(data.d);
                        console.log(json);
                        var catalogContainer = $('#sparepartCatalog');
                        var loadMoreBtn = $('#loadMoreBtn'); // Menyimpan referensi ke tombol "Load More"

                        // Jika data kosong pada halaman pertama dan tidak ada sparepart yang ditemukan
                        if (json.length === 0 && page === 1) {
                            loadMoreBtn.prop('disabled', true).text('No Sparepart Found').css('cursor', 'not-allowed'); // Disable tombol load more dan ubah kursor
                        } else {
                            loadMoreBtn.prop('disabled', false).text('Load More').css('cursor', 'pointer'); // Enable tombol load more jika ada sparepart
                        }

                        // Jika data kosong pada halaman berikutnya, jangan menampilkan pesan dan disable tombol
                        if (json.length === 0 && page > 1) {
                            loadMoreBtn.prop('disabled', true).text('No more items').css('cursor', 'not-allowed'); // Disable tombol load more dan ubah kursor
                        }

                        // Loop dan tambahkan sparepart ke kontainer
                        $.each(json, function (index, item) {
                            var imageUrl = item._attcFile_Picture ? item._attcFile_Picture : "https://via.placeholder.com/150";
                            var goodsCode = item._goodsCode || "No code available";
                            var nowStock = item._nowStock !== null && item._nowStock !== undefined ? item._nowStock : 0;
                            var vendor = item._vendor !== null && item._vendor !== undefined ? item._vendor : "No vendor available";
                            var setColour;
                            if (item._colour == "Green") {
                                setColour = `<span class="badge badge-success mb-2"><p class="card-text" style="font-size:.8rem; color:white;"><strong>Now Stock :</strong> ${nowStock}</p></span>`
                            } else if (item._colour == "Light Green") {
                                setColour = `<span class="badge badge-success mb-2"><p class="card-text" style="font-size:.8rem; color:white;"><strong>Now Stock :</strong> ${nowStock}</p></span>`
                            } else if (item._colour == "Yellow") {
                                setColour = `<span class="badge badge-warning mb-2"><p class="card-text" style="font-size:.8rem; color:black;"><strong>Now Stock :</strong> ${nowStock}</p></span>`
                            }
                            else if (item._colour == "Black") {
                                setColour = `<span class="badge badge-dark mb-2"><p class="card-text" style="font-size:.8rem; color:white;"><strong>Now Stock :</strong> ${nowStock}</p></span>`
                            }

                            var loanedQtyMessage;
                            // Jika loanedQty lebih dari 0, tampilkan informasi peminjaman
                            if (item._loanedQty > 0) {
                                loanedQtyMessage = `<span class="badge badge-info mb-2"><p class="card-text" style="font-size:.8rem; color:white;"><strong>On Loan : </strong> ${item._loanedQty}</p></span>`;
                            } else {
                                loanedQtyMessage = '';
                            }

                            //<p class="card-text" style="font-size:.8rem;"><strong>Now Stock :</strong> ${nowStock}</p>

                            var sparepartCard = `
                            <div class="col mb-4">
                                <div class="card">
                                    <img src="${imageUrl}" class="card-img-top" alt="Image" style="height: 250px; object-fit: fill;">
                                    
                                    <div class="card-body" style="font-family:calibri;">
                                        <h4 class="card-title" style="font-weight:600; font-size:1.4rem;">${item._goodsName}</h4>
                                        <p class="card-text" style="font-weight:500; font-size:.8rem;">${goodsCode}</p>
                                        <p class="card-text" style="font-size:.8rem;"><strong>${item._goodsDesc || "No Goods Desc info"}</strong></p>
                                        <p class="card-text" style="font-size:.8rem;"><strong>${item._subKeeping || "No sub-keeping info"}</strong></p>
                                        ${setColour}
                                        ${loanedQtyMessage}
                                        <p class="card-text" style="font-size:.8rem;"><strong>${item._vendor || "No vendor info"}</strong></p>
                                        <div class="text-right">
                                            <button class="btn btn-outline-info btn-sm poppins-light" style="font-size:.7rem; font-family:Poppins;" onclick="showModal('${item._goodsCode}', '${item._goodsName}', '${item._goodsDesc}', '${item._subKeeping}', '${item._nowStock}', '${imageUrl}' , '${item._vendor}' , '${item._colour}')">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `;

                            catalogContainer.append(sparepartCard);
                        });
                    },
                    complete: function () {
                        $('#loadingImg').hide();
                    },
                    error: function (xhr, status, error) {
                        console.error("Error fetching data: " + error);
                    }
                });
            }

            // Handling search input
            $('#searchInput').keyup(function () {
                searchQuery = $(this).val(); // Get search query from input
                $('#sparepartCatalog').empty(); // Clear the container
                page = 1; // Reset ke halaman pertama

                // Jika search kosong, load sparepart pertama
                if (searchQuery === '') {
                    $('#loadMoreBtn').prop('disabled', false).text('Load More').css('cursor', 'pointer');
                    getSpareparts(); // Load data untuk halaman pertama
                } else {
                    getSpareparts(); // Load data berdasarkan query pencarian
                }
            });

            // Handling Load More button click
            $('#loadMoreBtn').click(function () {
                page++; // Increment halaman
                getSpareparts(); // Load data untuk halaman berikutnya
            });

            // Initial load ketika halaman pertama kali dimuat
            getSpareparts();

            // Function to show modal with sparepart details
            window.showModal = function (goodsCode, goodsName, goodsDesc, subKeeping, nowStock, imageUrl, vendor, colour) {
                $('#modalImage').attr('src', imageUrl);  // Set image
                $('#modalGoodsCode').text(goodsCode);  // Set goods code
                $('#modalGoodsName').text(goodsName);  // Set goods name
                $('#modalGoodsDesc').text(goodsDesc);  // Set goods description
                $('#modalSubKeeping').text(subKeeping);  // Set sub-keeping

                //$('#modalStock').text(nowStock);  // Set stock
                if (colour == 'Green') {
                    $("#modalStock").addClass("badge badge-success");
                } else if (colour == 'Light Green') {
                    $("#modalStock").addClass("badge badge-success");
                } else if (colour == 'Yellow') {
                    $("#modalStock").addClass("badge badge-warning");
                } else if (colour == 'Black') {
                    $("#modalStock").addClass("badge badge-dark");
                }
                $('#strong').text(nowStock);  // Set sub-keeping

                $('#modalVendor').text(vendor);  // Set stock

                // Reset input fields di modal
                $('#inputField1').val('');
                $('#inputField2').val('');
                $('#inputField3').val('');
                $('#inputField4').val('');

                $('#sparepartModal').modal('show');  // Show the modal
                loadModelData();
                loadEmployee();
                loadLineName();
                loadCell();

                // Set nowStock globally
                window.nowStock = nowStock; // Menyimpan nilai nowStock secara global

                // Pastikan qty tidak melebihi nowStock
                if (parseInt($('#qtyInput').val()) >= window.nowStock) {
                    $('#increaseQty').prop('disabled', true); // Disable the + button if qty == nowStock
                    $('#increaseQty').css('cursor', 'not-allowed'); // Change cursor to not-allowed
                }
            };

            $('#selectModel').select2({
                placeholder: '-- Pilih Model --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectEmployee').select2({
                placeholder: '-- Pilih Issued by --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectLine').select2({
                placeholder: '-- Pilih Line --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });

            $('#selectCell').select2({
                placeholder: '-- Pilih Cell --',
                width: '100%',  // Pastikan dropdown seleksi penuh
            });


        });

        // Menambahkan event listener ketika modal ditutup
        $('#sparepartModal').on('hidden.bs.modal', function () {
            // Mengosongkan textarea
            $('#additionalNotes').val('');
            $("#modalStock").removeClass();
            // Mengosongkan semua select2 (dropdown)
            $('#selectModel').val('').trigger('change'); // Mengosongkan dan mereset select2
            $('#selectLine').val('').trigger('change');  // Mengosongkan dan mereset select2
            $('#selectCell').val('').trigger('change');  // Mengosongkan dan mereset select2
            $('#selectEmployee').val('').trigger('change'); // Mengosongkan dan mereset select2

            $('#qtyInput').val(1); // Reset qty ke default
            $('#increaseQty').prop('disabled', false); // Aktifkan tombol +
            $('#increaseQty').css('cursor', 'pointer'); // Set cursor back to pointer
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

        function loadEmployee() {
            //ambil data employee
            $.ajax({
                type: "POST",
                url: "registernew.aspx/GetEmployee", // Gantilah dengan nama file dan method backend
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Pastikan kita melakukan JSON.parse pada response.d
                    var employees = JSON.parse(response.d);
                    var employeeSelect = $('#selectEmployee');

                    // Kosongkan dropdown terlebih dahulu
                    employeeSelect.empty();
                    employeeSelect.append('<option value="">-- Pilih Issued by --</option>');

                    // Isi dropdown dengan data supplier
                    for (var i = 0; i < employees.length; i++) {
                        employeeSelect.append('<option value="' + employees[i] + '">' + employees[i] + '</option>');
                    }

                    // Re-inisialisasi select2 setelah data dimuat
                    employeeSelect.trigger('change');
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

        function loadLineName() {
            //ambil data model
            $.ajax({
                type: "POST",
                url: "registernew.aspx/GetLineName", // Gantilah dengan nama file dan method backend
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Pastikan kita melakukan JSON.parse pada response.d
                    var lines = JSON.parse(response.d);
                    var lineSelect = $('#selectLine');

                    // Kosongkan dropdown terlebih dahulu
                    lineSelect.empty();
                    lineSelect.append('<option value="">-- Pilih Model --</option>');

                    // Isi dropdown dengan data supplier
                    for (var i = 0; i < lines.length; i++) {
                        lineSelect.append('<option value="' + lines[i] + '">' + lines[i] + '</option>');
                    }

                    // Re-inisialisasi select2 setelah data dimuat
                    lineSelect.trigger('change');
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

        function loadCell() {
            //ambil data model
            $.ajax({
                type: "POST",
                url: "registernew.aspx/GetCell", // Gantilah dengan nama file dan method backend
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Pastikan kita melakukan JSON.parse pada response.d
                    var cells = JSON.parse(response.d);
                    var cellSelect = $('#selectCell');

                    // Kosongkan dropdown terlebih dahulu
                    cellSelect.empty();
                    cellSelect.append('<option value="">-- Pilih Cell --</option>');

                    // Isi dropdown dengan data supplier
                    for (var i = 0; i < cells.length; i++) {
                        cellSelect.append('<option value="' + cells[i] + '">' + cells[i] + '</option>');
                    }

                    // Re-inisialisasi select2 setelah data dimuat
                    cellSelect.trigger('change');
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

        // Membuat objek Notyf dengan konfigurasi
        const notyf = new Notyf({
            duration: 3000, // Durasi notifikasi muncul
            position: {
                x: 'right', // Posisi horizontal di kanan
                y: 'top'    // Posisi vertikal di atas
            }
        });

        //$('#btnLoanNow').click(function () {
        //    const swalWithBootstrapButtons = Swal.mixin({
        //        customClass: {
        //            confirmButton: "btn btn-success",
        //            cancelButton: "btn btn-danger"
        //        },
        //        buttonsStyling: false
        //    });
        //    swalWithBootstrapButtons.fire({
        //        title: "Apakah Anda yakin?",
        //        text: "Loan Sparepart yang dipilih!?",
        //        icon: "warning",
        //        showCancelButton: true,
        //        confirmButtonText: "Yes, Loan!",
        //        cancelButtonText: "No, Cancel!",
        //        reverseButtons: true
        //    }).then((result) => {
        //        if (result.isConfirmed) {
        //            $('#loadingImg').show();
        //            // Mengambil data dari modal
        //            var goodsName = $("#modalGoodsName").text();
        //            var goodsCode = $("#modalGoodsCode").text();
        //            var qtyIssued = $("#qtyInput").val();
        //            var issuedBy = $("#selectEmployee").val();
        //            var reason = $("#additionalNotes").val();
        //            var lineName = $("#selectLine").val();
        //            var cellName = $("#selectCell").val();
        //            var model = $("#selectModel").val();
        //            var issuedByAccount = sessionStorage.getItem("name");

        //            var attcFile = $('#inputGambar')[0].files[0];  // Ambil file gambar
        //            var reader = new FileReader();

        //            reader.onloadend = function () {
        //                var base64Picture = reader.result.split(',')[1]; // Ambil base64 string dari file

        //                // Kirim data ke server menggunakan AJAX
        //                $.ajax({
        //                    type: "POST",
        //                    url: "catalog.aspx/SimpanDataLoan", // Ganti dengan URL endpoint Anda
        //                    data: JSON.stringify({ // Mengirim data sebagai JSON
        //                        goodsName: goodsName,
        //                        goodsCode: goodsCode,
        //                        qtyIssued: qtyIssued,
        //                        issuedBy: issuedBy,
        //                        reason: reason,
        //                        lineName: lineName,
        //                        cellName: cellName,
        //                        model: model,
        //                        issuedByAccount: issuedByAccount,
        //                        picture: base64Picture // Kirim Base64 string dari gambar
        //                    }),
        //                    contentType: 'application/json; charset=utf-8', // Set Content-Type ke application/json
        //                    dataType: 'json',
        //                    success: function (response) {
        //                        // Handle respons dari server
        //                        console.log(response);
        //                        $('#loadingImg').hide(); // Sembunyikan loading sebelum menampilkan SweetAlert

        //                        if (response.d.startsWith("Terjadi kesalahan:") || response.d.startsWith("Jenis file tidak valid:") || response.d == "Tidak ada file yang diunggah.") {
        //                            // Tampilkan pesan error dari server
        //                            Swal.fire({
        //                                icon: 'error',
        //                                title: 'Oops...',
        //                                text: response.d, // Tampilkan pesan error dari server
        //                            });
        //                        } else {
        //                            // Tampilkan pesan sukses
        //                            Swal.fire({
        //                                icon: 'success',
        //                                title: 'Success!',
        //                                text: 'Sparepart berhasil di loan.',
        //                            }).then((result) => {
        //                                if (result.isConfirmed) {
        //                                    window.location.href = 'loanlist.aspx';
        //                                }
        //                            });
        //                        }

        //                    },
        //                    error: function (error) {
        //                        // Handle error
        //                        console.error(error);
        //                        $('#loadingImg').hide(); // Pastikan loading disembunyikan jika terjadi error
        //                        Swal.fire({
        //                            icon: 'error',
        //                            title: 'Oops...',
        //                            text: 'Terjadi kesalahan saat menyimpan data.',
        //                        });

        //                    }
        //                });
        //            }
        //            reader.readAsDataURL(attcFile); // Membaca file gambar menjadi base64
        //        } else if (result.dismiss === Swal.DismissReason.cancel) {
        //            // Aksi jika dibatalkan
        //        }
        //    });
        //});

        $('#btnLoanNow').click(function () {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: "btn btn-success",
                    cancelButton: "btn btn-danger"
                },
                buttonsStyling: false
            });
            swalWithBootstrapButtons.fire({
                title: "Apakah Anda yakin?",
                text: "Loan Sparepart yang dipilih!?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Yes, Loan!",
                cancelButtonText: "No, Cancel!",
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#loadingImg').show();
                    // Mengambil data dari modal
                    var goodsName = $("#modalGoodsName").text();
                    var goodsCode = $("#modalGoodsCode").text();
                    var qtyIssued = $("#qtyInput").val();
                    var issuedBy = $("#selectEmployee").val();
                    var reason = $("#additionalNotes").val();
                    var lineName = $("#selectLine").val();
                    var cellName = $("#selectCell").val();
                    var model = $("#selectModel").val();
                    var issuedByAccount = sessionStorage.getItem("name");

                    var attcFile = $('#inputGambar')[0].files[0];  // Ambil file gambar atau PDF
                    var reader = new FileReader();

                    reader.onloadend = function () {
                        var base64Picture = reader.result; // Kirim Data URL utuh

                        // Kirim data ke server menggunakan AJAX
                        $.ajax({
                            type: "POST",
                            url: "catalog.aspx/SimpanDataLoan", // Ganti dengan URL endpoint Anda
                            data: JSON.stringify({ // Mengirim data sebagai JSON
                                goodsName: goodsName,
                                goodsCode: goodsCode,
                                qtyIssued: qtyIssued,
                                issuedBy: issuedBy,
                                reason: reason,
                                lineName: lineName,
                                cellName: cellName,
                                model: model,
                                issuedByAccount: issuedByAccount,
                                picture: base64Picture // Kirim Base64 string dari file
                            }),
                            contentType: 'application/json; charset=utf-8', // Set Content-Type ke application/json
                            dataType: 'json',
                            success: function (response) {
                                // Handle respons dari server
                                console.log(response);
                                $('#loadingImg').hide(); // Sembunyikan loading sebelum menampilkan SweetAlert

                                if (response.d.startsWith("Terjadi kesalahan:") || response.d.startsWith("Jenis file tidak valid:") || response.d == "Tidak ada file yang diunggah.") {
                                    // Tampilkan pesan error dari server
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: response.d, // Tampilkan pesan error dari server
                                    });
                                } else {
                                    // Tampilkan pesan sukses
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Success!',
                                        text: 'Sparepart berhasil di loan.',
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location.href = 'loanlist.aspx';
                                        }
                                    });
                                }

                            },
                            error: function (error) {
                                // Handle error
                                console.error(error);
                                $('#loadingImg').hide(); // Pastikan loading disembunyikan jika terjadi error
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Terjadi kesalahan saat menyimpan data.',
                                });

                            }
                        });
                    }
                    reader.readAsDataURL(attcFile); // Membaca file menjadi base64
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    // Aksi jika dibatalkan
                }
            });
        });


        // Ketika tombol "Issued Now" di-click
        $('#btnIssuedNow').click(function () {
            var nowStock = $('#strong').text(); // Ambil nilai stok dari modal
            var isValid = true; // Flag untuk mengecek validasi form
            var missingFields = []; // Menyimpan field yang belum diisi

            // Mengecek setiap field di modal untuk memastikan semuanya terisi
            $('#selectModel, #selectLine, #selectCell, #selectEmployee, #additionalNotes').each(function () {
                if ($(this).val() === '' || $(this).val() === null) {
                    isValid = false; // Tandai jika ada field yang kosong
                    missingFields.push($(this).prev('label').text()); // Menyimpan label field yang kosong
                }
            });

            // Jika stok tersedia dan semua input valid
            if (parseInt(nowStock) > 0) {
                if (isValid) {
                    // Menampilkan konfirmasi sebelum melanjutkan
                    //var userConfirmation = confirm("Apakah Anda yakin ingin issued sparepart ini?");

                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: "btn btn-success",
                            cancelButton: "btn btn-danger"
                        },
                        buttonsStyling: false
                    });
                    swalWithBootstrapButtons.fire({
                        title: "Apakah Anda yakin?",
                        text: "Issued Sparepart yang dipilih!?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonText: "Yes, Issued!",
                        cancelButtonText: "No, Cancel!",
                        reverseButtons: true
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $('#loadingImg').show();
                            // Mengambil data dari modal
                            var goodsName = $("#modalGoodsName").text();
                            var goodsCode = $("#modalGoodsCode").text();
                            var qtyIssued = $("#qtyInput").val();
                            var issuedBy = $("#selectEmployee").val();
                            var reason = $("#additionalNotes").val();
                            var lineName = $("#selectLine").val();
                            var cellName = $("#selectCell").val();
                            var model = $("#selectModel").val();
                            var issuedByAccount = sessionStorage.getItem("name");

                            // Kirim data ke backend (C# Web Forms)
                            $.ajax({
                                url: 'catalog.aspx/InsertIssuedPart',
                                type: 'POST',
                                data: JSON.stringify({
                                    goodsName: goodsName,
                                    goodsCode: goodsCode,
                                    qtyIssued: qtyIssued,
                                    issuedBy: issuedBy,
                                    reason: reason,
                                    lineName: lineName,
                                    cellName: cellName,
                                    model: model,
                                    issuedByAccount: issuedByAccount
                                }),
                                contentType: 'application/json',
                                dataType: 'json',
                                success: function (response) {
                                    if (response.d) {
                                        alert("Data berhasil di-issue.");
                                        //$('#loadingImg').show();
                                        // Bisa menutup modal atau mereload halaman sesuai kebutuhan
                                        window.location.href = "dailyissuedpart.aspx"; // Redirect ke halaman lain setelah sukses
                                    } else {
                                        alert("Gagal melakukan proses issue.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Terjadi kesalahan: " + error);
                                }
                            });
                        } else if (
                            /* Read more about handling dismissals below */
                            result.dismiss === Swal.DismissReason.cancel
                        ) {
                            //swalWithBootstrapButtons.fire({
                            //    title: "Cancelled",
                            //    text: "Your imaginary file is safe :)",
                            //    icon: "error"
                            //});
                        }
                    });

                    //if (userConfirmation) {

                    //} else {
                    //    // Jika pengguna menekan "Cancel", tidak ada aksi yang dilakukan
                    //    //alert("Proses issued dibatalkan.");
                    //}

                } else {
                    // Menampilkan notifikasi error jika ada field yang kosong
                    var errorMsg = 'Mohon isikan data ' + missingFields.join(', ') + '.';
                    notyf.error(errorMsg); // Menampilkan error dengan daftar field yang belum diisi
                }
            } else {
                // Menampilkan notifikasi error jika stok tidak cukup
                notyf.error('Sparepart is out of stock!');
            }
        });

        // Handle increase quantity
        $('#increaseQty').click(function () {
            var qty = parseInt($('#qtyInput').val());

            // Jika qty < nowStock, tambahkan qty dengan 1
            if (qty < window.nowStock) {
                $('#qtyInput').val(qty + 1);
            }

            // Jika qty sudah sama atau lebih dari nowStock, tampilkan notifikasi dengan Notyf
            if (qty + 1 >= window.nowStock) {
                notyf.error("Stock sudah tidak cukup.");
                $('#increaseQty').prop('disabled', true); // Disable tombol +
                $('#increaseQty').css('cursor', 'not-allowed'); // Change cursor to not-allowed
            }
        });

        // Handle decrease quantity
        $('#decreaseQty').click(function () {
            var qty = parseInt($('#qtyInput').val());

            if (qty > 1) {
                $('#qtyInput').val(qty - 1); // Mengurangi qty dengan 1 jika lebih dari 1
            }

            // Jika qty kurang dari nowStock, aktifkan kembali tombol +
            if (qty - 1 < window.nowStock) {
                $('#increaseQty').prop('disabled', false); // Mengaktifkan tombol + kembali
                $('#increaseQty').css('cursor', 'pointer'); // Set cursor back to pointer
            }
        });
    </script>



</body>
</html>
