using System;
using System.Data;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class EditReview : System.Web.UI.Page
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
                LoadRatings();

                int reviewId;

                if (int.TryParse(Request.QueryString["id"], out reviewId))
                {
                    LoadReview(reviewId);
                }
                else
                {
                    lblError.Text = "Invalid review, sorry.";
                }
            }
        }

        private void LoadRatings()
        {
            for (int i = 1; i <= 5; i++)
            {
                ddlOverall.Items.Add(i.ToString());
                ddlFood.Items.Add(i.ToString());
                ddlService.Items.Add(i.ToString());
                ddlAtmosphere.Items.Add(i.ToString());
                ddlPrice.Items.Add(i.ToString());
            }
        }

        private void LoadReview(int reviewId)
        {
            ReviewDB reviewDB = new ReviewDB();

            DataSet ds = reviewDB.GetReview(
                reviewId,
                SessionHelper.UserID
            );

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Review not found.";
                btnSave.Enabled = false;
                return;
            }

            DataRow row = ds.Tables[0].Rows[0];

            txtVisitDate.Text =
                Convert.ToDateTime(row["VisitDate"]).ToString("yyyy-MM-dd");

            txtReview.Text = row["ReviewText"].ToString();

            ddlOverall.SelectedValue = row["OverallRating"].ToString();
            ddlFood.SelectedValue = row["FoodRating"].ToString();
            ddlService.SelectedValue = row["ServiceRating"].ToString();
            ddlAtmosphere.SelectedValue = row["AtmosphereRating"].ToString();
            ddlPrice.SelectedValue = row["PriceRating"].ToString();
        }

        private bool Verify()
        {
            if (txtVisitDate.Text.Trim() == "")
            {
                lblError.Text = "Please select a visit date.";
                return false;
            }

            DateTime visitDate;

            if (!DateTime.TryParse(txtVisitDate.Text, out visitDate))
            {
                lblError.Text = "Please enter a valid visit date.";
                return false;
            }

            if (visitDate > DateTime.Today)
            {
                lblError.Text = "Visit date can't be in the future.";
                return false;
            }

            if (txtReview.Text.Trim() == "")
            {
                lblError.Text = "Please enter a review.";
                return false;
            }

            lblError.Text = "";
            return true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Verify())
            {
                return;
            }

            int reviewId;

            if (int.TryParse(Request.QueryString["id"], out reviewId))
            {
                Review review = new Review();

                review.ReviewID = reviewId;
                review.UserID = SessionHelper.UserID;

                review.VisitDate = DateTime.Parse(txtVisitDate.Text);
                review.ReviewText = txtReview.Text.Trim();

                review.OverallRating = int.Parse(ddlOverall.SelectedValue);
                review.FoodRating = int.Parse(ddlFood.SelectedValue);
                review.ServiceRating = int.Parse(ddlService.SelectedValue);
                review.AtmosphereRating = int.Parse(ddlAtmosphere.SelectedValue);
                review.PriceRating = int.Parse(ddlPrice.SelectedValue);

                ReviewDB reviewDB = new ReviewDB();

                int result = reviewDB.UpdateReview(review);

                if (result > 0)
                {
                    Response.Redirect("MyReviews.aspx");
                    return;
                }

                lblError.Text = "Unable to update review";
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyReviews.aspx");
        }
    }
}