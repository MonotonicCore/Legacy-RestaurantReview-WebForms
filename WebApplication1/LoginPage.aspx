<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <style>
        body {
            margin: 0;
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .loginBox {
            width: 520px;
            margin: 90px auto;
            padding: 35px;

            background-color: #222222;
            border: 10px solid #888888;
            border-radius: 14px;

            box-sizing: border-box;
            color: white;
        }

        .loginBox h2 {
            margin-top: 0;
            margin-bottom: 30px;

            font-size: 32px;
            font-weight: normal;
        }

        .fieldGroup {
            margin-bottom: 22px;
        }

        .fieldGroup label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .fieldGroup input {
            width: 100%;
            padding: 10px;

            box-sizing: border-box;

            background-color: #111111;
            color: white;

            border: 1px solid #666666;
            border-radius: 3px;
        }

        .buttonArea {
            margin-top: 25px;
        }

        .buttonArea input {
            padding: 9px 18px;
            margin-right: 10px;

            background-color: #eeeeee;
            color: black;

            border: none;
            border-radius: 3px;

            cursor: pointer;
        }

        .buttonArea input:hover {
            background-color: white;
        }

        .errorMessage {
            display: block;
            margin-bottom: 20px;
            color: #ff8c8c;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="loginBox">

            <h2>LOGIN</h2>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

            <div class="fieldGroup">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>

            <div class="fieldGroup">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div class="buttonArea">

                <asp:Button ID="btnLogin"
                    runat="server"
                    OnClick="btnLogin_Click"
                    Text="Login" />

                <asp:Button ID="btnRegister"
                    runat="server"
                    OnClick="btnRegister_Click"
                    Text="Register" />

            </div>

        </div>

    </form>
</body>
</html>