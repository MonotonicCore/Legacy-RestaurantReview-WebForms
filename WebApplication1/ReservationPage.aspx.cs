using System;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class ReservationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        private bool Verify()
        {
            if (txtName.Text.Trim() == "")
            {
                lblError.Text = "Please enter your name.";
                return false;
            }

            if (txtPhone.Text.Trim() == "")
            {
                lblError.Text = "Please enter your phone number.";
                return false;
            }

            if (txtEmail.Text.Trim() == "")
            {
                lblError.Text = "Please enter your email.";
                return false;
            }

            DateTime reservationDate;

            if (!DateTime.TryParse(txtReservationDate.Text, out reservationDate))
            {
                lblError.Text = "Please select a reservation date and time.";
                return false;
            }

            if (reservationDate <= DateTime.Now)
            {
                lblError.Text = "Reservation must be in the future.";
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

            if (!int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                lblError.Text = "Invalid restaurant.";
                return;
            }

            Reservation reservation = new Reservation();

            reservation.RestaurantID = restaurantId;

            if (SessionHelper.IsLoggedIn())
            {
                reservation.UserID = SessionHelper.UserID;
            }

            else
            {
                reservation.UserID = null;
            }

            reservation.Name = txtName.Text.Trim();
            reservation.Phone = txtPhone.Text.Trim();
            reservation.Email = txtEmail.Text.Trim();
            reservation.ReservationDate = DateTime.Parse(txtReservationDate.Text);
            reservation.PartySize = int.Parse(ddlPartySize.SelectedValue);
            reservation.Comments = txtComments.Text.Trim();

            ReservationDB reservationDB = new ReservationDB();

            int result = reservationDB.AddReservation(reservation);

            if (result > 0)
            {
                lblError.Text = "Reservation had been submitted successfully!";
                return;
            }

            lblError.Text = "Unable to submit reservation.";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            int restaurantId;

            if (int.TryParse(Request.QueryString["id"], out restaurantId))
            {
                Response.Redirect("RestaurantPage.aspx?id=" + restaurantId);
            }

        }
    }
}