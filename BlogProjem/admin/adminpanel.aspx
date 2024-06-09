<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="BlogProjem.admin.adminpanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-panel {
            margin: 50px;
        }
        .admin-panel h1 {
            font-size: 2em;
            color: darkslategrey;
        }
        .admin-panel p {
            color: #555;
            font-size:16px;
        }
        .admin-panel ul {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
        }
        .admin-panel ul li {
            font-size: 1.2em;
            margin: 10px 0;
            color: #444;
        }
    </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-panel">
        <h1>Hoşgeldiniz!</h1>
        <p style="margin-bottom:20px;">Admin paneline hoş geldiniz! Bu panel üzerinden aşağıdaki işlemleri gerçekleştirebilirsiniz:</p>
        
        <ul">
            <li>
                <strong>Kategori Yönetimi:</strong>
                <p>Yeni kategoriler ekleyebilir, mevcut kategorileri düzenleyebilir veya silebilirsiniz. Bu özellik, blog içeriklerinizi düzenlemenize ve gruplamanıza yardımcı olur.</p>
            </li>
            <li>
                <strong>Duyuru Yönetimi:</strong>
                <p>Siteye yeni duyurular ekleyebilir ve mevcut duyuruları güncelleyebilirsiniz. Bu sayede, ziyaretçilerinize önemli bilgileri ve güncellemeleri kolayca iletebilirsiniz.</p>
            </li>
            <li>
                <strong>Blog Yönetimi:</strong>
                <p>Yeni blog yazıları ekleyebilir, mevcut yazıları düzenleyebilir veya silebilirsiniz. Blog içeriğinizi sürekli güncel tutarak ziyaretçilerin ilgisini çekebilirsiniz.</p>
            </li>
            <li>
                <strong>Yorum Yönetimi:</strong>
                <p>Gelen yorumları onaylayabilir, silebilir veya cevaplayabilirsiniz. Bu sayede, kullanıcı etkileşimini yönetebilir ve sitenizdeki tartışma kalitesini artırabilirsiniz.</p>
            </li>
        </ul>
    </div>
</asp:Content>
