<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="duyuruGuncelle.aspx.cs" Inherits="BlogProjem.admin.duyuruGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
        Duyuru Güncelleme Paneli
    </div>

    <asp:Panel ID="pnl_DuyuruGuncelle" runat="server" CssClass="panel-style">
        <div class="form-group">
            <label for="txt_baslik">Başlık:</label>
            <asp:TextBox ID="txt_baslik" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_icerik">İçerik:</label>
            <asp:TextBox ID="txt_icerik" runat="server" TextMode="MultiLine" Height="200px"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btn_guncelle" CssClass="eklebuton" runat="server" Text="Güncelle" OnClick="btn_guncelle_Click" />
        </div>
    </asp:Panel>
</asp:Content>
