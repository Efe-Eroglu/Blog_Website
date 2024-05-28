<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="BlogProjem.admin.kategoriler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 113px;
        }
        .auto-style2 {
            width: 74px;
        }
        .auto-style5 {
            width: 74px;
            height: 24px;
        }
        .auto-style6 {
            height: 24px;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style8 {
            width: 313px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div style="height:25px; background-color:#2a595a; color:#fff; font-weight:bolder">
            <asp:Button ID="btn_keArti" runat="server" Height="25px" OnClick="btn_keArtiClick" Text="+" Width="49px" />
<asp:Button ID="btn_keEksi" runat="server" Height="25px" OnClick="btn_keEksiClick" Text="-" Width="48px" />

        Kategori Ekleme Paneli    
        </div>
        <asp:Panel ID="pnl_kategoriEkle" runat="server" BackColor="#669999" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="text-align:right"></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align:right">Kategori Adı :</td>
                    <td>
                        <asp:TextBox ID="txt_kategoriAdi" runat="server" CssClass="textboxGorsel" Height="25px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align:right">Sıra :</td>
                    <td>
                        <asp:TextBox ID="txt_Sira" runat="server" CssClass="textboxGorsel" Height="25px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="auto-style5" style="text-align:right">Resim :</td>
                   <td class="auto-style6">
                       <asp:FileUpload ID="fu_kategoriResim" runat="server" CssClass="textboxGorsel" width="300px"></asp:FileUpload>
                   </td>
               </tr>
                  <tr>
                     <td class="auto-style2" style="text-align:right">Ekle :</td>
                     <td>
                         <asp:Button ID="btn_kategoriEkle" runat="server" CssClass="textboxGorsel" Text="Ekle" OnClick="btn_kategoriEkleme"></asp:Button>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style2" style="text-align:right"></td>
                     <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height:30px;"></div>

         <div style="height:25px; background-color:#2a595a; color:#fff; font-weight:bolder">
    <asp:Button ID="btn_kdArti" runat="server" Height="25px" Text="+" Width="64px" OnClick="btn_kdArti_Click" />
<asp:Button ID="btn_kdEksi" runat="server" Height="25px" Text="-" Width="51px" OnClick="btn_kdEksi_Click" />

             Kategori Düzenleme Paneli<asp:DataList ID="DataList1" runat="server" CssClass="auto-style8">
                 <HeaderTemplate>
                     <table class="auto-style7">
                         <tr>
                             <td>Kategori Ad</td>
                             <td>Düzenleme</td>
                             <td>Sil</td>
                         </tr>
                     </table>
                 </HeaderTemplate>
<ItemTemplate>
    <tr>
        <td>
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("kategoriAd") %>'></asp:Literal>
        </td>
        <td>
            <a href="kategoriguncelle.aspx?kategoriID=<%# Eval("kategoriID") %>">Düzenleme</a>
        </td>
        <td>
            <a href="kategoriler.aspx?kategoriID=<%# Eval("kategoriID") %>&islem=sil">Sil</a>
        </td>
    </tr>
</ItemTemplate>



             </asp:DataList>
                &nbsp;</div>
        <asp:Panel ID="pnl_kategoriDuzenle" runat="server" BackColor="#669999" ForeColor="White">
            </asp:Panel>
    </div>
</asp:Content>




