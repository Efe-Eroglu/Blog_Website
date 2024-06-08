<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumGuncelle.aspx.cs" Inherits="BlogProjem.admin.yorumGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .card-header {
            background-color: darkcyan;
            color: white;
            padding: 20px;
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #2C3E50;
            outline: none;
        }

        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check-label {
            margin-left: 5px;
        }

        .btn {
            background-color: cadetblue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            width:100%;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: darkcyan;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card-header">
            Yorum Güncelleme
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="txt_kisi" class="form-label">Gönderen Kişi :</label>
                <asp:TextBox ID="txt_kisi" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txt_yorum" class="form-label">Yorum :</label>
                <asp:TextBox ID="txt_yorum" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10" />
            </div>
            <div class="form-group form-check">
                <asp:CheckBox ID="cb_onay" runat="server" CssClass="form-check-input" OnCheckedChanged="cb_onay_CheckedChanged" />
                <label class="form-check-label" for="cb_onay">Onayla</label>
            </div>
            <div class="form-group">
                <asp:Button ID="btn_guncelle" runat="server" CssClass="btn" OnClick="btn_guncelle_Click" Text="Güncelle" />
            </div>
        </div>
    </div>
</asp:Content>
