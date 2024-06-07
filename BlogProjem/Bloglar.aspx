<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bloglar.aspx.cs" Inherits="BlogProjem.Bloglar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Postlar</title>
    <link rel="stylesheet" type="text/css" href="slider JS/amazingslider-1.css">

    <script src="slider JS/jquery.js"></script>
    <script src="slider JS/amazingslider.js"></script>
    <script src="slider JS/initslider-1.js"></script>
    <style type="text/css">
        .leftArea {
            width: 300px;
            margin-top: 30px;
        }

        .duyurular {
            background-color: cadetblue;
            height: auto;
        }

        hr {
            background-color: brown;
        }

        .space {
            margin-top: 30px;
        }

        h2 {
            background-color: darkcyan
        }

        .kategoriler {
            background-color: cadetblue;
            height: auto;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 58px;
        }

        .auto-style3 {
            margin-left: 40px;
        }

        .auto-style4 {
            width: 65px;
        }

        .container {
            display: flex;
        }

        .rightArea {
            width: 100%;
            margin-top: 50px;
            height: 300px;
        }

        .auto-style5 {
            width: 621px;
            height: 80px;
        }

        .blogContainer {
            display: flex;
            flex-direction: row;
            border: 1px solid black;
        }

        .auto-style9 {
            width: 450px;
        }
        .auto-style10 {
            float: left;
            height: auto;
            width: 449px;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">


        <div class="slider">
            <div class="amazingslider-wrapper" id="amazingslider-wrapper-1" style="display: block; position: relative; max-width: 900px; margin: 0px auto 0px;">
                <div class="amazingslider" id="amazingslider-1" style="display: block; position: relative; margin: 0 auto;">
                    <ul class="amazingslider-slides" style="display: none;">


                        <asp:DataList ID="dl_slider" runat="server">
                            <ItemTemplate>
                                <li>
                                    <img src="<%#Eval("blogResim") %>" alt="<%#Eval("blogBaslik") %>" title="<%#Eval("blogBaslik") %>" /></li>
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
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Image ID="Image1" runat="server" Height="38px" ImageUrl='<%# Eval("duyurularResim") %>' Width="53px" />
                                        </td>
                                        <td class="auto-style3">
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


                <div class="space"></div>

                <div class="kategoriler">
                    <h2>Kategoriler</h2>
                    <hr />
                    <div class="icerik">
                        <asp:DataList ID="dl_kategori" runat="server">
                            <ItemTemplate>
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style4">
                                            <asp:Image ID="Image2" runat="server" Height="38px" ImageUrl='<%# Eval("kategoriResim") %>' Width="60px" />
                                        </td>
                                        <td>
                                            <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
                                            (<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("kategoriAdet") %>'></asp:Literal>)</td>
                                    </tr>

                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>

            </div>



            <div class="rightArea">



                <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="303px">
                    <ItemTemplate>
                        <div class="blogContainer">

                            <div class="auto-style5">
                                <asp:Image ID="Image3" runat="server" Height="77px" Width="125px" ImageUrl='<%# Eval("blogResim") %>' />
                            </div>

                            <div style ="float: left; height: auto; border:1px solid black;padding:5px;">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>
                            </div>
                            <div style="float: left; height: auto; border:1px solid black; padding:5px;">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("blogOzet") %>'></asp:Label>
                            </div>

                            <div style="height: 20px; width: 690px; font-size: 12px; line-height: 20px; padding:5px; float: left;">
                                <div style="width: auto; height: 20px; float: left; margin: 20px; border:1px solid black;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("blogTarih","{0:dd MMMM yyyy}") %>'></asp:Label>
                                </div>
                                <div style="width: auto; padding:5px; height: 20px; float: left; margin: 20px; border:1px solid black;">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("blogOkunma") %>'></asp:Label>
                                </div>
                                <div style="width: auto; height: 20px; padding:5px; float: left; margin: 20px; border:1px solid black;">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("blogYorumSayisi") %>'></asp:Label>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>



            </div>


        </div>
    </form>
</body>
</html>

