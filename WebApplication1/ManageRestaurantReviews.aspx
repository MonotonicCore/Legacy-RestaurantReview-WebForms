<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRestaurantReviews.aspx.cs" Inherits="WebApplication1.ManageRestaurantReviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Reviews</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .reviewContainer {
            width: 850px;
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
        }

        .reviewCard {
            background-color: #eeeeee;
            padding: 25px;
            margin-bottom: 20px;

            border-radius: 18px;
        }

        .reviewCard h3 {
            margin-top: 0;
            margin-bottom: 5px;
        }

        .reviewDate {
            margin-top: 0;
            color: #777;
            font-size: 14px;
        }

        .reviewText {
            margin-top: 20px;
            margin-bottom: 20px;

            line-height: 1.5;
        }

        .ratingArea {
            background-color: white;
            padding: 18px;
            margin-bottom: 20px;

            border-radius: 14px;
        }

        .ratingArea p {
            margin: 6px 0;
        }

        .existingResponse {
            background-color: white;

            padding: 18px;
            margin-bottom: 20px;

            border-radius: 14px;
        }

        .existingResponse h4 {
            margin-top: 0;
            margin-bottom: 8px;
        }

        .existingResponse p {
            margin: 0 0 8px 0;
            line-height: 1.5;
        }

        .existingResponse span {
            color: #777;
            font-size: 13px;
        }

        .responseArea label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .responseArea textarea {
            width: 100%;
            padding: 10px;

            box-sizing: border-box;

            background-color: white;
            border: none;
            border-radius: 12px;

            font-family: Arial, sans-serif;
            font-size: 14px;

            resize: vertical;
        }

        .responseArea input {
            margin-top: 12px;
            padding: 10px 18px;

            background-color: #222;
            color: white;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .responseArea input:hover {
            background-color: #444;
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

            <h2>Restaurant Reviews</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:GridView ID="gvReviews"
                runat="server"
                AutoGenerateColumns="False"
                ShowHeader="False"
                GridLines="None"
                CssClass="reviewGrid"
                OnSelectedIndexChanged="gvReviews_SelectedIndexChanged">

                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>

                            <div class="reviewCard">

                                <h3><%# Eval("ReviewerName") %></h3>

                                <p class="reviewDate">
                                    <%# String.Format("{0:MM/dd/yyyy h:mm tt}", Eval("ReviewDate")) %>
                                </p>

                                <p class="reviewText">
                                    <%# Eval("ReviewText") %>
                                </p>

                                <div class="ratingArea">

                                    <p>Overall: <%# Eval("OverallRating") %> / 5</p>
                                    <p>Food: <%# Eval("FoodRating") %> / 5</p>
                                    <p>Service: <%# Eval("ServiceRating") %> / 5</p>
                                    <p>Atmosphere: <%# Eval("AtmosphereRating") %> / 5</p>
                                    <p>Price: <%# Eval("PriceRating") %> / 5</p>

                                </div>


                                <asp:Panel
                                    ID="pnlExistingResponse"
                                    runat="server"
                                    CssClass="existingResponse"
                                    Visible='<%# Eval("ResponseText") != DBNull.Value && !String.IsNullOrEmpty(Eval("ResponseText").ToString()) %>'>

                                    <h4>Representative Response</h4>

                                    <p>
                                        <%# Eval("ResponseText") %>
                                    </p>

                                    <span>
                                        <%# Eval("ResponseDate") == DBNull.Value ? "" : String.Format("{0:MM/dd/yyyy h:mm tt}", Eval("ResponseDate")) %>
                                    </span>

                                </asp:Panel>


                                <div class="responseArea">

                                    <label>Response</label>

                                    <asp:TextBox
                                        ID="txtResponse"
                                        runat="server"
                                        TextMode="MultiLine"
                                        Rows="3">
                                    </asp:TextBox>

                                    <asp:Button
                                        ID="btnRespond"
                                        runat="server"
                                        Text="Respond"
                                        CommandArgument='<%# Eval("ReviewID") %>'
                                        OnClick="btnRespond_Click" />

                                </div>

                            </div>

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