using System;
using System.Data;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class EditReservation : System.Web.UI.Page
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
                int reservationId;

                if (int.TryParse(Request.QueryString["id"], out reservationId))
                {
                    LoadReservation(reservationId);
                }
                else
                {
                    lblError.Text = "Invalid reservation.";
                    btnSave.Enabled = false;
                }
            }
        }


        private void LoadReservation(int reservationId)
        {
            ReservationDB reservationDB = new ReservationDB();

            DataSet ds = reservationDB.GetReservation(
                reservationId,
                SessionHelper.UserID
            );

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Reservation not found.";
                btnSave.Enabled = false;
                return;
            }

            DataRow row = ds.Tables[0].Rows[0];

            DateTime reservationDate = Convert.ToDateTime(row["ReservationDate"]);

            txtReservationDate.Text = reservationDate.ToString("yyyy-MM-ddTHH:mm");

            ddlPartySize.SelectedValue = row["PartySize"].ToString();

            txtComments.Text = row["Comments"].ToString();

            ddlStatus.SelectedValue = row["Status"].ToString();
        }

        private bool Verify()
        {
            DateTime reservationDate;

            if (!DateTime.TryParse(
                txtReservationDate.Text,
                out reservationDate))
            {
                lblError.Text = "Please enter a valid date and time and try again";
                return false;
            }

            if (reservationDate <= DateTime.Now)
            {
                lblError.Text = "Reservation must be in the future";
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

            int reservationId;
            if (int.TryParse(Request.QueryString["id"], out reservationId))
            {
                Reservation reservation = new Reservation();

                reservation.ReservationID = reservationId;
                reservation.ReservationDate = DateTime.Parse(txtReservationDate.Text);
                reservation.PartySize = int.Parse(ddlPartySize.SelectedValue);
                reservation.Comments = txtComments.Text.Trim();
                reservation.Status = ddlStatus.SelectedValue;

                ReservationDB reservationDB = new ReservationDB();

                int result = reservationDB.UpdateReservation(reservation);

                if (result > 0)
                {
                    Response.Redirect("ManageReservations.aspx");
                    return;
                }

                lblError.Text = "Unable to update reservation.";
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageReservations.aspx");
        }
    }
}