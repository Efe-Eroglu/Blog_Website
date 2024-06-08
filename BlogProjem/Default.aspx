<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BlogProjem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="hero_area">
        <section class="slider_section position-relative">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-9 mt-5">
                                    <div class="detail-box">
                                        <div>
                                            <h1>Hoşgeldin,<br>
                                                <span>Maya Angelou</span>
                                            </h1>
                                            <p>
                                                Kelimelerin sihirli gücü, insanların kalplerine dokunmanın, hayalleri inşa etmenin ve dünyayı dönüştürmenin anahtarıdır. Her cümle, bir hikayenin başlangıcı; her paragraf, bir yolculuğun kapısıdır
                                            </p>
                                            <div class="btn-box">
                                                <a href="/" class="btn-1">Okumaya Başla</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </div>

    <section class="about_section layout_padding" id="About">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>Hakkımızda
                            </h2>
                        </div>
                        <p>
                            Merhaba ve Hoş Geldiniz! Biz DevBlog ekibi olarak, yazılım dünyasına tutkulu bir şekilde bağlıyız ve bu tutkumuzu sizinle paylaşmak için buradayız. Misyonumuz, karmaşık teknolojik konuları anlaşılır ve erişilebilir bir şekilde sunarak, yazılım geliştirme sürecinde size rehberlik etmek ve ilham vermek. Deneyimli ve tutkulu bir ekip olarak, sürekli olarak yeni teknolojilere ve trendlere odaklanıyoruz, böylece size en güncel ve etkili içerikleri sunabiliyoruz. Blogumuzda, yazılım geliştirme sürecinde karşılaşılan zorlukları aşmanıza yardımcı olacak ipuçları, teknik makaleler, derinlemesine kılavuzlar ve sektördeki en son gelişmeler hakkında bilgi bulacaksınız. Ayrıca, başarı hikayelerini ve ilham verici deneyimleri paylaşarak, yazılım dünyasında kariyerinizi şekillendirmenize yardımcı olmayı amaçlıyoruz. Siz değerli okuyucularımız için en iyi deneyimi sunmak için buradayız. Sorularınızı, önerilerinizi ve geri bildirimlerinizi her zaman bekliyoruz. Bize ulaşmaktan çekinmeyin! Yazılım maceramıza hoş geldiniz. Birlikte kod dünyasını keşfedelim! 
              <br />
                            <br />
                            Saygılarımla DevBlog yazar ekibi,
                        </p>
                        <a href="/">Okumaya Başla
                        </a>
                    </div>
                </div>
                <div class="col-md-6 mt-5">
                    <div class="img-box">
                        <img src="images/about-img.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </section>

   <section class="contact_section mt-5" id="Contact">
        <div class="container">
            <div class="heading_container">
                <h2>Bizimle İletişime Geç</h2>
            </div>
        </div>
        <div class="container contact_bg layout_padding2-top">
            <div class="row">
                <div class="col-md-6">
                    <div class="contact_form">
                        <input type="text" placeholder="İsim" name="isim">
                        <input type="email" placeholder="Email" name="email">
                        <input type="text" placeholder="Mesaj" class="message_input" name="mesaj">
                        <br />
                        <asp:Button ID="btnSend" Text="Gönder" OnClientClick="return sendEmail();" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="img-box">
                        <img src="images/contact-img.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function sendEmail() {
            var isim = document.getElementsByName("isim")[0].value;
            var email = document.getElementsByName("email")[0].value;
            var mesaj = document.getElementsByName("mesaj")[0].value;

            if (!isim || !email || !mesaj) {
                alert('Lütfen tüm alanları doldurun.');
                return false;
            }

            $.ajax({
                type: "POST",
                url: "Default.aspx/SendEmail",
                data: JSON.stringify({ isim: isim, email: email, mesaj: mesaj }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: {
                    withCredentials: true
                },
                success: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert('E-posta gönderilirken hata oluştu: ' + response.responseText);
                }
            });

            return false;
        }

   </script>
</asp:Content>
