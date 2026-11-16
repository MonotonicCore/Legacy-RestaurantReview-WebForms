using System;
using System.Data;
using System.Web.UI.WebControls;

using WebApplication1.Data;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class RestaurantPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                string[] images =
                {
                    "Images/emei.jpg",
                    "Images/duckhouse.jpg",
                    "Images/nanzhou.jpg",
                    "Images/thelove.jpg",
                    "Images/morimoto.jpg",
                    "Images/talula.png",
                    "Images/bluecorn.png"
                };

                string image = images[new Random().Next(images.Length)];

                restaurantTop.Attributes["style"] = "--backgroundImage: url('" + image + "');";
                int restaurantId;

                // Request.QueryString["id"] get URL
                // if the URL is "RestaurantPage.aspx?id=1",
                // then Request.QueryString["id"] will return "1"
                // trparse turn str to int <<<

                if (int.TryParse(Request.QueryString["id"], out restaurantId))
                {
                    LoadRestaurant(restaurantId);

                    LoadRestaurantImage(restaurantId);

                    LoadCuisine(restaurantId);
                    LoadReviews(restaurantId);
                }
            }
        }

        private void LoadRestaurant(int restaurantId)
        {
            RestaurantDB restaurantDB = new RestaurantDB();
            Restaurant restaurant = restaurantDB.GetRestaurant(restaurantId);

            if (restaurant != null)
            {
                lblRestaurant.Text = restaurant.RestaurantName;
                lblAddress.Text = restaurant.Address;

                lblCity.Text = restaurant.City + ", " + restaurant.State + " " + restaurant.ZipCode;

                lblDescription.Text = restaurant.Description;
                lblPhone.Text = restaurant.Phone;
                lblOwner.Text = restaurant.OwnerName;
                lblHours.Text = restaurant.Hours;

                //imgRestaurant.ImageUrl = row["ImageURL"].ToString();
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

                hlWebsite.NavigateUrl = restaurant.WebsiteURL;
                hlWebsite.Text = "Website";

                //hlSocial.NavigateUrl = row["SocialMediaURL"].ToString();
                //hlSocial.Text = "Social Media";
                string socialUrl = restaurant.SocialMediaURL;

                if (socialUrl != "")
                {
                    hlSocial.NavigateUrl = socialUrl;
                    hlSocial.Text = "Social Media";
                    hlSocial.Visible = true;
                }
                else
                {
                    hlSocial.Visible = false;
                }
            }
        }

        private void LoadCuisine(int restaurantId)
        {
            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet ds = restaurantDB.GetCuisines(restaurantId);
            string cuisineText = "";

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (cuisineText != "")
                {
                    cuisineText += ", ";
                }

                cuisineText += row["CuisineName"].ToString();
            }

            lblCuisine.Text = cuisineText;
        }

        private void LoadReviews(int restaurantId)
        {
            ReviewDB reviewDB = new ReviewDB();

            DataSet ds = reviewDB.GetReviews(restaurantId);

            gvReview.DataSource = ds;
            gvReview.DataBind();
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                Response.Redirect("ReviewPage.aspx?id=" + restaurantId);
            }
        }

        // oops
        protected void gvReview_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnHelpful_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int reviewId = int.Parse(btn.CommandArgument);

            ReviewDB reviewDB = new ReviewDB();

            reviewDB.Helpful(reviewId);

            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                LoadReviews(restaurantId);
            }
        }

        protected void btnNotHelpful_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int reviewId = int.Parse(btn.CommandArgument);

            ReviewDB reviewDB = new ReviewDB();

            reviewDB.NotHelpful(reviewId);

            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                LoadReviews(restaurantId);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void btnReservation_Click(object sender, EventArgs e)
        {
            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                Response.Redirect("ReservationPage.aspx?id=" + restaurantId);
            }
        }

        protected string GetReviewImage(object imageData, object contentType)
        {
            if (imageData == DBNull.Value || imageData == null)
            {
                return "";
            }

            byte[] bytes = (byte[])imageData;
            string base64 = Convert.ToBase64String(bytes);

            return "data:" + contentType.ToString() + ";base64," + base64;
        }

        private void LoadRestaurantImage(int restaurantId)
        {
            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet ds = restaurantDB.GetRestaurantImage(restaurantId);

            if (ds.Tables[0].Rows.Count == 0)
            {
                return;
            }

            DataRow row = ds.Tables[0].Rows[0];

            byte[] imageData = (byte[])row["ImageData"];
            string base64 = Convert.ToBase64String(imageData);

            imgRestaurant.ImageUrl = "data:" + row["ContentType"].ToString() + ";base64," + base64;
        }

    }
}