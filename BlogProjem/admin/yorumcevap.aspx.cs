using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem.admin
{
    public partial class yorumcevap : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();
        string blogID = "";
        string yorumID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            blogID = Request.QueryString["blogID"];
            yorumID = Request.QueryString["yorumID"];
        }

        protected void btn_cevap_Click(object sender, EventArgs e)
        {
            SqlCommand cmdekle = new SqlCommand("insert into Yorum (yorumAdSoyad,yorumIcerik,yorumResim, yorumOnay,blogID) values (@ad,@icerik,@resim, @onay,@id)", baglan.baglan());
            cmdekle.Parameters.AddWithValue("@ad", txt_ad.Text);
            cmdekle.Parameters.AddWithValue("@icerik", txt_yorum.Text);
            cmdekle.Parameters.AddWithValue("@resim","../sresim/d2.jpeg");
            cmdekle.Parameters.AddWithValue("@id",blogID);
            cmdekle.Parameters.AddWithValue("@onay",1);

            cmdekle.ExecuteNonQuery();


            SqlCommand cmdarttir = new SqlCommand("update Blog set blogYorumSayisi=blogYorumSayisi+2 where blogID='" + blogID+"'", baglan.baglan());
            cmdarttir.ExecuteNonQuery();

            SqlCommand cmdonay = new SqlCommand("update Yorum set yorumOnay=1 where yorumID='"+yorumID+"'",baglan.baglan());
            cmdonay.ExecuteNonQuery();


            Response.Redirect("yorumlar.aspx");

        }
    }
}