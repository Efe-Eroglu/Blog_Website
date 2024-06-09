using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace BlogProjem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["kullanici"] != null)
                {
                    HtmlAnchor loginLink = (HtmlAnchor)FindControl("loginLink");
                    HtmlAnchor registerLink = (HtmlAnchor)FindControl("registerLink");

                    if (loginLink != null)
                    {
                        loginLink.Visible = false;
                    }

                    if (registerLink != null)
                    {
                        registerLink.Visible = false;
                    }
                }
            }
        }
    }
}
