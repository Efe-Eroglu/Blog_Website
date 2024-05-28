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
        
            kategoriID = Request.QueryString["kategoriID"];
            islem = Request.QueryString["islem"];

            if (islem == "sil") 
            {
                SqlCommand cmdsil = new SqlCommand("delete from Kategori where kategoriID = '" + kategoriID +"'",baglan.baglan());
                cmdsil.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false) 
            {
                pnl_kategoriEkle.Visible = false;
            }


            SqlCommand cmdkgetir = new SqlCommand("Select * from Kategori", baglan.baglan());
            SqlDataReader drkgetir = cmdkgetir.ExecuteReader(); 

            DataList1.DataSource = drkgetir;
            DataList1.DataBind();
        }

        protected void btn_kdEksi_Click(object sender, EventArgs e)
        {
            pnl_kategoriDuzenle.Visible = false;
        }

        protected void btn_kdArti_Click(object sender, EventArgs e)
        {
            pnl_kategoriDuzenle.Visible = true;
        }

        protected void btn_keEksiClick(object sender, EventArgs e)
        {
            pnl_kategoriEkle.Visible=false;
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
                SqlCommand cmdkekle = new SqlCommand("insert into Kategori(kategoriAd, kategoriSira, kategoriResim) values('"+txt_kategoriAdi.Text +"','" + txt_Sira.Text + "','/kresim/"+fu_kategoriResim.FileName+"')", baglan.baglan());
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