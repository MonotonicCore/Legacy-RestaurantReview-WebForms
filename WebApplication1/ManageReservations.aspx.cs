using System;
using System.Data;
using System.Web.UI.WebControls;

using WebApplication1.Data;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class ManageReservations : System.Web.UI.Page
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
                LoadReservations();
            }
        }

        private void LoadReservations()
        {
            RestaurantDB restaurantDB = new RestaurantDB();

            DataSet restaurantData = restaurantDB.GetRestaurantByRepresentative(SessionHelper.UserID);

            if (restaurantData.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "You dont have a restaurant";
                gvReservations.Visible = false;
                return;
            }

            int restaurantId = Convert.ToInt32(restaurantData.Tables[0].Rows[0]["RestaurantId"]);

            ReservationDB reservationDB = new ReservationDB();

            DataSet reservationData = reservationDB.GetReservations(restaurantId);

            if (reservationData.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "There are no reservations.";
                gvReservations.Visible = false;
                return;
            }

            lblMessage.Text = "";
            gvReservations.Visible = true;

            gvReservations.DataSource = reservationData;
            gvReservations.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            int reservationId = Convert.ToInt32(button.CommandArgument);

            ReservationDB reservationDB = new ReservationDB();

            int result = reservationDB.UpdateStatus(reservationId, "Confirmed");

            if (result > 0)
            {
                LoadReservations();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            int reservationId = Convert.ToInt32(button.CommandArgument);

            ReservationDB reservationDB = new ReservationDB();

            int result = reservationDB.DeleteReservation(reservationId);

            if (result > 0)
            {
                LoadReservations();
            }
        }


    }
}