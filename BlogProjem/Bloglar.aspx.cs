﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem
{
    public partial class Bloglar : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("login.aspx");
            }

            //Slider
            SqlCommand cmdslider = new SqlCommand("Select TOP 5 * from Blog order by blogOkunma DESC", baglan.baglan());
            SqlDataReader drslider = cmdslider.ExecuteReader(); 

            dl_slider.DataSource = drslider;
            dl_slider.DataBind();


            //Duyurular
            SqlCommand cmdduyuru = new SqlCommand("select TOP 5 * from Duyurular order by duyurularID DESC",baglan.baglan());
            SqlDataReader drduyuru = cmdduyuru.ExecuteReader(); 

            dl_duyuru.DataSource = drduyuru;    
            dl_duyuru.DataBind();


            //Kategoriler
            SqlCommand cmdkategori = new SqlCommand("select * from Kategori",baglan.baglan());
            SqlDataReader drkategori = cmdkategori.ExecuteReader(); 

            dl_kategori.DataSource = drkategori;    
            dl_kategori.DataBind();


            //Bloglar
            string sqlString = "SELECT dbo.Blog.blogResim, dbo.Blog.blogID ,dbo.Blog.blogYorumSayisi, dbo.Blog.blogOkunma, dbo.Blog.blogTarih, dbo.Blog.blogBaslik, dbo.Blog.blogOzet, dbo.Kategori.kategoriResim FROM dbo.Blog INNER JOIN dbo.Kategori ON dbo.Blog.kategoriID = dbo.Kategori.kategoriID order by blogID DESC";
            SqlCommand cmdblog = new SqlCommand(sqlString, baglan.baglan());
            SqlDataReader drbloggetir = cmdblog.ExecuteReader();
            DataList1.DataSource = drbloggetir;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}