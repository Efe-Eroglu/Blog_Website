using System;
using System.Net.Mail;
using System.Web.Services;
using System.Web.UI;

namespace BlogProjem
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SendEmail(string isim, string email, string mesaj)
        {
            // Kutuların boş olup olmadığını kontrol et
            if (string.IsNullOrEmpty(isim) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(mesaj))
            {
                return "Lütfen tüm alanları doldurun.";
            }

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("denemehesabi09812@gmail.com");
                mail.To.Add("denemehesabi09812@gmail.com");
                mail.Subject = "İletişim Formu: " + isim;
                mail.Body = "E-posta: " + email + "\n\nMesaj: " + mesaj;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("denemehesabi09812@gmail.com", "xlkowvldcesjpdqz"); 
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);

                return "E-posta başarıyla gönderildi.";
            }
            catch (Exception ex)
            {
                return "E-posta gönderilirken hata oluştu: " + ex.Message;
            }
        }
    }
}
