using System;
using System.Data.SqlClient;
using System.Web.UI;

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

                // Scriptleri oluştur ve sayfaya ekle
                ClientScript.RegisterStartupScript(this.GetType(), "charts", $@"
                    var yorumCount = {yorumCount};
                    var kullaniciCount = {kullaniciCount};
                    var blogCount = {blogCount};
                    var kategoriCount = {kategoriCount};
                ", true);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
