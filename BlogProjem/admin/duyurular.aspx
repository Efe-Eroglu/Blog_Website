<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="duyurular.aspx.cs" Inherits="BlogProjem.admin.duyurular" %>

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
            display: flex;
            align-items: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea,
        .form-group select,
        .form-group button {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        .form-group textarea {
            resize: vertical;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .eklebuton {
            background-color: cadetblue;
            color: white;
            font-size: 28px;
            font-weight: bold;
            transition: ease 1s;
        }

        .eklebuton:hover {
            cursor: pointer;
            background-color: darkcyan;
        }

        #ikon {
            color: darkslategray;
        }

        #ikon:hover {
            color: darkcyan;
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
    <div class="section-header">
        <asp:Button ID="btn_duyuruArti" runat="server" CssClass="action-button" OnClick="btn_duyuruArtiClick" Text="+" />
        <asp:Button ID="btn_duyuruEksi" runat="server" CssClass="action-button" OnClick="btn_duyuruEksiClick" Text="-" />
        Duyurular Ekleme Paneli
    </div>

    <asp:Panel ID="pnl_Duyuru" runat="server" CssClass="panel-style">
        <div class="form-group">
            <label for="txt_baslik">Başlık:</label>
            <asp:TextBox ID="txt_baslik" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_icerik">İçerik:</label>
            <asp:TextBox ID="txt_icerik" runat="server" TextMode="MultiLine" Height="200px"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btn_ekle" CssClass="eklebuton" runat="server" Text="Ekle" OnClick="btn_ekle_Click" />
        </div>
    </asp:Panel>

    <div class="section-header">
        <asp:Button ID="btn_duyuruDuzenleArti" runat="server" CssClass="action-button" OnClick="btn_duyuruDArtiClick" Text="+" />
        <asp:Button ID="btn_duyuruDuzenleEksi" runat="server" CssClass="action-button" OnClick="btn_duyuruDEksiClick" Text="-" />
        Duyuru Düzenleme Paneli
    </div>

    <asp:Panel ID="pnl_duyuruDuzenle" runat="server" CssClass="panel-style">
        <table>
            <tr>
                <th style="width: 50%;">Duyuru Başlık</th>
                <th style="width: 25%;">Güncelle</th>
                <th style="width: 25%;">Sil</th>
            </tr>
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td style="width:50%">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("duyurularBaslik") %>'></asp:Literal>
                        </td>
                        <td style="width:25%"><a href="duyuruGuncelle.aspx?duyurularID=<%#Eval("duyurularID") %>"><i class="fas fa-edit icon-button" id="ikon"></i></a></td>
                        <td><a href="duyurular.aspx?duyurularID=<%#Eval("duyurularID") %>&islem=sil"><i class="fas fa-trash-alt icon-button" id="ikon"></i></a></td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>
    </asp:Panel>
</asp:Content>
