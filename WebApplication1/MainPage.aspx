<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApplication1.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>Restaurant Finder</title>

    <style>

        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        nav {
            background-color: white;
            padding: 14px 25px;
            color: black;

            display: flex;
            justify-content: space-between;
            align-items: center;

            border-bottom: 1px solid #ddd;
        }

        .navTitle {
            font-size: 24px;
            font-weight: bold;
        }

        .navLinks {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .navLinks a {
            padding: 9px 15px;

            text-decoration: none;
            color: #222;

            background-color: #eeeeee;
            border-radius: 12px;
        }

        .navLinks input {
            padding: 9px 15px;

            background-color: #222;
            color: white;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .navLinks input:hover {
            background-color: #444;
        }

        .navLinks a:hover {
            background-color: #dddddd;
        }

        /* my main content */
        main {
            padding: 40px 20px;
        }

        #searchSection {
            text-align: center;
            margin-bottom: 35px;
            padding-bottom: 25px;
        }

        .searchTop {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .searchTop div {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .searchTop input[type=text] {
            padding: 9px 12px;

            border: none;
            border-radius: 12px;

            background-color: white;
        }

        .searchTop input[type=submit] {
            padding: 10px 20px;

            background-color: #222;
            color: white;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .searchTop input[type=submit]:hover {
            background-color: #444;
        }

        .cuisineList {
            margin: 25px auto 0 auto;

            color: white;

            padding: 0;
            background: transparent;
            border-radius: 0;
        }

        .cuisineList td {
            padding: 6px 18px;
        }

        #restaurantSection {
            width: 100%;
        }

        /*  res grid view */

        .restaurantGrid {
            width: 100%;
        }

        .restaurantGrid tbody {
            display: flex;
            flex-wrap: wrap;

            /* centers + gap like yelp, dont touch */
            justify-content: center;
            gap: 35px;
        }

        .restaurantGrid tr {
            display: block;
        }

        .restaurantGrid td {
            display: block;
            border: none;
            padding: 0;
        }

        .restaurantCard {
            background-color: white;

            padding: 18px;
            width: 320px;
            min-height: 250px;

            box-sizing: border-box;

            border-radius: 20px;

            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
        }

        .restaurantCard h2 {

            /* removes the browser default space above the tit */
            margin-top: 0;
/*            bottom*/
            margin-bottom: 5px;
        }

        .restaurantImage {
            width: 100%;
            height: 160px;
            object-fit: cover;

            margin-top: 10px;
            margin-bottom: 10px;

            border-radius: 14px;
        }

        .restaurantCard > a {
            display: inline-block;

            margin-top: 8px;
            padding: 10px 16px;

            background-color: #e7e7e7;
            color: #222;

            text-decoration: none;

            border: 1px solid #d0d0d0;
            border-radius: 14px;

            transition: 0.2s;
        }

        .restaurantCard > a:hover {
            background-color: #dcdcdc;
        }

        .hero {
            position: relative;
            height: 220px;
            overflow: hidden;
        }

        .hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: blur(3px) brightness(70%);
        }

        .hero h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            margin: 0;
        }

        .topArea {
            background-image:
                linear-gradient(rgba(0, 0, 0, 0.30), rgba(0, 0, 0, 0.45)),
                url('Images/banner.jpg');

            background-size: cover;
            background-position: center;

            color: white;
        }

        .heroTitle {
            text-align: center;
            padding-top: 40px;
            padding-bottom: 25px;
        }

        .heroTitle h1 {
            margin: 0;

            font-size: 38px;
        }

        .ratingBox {
            background-color: #eeeeee;

            margin-top: 15px;
            margin-bottom: 15px;
            padding: 12px;

            border-radius: 12px;
        }

        .ratingBox p {
            margin: 4px 0;
        }

    </style>

</head>


<body style="height: 680px">
    <form id="form1" runat="server">
        <div>
        </div>


        <div class="topArea">

            <nav>
                <div class="navTitle">
                    Restaurant Finder
                </div>

                <div class="navLinks">
                    <a href="MainPage.aspx">Home</a>

                    <asp:Button ID="btnLogin"
                        runat="server"
                        Text="Login"
                        OnClick="btnLogin_Click" />

                    <asp:Button ID="btnRegister"
                        runat="server"
                        Text="Register"
                        OnClick="btnRegister_Click" />

                    <asp:Button ID="btnDashboard"
                        runat="server"
                        Text="Dashboard"
                        OnClick="btnDashboard_Click" />

                    <asp:Button ID="btnLogout"
                        runat="server"
                        Text="Logout"
                        OnClick="btnLogout_Click" />
                </div>
            </nav>

            <div class="heroTitle">
                <h1>Find Your Next Restaurant</h1>
            </div>

            <section id="searchSection">

            <div class="searchTop">

                <asp:Label ID="lblFind" runat="server" Text="Find Restaurant"></asp:Label>

                <div>
                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                </div>

                <asp:Button
                    ID="Button1"
                    runat="server"
                    Text="Search"
                    OnClick="btnSearch_Click" />
            </div>

            <asp:CheckBoxList
                ID="cblCuisine"
                runat="server"
                RepeatColumns="2"
                RepeatDirection="Horizontal"
                CssClass="cuisineList">

                <asp:ListItem Text="American" Value="American"></asp:ListItem>
                <asp:ListItem Text="Italian" Value="Italian"></asp:ListItem>
                <asp:ListItem Text="Chinese" Value="Chinese"></asp:ListItem>
                <asp:ListItem Text="Japanese" Value="Japanese"></asp:ListItem>
                <asp:ListItem Text="Mexican" Value="Mexican"></asp:ListItem>
                <asp:ListItem Text="Greek" Value="Greek"></asp:ListItem>
            </asp:CheckBoxList>

            </section>
            </div>

            <main>
            <section id="restaurantSection">

                <asp:GridView
                    ID="gvRestaurant"
                    runat="server"
                    AutoGenerateColumns="False"

                    DataKeyNames="RestaurantId"
                    ShowHeader="False"
                    GridLines="None"

                    CssClass="restaurantGrid">

                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <div class="restaurantCard">

                                    <h2><%# Eval("RestaurantName") %></h2>

                                    <asp:Image
                                        ID="imgRestaurant"
                                        runat="server"
                                        CssClass="restaurantImage"
                                        ImageUrl='<%# Eval("ImageURL") %>'
                                        Visible='<%# !String.IsNullOrEmpty(Eval("ImageURL").ToString()) %>' />
                                    
                                    <div class="ratingBox">
                                        <p>Overall: <%# Eval("OverallRating") == DBNull.Value ? "No ratings" : String.Format("{0:0.0}", Eval("OverallRating")) %></p>
                                        <p>Food: <%# Eval("FoodRating") == DBNull.Value ? "No ratings" : String.Format("{0:0.0}", Eval("FoodRating")) %></p>
                                        <p>Service: <%# Eval("ServiceRating") == DBNull.Value ? "No ratings" : String.Format("{0:0.0}", Eval("ServiceRating")) %></p>
                                        <p>Price: <%# Eval("PriceRating") == DBNull.Value ? "No ratings" : String.Format("{0:0.0}", Eval("PriceRating")) %></p>
                                    </div>

                                    <p>
                                        <%# Eval("City") %>, <%# Eval("State") %>
                                    </p>

                                    <p>
                                        <%# Eval("Description") %>
                                    </p>

                                    <p>
                                        <%# Eval("Hours") %>
                                    </p>

                                    <asp:HyperLink
                                        runat="server"
                                        Text="View Restaurant"
                                        NavigateUrl='<%# "RestaurantPage.aspx?id=" + Eval("RestaurantId") %>' />

                                </div>


                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </section>



            </main>

    </form>
</body>
</html>