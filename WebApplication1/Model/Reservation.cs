using System;

namespace WebApplication1.Model
{
    public class Reservation
    {
        public int ReservationID { get; set; }

        public int RestaurantID { get; set; }

        // ? for visitors without accounts are also allowed to make reservations
        public int? UserID { get; set; }

        public string Name { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public DateTime ReservationDate { get; set; }

        public int PartySize { get; set; }

        public string Comments { get; set; }

        public string Status { get; set; }
    }
}