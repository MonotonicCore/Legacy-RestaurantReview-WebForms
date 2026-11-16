using System;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using WebApplication1.Model;

namespace WebApplication1.Data
{
    public class ReviewDB
    {
        public DataSet GetReviews(int restaurantId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewGetByRestaurant");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

            return db.GetDataSet(cmd);
        }


        public DataSet GetReview(int reviewId, int userId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewGetOne");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", reviewId);
            cmd.Parameters.AddWithValue("@UserID", userId);

            return db.GetDataSet(cmd);
        }


        public DataSet GetUserReviews(int userId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewGetByUser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserID", userId);

            return db.GetDataSet(cmd);
        }


        public int AddReview(Review review)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", review.RestaurantID);
            cmd.Parameters.AddWithValue("@UserID", review.UserID);
            cmd.Parameters.AddWithValue("@ReviewerName", review.ReviewerName);
            cmd.Parameters.AddWithValue("@VisitDate", review.VisitDate);
            cmd.Parameters.AddWithValue("@ReviewText", review.ReviewText);
            cmd.Parameters.AddWithValue("@OverallRating", review.OverallRating);
            cmd.Parameters.AddWithValue("@FoodRating", review.FoodRating);
            cmd.Parameters.AddWithValue("@ServiceRating", review.ServiceRating);
            cmd.Parameters.AddWithValue("@AtmosphereRating", review.AtmosphereRating);
            cmd.Parameters.AddWithValue("@PriceRating", review.PriceRating);

            DataSet ds = db.GetDataSet(cmd);

            return Convert.ToInt32(ds.Tables[0].Rows[0]["ReviewID"]);
        }


        public int UpdateReview(Review review)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewUpdate");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", review.ReviewID);
            cmd.Parameters.AddWithValue("@UserID", review.UserID);
            cmd.Parameters.AddWithValue("@VisitDate", review.VisitDate);
            cmd.Parameters.AddWithValue("@ReviewText", review.ReviewText);
            cmd.Parameters.AddWithValue("@OverallRating", review.OverallRating);
            cmd.Parameters.AddWithValue("@FoodRating", review.FoodRating);
            cmd.Parameters.AddWithValue("@ServiceRating", review.ServiceRating);
            cmd.Parameters.AddWithValue("@AtmosphereRating", review.AtmosphereRating);
            cmd.Parameters.AddWithValue("@PriceRating", review.PriceRating);

            return db.DoUpdate(cmd);
        }


        public int DeleteReview(int reviewId, int userId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewDelete");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", reviewId);
            cmd.Parameters.AddWithValue("@UserID", userId);

            return db.DoUpdate(cmd);
        }


        public int Helpful(int reviewId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewHelpful");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", reviewId);

            return db.DoUpdate(cmd);
        }


        public int NotHelpful(int reviewId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewNotHelpful");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", reviewId);

            return db.DoUpdate(cmd);
        }


        public int AddImage(ReviewImage image)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewImageAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", image.ReviewID);
            cmd.Parameters.AddWithValue("@FileName", image.FileName);
            cmd.Parameters.AddWithValue("@ContentType", image.ContentType);
            cmd.Parameters.AddWithValue("@ImageData", image.ImageData);

            return db.DoUpdate(cmd);
        }


        public int AddResponse(ReviewResponse response)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_ReviewResponseAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReviewID", response.ReviewID);
            cmd.Parameters.AddWithValue("@RepresentativeID", response.RepresentativeID);
            cmd.Parameters.AddWithValue("@ResponseText", response.ResponseText);

            return db.DoUpdate(cmd);
        }
    }
}