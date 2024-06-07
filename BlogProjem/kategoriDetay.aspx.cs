using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem
{
    public partial class kategoriDetay : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();
        string kategoriID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            kategoriID = Request.QueryString["kategoriID"];


            //Slider
            SqlCommand cmdslider = new SqlCommand("Select * from Blog", baglan.baglan());
            SqlDataReader drslider = cmdslider.ExecuteReader();

            dl_slider.DataSource = drslider;
            dl_slider.DataBind();


            //Duyurular
            SqlCommand cmdduyuru = new SqlCommand("select * from Duyurular", baglan.baglan());
            SqlDataReader drduyuru = cmdduyuru.ExecuteReader();

            dl_duyuru.DataSource = drduyuru;
            dl_duyuru.DataBind();


            //Kategoriler
            SqlCommand cmdkategori = new SqlCommand("select * from Kategori", baglan.baglan());
            SqlDataReader drkategori = cmdkategori.ExecuteReader();

            dl_kategori.DataSource = drkategori;
            dl_kategori.DataBind();


            string sqlString = "SELECT dbo.Blog.blogResim, dbo.Blog.blogYorumSayisi, dbo.Blog.blogOkunma, dbo.Blog.blogTarih, dbo.Blog.blogBaslik, dbo.Blog.blogOzet, dbo.Kategori.kategoriResim, dbo.Kategori.kategoriID, dbo.Kategori.kategoriAd FROM dbo.Blog INNER JOIN dbo.Kategori ON dbo.Blog.kategoriID = dbo.Kategori.kategoriID WHERE dbo.Kategori.kategoriID='" + kategoriID + "'";
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