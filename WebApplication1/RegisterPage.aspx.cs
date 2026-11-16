using System;

using WebApplication1.Data;
using WebApplication1.Model;

namespace WebApplication1
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (!Verify())
            {
                return;
            }

            User user = new User();

            user.Username = txtUsername.Text.Trim();
            user.Password = txtPassword.Text.Trim();
            user.Email = txtEmail.Text.Trim();
            user.UserType = ddlUserType.SelectedValue;

            UserDB userDB = new UserDB();

            int result = userDB.AddUser(user);

            if (result > 0)
            {
                Response.Redirect("LoginPage.aspx");
            }

            lblError.Text = "Unable to create account";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }


        private bool Verify()
        {
            if (txtUsername.Text.Trim() == "")
            {
                lblError.Text = "Please enter a username.";
                return false;
            }

            if (txtPassword.Text.Trim() == "")
            {
                lblError.Text = "Please enter a password.";
                return false;
            }

            if (txtEmail.Text.Trim() == "")
            {
                lblError.Text = "Please enter an email.";
                return false;
            }

            lblError.Text = "";
            return true;
        }

    }
}