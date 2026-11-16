using System;
using System.Collections.Generic;
using System.Data;
using WebApplication1.Data;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRestaurants();

                if (SessionHelper.IsLoggedIn())
                {
                    btnLogin.Visible = false;
                    btnRegister.Visible = false;

                    btnDashboard.Visible = true;
                    btnLogout.Visible = true;
                }
                else
                {
                    btnLogin.Visible = true;
                    btnRegister.Visible = true;

                    btnDashboard.Visible = false;
                    btnLogout.Visible = false;
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cblCuisine_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void LoadRestaurants()
        {
            List<string> cuisines = new List<string>();

            for (int i = 0; i < cblCuisine.Items.Count; i++)
            {
                if (cblCuisine.Items[i].Selected)
                {
                    cuisines.Add(cblCuisine.Items[i].Value);
                }
            }

            string cuisineText = string.Join(",", cuisines);

            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet ds = restaurantDB.SearchRestaurants(txtCity.Text.Trim(), txtState.Text.Trim(), cuisineText);

            gvRestaurant.DataSource = ds;
            gvRestaurant.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRestaurants();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            SessionHelper.Logout();
            Response.Redirect("MainPage.aspx");
        }
    }
}