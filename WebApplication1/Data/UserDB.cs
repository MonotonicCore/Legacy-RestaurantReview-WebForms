using System;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using WebApplication1.Model;

namespace WebApplication1.Data
{
    public class UserDB
    {
        public User Login(string username, string password)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_UserLogin");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);

            DataSet ds = db.GetDataSet(cmd);

            if (ds.Tables[0].Rows.Count == 0)
            {
                return null;
            }

            DataRow row = ds.Tables[0].Rows[0];

            User user = new User();

            user.UserID = Convert.ToInt32(row["UserID"]);
            user.Username = row["Username"].ToString();
            user.Password = row["Password"].ToString();
            user.Email = row["Email"].ToString();
            user.UserType = row["UserType"].ToString();

            return user;
        }

        public int AddUser(User user)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_UserAdd");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Username", user.Username);
            cmd.Parameters.AddWithValue("@Password", user.Password);
            cmd.Parameters.AddWithValue("@Email", user.Email);
            cmd.Parameters.AddWithValue("@UserType", user.UserType);

            return db.DoUpdate(cmd);
        }

        public User GetUser(int userId)
        {
            DBConnect db = new DBConnect();

            SqlCommand cmd = new SqlCommand("sp_UserGet");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserID", userId);

            DataSet ds = db.GetDataSet(cmd);

            if (ds.Tables[0].Rows.Count == 0)
            {
                return null;
            }

            DataRow row = ds.Tables[0].Rows[0];

            User user = new User();

            user.UserID = Convert.ToInt32(row["UserID"]);
            user.Username = row["Username"].ToString();
            user.Password = row["Password"].ToString();
            user.Email = row["Email"].ToString();
            user.UserType = row["UserType"].ToString();

            return user;
        }
    }
}