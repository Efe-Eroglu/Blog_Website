<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleGuncelle.aspx.cs" Inherits="BlogProjem.admin.makaleGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-container {
            max-width: 600px;
            margin: 20px auto; 
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="file"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-group textarea {
            resize: vertical;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background-color: cadetblue;
            border: none;
            border-radius: 20px;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: darkcyan;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Makale Güncelle</h2>
        <div class="form-group">
            <label for="txt_baslik">Başlık:</label>
            <asp:TextBox ID="txt_baslik" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_ozet">Özet:</label>
            <asp:TextBox ID="txt_ozet" runat="server" TextMode="MultiLine" CssClass="form-control" Height="100px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_icerik">İçerik:</label>
            <asp:TextBox ID="txt_icerik" runat="server" TextMode="MultiLine" CssClass="form-control" Height="200px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="fu_slider">Slider:</label>
            <asp:FileUpload ID="fu_slider" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txt_yorumsayi">Yorum Sayısı:</label>
            <asp:TextBox ID="txt_yorumsayi" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btn_guncelle" runat="server" Text="Güncelle" CssClass="btn-primary" OnClick="btn_guncelle_Click" />
        </div>
    </div>
</asp:Content>
