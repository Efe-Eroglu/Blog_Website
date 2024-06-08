<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="BlogProjem.admin.kategoriler" %>

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

    .form-table {
        width: 100%;
    }

    .label-column {
        width: 30%;
        text-align: right;
        color: #666666;
        font-weight: bold;
    }

    .textboxGorsel {
        height: 30px;
        width: calc(100% - 20px);
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
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

    .data-list {
        width: 100%;
    }

    .data-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #f9f9f9;
    }

    .data-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .data-table th {
        border: 1px solid #ddd;
        padding: 10px;
        background-color: #2a595a;
        color: white; 
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="section-header">
            <asp:Button ID="btn_keArti" runat="server" CssClass="action-button" OnClick="btn_keArtiClick" Text="+" />
            <asp:Button ID="btn_keEksi" runat="server" CssClass="action-button" OnClick="btn_keEksiClick" Text="-" />
            Kategori Ekleme Paneli
        </div>
        <asp:Panel ID="pnl_kategoriEkle" runat="server" CssClass="panel-style">
            <table class="form-table">
                <tr>
                    <td class="label-column">Kategori Adı :</td>
                    <td>
                        <asp:TextBox ID="txt_kategoriAdi" runat="server" CssClass="textboxGorsel"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-column">Sıra :</td>
                    <td>
                        <asp:TextBox ID="txt_Sira" runat="server" CssClass="textboxGorsel"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-column">Resim :</td>
                    <td>
                        <asp:FileUpload ID="fu_kategoriResim" runat="server" CssClass="textboxGorsel"></asp:FileUpload>
                    </td>
                </tr>
                <tr>
                    <td class="label-column"></td>
                    <td>
                        <asp:Button ID="btn_kategoriEkle" runat="server" CssClass="action-button" Text="Ekle" OnClick="btn_kategoriEkleme"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel> 

        <div class="spacer"></div>

        <div class="section-header">
            <asp:Button ID="btn_kdArti" runat="server" CssClass="action-button" Text="+" OnClick="btn_kdArti_Click" />
            <asp:Button ID="btn_kdEksi" runat="server" CssClass="action-button" Text="-" OnClick="btn_kdEksi_Click" />
            Kategori Düzenleme Paneli
        </div>

        <asp:Panel ID="pnl" runat="server" CssClass="panel-style">
            <asp:DataList ID="DataList1" runat="server" CssClass="data-list">
                <HeaderTemplate>
                    <table class="data-table">
                        <tr>
                            <td>Kategori Ad</td>
                            <td>Düzenleme</td>
                            <td>Sil</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
                        </td>
                        <td>
                            <a href="kategoriguncelle.aspx?kategoriID=<%# Eval("kategoriID") %>">Düzenleme</a>
                        </td>
                        <td>
                            <a href="kategoriler.aspx?kategoriID=<%# Eval("kategoriID") %>&islem=sil">Sil</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel> <!-- Kategori Düzenleme Paneli'nin kapanma etiketi -->
    </div>
</asp:Content>
