using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem
{
    public partial class makaleDetay : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();
        string blogID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["kullanici"] == null)
            {
                Response.Redirect("login.aspx");
            }

            blogID = Request.QueryString["blogID"];

            if (Page.IsPostBack == false) 
            {
                //Slider
                SqlCommand cmdslider = new SqlCommand("Select TOP 5 * from Blog order by blogOkunma DESC", baglan.baglan());
                SqlDataReader drslider = cmdslider.ExecuteReader();

                dl_slider.DataSource = drslider;
                dl_slider.DataBind();


                //Duyurular
                SqlCommand cmdduyuru = new SqlCommand("select TOP 5 * from Duyurular order by duyurularID DESC", baglan.baglan());
                SqlDataReader drduyuru = cmdduyuru.ExecuteReader();

                dl_duyuru.DataSource = drduyuru;
                dl_duyuru.DataBind();


                //Kategoriler
                SqlCommand cmdkategori = new SqlCommand("select * from Kategori", baglan.baglan());
                SqlDataReader drkategori = cmdkategori.ExecuteReader();

                dl_kategori.DataSource = drkategori;
                dl_kategori.DataBind();



                //Blog Detay
                string sqlString = "SELECT dbo.Blog.blogResim, dbo.Blog.blogID ,dbo.Blog.blogYorumSayisi, dbo.Blog.blogOkunma, dbo.Blog.blogTarih, dbo.Blog.blogBaslik, dbo.Blog.blogIcerik, dbo.Kategori.kategoriResim, dbo.Kategori.kategoriID, dbo.Kategori.kategoriAd FROM dbo.Blog INNER JOIN dbo.Kategori ON dbo.Kategori.kategoriID = dbo.Blog.kategoriID WHERE dbo.Blog.blogID='" + blogID + "'";
                SqlCommand cmdblog = new SqlCommand(sqlString, baglan.baglan());
                SqlDataReader drbloggetir = cmdblog.ExecuteReader();
                DataList1.DataSource = drbloggetir;
                DataList1.DataBind();


                //Makale okunma sayısı
                SqlCommand cmdokuma = new SqlCommand("update Blog set blogOkunma=blogOkunma+1 where blogID='" +blogID+"'",baglan.baglan());
                cmdokuma.ExecuteNonQuery();


                //Yorum Getir
                SqlCommand cmdyorumgetir = new SqlCommand("select * from Yorum where blogID=@id and yorumOnay=@onay",baglan.baglan());
                cmdyorumgetir.Parameters.AddWithValue("@id",blogID);
                cmdyorumgetir.Parameters.AddWithValue("@onay",1);
                SqlDataReader drygetir = cmdyorumgetir.ExecuteReader();
                DataList2.DataSource = drygetir;
                DataList2.DataBind();
            }
        }


        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnYorumYap_Click(object sender, EventArgs e)
        {
            SqlCommand cmdyorum = new SqlCommand("insert into Yorum(yorumAdSoyad, yorumEmail, yorumIcerik, yorumResim, blogID) Values(@ad, @mail, @icerik, @resim,@id)", baglan.baglan());
            cmdyorum.Parameters.AddWithValue("@ad",txt_ad.Text);
            cmdyorum.Parameters.AddWithValue("@mail",txt_mail.Text);
            cmdyorum.Parameters.AddWithValue("@icerik",txtYorum.Text);
            cmdyorum.Parameters.AddWithValue("@id",blogID);
            cmdyorum.Parameters.AddWithValue("@resim","/tema/user.png");

            cmdyorum.ExecuteNonQuery();


            Response.Redirect("bloglar.aspx");

        }
    }
}