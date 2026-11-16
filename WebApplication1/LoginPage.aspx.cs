using System;
using WebApplication1.Data;
using WebApplication1.Helpers;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserDB userDB = new UserDB();

            User user = userDB.Login(
                txtUsername.Text.Trim(),
                txtPassword.Text.Trim()
            );

            if (user == null)
            {
                lblError.Text = "Invalid username or password";
                return;
            }

            SessionHelper.UserID = user.UserID;
            SessionHelper.Username = user.Username;
            SessionHelper.UserType = user.UserType;

            Response.Redirect("Dashboard.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}