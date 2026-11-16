using System.Web;

namespace WebApplication1.Helpers
{
    public class SessionHelper
    {
        public static int UserID
        {
            get
            {
                if (HttpContext.Current.Session["UserID"] == null)
                    return 0;

                return (int)HttpContext.Current.Session["UserID"];
            }
            set
            {
                HttpContext.Current.Session["UserID"] = value;
            }
        }

        public static string Username
        {
            get
            {
                return HttpContext.Current.Session["Username"]?.ToString();
            }
            set
            {
                HttpContext.Current.Session["Username"] = value;
            }
        }

        public static string UserType
        {
            get
            {
                return HttpContext.Current.Session["UserType"]?.ToString();
            }
            set
            {
                HttpContext.Current.Session["UserType"] = value;
            }
        }

        public static bool IsLoggedIn()
        {
            return UserID != 0;
        }

        public static void Logout()
        {
            HttpContext.Current.Session.Clear();
        }
    }
}