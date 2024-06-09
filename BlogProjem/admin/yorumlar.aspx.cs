using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogProjem.admin
{
    public partial class yorumlar : System.Web.UI.Page
    {

        sqlbaglantisi baglan = new sqlbaglantisi();
        string yorumID = "";
        string islem = "";
        string islem2 = "";
        string blogID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            yorumID = Request.QueryString["yorumID"];
            islem = Request.QueryString["islem"];
            islem2 = Request.QueryString["islem2"];
            blogID = Request.QueryString["blogID"];



            if (Page.IsPostBack == false)
            {
                pnl_onaysizYorum.Visible = false;
                pnl_onayliYorum.Visible = false;



                if (islem == "sil")
                {
                    SqlCommand cmdsil = new SqlCommand("delete from Yorum where yorumID='" + yorumID + "'", baglan.baglan());
                    cmdsil.ExecuteNonQuery();

                    SqlCommand cmdazalt = new SqlCommand("update Blog set blogYorumSayisi=blogYorumSayisi-1 where blogID='" + blogID + "'", baglan.baglan());
                    cmdazalt.ExecuteNonQuery();
                }

                if (islem2 == "sil")
                {
                    SqlCommand cmdsil = new SqlCommand("delete from Yorum where yorumID='" + yorumID + "'", baglan.baglan());
                    cmdsil.ExecuteNonQuery();


                    SqlCommand cmdazalt = new SqlCommand("update Blog set blogYorumSayisi=blogYorumSayisi-1 where blogID='" + blogID + "'", baglan.baglan());
                    cmdazalt.ExecuteNonQuery();
                }

                //Onaysız Yorumlar
                string sqlString = "SELECT dbo.Blog.blogBaslik, dbo.Blog.blogID, dbo.Blog.blogYorumSayisi, dbo.Blog.blogTarih, dbo.Blog.blogResim, dbo.Blog.blogOkunma, dbo.Blog.blogIcerik, dbo.Yorum.yorumID, dbo.Yorum.yorumAdSoyad, dbo.Yorum.yorumEmail, dbo.Yorum.yorumIcerik, dbo.Yorum.yorumTarih, dbo.Yorum.yorumOnay, dbo.Yorum.yorumResim, dbo.Yorum.blogID AS Expr2 FROM dbo.Blog INNER JOIN dbo.Yorum ON dbo.Blog.blogID = dbo.Yorum.blogID where yorumOnay = 0";
                SqlCommand cmdyorum = new SqlCommand(sqlString, baglan.baglan());
                SqlDataReader dryorum = cmdyorum.ExecuteReader();

                dl_yorum.DataSource = dryorum;
                dl_yorum.DataBind();


                string sqlStringonay = "SELECT dbo.Blog.blogBaslik, dbo.Blog.blogID, dbo.Blog.blogYorumSayisi, dbo.Blog.blogTarih, dbo.Blog.blogResim, dbo.Blog.blogOkunma, dbo.Blog.blogIcerik, dbo.Yorum.yorumID, dbo.Yorum.yorumAdSoyad, dbo.Yorum.yorumEmail, dbo.Yorum.yorumIcerik, dbo.Yorum.yorumTarih, dbo.Yorum.yorumOnay, dbo.Yorum.yorumResim, dbo.Yorum.blogID AS Expr2 FROM dbo.Blog INNER JOIN dbo.Yorum ON dbo.Blog.blogID = dbo.Yorum.blogID where yorumOnay = 1";
                SqlCommand cmdoyorum = new SqlCommand(sqlStringonay,baglan.baglan());
                SqlDataReader dronayli = cmdoyorum.ExecuteReader();

                dl_onayYorum.DataSource = dronayli;
                dl_onayYorum .DataBind();   

            }

        }

        protected void btn_oyArtiClick(object sender, EventArgs e)
        {
            pnl_onaysizYorum.Visible = true;
        }

        protected void btn_oyEksiClick(object sender, EventArgs e)
        {
            pnl_onaysizYorum.Visible = false;
        }

        protected void btn_onyArtiClick(object sender, EventArgs e)
        {
            pnl_onayliYorum.Visible = true; 
        }

        protected void btn_onyEksiClick(object sender, EventArgs e)
        {
            pnl_onayliYorum.Visible = false;
        }

    }
}