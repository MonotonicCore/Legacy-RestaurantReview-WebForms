using System;
using System.Data;
using System.Web.UI.WebControls;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class ManageRestaurantReviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionHelper.IsLoggedIn())
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (SessionHelper.UserType != "Representative")
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
            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet restaurantData = restaurantDB.GetRestaurantByRepresentative(SessionHelper.UserID);

            if (restaurantData.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "You have no restaurant assigned.";
                gvReviews.Visible = false;
                return;
            }

            int restaurantId = Convert.ToInt32(restaurantData.Tables[0].Rows[0]["RestaurantId"]);

            ReviewDB reviewDB = new ReviewDB();

            DataSet reviewData = reviewDB.GetReviews(restaurantId);

            if (reviewData.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "There are no reviews.";
                gvReviews.Visible = false;
                return;
            }

            lblMessage.Text = "";
            gvReviews.Visible = true;

            gvReviews.DataSource = reviewData;
            gvReviews.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnRespond_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int reviewId = int.Parse(button.CommandArgument);

            GridViewRow row = (GridViewRow)button.NamingContainer;
            TextBox txtResponse = (TextBox)row.FindControl("txtResponse");

            if (txtResponse.Text.Trim() == "")
            {
                lblMessage.Text = "Enter a response.";
                return;
            }

            ReviewResponse response = new ReviewResponse();

            response.ReviewID = reviewId;
            response.RepresentativeID = SessionHelper.UserID;
            response.ResponseText = txtResponse.Text.Trim();
            response.ResponseDate = DateTime.Now;

            ReviewDB reviewDB = new ReviewDB();

            reviewDB.AddResponse(response);

            lblMessage.Text = "Response submitted.";

            LoadReviews();
        }

        protected void gvReviews_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}