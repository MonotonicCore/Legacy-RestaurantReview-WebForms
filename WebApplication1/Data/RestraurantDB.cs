using System;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using WebApplication1.Model;

namespace WebApplication1.Data
{
    public class RestaurantDB
    {
        public Restaurant GetRestaurant(int restaurantId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantGet");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

            DataSet ds = db.GetDataSet(cmd);

            if (ds.Tables[0].Rows.Count == 0)
            {
                return null;
            }

            DataRow row = ds.Tables[0].Rows[0];

            Restaurant restaurant = new Restaurant();

            restaurant.RestaurantID = Convert.ToInt32(row["RestaurantID"]);

            if (row["RepresentativeID"] != DBNull.Value)
            {
                restaurant.RepresentativeID = Convert.ToInt32(row["RepresentativeID"]);
            }

            restaurant.RestaurantName = row["RestaurantName"].ToString();
            restaurant.Address = row["Address"].ToString();
            restaurant.City = row["City"].ToString();
            restaurant.State = row["State"].ToString();
            restaurant.ZipCode = row["ZipCode"].ToString();
            restaurant.Description = row["Description"].ToString();
            restaurant.Phone = row["Phone"].ToString();
            restaurant.OwnerName = row["OwnerName"].ToString();
            restaurant.WebsiteURL = row["WebsiteURL"].ToString();
            restaurant.SocialMediaURL = row["SocialMediaURL"].ToString();
            restaurant.Hours = row["Hours"].ToString();
            restaurant.ImageURL = row["ImageURL"].ToString();

            return restaurant;
        }

        public DataSet SearchRestaurants(string city, string state, string cuisines)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantSearch");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@State", state);
            cmd.Parameters.AddWithValue("@Cuisines", cuisines);

            return db.GetDataSet(cmd);
        }

        public DataSet GetCuisines(int restaurantId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantGetCuisines");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

            return db.GetDataSet(cmd);
        }

        public int AddRestaurant(Restaurant restaurant)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RepresentativeID", restaurant.RepresentativeID);
            cmd.Parameters.AddWithValue("@RestaurantName", restaurant.RestaurantName);
            cmd.Parameters.AddWithValue("@Address", restaurant.Address);
            cmd.Parameters.AddWithValue("@City", restaurant.City);
            cmd.Parameters.AddWithValue("@State", restaurant.State);
            cmd.Parameters.AddWithValue("@ZipCode", restaurant.ZipCode);
            cmd.Parameters.AddWithValue("@Description", restaurant.Description);
            cmd.Parameters.AddWithValue("@Phone", restaurant.Phone);
            cmd.Parameters.AddWithValue("@OwnerName", restaurant.OwnerName);
            cmd.Parameters.AddWithValue("@WebsiteURL", restaurant.WebsiteURL);
            cmd.Parameters.AddWithValue("@SocialMediaURL", restaurant.SocialMediaURL);
            cmd.Parameters.AddWithValue("@Hours", restaurant.Hours);

            return db.DoUpdate(cmd);
        }

        public int UpdateRestaurant(Restaurant restaurant)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantUpdate");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurant.RestaurantID);
            cmd.Parameters.AddWithValue("@RepresentativeID", restaurant.RepresentativeID);
            cmd.Parameters.AddWithValue("@RestaurantName", restaurant.RestaurantName);
            cmd.Parameters.AddWithValue("@Address", restaurant.Address);
            cmd.Parameters.AddWithValue("@City", restaurant.City);
            cmd.Parameters.AddWithValue("@State", restaurant.State);
            cmd.Parameters.AddWithValue("@ZipCode", restaurant.ZipCode);
            cmd.Parameters.AddWithValue("@Description", restaurant.Description);
            cmd.Parameters.AddWithValue("@Phone", restaurant.Phone);
            cmd.Parameters.AddWithValue("@OwnerName", restaurant.OwnerName);
            cmd.Parameters.AddWithValue("@WebsiteURL", restaurant.WebsiteURL);
            cmd.Parameters.AddWithValue("@SocialMediaURL", restaurant.SocialMediaURL);
            cmd.Parameters.AddWithValue("@Hours", restaurant.Hours);

            return db.DoUpdate(cmd);
        }

        public int AddImage(RestaurantImage image)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantImageAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", image.RestaurantID);
            cmd.Parameters.AddWithValue("@FileName", image.FileName);
            cmd.Parameters.AddWithValue("@ContentType", image.ContentType);
            cmd.Parameters.AddWithValue("@ImageData", image.ImageData);
            cmd.Parameters.AddWithValue("@Caption", image.Caption);

            return db.DoUpdate(cmd);
        }

        public DataSet GetRestaurantByRepresentative(int representativeId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantGetByRepresentative");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RepresentativeID", representativeId);

            return db.GetDataSet(cmd);
        }

        public DataSet GetRestaurantImage(int restaurantId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_RestaurantImageGet");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

            return db.GetDataSet(cmd);
        }


    }
}