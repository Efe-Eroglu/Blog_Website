using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace BlogProjem
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = isim.Text;
            string email = txtEmail.Text; 
            string message = Request.Form["mesaj"].ToString(); 

            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential("denemehesabi09812@gmail.com", "mbisapnakfjnlthb"),
                    EnableSsl = true
                };

                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress("denemehesabi09812@gmail.com"),
                    Subject = "Blog Kullanıcısından Mesajın Var",
                    Body = $"Name: {name}\nEmail: {email}\nMessage:{message}"
                };
                mailMessage.To.Add("denemehesabi09812@gmail.com");

                client.Send(mailMessage);

                Response.Write("<script>alert('Mesajınız Tarafımıza İletildi.');</script>");
            }
            catch (SmtpFailedRecipientException ex)
            {
                Response.Write($"<script>alert('Mail Gönderilemedi: {ex.FailedRecipient}. Hata: {ex.Message}');</script>");
            }
            catch (SmtpException ex)
            {
                Response.Write($"<script>alert('SMTP error: {ex.Message}');</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
        }
    }
}
