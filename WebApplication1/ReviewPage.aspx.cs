using System;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class ReviewPage : System.Web.UI.Page
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
                int restaurantId;

                if (int.TryParse(Request.QueryString["id"], out restaurantId))
                {
                    LoadRestaurant(restaurantId);
                    LoadRatings();

                    txtReviewer.Text = SessionHelper.Username;
                    txtReviewer.ReadOnly = true;
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

        private void LoadRestaurant(int restaurantId)
        {
            RestaurantDB restaurantDB = new RestaurantDB();

            Restaurant restaurant = restaurantDB.GetRestaurant(restaurantId);

            if (restaurant != null)
            {
                lblRestaurant.Text = restaurant.RestaurantName;

                string imageUrl = restaurant.ImageURL;

                if (imageUrl != "")
                {
                    imgRestaurant.ImageUrl = imageUrl;
                    imgRestaurant.Visible = true;
                }
                else
                {
                    imgRestaurant.Visible = false;
                }
            }
        }

        private bool Verify()
        {
            if (txtReviewer.Text.Trim() == "")
            {
                lblError.Text = "Please enter your name.";
                return false;
            }

            if (txtVisitDate.Text.Trim() == "")
            {
                lblError.Text = "Please select your visit date.";
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
                lblError.Text = "Visit date cannot be in the future.";
                return false;
            }

            if (txtReview.Text.Trim() == "")
            {
                lblError.Text = "Please enter a review.";
                return false;
            }

            if (fuReviewImage.HasFile)
            {
                string contentType = fuReviewImage.PostedFile.ContentType;

                if (contentType != "image/jpeg" && contentType != "image/png")
                {
                    lblError.Text = "Please upload a JPG or PNG image.";
                    return false;
                }
            }

            if (fuReviewImage.HasFile && fuReviewImage.PostedFile.ContentLength > 1048576)
            {
                lblError.Text = "Review image must be 1 MB or smaller";
                return false;
            }

            lblError.Text = "";
            return true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (!Verify())
            {
                return;
            }

            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                Review review = new Review();

                review.RestaurantID = restaurantId;
                review.UserID = SessionHelper.UserID;
                review.ReviewerName = SessionHelper.Username;

                review.VisitDate = DateTime.Parse(txtVisitDate.Text);
                review.ReviewText = txtReview.Text.Trim();

                review.OverallRating = int.Parse(ddlOverall.SelectedValue);
                review.FoodRating = int.Parse(ddlFood.SelectedValue);
                review.ServiceRating = int.Parse(ddlService.SelectedValue);
                review.AtmosphereRating = int.Parse(ddlAtmosphere.SelectedValue);
                review.PriceRating = int.Parse(ddlPrice.SelectedValue);

                ReviewDB reviewDB = new ReviewDB();

                int result = reviewDB.AddReview(review);

                if (result > 0)
                {
                    if (fuReviewImage.HasFile)
                    {
                        ReviewImage image = new ReviewImage();

                        image.ReviewID = result;
                        image.FileName = fuReviewImage.FileName;
                        image.ContentType = fuReviewImage.PostedFile.ContentType;
                        image.ImageData = fuReviewImage.FileBytes;

                        reviewDB.AddImage(image);
                    }

                    Response.Redirect("RestaurantPage.aspx?id=" + restaurantId);
                    return;
                }

                lblError.Text = "Unable to submit review.";

                //if (result > 0)
                //{
                //    Response.Redirect("RestaurantPage.aspx?id=" + restaurantId);
                //    return;
                //}

                //lblError.Text = "Unable to submit review";
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                Response.Redirect("RestaurantPage.aspx?id=" + restaurantId);
            }
        }

        protected void ddlAtmosphere_SelectedIndexChanged(object sender, EventArgs e)
        {
            // not needed for now (?)
        }
    }
}