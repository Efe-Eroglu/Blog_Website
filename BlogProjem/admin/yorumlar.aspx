<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="yorumlar.aspx.cs" Inherits="BlogProjem.admin.yorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
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

        .comment-card {
            display: flex;
            flex-direction: column;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            width: 750px;
        }

        .comment-details {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        
        .comment-info {
            flex-grow: 1;
        }

            .comment-info label {
                margin-bottom: 5px;
            }

        .comment-actions {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

            .comment-actions a {
                color: white;
                background-color: cadetblue;
                text-decoration: none;
                padding: 15px;
                border-radius: 25px;
                width: 100px;
                text-align: center;
                transition: color 2s;
            }

                .comment-actions a:hover {
                    background-color: darkcyan;
                }

        .comment-header {
            color: #333;
            margin-bottom: 30px;
        }

        .comment-content {
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }

        #head {
            font-weight: bold;
        }

        .commentImage {
            width: 250px;
            height: 300px;
            margin-right:50px;
            }


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-header">
        <asp:Button ID="btn_oyArti" runat="server" CssClass="action-button" OnClick="btn_oyArtiClick" Text="+" />
        <asp:Button ID="btn_oyEksi" runat="server" CssClass="action-button" OnClick="btn_oyEksiClick" Text="-" />
        Onaysız Yorum Paneli
    </div>
    <asp:Panel ID="pnl_onaysizYorum" runat="server" CssClass="panel-style">
        <asp:DataList ID="dl_yorum" runat="server">
            <ItemTemplate>
                <div class="comment-card">
                    <div class="comment-details">
                        <div class="comment-image">
                            <asp:Image ID="Image1" runat="server"  CssClass="commentImage" ImageUrl='<%# Eval("yorumResim") %>'/>
                        </div>
                        <div class="comment-info">
                            <div class="comment-header">
                                <span id="head">Ad Soyad: </span> 
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("yorumAdSoyad") %>'></asp:Label>

                            </div>
                            <div class="comment-header">
                                <span id="head">Email: </span                                
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("yorumEmail") %>'></asp:Label>
                            </div>
                            <div class="comment-header">
                                <span id="head">Tarih:</span> 
                                


                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("yorumTarih","{0:yyyy}") %>'></asp:Label>
                            </div>
                            <div class="comment-header">
                                <span id="head">Makale: </span> 
                                
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>

                            </div>
                            <div class="comment-header">
                                <span id="head">Yorum İçeriği: </span> 
                                
                                <div class="comment-content">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("yorumIcerik") %>'></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="comment-actions">
                        <a href="yorumcevap.aspx?blogID=<%# Eval("blogID") %>&yorumID=<%# Eval("yorumID") %>">Cevapla</a>
                        <a href="yorumGuncelle.aspx?yorumID=<%# Eval("yorumID") %>&blogID=<%# Eval("blogID") %>">Güncelle</a>
                        <a href="yorumlar.aspx?yorumID=<%# Eval("yorumID") %>&islem=sil">Sil</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>

    <div class="section-header">
        <asp:Button ID="btn_onayliArti" runat="server" CssClass="action-button" OnClick="btn_onyArtiClick" Text="+" />
        <asp:Button ID="btn_onayliEksi" runat="server" CssClass="action-button" OnClick="btn_onyEksiClick" Text="-" />
        Onaylı Yorum Paneli
    </div>
    <asp:Panel ID="pnl_onayliYorum" runat="server" CssClass="panel-style">
        <asp:DataList ID="dl_onayYorum" runat="server">
            <ItemTemplate>
                <div class="comment-card">
                    <div class="comment-details">
                        <div class="comment-image">
                            <asp:Image ID="Image2" runat="server" CssClass="commentImage" ImageUrl='<%# Eval("yorumResim") %>' />
                        </div>
                        <div class="comment-info">
                            <div class="comment-header"><span id="head">Ad Soyad: </span>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("yorumAdSoyad") %>'></asp:Label>

                            </div>
                            <div class="comment-header"><span id="head">Email: </span>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("yorumEmail") %>'></asp:Label>

                            </div>
                            <div class="comment-header"><span id="head">Tarih: </span>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("yorumTarih","{0:yyyy}") %>'></asp:Label>

                            </div>
                            <div class="comment-header"><span id="head">Makale: </span>                            
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("blogBaslik") %>'></asp:Label>

                            </div>
                            <div class="comment-header"><span id="head">Yorum İçeriği</span>                                
                            <div class="comment-content">
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("yorumIcerik") %>'></asp:Label>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment-actions">
                        <a href="yorumlar.aspx?yorumID=<%# Eval("yorumID") %>&islem2=sil&blogID=<%# Eval("blogID") %>">Sil</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>
</asp:Content>
