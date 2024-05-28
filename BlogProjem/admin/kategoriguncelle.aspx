<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriguncelle.aspx.cs" Inherits="BlogProjem.admin.kategoriguncelle" %>
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
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>Kategori Adı :<asp:TextBox ID="txt_kategoriAd" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Sıra :
                <asp:TextBox ID="txt_sira" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Adet :<asp:TextBox ID="txt_adet" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Resim:
                <asp:FileUpload ID="fu_kresim" runat="server" Width="298px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_kguncelle" runat="server" OnClick="Button2_Click" Text="Güncelle" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
