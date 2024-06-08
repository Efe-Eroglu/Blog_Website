<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumcevap.aspx.cs" Inherits="BlogProjem.admin.yorumcevap" %>
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
            max-width: 600px;
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
            text-align: center;
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
            border-color: #007bff;
            outline: none;
        }

        .btn {
            background-color: cadetblue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
            display: inline-block;
            width:100%;
        }

        .btn:hover {
            background-color: darkcyan;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card-header">
            Yorum Cevaplama
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="txt_ad" class="form-label">Admin :</label>
                <asp:TextBox ID="txt_ad" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txt_yorum" class="form-label">Yorum :</label>
                <asp:TextBox ID="txt_yorum" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
            </div>
            <div class="form-group">
                <asp:Button ID="btn_cevap" runat="server" CssClass="btn" OnClick="btn_cevap_Click" Text="Cevap Yaz" />
            </div>
        </div>
    </div>
</asp:Content>
