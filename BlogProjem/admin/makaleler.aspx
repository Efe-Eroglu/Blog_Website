<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="makaleler.aspx.cs" Inherits="BlogProjem.admin.makaleler" %>

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
            display: flex;
            align-items: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-group input,
            .form-group textarea,
            .form-group select,
            .form-group button {
                width: 100%;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .form-group button {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }

                .form-group button:hover {
                    background-color: #45a049;
                }

            .form-group textarea {
                resize: vertical;
            }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

        .eklebuton {
            background-color: cadetblue;
            color: white;
            font-size: 28px;
            font-weight: bold;
            transition: ease 1s;
        }

            .eklebuton:hover {
                cursor: pointer;
                background-color: darkcyan;
            }

        #ikon {
            color: darkslategray;
        }

            #ikon:hover {
                color: darkcyan;
            }

        .data-table th {
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #2a595a;
            color: white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
        <asp:Button ID="btn_blogArti" runat="server" CssClass="action-button" OnClick="btn_blogArtiClick" Text="+" />
        <asp:Button ID="btn_blogEksi" runat="server" CssClass="action-button" OnClick="btn_blogEksiClick" Text="-" />
        Blog Ekleme Paneli
    </div>

    <asp:Panel ID="pnl_blog" runat="server" CssClass="panel-style">
        <div class="form-group">
            <label for="ddl_kategori">Kategori:</label>
            <asp:DropDownList ID="ddl_kategori" runat="server"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txt_baslik">Başlık:</label>
            <asp:TextBox ID="txt_baslik" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_ozet">Özet:</label>
            <asp:TextBox ID="txt_ozet" runat="server" TextMode="MultiLine" Height="100px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="fu_slider">Resim:</label>
            <asp:FileUpload ID="fu_slider" runat="server" />
        </div>
        <div class="form-group">
            <label for="txt_icerik">İçerik:</label>
            <asp:TextBox ID="txt_icerik" runat="server" TextMode="MultiLine" Height="200px"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btn_makaleEkle" CssClass="eklebuton" runat="server" Text="Ekle" OnClick="btn_makaleEkle_Click" />
        </div>
    </asp:Panel>

    <div class="section-header">
        <asp:Button ID="btn_blogDArti" runat="server" CssClass="action-button" OnClick="btn_blogDArtiClick" Text="+" />
        <asp:Button ID="btn_blogDEksi" runat="server" CssClass="action-button" OnClick="btn_blogDEksiClick" Text="-" />
        Blog Düzenleme Paneli
    </div>
    <asp:Panel ID="pnl_blogDuzenle" runat="server" CssClass="panel-style">
        <table>
            <tr>
                <th style="width: 550px;">Blog Adı</th>
                <th style="width: 297px;">Düzenle</th>
                <th>Sil</th>
            </tr>
            <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <tr>
                <td><asp:Literal ID="Literal1" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Literal></td>
                        <td><a href="makaleGuncelle.aspx?blogID=<%#Eval("blogID")%>"><i class="fas fa-edit icon-button" id="ikon"></i></a></td>
                        <td><a href="makaleler.aspx?blogID=<%#Eval("blogID")%>&islem=sil"><i class="fas fa-trash-alt icon-button" id="ikon"></i></a></td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>
    </asp:Panel>

    <div class="section-header">
        <asp:Button ID="Button1" runat="server" CssClass="action-button" OnClick="btn_BlogDosyaEkleArti" Text="+" />
        <asp:Button ID="Button2" runat="server" CssClass="action-button" OnClick="btn_BlogDosyaEkleEksi" Text="-" />
        Blog Dosya Ekleme Paneli
    </div>
    <asp:Panel ID="pnl_dosyaEkle" runat="server" CssClass="panel-style">
        <div class="form-group">
            <label for="fu_dosya">Dosya Seç:</label>
            <asp:FileUpload ID="fu_dosya" runat="server" />
        </div>
        <div class="form-group">
            <asp:Button ID="btn_ekle" runat="server" Text="Ekle" CssClass="eklebuton" OnClick="btn_ekle_Click" />
        </div>
        <div class="form-group">
            <p><strong>Not:</strong> Ekleme işlemi /dosyalar/eklenendosya.uzantı şeklinde kullanılacak</p>
        </div>
    </asp:Panel>
</asp:Content>
