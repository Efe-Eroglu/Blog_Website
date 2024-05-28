using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BlogProjem.admin
{
    public partial class _default : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Admin where yoneticiKullaniciAd='"+txt_kullanici.Text+"' and yoneticiSifre='"+txt_sifre.Text+"'",baglan.baglan());  
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read()) 
            {
                Response.Redirect("adminpanel.aspx");
            }
            else 
            {
                Console.WriteLine("Hatalı giriş");
            }
        
        }
    }
}