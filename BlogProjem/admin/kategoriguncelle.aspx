<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriguncelle.aspx.cs" Inherits="BlogProjem.admin.kategoriguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-container {
            max-width: 500px;
            margin: 0 auto; 
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

            .form-container h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

        .form-group {
            margin-bottom: 20px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            .form-group input[type="text"],
            .form-group input[type="file"] {
                width: calc(100% - 22px); /* Dosya seçme girdisinin genişliğini düzenle */
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .form-group input[type="file"] {
                background-color: #a1c2aa; /* Arka plan rengi */
                color: #fff; /* Metin rengi */
                border: 1px solid #007bff; /* Kenarlık */
                border-radius: 25px; /* Köşe yuvarlaklığı */
                padding: 10px; /* İç boşluk */
                cursor: pointer; /* İmleç türü */
                transition: background-color 0.3s, border-color 0.3s, color 0.3s; /* Geçiş efekti */
                width:300px;
                }

                /* Dosya seç butonu için durum değişikliği */
                .form-group input[type="file"]:hover,
                .form-group input[type="file"]:focus {
                    background-color: #6aad7c; /* Arka plan rengi */
                    border-color: #0056b3; /* Kenarlık rengi */
                }

        /* Butonların tasarımını değiştirmek için ayrı bir CSS sınıfı tanımlıyoruz */
        .btn-primary {
            width: 100%;
            padding: 12px;
            background-color: #18994c;
            border: none;
            border-radius: 20px; /* Köşeleri daha yuvarlak yap */
            color: #fff;
            font-size: 18px; /* Metni biraz daha büyük yap */
            font-weight: bold; /* Metni kalın yap */
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .btn-primary:hover {
                background-color: #257a3c;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Kategori Güncelle</h2>
        <div class="form-group">
            <label for="txt_kategoriAd">Kategori Adı</label>
            <asp:TextBox ID="txt_kategoriAd" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_sira">Sıra</label>
            <asp:TextBox ID="txt_sira" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txt_adet">Adet</label>
            <asp:TextBox ID="txt_adet" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="fu_kresim">Resim</label>
            <asp:FileUpload ID="fu_kresim" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Button ID="btn_kguncelle" runat="server" OnClick="Button2_Click" Text="Güncelle" CssClass="btn-primary" />
        </div>
    </div>
</asp:Content>
