using System;

using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionHelper.IsLoggedIn())
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblUsername.Text = SessionHelper.Username;

                pnlReviewer.Visible = SessionHelper.UserType == "Reviewer";

                pnlRepresentative.Visible = SessionHelper.UserType == "Representative";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            SessionHelper.Logout();
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void btnMyReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyReviews.aspx");
        }

        protected void btnRestaurant_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRestaurant.aspx");
        }

        protected void btnReservations_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageReservations.aspx");
        }

        protected void btnRestaurantReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRestaurantReviews.aspx");
        }
    }
}