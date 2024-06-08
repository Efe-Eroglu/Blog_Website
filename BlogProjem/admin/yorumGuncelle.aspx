<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumGuncelle.aspx.cs" Inherits="BlogProjem.admin.yorumGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 187px;
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
            <td class="auto-style2">Gönderen Kişi :</td>
            <td>
                <asp:TextBox ID="txt_kisi" runat="server" Height="52px" Width="402px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Yorum :</td>
            <td>
                <asp:TextBox ID="txt_yorum" runat="server" Height="297px" Width="405px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Onay</td>
            <td>
                <asp:CheckBox ID="cb_onay" runat="server" OnCheckedChanged="cb_onay_CheckedChanged" Text="Onayla" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btn_guncelle" runat="server" Height="46px" OnClick="btn_guncelle_Click" Text="Güncelle" Width="142px" />
            </td>
        </tr>
    </table>




</asp:Content>
