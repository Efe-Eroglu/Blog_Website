<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumlar.aspx.cs" Inherits="BlogProjem.admin.yorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 106px;
        }

        .auto-style2 {
            height: 123px;
        }

        .auto-style3 {
            height: 63px;
        }

        .auto-style5 {
            height: 43px;
        }

        .auto-style6 {
            width: 100%;
            height: 101px;
        }

        .auto-style7 {
            width: 194px;
        }


        .action-button {
            height: 35px;
            width: 80px;
            margin-right: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition-duration: 0.4s;
        }

            .action-button:hover {
                background-color: #45a049;
            }

        .panel-style {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            margin-bottom: 20px;
        }

            .panel-style:hover {
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }

        .section-header {
            height: 40px;
            background-color: #2a595a;
            color: #fff;
            font-weight: bold;
            margin-bottom: 20px;
            padding: 10px 20px;
            border-radius: 10px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="section-header">
        <asp:Button ID="btn_oyArti" runat="server" CssClass="action-button" OnClick="btn_oyArtiClick" Text="+" />
        <asp:Button ID="btn_oyEksi" runat="server" CssClass="action-button" OnClick="btn_oyEksiClick" Text="-" />
        Onaysız Yorum Paneli Paneli
    </div>
    <asp:Panel ID="pnl_onaysizYorum" runat="server" CssClass="panel-style">
        <div>
            <asp:DataList ID="dl_yorum" runat="server">
                <ItemTemplate>
                    <div class="auto-style1">
                        <div class="auto-style2">
                            <div class="auto-style3">
                                <asp:Image ID="Image1" runat="server" Height="58px" ImageUrl='<%# Eval("yorumResim") %>' Width="66px" />
                                <div class="auto-style5">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("yorumAdSoyad") %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("yorumEmail") %>'></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("yorumTarih","{0:MMMM yyyy}") %>'></asp:Label>
                                    &nbsp; Makale :
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>
                                    &nbsp; Yorum İçerik:
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("yorumIcerik") %>'></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <table class="auto-style6">
                            <tr>
                                <td class="auto-style7"><a href="yorumcevap.aspx?blogID=<%#Eval ("blogID")%>&yorumID=<%#Eval("yorumID") %>">Cevapla</a></td>
                                <td><a href="yorumGuncelle.aspx?yorumID=<%#Eval("yorumID") %>&blogID=<%#Eval("blogID") %>">Güncelle</a></td>
                                <td><a href="yorumlar.aspx?yorumID=<%#Eval("yorumID")%>&islem=sil">Sil</a></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </asp:Panel>


    
    <div class="section-header">
        <asp:Button ID="btn_onayliArti" runat="server" CssClass="action-button" OnClick="btn_onyArtiClick" Text="+" />
        <asp:Button ID="btn_onayliEksi" runat="server" CssClass="action-button" OnClick="btn_onyEksiClick" Text="-" />
        Onaylı Yorum Paneli
    </div>
    <asp:Panel ID="pnl_onayliYorum" runat="server" CssClass="panel-style">
            <div>
                <asp:DataList ID="dl_onayYorum" runat="server">
                    <ItemTemplate>
                        <div class="auto-style1">
                            <div class="auto-style2">
                                <div class="auto-style3">
                                    <asp:Image ID="Image2" runat="server" Height="58px" ImageUrl='<%# Eval("yorumResim") %>' Width="66px" />
                                    <div class="auto-style5">
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("yorumAdSoyad") %>'></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("yorumEmail") %>'></asp:Label>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("yorumTarih","{0:MMMM yyyy}") %>'></asp:Label>
                                        &nbsp; Makale :
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>
                                        &nbsp; Yorum İçerik:
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("yorumIcerik") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td><a href="yorumlar.aspx?yorumID=<%#Eval("yorumID") %>&islem2=sil&blogID=<%#Eval("blogID") %>">Sil</a></td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
    </asp:Panel>

</asp:Content>
