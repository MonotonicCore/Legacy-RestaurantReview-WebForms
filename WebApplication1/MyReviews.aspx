<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyReviews.aspx.cs" Inherits="WebApplication1.MyReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Reviews</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .reviewContainer {
            width: 1100px;
            margin: 60px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .reviewContainer h2 {
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 32px;
        }

        .message {
            display: block;
            margin-bottom: 20px;
            color: #555;
        }

        .reviewGrid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;

            border-radius: 16px;
        }

        .reviewGrid th {
            background-color: #222;
            color: white;

            padding: 12px;
            text-align: left;
        }

        .reviewGrid td {
            padding: 12px;
            background-color: #eeeeee;

            border-bottom: 1px solid #d5d5d5;
        }

        .reviewGrid tr:last-child td {
            border-bottom: none;
        }

        .reviewGrid a {
            color: #222;
            font-weight: bold;
            text-decoration: none;
        }

        .reviewGrid a:hover {
            text-decoration: underline;
        }

        .bottomArea {
            margin-top: 25px;
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

    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="reviewContainer">

            <h2>My Reviews</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:GridView ID="gvReviews"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="reviewGrid"
                GridLines="None">

                <Columns>

                    <asp:BoundField DataField="RestaurantName"
                        HeaderText="Restaurant" />

                    <asp:BoundField DataField="ReviewText"
                        HeaderText="Review" />

                    <asp:BoundField DataField="VisitDate"
                        HeaderText="Visit Date"
                        DataFormatString="{0:MM/dd/yyyy}" />

                    <asp:BoundField DataField="OverallRating"
                        HeaderText="Overall" />

                    <asp:BoundField DataField="FoodRating"
                        HeaderText="Food" />

                    <asp:BoundField DataField="ServiceRating"
                        HeaderText="Service" />

                    <asp:BoundField DataField="AtmosphereRating"
                        HeaderText="Atmosphere" />

                    <asp:BoundField DataField="PriceRating"
                        HeaderText="Price" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:HyperLink
                                ID="hlEdit"
                                runat="server"
                                Text="Edit"
                                NavigateUrl='<%# "EditReview.aspx?id=" + Eval("ReviewID") %>'>
                            </asp:HyperLink>

                            &nbsp;

                            <asp:LinkButton
                                ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CommandArgument='<%# Eval("ReviewID") %>'
                                OnClick="btnDelete_Click"
                                OnClientClick="return confirm('Are you sure you want to delete this review?');">
                            </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <div class="bottomArea">

                <asp:Button ID="btnBack"
                    runat="server"
                    Text="Back"
                    OnClick="btnBack_Click" />

            </div>

        </div>

    </form>
</body>
</html>