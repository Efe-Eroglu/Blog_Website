<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleler.aspx.cs" Inherits="BlogProjem.admin.makaleler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 406px;
        }
        .auto-style3 {
            width: 406px;
            height: 27px;
        }
        .auto-style4 {
            height: 27px;
        }
        .auto-style5 {
            width: 414px;
        }
        .auto-style6 {
            width: 481px;
        }
        .auto-style7 {
            width: 611px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="section-header">
        <asp:Button ID="btn_blogArti" runat="server" CssClass="action-button" OnClick="btn_blogArtiClick" Text="+" />
        <asp:Button ID="btn_blogEksi" runat="server" CssClass="action-button" OnClick="btn_blogEksiClick" Text="-" />
        Blog Ekleme Paneli
    </div>
        <asp:Panel ID="pnl_blog" runat="server" CssClass="panel-style">

    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Kategori :</td>
            <td class="auto-style4">
                <asp:DropDownList ID="ddl_kategori" runat="server" Width="244px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Başlık :</td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_baslik" runat="server" Width="407px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Özet : </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_ozet" runat="server" Height="200px" Width="406px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Resim :</td>
            <td class="auto-style4">
                <asp:FileUpload ID="fu_slider" runat="server" Width="412px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">İçerik :</td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_icerik" runat="server" Height="305px" Width="406px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="btn_makaleEkle" runat="server" Height="83px" Text="Ekle" Width="231px" OnClick="btn_makaleEkle_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
    </table>
        </asp:Panel> 


    
    <div class="section-header">
        <asp:Button ID="btn_blogDArti" runat="server" CssClass="action-button" OnClick="btn_blogDArtiClick" Text="+" />
        <asp:Button ID="btn_blogDEksi" runat="server" CssClass="action-button" OnClick="btn_blogDEksiClick" Text="-" />
        Blog Düzenleme Paneli
    </div>
        <asp:Panel ID="pnl_blogDuzenle" runat="server" CssClass="panel-style">
            <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">Blog Adı </td>
                            <td class="auto-style6">Düzenle</td>
                          <a><td>Sil</td></a>  
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Literal>
                            </td>
                            <td class="auto-style7">Düzenle</td>
                          <td><a href ="makaleler.aspx?blogID=<%#Eval("blogID")%>&islem=sil">Sil</a></td>  
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel> 


</asp:Content>
