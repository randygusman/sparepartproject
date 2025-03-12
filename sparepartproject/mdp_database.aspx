<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mdp_database.aspx.cs" Inherits="sparepartproject.mdp_database" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - MDP Database Part</title>
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



    <style>
        /* Tabel */
        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem; /* Ukuran font tabel */
            font-family: sans-serif; /* Jenis font tabel */
            cursor: pointer;
        }

            .table th, .table td {
                padding: 10px; /* Padding untuk sel tabel */
                text-align: center; /* Mengatur teks menjadi rata tengah */
                border: 1px solid #eeeeee; /* Border yang ringan untuk tabel */
            }

            /* Header tabel */
            .table thead {
                background-color: #003366; /* Warna latar belakang header tabel */
                color: white; /* Warna teks header */
            }

            /* Hover efek pada baris tabel */
            .table tbody tr:hover {
                background-color: #e9ecef; /* Warna latar belakang saat hover baris tabel */
                transition: background-color 0.1s ease; /* Menambahkan transisi agar lebih smooth */
            }

            /* Warna latar belakang untuk baris ganjil */
            .table tbody tr:nth-child(odd) {
                background-color: #f9f9f9; /* Warna latar belakang baris ganjil */
            }

            /* Warna latar belakang untuk baris genap */
            .table tbody tr:nth-child(even) {
                background-color: #ffffff; /* Warna latar belakang baris genap */
            }

            /* Hover pada baris tabel */
            .table tbody tr:hover {
                background-color: #e0e0e0; /* Warna latar belakang saat hover pada baris tabel */
                cursor: pointer; /* Mengubah kursor menjadi pointer */
            }

        /* Tombol Pagination */
        .page-button {
            padding: 8px 12px;
            border: 1px solid #007bff; /* Border biru */
            background-color: white; /* Latar belakang putih */
            color: #007bff; /* Warna teks biru */
            cursor: pointer;
            margin: 0 2px; /* Spasi antar tombol */
            font-size: 0.7rem; /* Ukuran font lebih kecil */
            border-radius: 5px; /* Memberikan sudut tombol yang lebih halus */
        }

            /* Hover pada tombol pagination */
            .page-button:hover {
                background-color: #007bff; /* Latar belakang biru saat tombol hover */
                color: white; /* Teks putih saat hover */
            }

            /* Tombol pagination aktif */
            .page-button.active {
                background-color: #007bff; /* Latar belakang biru untuk tombol aktif */
                color: white; /* Teks putih untuk tombol aktif */
                font-weight: bold; /* Menebalkan teks tombol aktif */
            }

            /* Tombol pagination disabled */
            .page-button:disabled {
                background-color: #e0e0e0; /* Latar belakang gray untuk tombol disabled */
                color: #b0b0b0; /* Warna teks gray untuk tombol disabled */
                cursor: not-allowed; /* Menghilangkan kursor pointer untuk tombol disabled */
            }

        /* Penataan untuk bagian pagination */
        #pagination {
            text-align: right;
            margin-top: 15px;
            padding: 10px 0;
        }

        /* Pop-Up untuk gambar */
        #imagePopup {
            position: fixed; /* Memastikan pop-up tetap di posisi yang sama meskipun halaman di-scroll */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* Background transparan */
            display: flex; /* Menggunakan Flexbox */
            justify-content: center; /* Mengatur konten (popup) di tengah secara horizontal */
            align-items: center; /* Mengatur konten (popup) di tengah secara vertikal */
            z-index: 9999; /* Agar pop-up muncul di atas konten lainnya */
        }

        /* Konten dari popup */
        .popup-content {
            position: relative;
            background-color: white;
            padding: 20px;
            max-width: 420px; /* Menyediakan ukuran maksimal */
            max-height: 420px; /* Menyediakan ukuran maksimal */
            overflow: auto; /* Jika gambar lebih besar dari pop-up, beri scroll */
        }

        /* Tombol close pada pop-up */
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 30px;
            color: #333;
            cursor: pointer;
        }

        /* Gambar dalam pop-up */
        #sparepartImage {
            max-width: 400px; /* Maksimum lebar gambar */
            max-height: 400px; /* Maksimum tinggi gambar */
            object-fit: contain; /* Menjaga rasio gambar agar tidak terdistorsi */
        }

        /* Menambahkan hover pada teks sparepart-code */
        .sparepart-code:hover {
            color: #0056b3; /* Mengubah warna biru saat hover */
            text-decoration: none; /* Menghilangkan underline saat hover */
        }

        /* Status class untuk tabel */
        td.status-zero {
            background-color: rgba(58, 58, 66, .12);
            color: #3a3a42 !important;
            padding: 0.2em 0.4em; /* Add some padding to the badge */
            border-radius: 0.2rem; /* Rounded corners */
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
        }

        td.status-rop {
            background-color: rgba(246, 108, 19, .12);
            color: #f66c13 !important;
            padding: 0.2em 0.4em; /* Add some padding to the badge */
            border-radius: 0.2rem; /* Rounded corners */
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
        }

        td.status-safety {
            background-color: rgba(58, 58, 66, .12);
            color: #3a3a42 !important;
            padding: 0.2em 0.4em; /* Add some padding to the badge */
            border-radius: 0.2rem; /* Rounded corners */
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
        }

        td.status-normal {
            background-color: rgba(78, 182, 49, .12);
            color: #4eb631 !important;
            padding: 0.3em 0.6em; /* Add some padding to the badge */
            border-radius: 0.2rem; /* Rounded corners */
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
        }

        /* Penataan button add part */
        #btnAddPart, #btnAddPartonebyone {
            font-size: .8rem;
            margin-bottom: 5px;
        }

        /* Custom dataTables styles (optional) */
        .dataTables_info, .dataTables_filter, .dataTables_length, .paging_simple_numbers {
            font-size: 10px;
        }

        /* Overlay loading */
        .overlay {
            position: fixed;
            left: 0px;
            margin-top: 200px;
            width: 100%;
            text-align: center;
            height: 100%;
            z-index: 9999;
            background-color: transparent;
        }

            /* Efek overlay */
            .overlay::before {
                margin: auto;
                display: block;
                text-align: center;
                content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');
            }
        /* Menambahkan gaya default untuk .sparepart-code */
        .sparepart-code {
            color: blue; /* Warna biru */
            text-decoration: underline; /* Garis bawah untuk link */
            cursor: pointer; /* Mengindikasikan bisa diklik */
        }
    </style>
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

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                    </button>
                    <h5 style="margin-bottom: 0px; margin-left: 20px;">Database Part</h5>
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


            <div class="col-12">
            </div>

            <%-- <div class="line"></div>--%>
            <form id="form2" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <div class="col-lg-12 col-sm-12 col-xl-12 col-12 col-xs-12" style="margin-left: 0;">
                    <%--<div class="line"></div>--%>
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <label style="margin-top: 0px; font-size: 1.5rem;" class="mb-5">MDP Sparepart Database</label>
                                </div>

                            </div>
                            <div class="row">
                            </div>

                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row mt-3"></div>
                                    <div style="justify-content: space-between; align-items: center; margin-bottom: 5px;">
                                        <h2></h2>
                                        <input type="text" id="searchInput" placeholder="Cari spare part..." style="font-size: 1rem; font-family: sans-serif;" />
                                    </div>
                                    <table class="table table-hover" style="font-size: .9rem; font-family: sans-serif; cursor: pointer;" id="tabela">
                                        <thead>
                                            <tr>
                                                <th scope="col" title="SPI Goods Code">SPI Goods Code</th>
                                                <th scope="col">Goods Name</th>
                                                <th scope="col">Sub Keeping</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Qty</th>
                                                <th scope="col">Min Stock</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Data tabel akan dimasukkan di sini -->
                                        </tbody>
                                    </table>

                                    <div id="pagination">
                                        <!-- Tombol pagination akan ditambahkan di sini -->
                                    </div>

                                </div>

                                <!-- Pop-Up untuk menampilkan gambar -->
                                <div id="imagePopup" style="display: none;">
                                    <div class="popup-content">
                                        <span id="closePopup" class="close-button">&times;</span>
                                        <img id="sparepartImage" src="" alt="Sparepart Image" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- <div id="loadingImg" style="display: none;" class="m-auto mt-9"><%--images/load.gif
                            <img src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif" height="120" width="240" />
                        </div>--%>

                        <%--<div class="overlay" id="loadingImg">
                            <p>Processing data, please wait...</p>
                        </div>--%>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: normal; float: left;" class="mb-5" id="lblUpdate" runat="server"></label>
                            <br />
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: normal; float: left;" class="mb-5" id="updateby" runat="server"></label>
                            <br />
                            <label style="margin-top: 0px; font-size: .7rem; font-weight: normal; float: left;" class="mb-5" id="filename" runat="server"></label>
                        </div>
                    </div>

                </div>


            </form>
        </div>
    </div>

    <script src="Scripts/jquery-3.5.1.min.js"></script>

    <%--<script src="Scripts/popper.min.js"></script>--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/myCustomScrollbar.js"></script>
    <script src="Scripts/DataTables/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });

        let currentPage = 1; // Halaman saat ini
        let searchTerm = ""; // Variabel untuk menyimpan kata kunci pencarian
        const pageSize = 10; // Jumlah item per halaman

        function loadSpareParts(page, search = "") {
            $.ajax({
                url: `/api/sparepart?page=${page}&pageSize=${pageSize}&search=${encodeURIComponent(search)}`,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    displayData(response.SpareParts);
                    setupPagination(response.TotalCount, page);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                }
            });
        }

        // Menangani pencarian
        $('#searchInput').on('input', function () {
            searchTerm = $(this).val(); // Simpan nilai pencarian
            currentPage = 1; // Reset ke halaman 1 saat melakukan pencarian
            loadSpareParts(currentPage, searchTerm);
        });

        function displayData(spareParts) {
            // Bersihkan tabel sebelumnya
            $('#tabela tbody').empty();

            if (spareParts.length === 0) {
                // Jika tidak ada hasil, tampilkan pesan
                $('#tabela tbody').append(`
            <tr>
                <td colspan="8" class="text-center">No sparepart found</td>
            </tr>
        `);
            } else {
                // Tambahkan data ke tabel
                spareParts.forEach(sparePart => {
                    let statusClass;
                    const imageSrc = sparePart.attchPicture.length > 0 ? sparePart.attchPicture[0] : '';
                    const sparepartCodeClass = sparePart.attchPicture.length > 0 ? 'sparepart-code clickable' : '';
                    if (sparePart.status === 'Zero') {
                        statusClass = 'status-zero'; // Kelas untuk status Zero
                    } else if (sparePart.status === 'Normal') {
                        statusClass = 'status-normal'; // Kelas untuk status Normal
                    } else if (sparePart.status === 'ROP') {
                        statusClass = 'status-rop'; // Kelas untuk status Normal
                    } else {
                        statusClass = ''; // Kelas kosong jika status tidak dikenali
                    }

                    $('#tabela tbody').append(`
                <tr>
                    <td class="${sparepartCodeClass}" data-image="${imageSrc}">${sparePart.code}</td>
                    <td>${sparePart.name}</td>
                    <td style="text-align:center; background-color:lightyellow; font-weight:bold;">${sparePart.SubKeepingName}</td>

                    <td>${sparePart.description}</td>

                    <td style="text-align:center;">${sparePart.sbq}</td>
                    <td style="text-align:center;">${sparePart.minStock}</td>
                    <td class="${statusClass}">${sparePart.status}</td>
                    <td></td>
                </tr>
            `);
                });
            }

            $('.sparepart-code').on('click', function () {
                const imageSrc = $(this).data('image');
                if (imageSrc) {
                    $('#sparepartImage').attr('src', imageSrc);
                    $('#imagePopup').show();
                }
            });

            // Menangani klik untuk menutup pop-up
            $('#closePopup').on('click', function () {
                $('#imagePopup').hide(); // Menyembunyikan pop-up
                $('#sparepartImage').attr('src', ''); // Mengosongkan gambar agar gambar reset
            });

            // Menutup pop-up jika area luar pop-up diklik
            $('#imagePopup').on('click', function (e) {
                if ($(e.target).is('#imagePopup')) {
                    $('#imagePopup').hide(); // Menyembunyikan pop-up jika area luar diklik
                    $('#sparepartImage').attr('src', ''); // Mengosongkan gambar
                }
            });

        }

        function setupPagination(totalCount, currentPage) {
            const totalPages = Math.ceil(totalCount / pageSize);
            $('#pagination').empty(); // Bersihkan pagination sebelumnya

            // Tombol halaman pertama
            if (currentPage > 1) {
                $('#pagination').append(`
            <button class="page-button" data-page="1">1</button>
        `);
            }

            // Tombol sebelumnya
            if (currentPage > 1) {
                $('#pagination').append(`
            <button class="page-button" data-page="${currentPage - 1}">Prev</button>
        `);
            }

            // Menentukan batasan untuk menampilkan nomor halaman
            const startPage = Math.max(2, currentPage - 1); // Mulai dari 2 jika currentPage lebih dari 1
            const endPage = Math.min(totalPages - 1, currentPage + 1); // Hingga totalPages - 1 jika total lebih dari 1

            // Tambahkan nomor halaman
            for (let page = startPage; page <= endPage; page++) {
                $('#pagination').append(`
            <button class="page-button ${page === currentPage ? 'active' : ''}" data-page="${page}">${page}</button>
        `);
            }

            // Tombol berikutnya
            if (currentPage < totalPages) {
                $('#pagination').append(`
            <button class="page-button" data-page="${currentPage + 1}">Next</button>
        `);
            }

            // Tombol halaman terakhir
            if (currentPage < totalPages) {
                $('#pagination').append(`
            <button class="page-button" data-page="${totalPages}">${totalPages}</button>
        `);
            }

            // Mengikat event listener pada tombol pagination
            $('.page-button').off('click').on('click', function (event) {
                event.preventDefault();
                const page = $(this).data('page');
                currentPage = page;
                loadSpareParts(currentPage, searchTerm); // Muat data berdasarkan halaman dan kata kunci pencarian
            });
        }


        $(document).ready(function () {
            loadSpareParts(currentPage);
        });
    </script>
</body>
</html>
