using System;

namespace WebApplication1.Model
{
    public class Review
    {
        public int ReviewID { get; set; }

        public int RestaurantID { get; set; }

        public int UserID { get; set; }

        public string ReviewerName { get; set; }

        public DateTime ReviewDate { get; set; }

        public DateTime VisitDate { get; set; }

        public string ReviewText { get; set; }

        public int OverallRating { get; set; }

        public int FoodRating { get; set; }

        public int ServiceRating { get; set; }

        public int AtmosphereRating { get; set; }

        public int PriceRating { get; set; }

        public int HelpfulCount { get; set; }

        public int NotHelpfulCount { get; set; }
    }
}