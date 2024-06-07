<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="duyurular.aspx.cs" Inherits="BlogProjem.admin.duyurular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style type="text/css">
     .action-button {
         height: 35px;
         width: 80px;
         margin-right: 10px;
         border: none;
         background-color: #4CAF50;
         color: white;
         padding: 10px 24px;
         text-align: center;
         text-decoration: none;
         display: inline-block;
         font-size: 16px;
         border-radius: 5px;
         cursor: pointer;
         transition-duration: 0.4s;
     }

         .action-button:hover {
             background-color: #45a049;
         }

     .panel-style {
         background-color: #f9f9f9;
         border: 1px solid #ddd;
         padding: 20px;
         border-radius: 10px;
         box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
         transition: 0.3s;
         margin-bottom: 20px;
     }

         .panel-style:hover {
             box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
         }

     .section-header {
         height: 40px;
         background-color: #2a595a;
         color: #fff;
         font-weight: bold;
         margin-bottom: 20px;
         padding: 10px 20px;
         border-radius: 10px;
     }
     .auto-style1 {
         width: 100%;
     }
     .auto-style2 {
         margin-left: 120px;
     }
     .auto-style3 {
         width: 393px;
     }
     .auto-style4 {
         width: 564px;
     }
     .auto-style5 {
         margin-left: 40px;
     }
 </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="section-header">
      <asp:Button ID="btn_duyuruArti" runat="server" CssClass="action-button" OnClick="btn_duyuruArtiClick" Text="+" />
      <asp:Button ID="btn_duyuruEksi" runat="server" CssClass="action-button" OnClick="btn_duyuruEksiClick" Text="-" />
      Duyurular Ekleme Paneli
  </div>
  
    <asp:Panel ID="pnl_Duyuru" runat="server" CssClass="panel-style">
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Başlık :</td>
                <td>
                    <asp:TextBox ID="txt_baslik" runat="server" Width="477px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>İçerik :</td>
                <td>
                    <asp:TextBox ID="txt_icerik" runat="server" Height="327px" Width="479px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btn_ekle" runat="server" Height="50px" OnClick="btn_ekle_Click" Text="Ekle" Width="96px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
  </asp:Panel>


        <div class="section-header">
    <asp:Button ID="btn_duyuruDuzenleArti" runat="server" CssClass="action-button" OnClick="btn_duyuruDArtiClick" Text="+" />
    <asp:Button ID="btn_duyuruDuzenleEksi" runat="server" CssClass="action-button" OnClick="btn_duyuruDEksiClick" Text="-" />
    Duyuru Düzenleme Paneli
</div>

  <asp:Panel ID="pnl_duyuruDuzenle" runat="server" CssClass="panel-style">
      <asp:DataList ID="DataList1" runat="server">
          <HeaderTemplate>
              <table class="auto-style1">
                  <tr>
                      <td class="auto-style4">Duyuru Başlık</td>
                      <td class="auto-style3">Güncelle</td>
                      <td>Sil</td>
                  </tr>
                  <tr>
                      <td class="auto-style4"></td>
                      <td class="auto-style3">&nbsp;</td>
                  </tr>
              </table>
          </HeaderTemplate>
          <ItemTemplate>
              <table class="auto-style1">
                  <tr>
                      <td class="auto-style5">
                          <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("duyurularBaslik") %>'></asp:Literal>
                      </td>
                      <td><a href="duyuruGuncelle.aspx?duyurularID=<%#Eval("duyurularID") %>">Güncelle</a></td>
                      <td><a href="duyurular.aspx?duyurularID=<%#Eval("duyurularID") %>&islem=sil">Sil</a></td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
          </ItemTemplate>
      </asp:DataList>
  </asp:Panel>
       

</asp:Content>
