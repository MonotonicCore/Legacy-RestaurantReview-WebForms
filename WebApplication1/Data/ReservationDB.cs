using System;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using WebApplication1.Model;

namespace WebApplication1.Data
{
    public class ReservationDB
    {
        public int AddReservation(Reservation reservation)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationAdd");

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RestaurantID", reservation.RestaurantID);

            if (reservation.UserID.HasValue)
            {
                cmd.Parameters.AddWithValue("@UserID", reservation.UserID.Value);
            }

            else
            {
                cmd.Parameters.AddWithValue("@UserID", DBNull.Value);
            }

            cmd.Parameters.AddWithValue("@Name", reservation.Name);
            cmd.Parameters.AddWithValue("@Phone", reservation.Phone);
            cmd.Parameters.AddWithValue("@Email", reservation.Email);
            cmd.Parameters.AddWithValue("@ReservationDate", reservation.ReservationDate);
            cmd.Parameters.AddWithValue("@PartySize", reservation.PartySize);
            cmd.Parameters.AddWithValue("@Comments", reservation.Comments);
            //cmd.Parameters.AddWithValue("@Status", reservation.Status); oops

            return db.DoUpdate(cmd);
        }

        public DataSet GetReservations(int restaurantId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationGetByRestaurant");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

            return db.GetDataSet(cmd);
        }

        public int UpdateReservation(Reservation reservation)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationUpdate");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReservationID", reservation.ReservationID);
            cmd.Parameters.AddWithValue("@ReservationDate", reservation.ReservationDate);
            cmd.Parameters.AddWithValue("@PartySize", reservation.PartySize);
            cmd.Parameters.AddWithValue("@Comments", reservation.Comments);
            cmd.Parameters.AddWithValue("@Status", reservation.Status);

            return db.DoUpdate(cmd);
        }

        public int DeleteReservation(int reservationId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationDelete");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReservationID", reservationId);

            return db.DoUpdate(cmd);
        }

        public int UpdateStatus(int reservationId, string status)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationSetStatus");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReservationID", reservationId);
            cmd.Parameters.AddWithValue("@Status", status);

            return db.DoUpdate(cmd);
        }

        public DataSet GetReservation(int reservationId, int representativeId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReservationGetOne");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReservationID", reservationId);
            cmd.Parameters.AddWithValue("@RepresentativeID", representativeId);

            return db.GetDataSet(cmd);
        }

    }
}