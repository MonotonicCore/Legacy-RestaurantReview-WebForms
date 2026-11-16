using System;
using System.Data;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;


namespace WebApplication1
{
    public partial class ManageRestaurant : System.Web.UI.Page
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
                LoadRestaurant();
            }
        }

        private void LoadRestaurant()
        {
            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet ds = restaurantDB.GetRestaurantByRepresentative(
                SessionHelper.UserID
            );

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblTitle.Text = "Add Restaurant";
                hfRestaurantID.Value = "";
                return;
            }

            DataRow row = ds.Tables[0].Rows[0];

            lblTitle.Text = "Edit Restaurant";

            hfRestaurantID.Value = row["RestaurantId"].ToString();

            txtRestaurantName.Text = row["RestaurantName"].ToString();
            txtAddress.Text = row["Address"].ToString();
            txtCity.Text = row["City"].ToString();
            txtState.Text = row["State"].ToString();
            txtZipCode.Text = row["ZipCode"].ToString();
            txtDescription.Text = row["Description"].ToString();
            txtPhone.Text = row["Phone"].ToString();
            txtOwnerName.Text = row["OwnerName"].ToString();
            txtWebsite.Text = row["WebsiteURL"].ToString();
            txtSocialMedia.Text = row["SocialMediaURL"].ToString();
            txtHours.Text = row["Hours"].ToString();
        }

        private bool Verify()
        {
            if (txtRestaurantName.Text.Trim() == "")
            {
                lblError.Text = "Please enter a restaurant name.";
                return false;
            }

            if (txtAddress.Text.Trim() == "")
            {
                lblError.Text = "Please enter an address.";
                return false;
            }

            if (txtCity.Text.Trim() == "")
            {
                lblError.Text = "Please enter a city.";
                return false;
            }

            if (txtState.Text.Trim() == "")
            {
                lblError.Text = "Please enter a state.";
                return false;
            }

            if (txtZipCode.Text.Trim() == "")
            {
                lblError.Text = "Please enter a zip code.";
                return false;
            }

            lblError.Text = "";
            return true;
        }

        private Restaurant GetRestaurantFromForm()
        {
            Restaurant restaurant = new Restaurant();

            restaurant.RepresentativeID = SessionHelper.UserID;
            restaurant.RestaurantName = txtRestaurantName.Text.Trim();
            restaurant.Address = txtAddress.Text.Trim();
            restaurant.City = txtCity.Text.Trim();
            restaurant.State = txtState.Text.Trim();
            restaurant.ZipCode = txtZipCode.Text.Trim();
            restaurant.Description = txtDescription.Text.Trim();
            restaurant.Phone = txtPhone.Text.Trim();
            restaurant.OwnerName = txtOwnerName.Text.Trim();
            restaurant.WebsiteURL = txtWebsite.Text.Trim();
            restaurant.SocialMediaURL = txtSocialMedia.Text.Trim();
            restaurant.Hours = txtHours.Text.Trim();

            return restaurant;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Verify())
            {
                return;
            }

            Restaurant restaurant = GetRestaurantFromForm();

            RestaurantDB restaurantDB = new RestaurantDB();

            int result;

            if (hfRestaurantID.Value == "")
            {
                result = restaurantDB.AddRestaurant(restaurant);
            }
            else
            {
                restaurant.RestaurantID =
                    Convert.ToInt32(hfRestaurantID.Value);

                result = restaurantDB.UpdateRestaurant(restaurant);
            }

            if (result > 0)
            {
                lblError.Text = "Restaurant saved successfully.";

                LoadRestaurant();
                return;
            }

            lblError.Text = "Unable to save restaurant.";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            if (hfRestaurantID.Value == "")
            {
                lblError.Text = "Please save the restaurant before uploading an image.";
                return;
            }

            if (!fuRestaurantImage.HasFile)
            {
                lblError.Text = "Please choose an image.";
                return;
            }

            if (fuRestaurantImage.PostedFile.ContentLength > 1048576)
            {
                lblError.Text = "Image must be 1 MB or smaller.";
                return;
            }

            RestaurantImage image = new RestaurantImage();

            image.RestaurantID = Convert.ToInt32(hfRestaurantID.Value);
            image.FileName = fuRestaurantImage.FileName;
            image.ContentType = fuRestaurantImage.PostedFile.ContentType;
            image.ImageData = fuRestaurantImage.FileBytes;
            image.Caption = txtImageCaption.Text.Trim();

            RestaurantDB restaurantDB = new RestaurantDB();

            int result = restaurantDB.AddImage(image);

            if (result > 0)
            {
                lblError.Text = "Image uploaded successfully.";
                txtImageCaption.Text = "";
                return;
            }

            lblError.Text = "Unable to upload image.";
        }
    }
}