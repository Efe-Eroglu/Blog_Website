﻿using System;
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
        string session = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            session = Request.QueryString["log"];
            if (session == null || session == "null") 
            {
                Session["yoneticiKullanici"] = null;
            }

            if (Session["yoneticiKullanici"] != null)
            {
                Response.Redirect("adminpanel.aspx");
            }
        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Admin where yoneticiKullaniciAd='"+txt_kullanici.Text+"' and yoneticiSifre='"+txt_sifre.Text+"'",baglan.baglan());  
            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.Read()) 
            {
                Session["yoneticiKullanici"] = dr["yoneticiKullaniciAd"];

                Response.Write("<script>alert('Giriş Başarılı!');</script>");
                Response.Redirect("adminpanel.aspx");
            }
            else 
            {
                Response.Write("<script>alert('Hatalı Giriş!');</script>");
            }

        }
    }
}