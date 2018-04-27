<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome to Tutoring CLub</title>
    <meta name="description" content="Extensive HTML5 Templpate">
    <meta name="author" content="Digital suntech">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, width=device-width">

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="login/plugins/font-awesome/css/font-awesome.min.css?v=13.9" rel="stylesheet" type="text/css" />

    <link href="login/plugins/bootstrap/css/bootstrap.min.css?v=13.9" rel="stylesheet" type="text/css" />

    <!-- END GLOBAL MANDATORY STYLES -->



    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="login/css/components.css?v=13.9" rel="stylesheet" id="style_components" type="text/css" />
    <link href="login/css/plugins.css?v=13.9" rel="stylesheet" type="text/css" />
    <link href="login/css/style.css?v=13.9" rel="stylesheet" type="text/css" />
    <link href="login/css/responsive.css?v=13.9" rel="stylesheet" type="text/css" />



    <!-- google web fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,latin-ext,cyrillic-ext' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Noto+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <script src="Scripts/jquery-3.2.1.js"></script>

</head>

<body class="body-bg">

    <!-- .header-wrapper start -->
    <div class="header-wrapper logo-bg">
        <!-- .container start -->
        <div class="container-fluid">
            <!-- #header start -->
            <header id="header">
                <!-- .row start -->
                <div class="row">
                    <div class="col-md-6">
                        <!-- social-info1 start -->
                        <section>
                            <div id="logo"><a>
                                <img src="login/img/logo.png" alt="Tutoring"></a></div>
                        </section>
                        <!-- .social-info1 end -->
                    </div>
                    <!-- .col -6 end -->


                </div>
                <!-- row-fluid end -->

                <div class="clearfix"></div>
            </header>
            <!-- #header end -->
        </div>
        <!-- .container end -->

    </div>
    <!-- .header-wrapper end -->


    <section id="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-6 h-text-bg">
                    <h1 style="color: #151515; line-height: 60px;">Tutoring Club Franchise<br />
                        Management System</h1>
                </div>
                <!-- end span -->

                <div class="col-md-1">
                </div>

                <div class="col-md-4 login_bg">
                    <div style="padding: 0px 15px;" class="row mar_25bt">
                        <div class="col-sm-2">
                            <div class="logo"><a>
                                <img src="login/img/white-logo.png" alt="Tutoring"></a></div>
                        </div>
                        <!-- end span -->
                        <div class="col-sm-10">
                            <h3 style="color: #fff !important;">Tutoring Club Login</h3>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>
                    <!-- end row -->


                    <!-- wpcf7 start -->
                    <form class="login-box" style="padding: 15px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;"
                        runat="server">
                        <fieldset class="login_fields user">
                               <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Username" ></asp:TextBox>                                
                             
                        </fieldset>

                        <fieldset class="login_fields user-pass">
                            <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                     
                        </fieldset>
                           <asp:Label ID="lblError" runat="server" ForeColor="#BF1A05" Font-Size="Medium" />
                        <asp:Button runat="server" ID="btnLogin" class="wpcf7-submit"
                                                    Text="Log In"    style="display:none;"
                                            onclick="btnLogin_Click" >
                                        </asp:Button>

                        <a class="wpcf7-submit" id="Login" href="javascript:void(0)">Log In</a>

                    </form>
                    <!-- wpcf7 end -->
                </div>

                <!-- end row -->


            </div>
        </div>
        <!-- end container -->
    </section>

    <!-- .footer-wrapper start -->
    <div class="footer-wrapper">

        <!-- .copyright-container start -->
        <div class="copyright-container">
            <div class="container">
                <div class="row">

                    <section class="col-md-6">
                        © 2018 Tutoring Club - All Rights Reserved
                    </section>
                </div>
                <!-- .row end -->
            </div>
            <!-- .container end -->
        </div>
        <!-- .copyright-container end -->


    </div>
     <script type="text/javascript">

        $("#Login").click(function () {
            document.getElementById("lblError").innerText = "";
            if (document.getElementById("txtEmail").value == "" || document.getElementById("txtPassword").value == "") {
                if (document.getElementById("txtEmail").value == "")
                    document.getElementById("lblError").innerText = "Please enter your username";
                else
                    document.getElementById("lblError").innerText = "Please enter your password";

                if (document.getElementById("txtEmail").value == "" && document.getElementById("txtPassword").value == "")
                    document.getElementById("lblError").innerText = "Please enter your username and password";
                return false;
            }
            $("#btnLogin").trigger("click");
        });
    </script>
    <!-- footer-wrapper end -->
</body>
</html>
