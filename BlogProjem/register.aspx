<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BlogProjem.register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <h1>Kullanıcı Kayıt Paneli</h1>
    <div class="register-container">
        <asp:HiddenField ID="hidStep" runat="server" />
        <asp:Panel ID="panelStep1" runat="server">
            <div>
                <label for="txt_isim" style="margin-left:15px;">İsim:</label>
                <asp:TextBox ID="txt_isim" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txt_soyisim" style="margin-left:15px;">Soyisim:</label>
                <asp:TextBox ID="txt_soyisim" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btn_devam" runat="server" Text="Devam" CssClass="register-button" OnClientClick="return false;" />
            </div>
        </asp:Panel>
        <asp:Panel ID="panelStep2" runat="server" Style="display:none;">
            <div>
                <label for="txt_kullanici" style="margin-left:15px;">Kullanıcı Adı:</label>
                <asp:TextBox ID="txt_kullanici" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txt_sifre" style="margin-left:15px;">Şifre:</label>
                <asp:TextBox ID="txt_sifre" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <label for="txt_email" style="margin-left:15px;">E-posta:</label>
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btn_kayit" runat="server" Text="Kayıt Ol" OnClick="btn_kayit_Click" CssClass="register-button" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
  <asp:Content ID="Folder" ContentPlaceHolderID="Folder" runat="server">
  
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


        <link href="Content/auth.css" rel="stylesheet" />

  
  </asp:Content>