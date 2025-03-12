<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spi_cell.aspx.cs" Inherits="sparepartproject.systemconfig.spi_cell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Sparepart Inventory - System Config - Cell</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="../Style/style.css" />
    <%--<link rel="stylesheet" href="Style/font-awesome.css" />--%>
    <%--<link href="Style/all.min.css" rel="stylesheet" />--%>
    <link href="../Style/all.min.css" rel="stylesheet" />

    <!-- Font Awesome JS -->
    <%--<script src="Scripts/solid.js"></script>--%>
    <script src="../Scripts/fontawesome.min.js"></script>
    <link rel="stylesheet" href="../Style/myCustomScrollbar.css" />
    <link rel="stylesheet" href="../Content/DataTables/css/jquery.dataTables.min.css" />

    <link href="../Style/select2.min.css" rel="stylesheet" />
    <link href="../Style/notyf.min.css" rel="stylesheet" />

    <style>
        .search-container {
            display: flex;
            justify-content: flex-end; /* Menyusun elemen ke kanan */
            align-items: center; /* Menyelaraskan elemen secara vertikal */
            width: 100%;
            margin-bottom: 10px; /* Menambahkan jarak bawah antara input dan tabel */
        }

        #searchInput {
            padding: 8px;
            font-size: .8rem;
            width: 200px; /* Menentukan lebar input */
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-right: 10px; /* Memberikan jarak antara input dan tombol */
        }

        #btnAddModel {
            font-size: .8rem;
            margin-left: 10px; /* Memberikan jarak antara tombol Add Model dan tombol pencarian */
        }
        /* Tabel */
        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem; /* Ukuran font tabel */
            font-family: Poppins; /* Jenis font tabel */
            cursor: pointer;
        }

            .table th, .table td {
                padding: 10px; /* Padding untuk sel tabel */
                text-align: center; /* Mengatur teks menjadi rata tengah */
                border: 1px solid lightgrey; /* Border yang ringan untuk tabel */
                vertical-align: middle;
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

        @font-face {
            font-family: 'Poppins';
            src: url('../Font/Poppins-Light.ttf') format('truetype'), url('../Font/Poppins-Light.woff2') format('woff2');
            font-weight: 300;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('../Font/Poppins-Regular.ttf') format('truetype'), url('../Font/Poppins-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('../Font/Poppins-Medium.ttf') format('truetype'), url('../Font/Poppins-Medium.woff2') format('woff2');
            font-weight: 500;
            font-style: normal;
        }

        @font-face {
            font-family: 'Poppins';
            src: url('../Font/Poppins-Bold.ttf') format('truetype'), url('../Font/Poppins-Bold.woff2') format('woff2');
            font-weight: 600;
            font-style: normal;
        }

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

        /* Menata pagination supaya berada di sebelah kanan */
        #custom-pagination {
            display: flex !important;
            justify-content: flex-end !important; /* Memindahkan pagination ke sebelah kanan */
            list-style-type: none !important;
            padding-left: 0 !important;
            margin-bottom: 0 !important;
        }

            /* Menata setiap item dalam pagination */
            #custom-pagination .page-item {
                margin: 0 2px !important;
            }

            /* Gaya untuk link pagination */
            #custom-pagination .page-link {
                display: block !important;
                padding: 8px 16px !important;
                color: #4E7BAF !important; /* Warna link default */
                border-color: #4E7BAF !important; /* Warna border saat hover */
                text-decoration: none !important;
                border: 1px solid #ddd !important;
                border-radius: 5px !important;
                font-size: 11px !important;
            }

            /* Tombol aktif */
            #custom-pagination .page-item.active .page-link {
                background-color: #3C5A8D !important; /* Warna biru untuk tombol aktif */
                color: white !important; /* Warna teks putih */
                border-color: #3C5A8D !important; /* Border tombol aktif */
            }

            /* Fokus pada tombol pagination */
            #custom-pagination .page-link:focus {
                background-color: #0056b3 !important; /* Warna latar belakang saat tombol dalam keadaan fokus */
                color: white !important;
                border-color: #0056b3 !important;
                outline: none !important;
            }

            /* Hover efek pada tombol */
            #custom-pagination .page-link:hover {
                background-color: #4E7BAF !important; /* Warna latar belakang saat hover */
                border-color: #4E7BAF !important; /* Warna border saat hover */ /* Warna latar belakang saat hover */
                color: white !important;
            }

            /* Gaya untuk tombol disabled */
            #custom-pagination .page-item.disabled .page-link {
                color: #ccc !important;
                pointer-events: none !important;
                background-color: #f8f9fa !important;
                border-color: #ddd !important;
            }
    </style>
</head>
<body style="font-family: 'Poppins'; background-color: #ddd">
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Sparepart Inventory</h3>
            </div>

            <ul class="list-unstyled components" style="font-weight: 500;">
                <li class="active">
                    <a href="#configSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">System Config</a>
                    <ul class="collapse list-unstyled" id="configSubmenu">
                        <li>
                            <a href="spi_model.aspx">Model</a>
                        </li>
                        <li>
                            <a href="spi_line.aspx">Line</a>
                        </li>
                        <li>
                            <a href="spi_cell.aspx" style="background-color: white; color: #172679;">Cell</a>
                        </li>
                        <li>
                            <a href="spi_keeping.aspx">Keeping & Sub Keeping</a>
                        </li>
                        <li onclick="alert('Coming Soon');">
                            <a href="#">Currency</a>
                        </li>
                        <li onclick="alert('Coming Soon');">
                            <a href="#">Employee</a>
                        </li>
                        <li>
                            <a href="spi_vendor.aspx">Vendor</a>
                        </li>
                        <li>
                            <a href="spi_maker.aspx">Maker</a>
                        </li>
                        <li>
                            <a href="spi_unit.aspx">Unit</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="../home.aspx">Home</a>
                </li>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">SPI</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="../registernew.aspx">Register Part</a>
                        </li>
                        <li>
                            <a href="../catalog.aspx">Catalog</a>
                        </li>
                        <li>
                            <a href="../spi_databasepart.aspx">Database Part</a>
                        </li>
                        <li>
                            <a href="../dailyissuedpart.aspx">Daily Issued Part</a>
                        </li>
                        <li>
                            <a href="../loanlist.aspx">Loan List</a>
                        </li>
                        <li>
                            <a href="../sparepartorder.aspx">Order Part</a>
                        </li>
                        <li>
                            <a href="../comingpart.aspx">Coming Part</a>
                        </li>
                        <li>
                            <a href="../listprintlabel.aspx">List Print Label</a>
                        </li>
                        <li>
                            <a href="../closedactivity.aspx">Closed Activity</a>
                        </li>
                        <li>
                            <a href="../modification_history.aspx">Modification History</a>
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
                            <a href="../expenses.aspx">Pre Expenses</a>
                        </li>
                        <li>
                            <a href="../expenseslist.aspx">Expenses</a>
                        </li>
                        <li>
                            <a href="../expenseslist_uncounting.aspx">Expenses (Uncounting)</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="../qcreminder_insertnew.aspx">QC Check Reminder</a>
                </li>
                <li>
                    <a href="../informationitem.aspx">Contactor</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="../Logout.aspx" class="article">Logout</a>
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
                <h5 style="margin-bottom: 0px; margin-left: 20px;">System Config - Cell</h5>
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
        <form id="form2" runat="server">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between bg-light" style="background-color: #f8f9fa!important">
                            <h6 class="m-0 font-weight-bold" style="color: #003366;">Cell</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="search-container">
                                <input type="text" id="searchInput" style="font-size: .7rem;" placeholder="Search..." />
                                <button id="btnAddModel" class="btn btn-primary" style="font-size: .7rem; display: inline-flex; align-items: center; padding: 8px 15px; border-radius: 5px; background-color: #007bff; border-color: #007bff;">
                                    <i class="fas fa-plus" style="margin-right: 8px;"></i>Tambah Cell
                                </button>
                            </div>
                            <table class="table table-hover" id="modelsTable" style="font-size: .8rem; cursor: pointer;">
                                <thead style="background-color: #2A476B; color: white;">
                                    <tr>
                                        <th>ID</th>
                                        <th>Cell</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Data dari AJAX akan dimasukkan di sini -->
                                </tbody>
                            </table>

                            <ul id="custom-pagination" class="pagination">
                                <!-- Pagination akan dimasukkan di sini -->
                            </ul>

                            <!--modal order one by one (input qty and line only-->
                            <div class="modal fade" id="addModelModal">
                                <div class="modal-dialog modal-md">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 id="addModelModalLabel" style="margin-bottom: 0; font-weight: 600; padding-left: 20px;">Tambah Cell</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div style="padding-left: 20px; padding-right: 20px;">
                                                <div class="form-group mt-3 mb-5">
                                                    <label for="modelName" style="font-weight: 500; font-size: 1rem;">New Cell</label>
                                                    <input type="text" class="form-control" id="cellName" style="font-size: .8rem; width: 100%; text-transform: uppercase;" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" style="font-size: .8rem;" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" style="font-size: .8rem;" id="btnAddModelToDB">Save Cell</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="../Scripts/jquery-3.5.1.min.js"></script>

    <%--<script src="Scripts/popper.min.js"></script>--%>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/myCustomScrollbar.js"></script>
    <script src="../Scripts/DataTables/jquery.dataTables.min.js"></script>
    <script src="../Scripts/notyf.min.js"></script>
    <script src="../Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        // Membuat objek Notyf dengan konfigurasi
        const notyf = new Notyf({
            duration: 3000, // Durasi notifikasi muncul
            position: {
                x: 'right', // Posisi horizontal di kanan
                y: 'top'    // Posisi vertikal di atas
            }
        });

        $('#btnAddModel').click(function (e) {
            e.preventDefault();  // Mencegah reload halaman
            $('#addModelModal').modal('show');  // Menampilkan modal
        });

        let currentPage = 1; // Halaman saat ini
        const pageSize = 10; // Jumlah item per halaman

        function loadCells(page, search = "") {
            $.ajax({
                url: '/api/cell?page=' + page + '&pageSize=' + pageSize + '&search=' + encodeURIComponent(search),
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    console.log(response); // Debug respons yang diterima

                    // Kosongkan tabel sebelum menambahkan data baru
                    $('#modelsTable tbody').empty();

                    if (response.data && response.data.length > 0) {
                        // Menambahkan data ke dalam tabel
                        response.data.forEach(function (unit) {
                            $('#modelsTable tbody').append(`
                        <tr>
                            <td>${unit.Id}</td>
                            <td>${unit.CellName}</td>
                            <td>
                                <button class="btn btn-outline-danger btn-sm delete-model" data-id="${unit.Id}">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    `);
                        });

                        // Menampilkan pagination
                        $('#custom-pagination').empty(); // Kosongkan pagination sebelumnya
                        for (var i = 1; i <= response.totalPages; i++) {
                            var activeClass = (i === page) ? 'active' : ''; // Menambahkan kelas active untuk halaman yang aktif
                            $('#custom-pagination').append(`
                        <li class="page-item ${activeClass}">
                            <a class="page-link" href="#" onclick="loadCells(${i}, '${search}')">${i}</a>
                        </li>
                    `);
                        }

                        // Set currentPage menjadi halaman yang sedang aktif
                        currentPage = page;
                    } else {
                        // Jika data tidak ditemukan, tampilkan pesan dalam tabel
                        $('#modelsTable tbody').append('<tr><td colspan="3" style="text-align:center; color:red;">Data tidak ditemukan</td></tr>');
                    }
                },
                error: function (xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
        }

        $(document).ready(function () {
            // Ambil role dari sessionStorage
            var role = sessionStorage.getItem("role");
            if (role === null) {
                // Redirect ke halaman login atau tampilkan pesan error
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Role tidak valid. Anda akan diarahkan kembali ke halaman login.',
                }).then((result) => {
                    window.location.href = "../Default.aspx";
                });
            } else if (role !== "ADMIN") {
                // Redirect ke halaman login atau tampilkan pesan error
                Swal.fire({
                    icon: 'error',
                    title: 'Akses Ditolak',
                    text: 'Role tidak valid. Anda akan diarahkan kembali ke halaman home.',
                }).then((result) => {
                    window.location.href = "../home.aspx";
                });
            }

            setTitleHeader();
            loadCells(currentPage); // Muat data untuk halaman 1 pada awalnya
        });

        function setTitleHeader() {
            document.getElementById("user").innerText = sessionStorage.getItem("name") + "  [ " + sessionStorage.getItem("role") + " ]";
        }

        // Menangani pencarian
        $('#searchInput').on('input', function () {
            let searchTerm = $(this).val(); // Simpan nilai pencarian
            currentPage = 1; // Reset ke halaman 1 saat melakukan pencarian
            loadCells(currentPage, searchTerm); // Panggil loadModels dengan kata kunci pencarian
        });

        $('#btnAddModelToDB').click(function () {
            var cellName = $('#cellName').val().toUpperCase(); // Ubah menjadi uppercase
            if (cellName) {
                // Menampilkan SweetAlert untuk konfirmasi
                Swal.fire({
                    title: 'Apakah Anda yakin?',
                    text: "Cell " + cellName + " akan ditambahkan.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Ya, tambahkan!',
                    cancelButtonText: 'Batal',
                    confirmButtonColor: '#007bff', // Warna latar belakang sesuai dengan btn btn-primary
                    cancelButtonColor: '#d33', // Warna tombol batal
                    customClass: {
                        confirmButton: 'btn-primary-swal', // Menambahkan kelas kustom ke tombol konfirmasi
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Jika pengguna memilih "Ya, tambahkan!", lanjutkan ke API untuk memeriksa dan menyimpan data
                        $.ajax({
                            url: '/api/cell/check',  // URL endpoint untuk cek model
                            type: 'POST',
                            data: JSON.stringify({ cellName: cellName }),  // Kirim data model
                            contentType: 'application/json',
                            success: function (response) {
                                if (response.exists) {
                                    Swal.fire({
                                        title: "Double!",
                                        text: "Cell tersebut sudah ada di Database?",
                                        icon: "warning"
                                    });
                                } else {
                                    // Jika tidak ada, simpan ke database
                                    $.ajax({
                                        url: '/api/cell/add',  // URL endpoint untuk menambah model
                                        type: 'POST',
                                        data: JSON.stringify({ cellName: cellName }),
                                        contentType: 'application/json',
                                        success: function (result) {
                                            if (result.success) {
                                                Swal.fire('Berhasil', 'Cell berhasil ditambahkan! Silahkan lihat pada table.', 'success');
                                                $('#addModelModal').modal('hide');  // Menutup modal
                                                // Reset nilai input
                                                $('#cellName').val('');
                                                $('#searchInput').val('');

                                                loadCells(currentPage);  // Muat ulang data model
                                            } else {
                                                Swal.fire('Gagal', 'Terjadi kesalahan saat menyimpan Cell.', 'error');
                                            }
                                        },
                                        error: function (error) {
                                            Swal.fire('Gagal', 'Terjadi kesalahan saat menyimpan Cell.', 'error');
                                        }
                                    });
                                }
                            },
                            error: function (error) {
                                notyf.error('Error saat memeriksa Cell Name yang sudah ada di Database!');
                            }
                        });
                    }
                });
            } else {
                notyf.error('New Cell Name tidak boleh kosong!');
            }
        });

        // Menangani klik tombol delete
        $(document).on('click', '.delete-model', function (event) {
            event.preventDefault();  // Mencegah reload halaman

            var unitId = $(this).data('id');  // Mendapatkan ID model dari atribut data-id
            var cellName = $(this).closest('tr').find('td:nth-child(2)').text();  // Mendapatkan nama model dari atribut data-name

            Swal.fire({
                title: 'Apakah Anda yakin?',
                text: 'Delete Cell berikut : ' + cellName + '?',  // Menampilkan nama model
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Delete!',
                cancelButtonText: 'Batal',
                confirmButtonColor: '#007bff', // Warna tombol konfirmasi
                cancelButtonColor: '#d33',
            }).then((result) => {
                if (result.isConfirmed) {
                    // Panggil API untuk menghapus model dari database
                    $.ajax({
                        url: '/api/cell/delete/' + unitId, // URL API delete
                        type: 'DELETE',
                        success: function (response) {
                            if (response.success) {
                                Swal.fire('Deleted!', 'Cell sudah di delete, lihat data terbaru pada table.', 'success');
                                loadCells(currentPage);  // Muat ulang data setelah dihapus
                                $('#searchInput').val('');

                            } else {
                                Swal.fire('Error!', 'Gagal delete cell.', 'error');
                            }
                        },
                        error: function (xhr, status, error) {
                            Swal.fire('Error!', 'Error ketika delete cell ke Database.', 'error');
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
