<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="BlogProjem.admin.kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
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
            padding-right: 10px;
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
            display: flex;
            align-items: center;
        }

        .data-list {
            width: 100%;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }

        .data-table td, .data-table th {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .data-table th {
            background-color: #2a595a;
            color: white; 
        }

        #ikon {
            color: darkslategray;
        }

        #ikon:hover {
            color: darkcyan;
        }

        strong {
            font-size: 20px;
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
                        <asp:Button ID="btn_kategoriEkle" runat="server" CssClass="action-button" Text="Ekle"  OnClick="btn_kategoriEkleme" />
                    </td>
                </tr>
            </table>
        </asp:Panel> 

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
                            <th><strong>Kategori Adı</strong></th>
                            <th><strong>Düzenle</strong></th>
                            <th><strong>Sil</strong></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
                        </td>
                        <td>
                            <a href="kategoriguncelle.aspx?kategoriID=<%# Eval("kategoriID") %>"><i class="fas fa-edit icon-button" id="ikon"></i></a>
                        </td>
                        <td>
                            <a href="kategoriler.aspx?kategoriID=<%# Eval("kategoriID") %>&islem=sil"><i class="fas fa-trash-alt icon-button" id="ikon"></i></a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
    </div>
</asp:Content>
