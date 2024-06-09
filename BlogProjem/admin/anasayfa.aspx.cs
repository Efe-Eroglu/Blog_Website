using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using Newtonsoft.Json;

namespace BlogProjem.admin
{
    public partial class anasayfa : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yoneticiKullanici"] == null)
            {
                Response.Redirect("default.aspx");
            }

            if (!IsPostBack)
            {
                GetStatistics();
            }
        }

        private void GetStatistics()
        {
            sqlbaglantisi baglan = new sqlbaglantisi();
            SqlConnection connection = baglan.baglan();

            try
            {
                // Yorum sayısı
                SqlCommand yorumCmd = new SqlCommand("SELECT COUNT(*) FROM Yorum", connection);
                int yorumCount = (int)yorumCmd.ExecuteScalar();

                // Kullanıcı sayısı
                SqlCommand kullaniciCmd = new SqlCommand("SELECT COUNT(*) FROM Kullanici", connection);
                int kullaniciCount = (int)kullaniciCmd.ExecuteScalar();

                // Blog sayısı
                SqlCommand blogCmd = new SqlCommand("SELECT COUNT(*) FROM Blog", connection);
                int blogCount = (int)blogCmd.ExecuteScalar();

                // Kategori sayısı
                SqlCommand kategoriCmd = new SqlCommand("SELECT COUNT(*) FROM Kategori", connection);
                int kategoriCount = (int)kategoriCmd.ExecuteScalar();

                // Kategorilere göre blog sayıları
                SqlCommand kategoriBlogCmd = new SqlCommand(
                    "SELECT Kategori.kategoriAd, COUNT(Blog.blogID) AS BlogSayisi " +
                    "FROM Kategori " +
                    "LEFT JOIN Blog ON Kategori.kategoriID = Blog.kategoriID " +
                    "GROUP BY Kategori.kategoriAd", connection);

                SqlDataReader reader = kategoriBlogCmd.ExecuteReader();

                var kategoriAdlari = new List<string>();
                var blogSayilari = new List<int>();

                while (reader.Read())
                {
                    kategoriAdlari.Add(reader["kategoriAd"].ToString()); 
                    blogSayilari.Add((int)reader["BlogSayisi"]);
                }
                reader.Close();

                // Scriptleri oluştur ve sayfaya ekle
                string script = $@"
                    var yorumCount = {yorumCount};
                    var kullaniciCount = {kullaniciCount};
                    var blogCount = {blogCount};
                    var kategoriCount = {kategoriCount};
                    var kategoriAdlari = {JsonConvert.SerializeObject(kategoriAdlari)};
                    var blogSayilari = {JsonConvert.SerializeObject(blogSayilari)};
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "charts", script, true);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
