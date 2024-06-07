<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="duyuruGuncelle.aspx.cs" Inherits="BlogProjem.admin.duyuruGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Başlık :</td>
            <td>
                <asp:TextBox ID="txt_baslik" runat="server" Width="381px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>İçerik :</td>
            <td>
                <asp:TextBox ID="txt_icerik" runat="server" Height="300px" Width="379px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_guncelle" runat="server" Height="58px" OnClick="btn_guncelle_Click" Text="Güncelle" Width="160px" />
            </td>
        </tr>
    </table>



</asp:Content>
