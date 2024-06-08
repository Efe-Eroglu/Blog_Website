using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem.admin
{
    public partial class duyuruGuncelle : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string duyurularID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            duyurularID = Request.QueryString["duyurularID"];    
            
            if (Page.IsPostBack == false)
            {
                SqlCommand cmddgetir = new SqlCommand("select * from Duyurular where duyurularID=@id",baglan.baglan());
                cmddgetir.Parameters.AddWithValue("id", duyurularID);   
                
                SqlDataReader drgetir = cmddgetir.ExecuteReader();  
                DataTable dt = new DataTable("tablo");
                dt.Load(drgetir);

                DataRow row = dt.Rows[0];
                txt_baslik.Text = row["duyurularBaslik"].ToString();
                txt_icerik.Text = row["duyurularIcerik"].ToString();
            }
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            SqlCommand cmddguncelle = new SqlCommand("update Duyurular set duyurularBaslik=@baslik, duyurularIcerik=@icerik where duyurularID=@id",baglan.baglan());
            cmddguncelle.Parameters.AddWithValue("@baslik",txt_baslik.Text);
            cmddguncelle.Parameters.AddWithValue("@id",duyurularID);
            cmddguncelle.Parameters.AddWithValue("@icerik",txt_icerik.Text);

            cmddguncelle.ExecuteNonQuery();

            Response.Redirect("duyurular.aspx");
        }
    }
}