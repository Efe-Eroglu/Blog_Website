﻿using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace BlogProjem
{
    public partial class register : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                Response.Redirect("Default.aspx");
            }
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

            // Boş alan kontrolü
            if (string.IsNullOrWhiteSpace(isim) || string.IsNullOrWhiteSpace(soyisim) || string.IsNullOrWhiteSpace(kullaniciAdi) || string.IsNullOrWhiteSpace(sifre) || string.IsNullOrWhiteSpace(email))
            {
                Response.Write("<script>alert('Lütfen tüm alanları doldurun.');</script>");
                return;
            }

            try
            {
                using (SqlConnection conn = baglan.baglan())
                {
                    // Kullanıcı adı ve e-posta kontrolü
                    string checkUserQuery = "SELECT COUNT(*) FROM Kullanici WHERE kullaniciTakmaAd = @KullaniciAdi OR kullaniciEmail = @Email";
                    SqlCommand checkUserCmd = new SqlCommand(checkUserQuery, conn);
                    checkUserCmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                    checkUserCmd.Parameters.AddWithValue("@Email", email);
                    int userCount = (int)checkUserCmd.ExecuteScalar();

                    if (userCount > 0)
                    {
                        // Kullanıcı adı veya e-posta zaten mevcut
                        Response.Write("<script>alert('Bu kullanıcı adı veya e-posta zaten kayıtlı. Lütfen farklı bir kullanıcı adı ve e-posta seçin.');</script>");
                        return;
                    }

                    // Kullanıcı adı ve e-posta mevcut değil, kayıt işlemini gerçekleştirin
                    string query = "INSERT INTO Kullanici (kullaniciAdSoyad, kullaniciTakmaAd, kullaniciSifre, kullaniciEmail) VALUES (@Isim, @KullaniciAdi, @Sifre, @Email)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Isim", isim + " " + soyisim);
                    cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                    cmd.Parameters.AddWithValue("@Sifre", sifre);
                    cmd.Parameters.AddWithValue("@Email", email);

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Session["kullanici"] = "kullanici";
                        Response.Write("<script>alert('Kayıt Başarılı.'); window.location='Default.aspx';</script>");
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
