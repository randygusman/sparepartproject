<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="sparepartproject._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MED Sparepart World</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Style/main.css" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="height=device-height, initial-scale=1.0" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
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
        body {
            color: #000;
            overflow-x: hidden;
            height: 100%;
            background-color: #B0BEC5;
            background-repeat: no-repeat;
            font-family:'Poppins';
        }

        .card0 {
            box-shadow: 0px 4px 8px 0px #757575;
            border-radius: 8px;
        }

        .card2 {
            margin: 0px 40px
        }

        .logo {
            width: 200px;
            height: 100px;
            margin-top: 20px;
            margin-left: 35px
        }

        .image {
            width: 550px;
            height: 250px;
        }

        .border-line {
            border-right: 1px solid #EEEEEE
        }

        .facebook {
            background-color: #3b5998;
            color: #fff;
            font-size: 18px;
            padding-top: 5px;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            cursor: pointer
        }

        .twitter {
            background-color: #1DA1F2;
            color: #fff;
            font-size: 18px;
            padding-top: 5px;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            cursor: pointer
        }

        .linkedin {
            background-color: #2867B2;
            color: #fff;
            font-size: 18px;
            padding-top: 5px;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            cursor: pointer
        }

        .line {
            height: 1px;
            width: 45%;
            background-color: #E0E0E0;
            margin-top: 10px
        }

        .or {
            width: 10%;
            font-weight: bold
        }

        .text-sm {
            font-size: 14px !important;
            font-weight:600;
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
            opacity: 1;
            font-weight: 300
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300
        }

        input,
        textarea {
            padding: 10px 12px 10px 12px;
            border: 1px solid lightgrey;
            border-radius: 2px;
            margin-bottom: 5px;
            margin-top: 2px;
            width: 100%;
            box-sizing: border-box;
            color: #2C3E50;
            font-size: 14px;
            letter-spacing: 1px
        }

            input:focus,
            textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #304FFE;
                outline-width: 0
            }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0
        }

        a {
            color: inherit;
            cursor: pointer
        }

        .btn-blue {
            background-color: #1A237E;
            width: 150px;
            color: #fff;
            border-radius: 5px;
            transition: 0.3s all;
        }

            .btn-blue:hover {
                cursor: pointer;
                color: #fff;
                transition: 0.3s all;
                -webkit-box-shadow: 1px 7px 21px -7px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 1px 7px 21px -7px rgba(0, 0, 0, 0.75);
                box-shadow: 1px 7px 21px -7px rgba(0, 0, 0, 0.75);
            }

        .bg-blue {
            color: #fff;
            background-color: #1A2D53;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        @media screen and (max-width: 991px) {
            .logo {
                margin-left: 0px
            }

            .image {
                width: 300px;
                height: 220px
            }

            .border-line {
                border-right: none
            }

            .card2 {
                border-top: 1px solid #EEEEEE !important;
                margin: 0px 15px
            }
        }

        .btn .btn-outline-primary {
            font-size: 14px;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.75); /* Black w/ opacity */
            /*animation-timing-function: ease;*/
        }

        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        .modal-content, #caption {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
            /*animation: mymove 2s infinite;*/
        }

        #img01:hover {
            cursor: pointer;
            transition: transform .1s ease;
            transform: scale(1.1);
            border: 1px;
            border-color: black;
            box-shadow: rgba(0,0,0,0.6);
        }

        #img01 {
            transition: transform .1s ease;
            border: 1px;
            border-color: black;
            box-shadow: rgba(0,0,0,0.6);
        }

        @-webkit-keyframes zoom {
            from {
                -webkit-transform: scale(0)
            }

            to {
                -webkit-transform: scale(1)
            }
        }

        @keyframes zoom {
            from {
                transform: scale(0)
            }

            to {
                transform: scale(1)
            }
        }

        /*@keyframes mymove {
            from {
                top: -10px;
            }

            to {
                top: 300px;
            }
        }*/

        .overlay {
            position: fixed;
            left: 0px;
            margin-top: 300px;
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
                content: url('loading.gif');
                /*content: url('//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Phi_fenomeni.gif/50px-Phi_fenomeni.gif');*/
            }
    </style>

    <script type="text/javascript">
        setInterval(function () {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'KeepAlive.aspx', true);
            xhr.send();
        }, 5 * 60 * 1000);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scrp1"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress" runat="server">
            <ProgressTemplate>
                <div class="overlay">
                    <p>Processing data, please wait...</p>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <div class="card card0 border-0">
                <div class="row d-flex">
                    <div class="col-lg-6">
                        <div class="card1 pb-5">
                            <div class="row" style="visibility: hidden;">
                                <img src="#" class="logo" />
                                <%--https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQe4T88EyuU63-RFsSCYwnBBj9_0kMRBUe0hf26NqHecDdevshq&usqp=CAU--%>
                            </div>
                            <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                                <img src="images/logo.JPG" class="image" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card2 card border-0 px-4 py-5">
                            <div class="row mb-4 px-3" style="visibility: hidden">
                                <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
                                <div class="facebook text-center mr-3">
                                    <%--<div class="fa fa-facebook"></div>--%>
                                </div>
                                <div class="twitter text-center mr-3">
                                    <%--<div class="fa fa-twitter"></div>--%>
                                </div>
                                <div class="linkedin text-center mr-3">
                                    <%--<div class="fa fa-linkedin"></div>--%>
                                </div>
                            </div>
                            <div class="row px-3 mb-4" style="visibility: hidden">
                                <div class="line"></div>
                                <small class="or text-center">Or</small>
                                <div class="line"></div>
                            </div>
                            <div class="row px-3">
                                <label class="mb-1">
                                    <h6 class="mb-0 text-sm">APO Account</h6>
                                </label>
                                <label class="sr-only" for="inlineFormInputGroup">Username</label>
                                <input type="text" name="email" id="txtEmail" runat="server" style="margin-bottom: 20px; font-size: 12px; font-weight:500;" placeholder="pebxxxxxx" required />
                                <%--style="padding: 20px 15px 20px 15px; margin-bottom: 20px; font-size: 12px; font-weight: 500;"--%>
                            </div>
                            <div class="row px-3">
                                <label class="mb-1">
                                    <h6 class="mb-0 text-sm">Password</h6>
                                </label>
                                <input type="password" name="password" style="font-size: 12px;" id="txtPassword" runat="server" placeholder="password" required />
                            </div>
                            <%--       <div class="row px-3 mb-4" style="visibility: hidden">
                                <div class="custom-control custom-checkbox custom-control-inline">
                                    <input id="chk1" type="checkbox" name="chk" class="custom-control-input" />
                                    <label for="chk1" class="custom-control-label text-sm">Remember me</label>
                                </div>
                                <a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                            </div>--%>
                            <div class="row mb-3 px-3" style="margin-top: 20px;">
                                <%--<button type="submit" class="btn btn-outline-primary text-center" style="width:150px; font-size:14px; font-weight:bold;" runat="server" onserverclick="Unnamed1_Click">Login</button>--%>
                                <%--<asp:Button runat="server" ID="btnLogin" CssClass="btn btn-outline-primary text-center" Style="width: 150px; font-size: 12px; font-weight: bold;" OnClick="Unnamed1_Click" Text="Login" />--%>
                                <input type="button" id="btnLogin" class="btn btn-outline-primary text-center" style="width:150px; font-weight:bold;" value="Login" />
                            </div>
                            <div class="row mb-4 px-3">
                                <small class="font-weight-bold">Forget your password? <a href="mailto:anggy.noviady@sep.epson.com.sg?cc=randy.gusman@sep.epson.com.sg&subject=Reset%20Password&body=Dear%20ISD%20" class="text-danger">Reset Here</a></small>
                            </div>
                            <div class="col-md" style="padding: 0; visibility: hidden;" id="wrong" runat="server">
                                <h6 id="aWrong" class="text-danger" style="font-size: 16px;">Wrong password or username</h6>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="bg-blue py-4">
                    <div class="row px-3" style="height: 20px;">
                        <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2020 - 2025 | PEB Machinery Engineering</small>
                        <div class="social-contact ml-4 ml-sm-auto"><span class="fa fa-facebook mr-4 text-sm"></span><span class="fa fa-google-plus mr-4 text-sm"></span><span class="fa fa-linkedin mr-4 text-sm"></span><span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span></div>
                    </div>
                </div>
            </div>
        </div>

        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01" src="images/marhaban.jpg" />
            <div id="caption"></div>
        </div>

    </form>


    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/sweetalert.js"></script>

    <script type="text/javascript">
        var modal = document.getElementById("myModal");
        var input = document.getElementById("txtPassword");

        // Get the warning text
        var text = document.getElementById("aWrong");

        // When the user presses any key on the keyboard, run the function
        input.addEventListener("keyup", function (event) {

            // If "caps lock" is pressed, display the warning text
            if (event.getModifierState("CapsLock")) {
                //text.style.display = "block";
                text.style.visibility = "visible";
                text.innerHTML = "Caps Lock is ON";
            } else {
                text.style.visibility = "hidden";
            }
        });

        var isPageVisited = '<%=isPageVisited.ToString()%>'

        $(document).ready(function () {
            if (isPageVisited == 'False') {
                //alert('<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="myModalLabel">Modal header</h3></div><div class="modal-body"><p>One fine body…</p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button></div></div>') //Instead of alert you should put your popup here.
                //modal.style.display = "block";
            }
        });
        var span = document.getElementsByClassName("close")[0];

        span.onclick = function () {
            modal.style.display = "none";
        }

        $("#btnLogin").click(function (e) {
            $('#UpdateProgress').show();
            e.preventDefault();

            var username = $("#txtEmail").val();
            var password = $("#txtPassword").val();

            $.ajax({
                type: "POST",
                url: "Default.aspx/LoginUser",
                data: JSON.stringify({ username: username, password: password }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = JSON.parse(response.d);

                    if (result.success) {
                        // Login berhasil
                        sessionStorage.setItem("username", result.username);
                        sessionStorage.setItem("role", result.role);
                        sessionStorage.setItem("name", result.name); // Simpan nama di sessionStorage
                        window.location.href = "home.aspx";

                    } else {
                        // Login gagal
                        Swal.fire({
                            icon: 'error',
                            title: 'Tidak dapat Login',
                            text: result.message,
                        });
                        $("#wrong").css("visibility", "visible");
                        $('#UpdateProgress').hide();
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + xhr.responseText);
                }
            });
        });
    </script>
</body>
</html>
