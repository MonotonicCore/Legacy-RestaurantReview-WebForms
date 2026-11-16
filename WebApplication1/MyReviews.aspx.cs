using System;
using System.Data;
using System.Web.UI.WebControls;

using WebApplication1.Data;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class MyReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionHelper.IsLoggedIn())
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (SessionHelper.UserType != "Reviewer")
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadReviews();
            }
        }

        private void LoadReviews()
        {
            ReviewDB reviewDB = new ReviewDB();

            DataSet ds = reviewDB.GetUserReviews(SessionHelper.UserID);

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "You have not written any reviews yet :(";
                gvReviews.Visible = false;
                return;
            }

            lblMessage.Text = "";
            gvReviews.Visible = true;

            gvReviews.DataSource = ds;
            gvReviews.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            int reviewId = Convert.ToInt32(button.CommandArgument);

            ReviewDB reviewDB = new ReviewDB();

            int result = reviewDB.DeleteReview(reviewId, SessionHelper.UserID);

            if (result > 0)
            {
                LoadReviews();
                return;
            }

            lblMessage.Text = "Unable to delete review.";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}