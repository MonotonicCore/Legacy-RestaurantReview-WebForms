<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication1.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .dashboardContainer {
            width: 850px;
            margin: 70px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .welcomeArea {
            margin-bottom: 30px;
        }

        .welcomeArea h2 {
            margin: 0;
            font-size: 32px;
        }

        .dashboardCard {
            background-color: #eeeeee;
            padding: 28px;
            margin-bottom: 20px;

            border-radius: 18px;
        }

        .dashboardCard h3 {
            margin-top: 0;
            margin-bottom: 12px;
        }

        .dashboardCard p {
            margin-top: 0;
            margin-bottom: 20px;
            color: #555;
        }

        .buttonArea {
            display: flex;
            flex-wrap: wrap;
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

        .bottomArea {
            display: flex;
            justify-content: space-between;

            margin-top: 30px;
            padding-top: 20px;

            border-top: 1px solid #ddd;
        }

        .bottomArea input {
            padding: 10px 18px;

            background-color: #eeeeee;
            color: #222;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .bottomArea input:hover {
            background-color: #dddddd;
        }

        .errorMessage {
            display: block;
            margin-top: 15px;
            color: #b00020;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="dashboardContainer">

            <div class="welcomeArea">
                <h2>
                    Welcome, <asp:Label ID="lblUsername" runat="server"></asp:Label>
                </h2>
            </div>


            <asp:Panel ID="pnlReviewer" runat="server" CssClass="dashboardCard">

                <h3>Reviewer Dashboard</h3>

                <p>
                    View and manage your restaurant reviews.
                </p>

                <div class="buttonArea">

                    <asp:Button ID="btnMyReviews" runat="server"
                        Text="My Reviews"
                        OnClick="btnMyReviews_Click" />

                </div>

            </asp:Panel>


            <asp:Panel ID="pnlRepresentative" runat="server" CssClass="dashboardCard">

                <h3>Restaurant Representative Dashboard</h3>

                <p>
                    Manage your restaurant, reservations, and customer reviews.
                </p>

                <div class="buttonArea">

                    <asp:Button ID="btnRestaurant" runat="server"
                        Text="My Restaurant"
                        OnClick="btnRestaurant_Click" />

                    <asp:Button ID="btnReservations" runat="server"
                        Text="Reservations"
                        OnClick="btnReservations_Click" />

                    <asp:Button ID="btnRestaurantReviews" runat="server"
                        Text="Restaurant Reviews"
                        OnClick="btnRestaurantReviews_Click" />

                </div>

            </asp:Panel>


            <div class="bottomArea">

                <asp:Button ID="btnSearch" runat="server"
                    Text="Search Restaurants"
                    OnClick="btnSearch_Click" />

                <asp:Button ID="btnLogout" runat="server"
                    Text="Logout"
                    OnClick="btnLogout_Click" />

            </div>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

        </div>

    </form>
</body>
</html>