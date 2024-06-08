<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumcevap.aspx.cs" Inherits="BlogProjem.admin.yorumcevap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 193px;
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
            <td class="auto-style2">Admin :</td>
            <td>
                <asp:TextBox ID="txt_ad" runat="server" Height="27px" Width="278px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Yorum : </td>
            <td>
                <asp:TextBox ID="txt_yorum" runat="server" Height="114px" Width="281px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btn_cevap" runat="server" Height="46px" OnClick="btn_cevap_Click" Text="Cevap Yaz" Width="140px" />
            </td>
        </tr>
    </table>



</asp:Content>
