using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem
{
    public partial class login : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Kullanici where kullaniciTakmaAd='" + txt_kullanici.Text + "' and kullaniciSifre='" + txt_sifre.Text + "'", baglan.baglan());
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Response.Write("<script>alert('Giriş Başarılı!');</script>");
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('Hatalı Giriş!');</script>");
            }

        }
    }
}