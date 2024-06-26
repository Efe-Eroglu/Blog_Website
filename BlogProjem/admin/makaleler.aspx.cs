﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem.admin
{
    public partial class makaleler : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string blogID = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["yoneticiKullanici"] == null) 
            {
                Response.Redirect("default.aspx");
            }

            blogID = Request.QueryString["blogID"];
            islem = Request.QueryString["islem"];


            if (islem == "sil" && !string.IsNullOrEmpty(blogID))
            {
                // Önce bloga bağlı yorumları siliyoruz
                SqlCommand cmdYorumSil = new SqlCommand("DELETE FROM Yorum WHERE blogID=@blogID", baglan.baglan());
                cmdYorumSil.Parameters.AddWithValue("@blogID", blogID);
                cmdYorumSil.ExecuteNonQuery();

                // Ardından blogu siliyoruz
                SqlCommand cmdBlogSil = new SqlCommand("DELETE FROM Blog WHERE blogID=@blogID", baglan.baglan());
                cmdBlogSil.Parameters.AddWithValue("@blogID", blogID);
                cmdBlogSil.ExecuteNonQuery();
            }


            if (Page.IsPostBack == false) 
            {
                pnl_blog.Visible = false;
                pnl_blogDuzenle.Visible = false;
                pnl_dosyaEkle.Visible = false;

                SqlCommand cmdkgetir = new SqlCommand("select * from Kategori",baglan.baglan());
                SqlDataReader drkgetir = cmdkgetir.ExecuteReader(); 
                ddl_kategori.DataTextField = "kategoriAd";
                ddl_kategori.DataValueField = "kategoriID";

                ddl_kategori.DataSource = drkgetir;
                ddl_kategori.DataBind();


                //BlogProjem getir

                SqlCommand cmdmgetir = new SqlCommand("select * from Blog",baglan.baglan());
                SqlDataReader drmgetir = cmdmgetir.ExecuteReader();

                DataList1.DataSource = drmgetir;
                DataList1.DataBind();   

            }
        }

        protected void btn_blogArtiClick(object sender, EventArgs e)
        {
            pnl_blog.Visible = true;
        }

        protected void btn_blogEksiClick(object sender, EventArgs e)
        {
            pnl_blog.Visible = false;
        }

        protected void btn_blogDArtiClick(object sender, EventArgs e)
        {
            pnl_blogDuzenle.Visible = true;
        }

        protected void btn_blogDEksiClick(object sender, EventArgs e)
        {
            pnl_blogDuzenle.Visible = false;
        }

        protected void btn_makaleEkle_Click(object sender, EventArgs e)
        {
            if (fu_slider.HasFile)
            {
                fu_slider.SaveAs(Server.MapPath("/sresim/" + fu_slider.FileName));

                SqlCommand cmdmekle = new SqlCommand("insert into Blog(blogBaslik, blogOzet, blogIcerik, blogResim, kategoriID) values (@blogBaslik, @blogOzet, @blogIcerik, @blogResim, @kategoriID)", baglan.baglan());
                cmdmekle.Parameters.AddWithValue("@blogBaslik", txt_baslik.Text);
                cmdmekle.Parameters.AddWithValue("@blogOzet", txt_ozet.Text);
                cmdmekle.Parameters.AddWithValue("@blogIcerik", txt_icerik.Text);
                cmdmekle.Parameters.AddWithValue("@blogResim", "/sresim/" + fu_slider.FileName);
                cmdmekle.Parameters.AddWithValue("@kategoriID", ddl_kategori.SelectedValue);
                cmdmekle.ExecuteNonQuery();

                SqlCommand cmdkadet = new SqlCommand("update Kategori Set kategoriAdet=kategoriAdet+1 where kategoriID='"+ddl_kategori.SelectedValue+"'",baglan.baglan());
                cmdkadet.ExecuteNonQuery();

                Response.Redirect("makaleler.aspx");

            }

            else
            {
                btn_makaleEkle.Text = "Resim Ekle !!!";
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_BlogDosyaEkleArti(object sender, EventArgs e)
        {
            pnl_dosyaEkle.Visible = true;  
        }

        protected void btn_BlogDosyaEkleEksi(object sender, EventArgs e)
        {
            pnl_dosyaEkle.Visible = false;
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            if (fu_dosya.HasFile) 
            {
                fu_dosya.SaveAs(Server.MapPath("/dosyalar/" + fu_dosya.FileName));
                Response.Redirect("makaleler.aspx");
            }
            else
            {
                btn_ekle.Text = "Dosya Eklenmedi !!!";
            }
        }
    }
}