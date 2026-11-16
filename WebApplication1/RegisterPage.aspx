<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebApplication1.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .registerContainer {
            width: 650px;
            margin: 70px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .registerContainer h2 {
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 32px;
        }

        .formGroup {
            margin-bottom: 20px;
        }

        .formGroup label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .formGroup input,
        .formGroup select {
            width: 100%;
            padding: 10px;

            box-sizing: border-box;

            background-color: #eeeeee;
            border: none;
            border-radius: 12px;

            font-size: 14px;
        }

        .buttonArea {
            margin-top: 30px;

            display: flex;
            gap: 10px;
        }

        .buttonArea input {
            padding: 10px 18px;

            background-color: #222;
            color: white;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .buttonArea input:hover {
            background-color: #444;
        }

        .backButton input {
            background-color: #eeeeee;
            color: #222;
        }

        .backButton input:hover {
            background-color: #dddddd;
        }

        .errorMessage {
            display: block;
            margin-top: 20px;
            color: #b00020;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="registerContainer">

            <h2>Create Account</h2>

            <div class="formGroup">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>

            <div class="formGroup">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </div>

            <div class="formGroup">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>

            <div class="formGroup">
                <label>User Type</label>

                <asp:DropDownList ID="ddlUserType" runat="server">
                    <asp:ListItem Text="Reviewer" Value="Reviewer"></asp:ListItem>
                    <asp:ListItem Text="Representative" Value="Representative"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="buttonArea">

                <asp:Button ID="btnRegister" runat="server"
                    Text="Register"
                    OnClick="btnRegister_Click" />

                <span class="backButton">
                    <asp:Button ID="btnBack" runat="server"
                        Text="Back"
                        OnClick="btnBack_Click" />
                </span>

            </div>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

        </div>

    </form>
</body>
</html>