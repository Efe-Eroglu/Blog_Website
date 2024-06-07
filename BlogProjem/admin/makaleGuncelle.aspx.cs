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
    public partial class makaleGuncelle : System.Web.UI.Page
    {


        sqlbaglantisi baglan = new sqlbaglantisi();
        string blogID ="";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            blogID = Request.QueryString["blogID"];
            
            if (Page.IsPostBack == false)
            {
                SqlCommand cmdmgetir = new SqlCommand("select * from Blog where blogID='" + blogID + "'",baglan.baglan());
                SqlDataReader drmgetir = cmdmgetir.ExecuteReader(); 

                DataTable dtmgetir = new DataTable("tablo");
                dtmgetir.Load(drmgetir);

                DataRow row = dtmgetir.Rows[0];
                txt_baslik.Text = row["blogBaslik"].ToString();
                txt_icerik.Text = row["blogIcerik"].ToString();
                txt_ozet.Text = row["blogOzet"].ToString();
                txt_yorumsayi.Text = row["blogYorumSayisi"].ToString();
            }
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            if (fu_slider.HasFile) 
            {
                fu_slider.SaveAs(Server.MapPath("/sresim/" + fu_slider.FileName));

                SqlCommand cmdmguncelle = new SqlCommand("update Blog set blogBaslik=@baslik, blogOzet=@ozet, blogIcerik=@icerik, blogResim=@resim, blogYorumSayisi=@yorumsayi",baglan.baglan());
                cmdmguncelle.Parameters.AddWithValue("@baslik", txt_baslik.Text);
                cmdmguncelle.Parameters.AddWithValue("@ozet", txt_ozet.Text); 
                cmdmguncelle.Parameters.AddWithValue("@icerik", txt_icerik.Text); 
                cmdmguncelle.Parameters.AddWithValue("@resim", "/sresim/" + fu_slider.FileName); 
                cmdmguncelle.Parameters.AddWithValue("@yorumsayi", int.Parse(txt_yorumsayi.Text)); 

                cmdmguncelle.ExecuteNonQuery();
                Response.Redirect("makaleler.aspx");
            }
            else
            {
                btn_guncelle.Text = "Resim Yüklenmedi !!!";
            }
        }
    }
}