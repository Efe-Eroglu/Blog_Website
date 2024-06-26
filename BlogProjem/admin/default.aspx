﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BlogProjem.admin._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Yönetici Girişi</title>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            border: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url('../images/hero-bg.jpg');
            background-size: cover;
            display: flex;
            justify-content: flex-start; 
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            padding-left: 20%; 
        }

        .login-container {
            padding: 20px;
            border-radius: 8px;
            color: #fff;
            text-align: center;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

            .login-container div {
                margin-bottom: 15px;
            }

            .login-container label {
                display: block;
                margin-bottom: 5px;
                text-align: left;
                font-size: 18px;
                color: #fff;
                font-family: Arial, Helvetica, sans-serif;
            }

            .login-container input[type="text"], .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 4px;
            }

        .login-button {
            width: 50%;
            padding: 15px;
            background-color: #e93f1a;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Poppins', sans-serif;
            float: left;
        }

            .login-button:hover {
                background-color: #cc3514;
            }

        h1 {
            color: #ed8207;
            text-align: center;
            margin-bottom: 40px;
            font-size: 48px;
        }
    </style>

</head>

<body>



    <form id="form1" runat="server">
        <h1>Admin Giriş Paneli</h1>
        <div class="login-container">
            <div>
                <label for="txt_kullanici">Kullanıcı Adı:</label>
                <asp:TextBox ID="txt_kullanici" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txt_sifre">Şifre:</label>
                <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btn_giris" runat="server" Text="Giriş" OnClick="btn_giris_Click" CssClass="login-button" />
            </div>
        </div>
    </form>
</body>
</html>
