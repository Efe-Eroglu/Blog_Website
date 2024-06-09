<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BlogProjem.login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Kullanıcı Giriş Paneli</h1>
     <div class="login-container">
         <div>
             <label for="txt_kullanici" style="margin-left:15px;">Kullanıcı Adı:</label>
             <asp:TextBox ID="txt_kullanici" runat="server"></asp:TextBox>
         </div>
         <div>
             <label for="txt_sifre" style="margin-left:15px;">Şifre:</label>
             <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password"></asp:TextBox>
         </div>
         <div>
             <asp:Button ID="btn_giris" runat="server" Text="Giriş" OnClick="btn_giris_Click" CssClass="login-button" />
         </div>
     </div>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="Folder" runat="server">
        <link href="Content/login.css" rel="stylesheet" />
</asp:Content>
