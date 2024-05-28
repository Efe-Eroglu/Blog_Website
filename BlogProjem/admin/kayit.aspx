<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayit.aspx.cs" Inherits="BlogProjem.admin.kayit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Kayıt Ol</title>
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
        .register-container {
            padding: 20px;
            border-radius: 8px;
            color: #fff;
            text-align: center;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-container div {
            margin-bottom: 15px;
        }
        .register-container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
            font-size: 18px;
            color: #fff;
            font-family: Arial, Helvetica, sans-serif;
        }
        .register-container input[type="text"], .register-container input[type="password"], .register-container input[type="email"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
        }
        .register-button {
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
        .register-button:hover {
            background-color: #cc3514;
        }
        h1 {
            color: #ed8207;
            text-align: center;
            margin-bottom: 40px;
            font-size: 48px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= btn_devam.ClientID %>').click(function (e) {
                e.preventDefault();
                var isim = $('#<%= txt_isim.ClientID %>').val();
                var soyisim = $('#<%= txt_soyisim.ClientID %>').val();
                if (isim && soyisim) {
                    $('#<%= panelStep1.ClientID %>').slideUp('fast', function() {
                        $('#<%= panelStep2.ClientID %>').slideDown('slow');
                        $('#<%= hidStep.ClientID %>').val("2"); // Panel Step2'nin gösterilmesini belirt
                    });
                } else {
                    alert("Lütfen isim ve soyisim giriniz.");
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Admin Kayıt Paneli</h1>
        <div class="register-container">
            <asp:HiddenField ID="hidStep" runat="server" />
            <asp:Panel ID="panelStep1" runat="server">
                <div>
                    <label for="txt_isim">İsim:</label>
                    <asp:TextBox ID="txt_isim" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txt_soyisim">Soyisim:</label>
                    <asp:TextBox ID="txt_soyisim" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btn_devam" runat="server" Text="Devam" CssClass="register-button" OnClientClick="return false;" />
                </div>
            </asp:Panel>
            <asp:Panel ID="panelStep2" runat="server" Style="display:none;">
                <div>
                    <label for="txt_kullanici">Kullanıcı Adı:</label>
                    <asp:TextBox ID="txt_kullanici" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txt_sifre">Şifre:</label>
                    <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div>
                    <label for="txt_email">E-posta:</label>
                    <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btn_kayit" runat="server" Text="Kayıt Ol" OnClick="btn_kayit_Click" CssClass="register-button" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
