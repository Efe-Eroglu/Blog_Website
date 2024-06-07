<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleGuncelle.aspx.cs" Inherits="BlogProjem.admin.makaleGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 300px;
    }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="auto-style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">Başlık:</td>
        <td>
            <asp:TextBox ID="txt_baslik" runat="server" Width="283px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Özet:</td>
        <td>
            <asp:TextBox ID="txt_ozet" runat="server" Height="166px" Width="282px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">İçerik:</td>
        <td>
            <asp:TextBox ID="txt_icerik" runat="server" Height="251px" Width="279px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Slider:</td>
        <td>
            <asp:FileUpload ID="fu_slider" runat="server" Width="285px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Yorum Sayısı:</td>
        <td>
            <asp:TextBox ID="txt_yorumsayi" runat="server" Width="283px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="btn_guncelle" runat="server" Height="63px" OnClick="btn_guncelle_Click" Text="Güncelle" Width="143px" />
        </td>
    </tr>
</table>


</asp:Content>
