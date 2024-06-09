<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="makaleDetay.aspx.cs" Inherits="BlogProjem.makaleDetay" %>

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
            font-family: 'Poppins', sans-serif;
            color: #0c0c0c;
            background-image: url("images/hero-bg.jpg");
            background-size: cover;
        }

        .kategoriler a:hover {
            font-size: 1.1em;
        }

        .amazingslider-wrapper, .amazingslider {
            box-shadow: 0 0 20px rgba(224, 76, 22, 0.5), 0 0 40px rgba(224, 76, 22, 0.5), 0 0 60px rgba(224, 76, 22, 0.5);
            transition: box-shadow 0.3s ease-in-out;
        }

            .amazingslider-wrapper:hover, .amazingslider:hover {
                box-shadow: 0 0 30px rgba(224, 76, 22, 0.7), 0 0 60px rgba(224, 76, 22, 0.7), 0 0 90px rgba(224, 76, 22, 0.7);
            }

        a {
            transition: font-size 0.5s ease;
            text-decoration: none;
            color: darkcyan;
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
            margin-top: 10px;
            font-family:Calibri;

        }

        .duyurular, .kategoriler {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .rightArea {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
        }

        .blogContainer {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 1100px;
            height: 600px;
            box-sizing: border-box;
        }

        .blogImage {
            height: 350px;
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

        .yorum-panel {
            font-family:Calibri;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin: 10px;
            width:92%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

            .yorum-panel h2 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .yorum-panel hr {
                border: 0;
                border-top: 1px solid #ddd;
                margin: 15px 0;
            }

        .yorumlar {
            margin-bottom: 30px;
        }

        .yorum-yap {
            margin-top: 20px;
        }

        .yorum {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }

            .yorum .yorum-yapan {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .yorum .yorum-tarih {
                color: #888;
                font-size: 12px;
            }

        .yorum-yap input[type="text"],
        .yorum-yap input[type="email"],
        .yorum-yap textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            resize: vertical;
        }

        .yorum-yap button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .yorum-yap button:hover {
                background-color: #0056b3;
            }

        #linkler {
            text-decoration: none;
        }

            #linkler:active,
            #linkler:visited {
                color: darkcyan;
            }

        .icerik {
            max-width: 250px;
            text-align: justify;
            margin-bottom: 10px;
        }

        .katResim {
            border-radius: 15px;
        }

        .btnYorumYap {
            background-color: cadetblue;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 8px;
        }

            .btnYorumYap:hover {
                background-color: darkcyan;
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
                            <a class="nav-link" href="Bloglar.aspx">Bloglar</a>
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

        <div class="slider" style="margin-top: 50px; margin-bottom: 50px;">
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
                    <h2 style="color: darkcyan; text-align: center">Duyurular</h2>
                    <hr />
                    <div class="icerik">
                        <asp:DataList ID="dl_duyuru" runat="server" Width="294px">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width: 45px;">
                                            <asp:Image ID="Image1" runat="server" Height="35px" ImageUrl='<%# Eval("duyurularResim") %>' Width="40px" />
                                        </td>
                                        <td style="font-size: 18px; font-weight: bold;">
                                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("duyurularBaslik") %>'></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="icerik" style="font-size: 16px;">
                                            <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("duyurularIcerik") %>'></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size: 12px; color: gray; border-bottom: 1px solid gray;">
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
                                            <asp:Image ID="Image2" runat="server" Height="45px" CssClass="katResim" ImageUrl='<%# Eval("kategoriResim") %>' Width="75px" />
                                        </td>
                                        <td>
                                            <a href="kategoriDetay.aspx?kategoriID=<%#Eval("kategoriID") %>">
                                                <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
                                            </a>
                                            <span style="font-size: 12px; color: gray;">(<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("kategoriAdet") %>'></asp:Literal>)
                                            </span>
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>
                            </div>
                            <div class="blogSummary">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("blogIcerik") %>'></asp:Label>
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

                <div class="yorum-panel">
                    <h2>Yorumlar </h2>
                    <hr />

                    <div class="yorumlar">
                        <asp:DataList ID="DataList2" runat="server">
                            <ItemTemplate>
                                <div style="display: flex">
                                    <div style="margin: 20px;">
                                        <asp:Image ID="Image4" runat="server" Height="100px" ImageUrl='<%# Eval("yorumResim") %>' Width="100px" />
                                    </div>
                                    <div style="margin-top: 20px;">
                                        <div style="font-weight: bold; font-size: 18px">
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("yorumAdSoyad") %>'></asp:Label>
                                        </div>
                                        <div style="font-size: 16px; margin-bottom: 10px;">
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("yorumIcerik") %>'></asp:Label>
                                        </div>
                                        <div style="color: gray; font-size: 12px">
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("yorumTarih","{0:dd MMMM yyyy}") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <hr />

                    <h3>Yorum Yap</h3>

                    <div class="yorum-yap">
                        <div class="yorumBilgi">
                            <div style="max-width: 400px;">
                                Ad Soyad :
                                <asp:TextBox ID="txt_ad" runat="server" placeholder="Ad Soyad"></asp:TextBox>
                            </div>
                        </div>

                        <div class="yorumIcerik" style="max-width: 95%">
                            <asp:TextBox ID="txtYorum" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Yorumunuzu buraya yazınız..."></asp:TextBox>
                        </div>

                        <asp:Button ID="btnYorumYap" runat="server" Text="Yorum Yap" CssClass="btnYorumYap" OnClick="btnYorumYap_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>Copyright &copy; 2024 All Rights Reserved By Efe EROĞLU</p>
        </div>
    </form>
</body>
</html>
