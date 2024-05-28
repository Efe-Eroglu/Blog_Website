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
    public partial class kategoriguncelle : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string kategoriID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            kategoriID = Request.QueryString["kategoriID"];
            Console.WriteLine(kategoriID);
            if (Page.IsPostBack == false) 
            {
                SqlCommand cmdkguncelle = new SqlCommand("select * from Kategori where kategoriID='" + kategoriID + "'", baglan.baglan());
                SqlDataReader drkguncelle = cmdkguncelle.ExecuteReader();

                DataTable dtkguncelle = new DataTable("tablo");
                dtkguncelle.Load(drkguncelle);

                DataRow row = dtkguncelle.Rows[0];
                txt_kategoriAd.Text = row["kategoriAd"].ToString();
                txt_sira.Text = row["kategoriSira"].ToString();
                txt_adet.Text = row["kategoriAdet"].ToString();   
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (fu_kresim.HasFile) 
            {
                fu_kresim.SaveAs(Server.MapPath("/kresim/" + fu_kresim.FileName));
                SqlCommand cmdkguncelle = new SqlCommand("Update Kategori set kategoriAd = '" + txt_kategoriAd.Text + "', kategoriSira = '" + txt_sira.Text + "', kategoriAdet='" + txt_adet.Text + "', kategoriResim='/kresim/" + fu_kresim.FileName + "' where kategoriID='" + kategoriID + "'", baglan.baglan());
                cmdkguncelle.ExecuteNonQuery();

                Response.Redirect("kategoriler.aspx");
            }
            else
            {
                SqlCommand cmdkguncelle = new SqlCommand("Update Kategori set kategoriAd = '" + txt_kategoriAd.Text + "', kategoriSira = '" + txt_sira.Text + "', kategoriAdet='" + txt_adet.Text + "' where kategoriID='" + kategoriID + "'", baglan.baglan());
                cmdkguncelle.ExecuteNonQuery();

                Response.Redirect("");
            }
        }
    }
}