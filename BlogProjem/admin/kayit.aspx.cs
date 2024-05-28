using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace BlogProjem.admin
{
    public partial class kayit : Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panelStep2.Style["display"] = "none";
            }
            else
            {
                if (hidStep.Value == "2")
                {
                    panelStep1.Style["display"] = "none";
                    panelStep2.Style["display"] = "block";
                }
            }
        }

        protected void btn_kayit_Click(object sender, EventArgs e)
        {
            string isim = txt_isim.Text;
            string soyisim = txt_soyisim.Text;
            string kullaniciAdi = txt_kullanici.Text;
            string sifre = txt_sifre.Text;
            string email = txt_email.Text;

            try
            {
                using (SqlConnection conn = baglan.baglan())
                {
                    string query = "INSERT INTO Admin (yoneticiAdSoyad, yoneticiKullaniciAd, yoneticiSifre, yoneticiEmail) VALUES (@Isim, @KullaniciAdi, @Sifre, @Email)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Isim", isim + " " + soyisim);
                    cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                    cmd.Parameters.AddWithValue("@Sifre", sifre);
                    cmd.Parameters.AddWithValue("@Email", email);

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Kayıt Başarılı.'); window.location='adminpanel.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Kayıt başarısız.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Hata: " + ex.Message + "');</script>");
            }
        }
    }
}
