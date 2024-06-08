<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bloglar.aspx.cs" Inherits="BlogProjem.Bloglar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Postlar</title>
    <link rel="stylesheet" type="text/css" href="slider JS/amazingslider-1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="slider JS/jquery.js"></script>
    <script src="slider JS/amazingslider.js"></script>
    <script src="slider JS/initslider-1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">

    <style type="text/css">
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #f4f4f9;
            font-family: 'Poppins', sans-serif;
            color: #0c0c0c;
            background-color: silver;
        }

        .header_section {
            background-image: url('images/hero-bg.jpg');
            height: 77px;
            justify-content: center;
            align-content: center;
        }

            .header_section .navbar-brand {
                display: flex;
                align-items: center;
                color: white;
                text-transform: uppercase;
                text-decoration: none;
            }

                .header_section .navbar-brand img {
                    width: 40px;
                    margin-right: 10px;
                }

                .header_section .navbar-brand span {
                    font-size: 24px;
                    font-weight: 700;
                }

        .custom_nav-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 0 20px;
        }

            .custom_nav-container .navbar-nav {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .custom_nav-container .nav-item {
                margin-left: 20px;
            }

            .custom_nav-container .nav-link {
                color: white;
                text-decoration: none;
                text-transform: uppercase;
                padding: 10px 30px;
                font-size: 16px;
            }


            .custom_nav-container .nav_search-btn {
                background: url('../images/search-icon.png') no-repeat center center;
                background-size: 22px;
                width: 35px;
                height: 35px;
                border: none;
                cursor: pointer;
                margin-left: 20px;
            }

        .slider {
            margin-top: 20px;
        }

        .footer {
            background-color: #1d1d1d;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 50px;
            font-size: 14px;
        }

        .container {
            display: flex;
            padding: 20px;
            gap: 20px;
        }

        .leftArea {
            width: 300px;
        }

        .duyurular, .kategoriler {
            background-color: #f4f4f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .rightArea {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .blogContainer {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 350px;
            max-width: 350px;
            box-sizing: border-box;
        }

        .blogImage {
            height: 150px;
            width: 100%;
            object-fit: cover;
            border-radius: 8px;
        }

        .blogTitle {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .blogSummary {
            font-size: 14px;
            margin-top: 10px;
        }

        .blogInfo {
            font-size: 12px;
            color: gray;
            display: flex;
            gap: 10px;
            align-items: center;
            margin-top: 10px;
        }

            .blogInfo span {
                display: flex;
                align-items: center;
                gap: 5px;
            }

        right-nav {
            justify-content: center;
            align-content: center;
            display: flex;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header_section">
            <div class="custom_nav-container">
                <a class="navbar-brand" href="/">
                    <img src="images/logo.png" style="width: 20px;" alt="Logo">
                    <span>Dev Blog</span>
                </a>
                <nav class="right-nav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/Default.aspx">Ana Sayfa</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx#About">Hakkımızda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx#Contact">İletişim</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="slider">
            <div class="amazingslider-wrapper" id="amazingslider-wrapper-1" style="display: block; position: relative; max-width: 900px; margin: 0 auto;">
                <div class="amazingslider" id="amazingslider-1" style="display: block; position: relative; margin: 0 auto;">
                    <ul class="amazingslider-slides" style="display: none;">
                        <asp:DataList ID="dl_slider" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="makaledetay.aspx?blogID=<%#Eval("blogID") %>">
                                        <img src="<%#Eval("blogResim") %>" alt="<%#Eval("blogBaslik") %>" title="<%#Eval("blogBaslik") %>" />

                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="leftArea">
                <div class="duyurular">
                    <h2>Duyurular</h2>
                    <hr />
                    <div class="icerik">
                        <asp:DataList ID="dl_duyuru" runat="server" Width="294px">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" Height="38px" ImageUrl='<%# Eval("duyurularResim") %>' Width="53px" />
                                        </td>
                                        <td>
                                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("duyurularBaslik") %>'></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("duyurularIcerik") %>'></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("duyurularTarih","{0:dd MMMM yyyy}") %>'></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>

                <div class="kategoriler">
                    <h2>Kategoriler</h2>
                    <hr />
                    <div class="icerik">
                        <asp:DataList ID="dl_kategori" runat="server">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" Height="38px" ImageUrl='<%# Eval("kategoriResim") %>' Width="60px" />
                                        </td>
                                        <td>
                                            <a href="kategoriDetay.aspx?kategoriID=<%#Eval("kategoriID") %>">
                                                <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
                                            </a>
                                            (<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("kategoriAdet") %>'></asp:Literal>)
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>

            <div class="rightArea">
                <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" CssClass="aspNet-DataList">
                    <ItemTemplate>
                        <div class="blogContainer">
                            <asp:Image ID="Image3" runat="server" CssClass="blogImage" ImageUrl='<%# Eval("blogResim") %>' />
                            <div class="blogTitle">
                                <a href="makaleDetay.aspx?blogID=<%#Eval("blogID") %>">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label></a>
                            </div>
                            <div class="blogSummary">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("blogOzet") %>'></asp:Label>
                            </div>
                            <div class="blogInfo">
                                <span>
                                    <i class="fa fa-calendar-alt"></i>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("blogTarih","{0:dd MMMM yyyy}") %>'></asp:Label>
                                </span>
                                <span>
                                    <i class="fa fa-eye"></i>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("blogOkunma") %>'></asp:Label>
                                </span>
                                <span>
                                    <i class="fa fa-comments"></i>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("blogYorumSayisi") %>'></asp:Label>
                                </span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <div class="footer">
            <p>Copyright &copy; 2024 All Rights Reserved By Efe EROĞLU</p>
        </div>
    </form>
</body>
</html>
 