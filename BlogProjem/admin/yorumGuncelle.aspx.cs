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
    public partial class yorumGuncelle : System.Web.UI.Page
    {
        sqlbaglantisi baglan = new sqlbaglantisi();
        string yorumID = "";
        string blogID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }
            
            yorumID = Request.QueryString["yorumID"];
            blogID = Request.QueryString["blogID"];

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(yorumID))
                {
                    SqlCommand cmdygetir = new SqlCommand("SELECT * FROM Yorum WHERE yorumID=@yorumID", baglan.baglan());
                    cmdygetir.Parameters.AddWithValue("@yorumID", yorumID);
                    SqlDataReader dryorum = cmdygetir.ExecuteReader();

                    DataTable dtygetir = new DataTable("tablo");
                    dtygetir.Load(dryorum);

                    if (dtygetir.Rows.Count > 0)
                    {
                        DataRow row = dtygetir.Rows[0];
                        txt_kisi.Text = row["yorumAdSoyad"].ToString();
                        txt_yorum.Text = row["yorumIcerik"].ToString();
                        cb_onay.Checked = Convert.ToBoolean(row["yorumOnay"]);
                    }
                }
            }
        }

        protected void btn_guncelle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(yorumID))
            {
                SqlCommand cmdonay = new SqlCommand("UPDATE Yorum SET yorumAdSoyad=@ad, yorumIcerik=@icerik, yorumOnay=@onay WHERE yorumID=@yorumID", baglan.baglan());
                cmdonay.Parameters.AddWithValue("@ad", txt_kisi.Text);
                cmdonay.Parameters.AddWithValue("@icerik", txt_yorum.Text);
                cmdonay.Parameters.AddWithValue("@onay", cb_onay.Checked);
                cmdonay.Parameters.AddWithValue("@yorumID", yorumID);
                cmdonay.ExecuteNonQuery();


                if (cb_onay.Checked == true)
                {
                    SqlCommand cmdekle = new SqlCommand("update Blog set blogYorumSayisi=blogYorumSayisi+1 where blogID = '" + blogID + "'", baglan.baglan());
                    cmdekle.ExecuteNonQuery();

                }




                Response.Redirect("yorumlar.aspx");
            }
        }

        protected void cb_onay_CheckedChanged(object sender, EventArgs e)
        {
            // Eğer burada bir işlem yapmayacaksanız bu metodu boş bırakabilirsiniz.
        }
    }
}
