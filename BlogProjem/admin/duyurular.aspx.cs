using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem.admin
{
    public partial class duyurular : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string duyurularID = "";
        string islem = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            duyurularID = Request.QueryString["duyurularId"];
            islem = Request.QueryString["islem"];


            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            if (islem == "sil")
            {
                SqlCommand cmddsil = new SqlCommand("delete from Duyurular where duyurularID=@id", baglan.baglan());
                cmddsil.Parameters.AddWithValue("@id", duyurularID);
                cmddsil.ExecuteNonQuery();
            }

            if (Page.IsPostBack == false)
            {
                pnl_Duyuru.Visible = false;
                pnl_duyuruDuzenle.Visible = false;


                //Duyuru getir

                SqlCommand cmddgetir = new SqlCommand("Select * from Duyurular", baglan.baglan());
                SqlDataReader drdgetir = cmddgetir.ExecuteReader();

                DataList1.DataSource = drdgetir;
                DataList1.DataBind();

            }
        }

        protected void btn_duyuruEksiClick(object sender, EventArgs e)
        {
            pnl_Duyuru.Visible = false;
        }

        protected void btn_duyuruArtiClick(object sender, EventArgs e)
        {
            pnl_Duyuru.Visible = true;
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            SqlCommand cmddekle = new SqlCommand("insert into Duyurular (duyurularBaslik, duyurularIcerik, duyurularResim) values (@baslik, @icerik, @resim)", baglan.baglan());
            cmddekle.Parameters.AddWithValue("@baslik", txt_baslik.Text);
            cmddekle.Parameters.AddWithValue("@icerik", txt_icerik.Text);
            cmddekle.Parameters.AddWithValue("@resim", "/tema/bildirim.png");

            cmddekle.ExecuteNonQuery();

            Response.Redirect("duyurular.aspx");
        }

        protected void btn_duyuruDArtiClick(object sender, EventArgs e)
        {
            pnl_duyuruDuzenle.Visible = true;
        }

        protected void btn_duyuruDEksiClick(object sender, EventArgs e)
        {
            pnl_duyuruDuzenle.Visible = false;
        }
    }
}