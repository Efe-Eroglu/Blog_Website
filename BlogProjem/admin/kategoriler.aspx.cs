using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BlogProjem.admin
{
    public partial class kategoriler : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string kategoriID = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            kategoriID = Request.QueryString["kategoriID"];
            islem = Request.QueryString["islem"];

            if (islem == "sil")
            {
                try
                {
                    // Önce yorumları sil
                    SqlCommand cmdSilYorum = new SqlCommand("DELETE FROM Yorum WHERE blogID IN (SELECT blogID FROM Blog WHERE kategoriID = @kategoriID)", baglan.baglan());
                    cmdSilYorum.Parameters.AddWithValue("@kategoriID", kategoriID);
                    cmdSilYorum.ExecuteNonQuery();

                    // Sonra blogları sil
                    SqlCommand cmdSilBlog = new SqlCommand("DELETE FROM Blog WHERE kategoriID = @kategoriID", baglan.baglan());
                    cmdSilBlog.Parameters.AddWithValue("@kategoriID", kategoriID);
                    cmdSilBlog.ExecuteNonQuery();

                    // En son kategoriyi sil
                    SqlCommand cmdSilKategori = new SqlCommand("DELETE FROM Kategori WHERE kategoriID = @kategoriID", baglan.baglan());
                    cmdSilKategori.Parameters.AddWithValue("@kategoriID", kategoriID);
                    cmdSilKategori.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Hata olursa burada işlem yapabilirsiniz
                    Response.Write("Hata: " + ex.Message);
                }
            }

            if (Page.IsPostBack == false)
            {
                pnl_kategoriEkle.Visible = false;
                pnl.Visible = false;
            }

            SqlCommand cmdkgetir = new SqlCommand("Select * from Kategori", baglan.baglan());
            SqlDataReader drkgetir = cmdkgetir.ExecuteReader();

            DataList1.DataSource = drkgetir;
            DataList1.DataBind();
        }

        protected void btn_kdEksi_Click(object sender, EventArgs e)
        {
            pnl.Visible = false;
        }

        protected void btn_kdArti_Click(object sender, EventArgs e)
        {
            pnl.Visible = true;
        }

        protected void btn_keEksiClick(object sender, EventArgs e)
        {
            pnl_kategoriEkle.Visible = false;
        }

        protected void btn_keArtiClick(object sender, EventArgs e)
        {
            pnl_kategoriEkle.Visible = true;
        }

        protected void btn_kategoriEkleme(object sender, EventArgs e)
        {
            if (fu_kategoriResim.HasFile)
            {
                fu_kategoriResim.SaveAs(Server.MapPath("/kresim/" + fu_kategoriResim.FileName));
                SqlCommand cmdkekle = new SqlCommand("insert into Kategori(kategoriAd, kategoriSira, kategoriResim) values(@kategoriAd, @kategoriSira, @kategoriResim)", baglan.baglan());
                cmdkekle.Parameters.AddWithValue("@kategoriAd", txt_kategoriAdi.Text);
                cmdkekle.Parameters.AddWithValue("@kategoriSira", txt_Sira.Text);
                cmdkekle.Parameters.AddWithValue("@kategoriResim", "/kresim/" + fu_kategoriResim.FileName);
                cmdkekle.ExecuteNonQuery();

                Response.Redirect("kategoriler.aspx");
            }
            else
            {
                btn_kategoriEkle.Text = "Resim Ekle !!!";
            }
        }
    }
}
