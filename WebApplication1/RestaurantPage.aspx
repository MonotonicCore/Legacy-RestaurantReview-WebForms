<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantPage.aspx.cs" Inherits="WebApplication1.RestaurantPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .restaurantTop {
            padding: 35px 50px;
            border-bottom: 1px solid #ccc;
            position: relative;
            overflow: hidden;
        }

/*        im losing hair*/
/*https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Selectors/::after */
/*https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/linear-gradient */

/*        .restaurantTop::after {
            content: "";
            position: absolute;
            top: 20px;
            left: 30px;
            right: 30px;
            bottom: 20px;

            background:
                linear-gradient(rgba(255,255,255,0.78), rgba(255,255,255,0.78))
                left top / 72% 100% no-repeat,

                linear-gradient(rgba(255,255,255,0.78), rgba(255,255,255,0.78))
                left 190px / 100% calc(100% - 190px) no-repeat;

            z-index: 1;

    sad
        }*/

        .restaurantTop::before {
            content: "";
            position: absolute;
            top: -30px;
            left: -30px;
            right: -30px;
            bottom: -30px;

            background-image:var(--backgroundImage);
            background-size: cover;
            background-position: center;

            filter: blur(25px) brightness(65%);
            z-index: 0;
        }

        .restaurantTop::after {
            content: "";
            position: absolute;
            top: 20px;
            left: 30px;
            right: 30px;
            bottom: 20px;

            background-color: rgba(255, 255, 255, 0.78);
            z-index: 1;
        }

        .restaurantTop > div {
            position: relative;
            z-index: 2;
        }

        .restaurantHeader {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 40px;
            margin-bottom: 20px;
        }

        .restaurantIdentity {
            flex: 1;
            padding: 20px;
        }

        #lblRestaurant {
            font-size: 32px;
            font-weight: bold;
            display: block;
            margin-bottom: 20px;
        }

        .restaurantTop img {
            width: 260px;
            height: 180px;
            object-fit: cover;
            border-radius: 14px;
        }

        .locationBox {
            width: 300px;
            border: 1px solid #aaa;
            padding: 18px;
            box-sizing: border-box;
            margin: 20px;
            background-color: rgba(255, 255, 255, 0.25);
            border-radius: 14px;
        }

        .locationBox p {
            margin: 15px 0;
        }

        .descriptionBox {
            width: 70%;
            padding: 15px 20px;
            box-sizing: border-box;
        }

        .cuisineBox {
            width: 40%;
            padding: 15px 20px;
            box-sizing: border-box;
        }

        .restaurantBottom {
            padding: 15px 20px 25px 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .contactBox {
            width: 40%;
        }

        .contactBox p {
            margin: 10px 0 0 0;
        }

        .reviewButtonArea {
            text-align: right;
            display: flex;
            gap: 8px;
        }

        .reviewButtonArea input {
            padding: 10px 16px;

            background-color: #eeeeee;
            color: #222;

            border: 1px solid #d0d0d0;
            border-radius: 12px;

            cursor: pointer;
        }

        .reviewButtonArea input:hover {
            background-color: #dddddd;
        }

        .writeReviewButton {
            padding: 10px 16px;
            cursor: pointer;
        }

        .restaurantPage {
            width: calc(100% - 60px);
            margin: 18px 30px 30px 30px;
            padding: 30px 40px 40px 40px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
            min-height: 320px;
        }

        .reviewTitle {
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 30px;
        }

        .reviewGrid {
            width: 100%;
        }

        .reviewGrid td {
            border: none;
            padding: 0;
        }

        .reviewCard {
            width: 100%;
            background-color: #eeeeee;

            padding: 25px;
            margin-bottom: 20px;

            border-radius: 18px;

            display: grid;
            grid-template-columns: 1fr auto;
            align-items: center;
            gap: 30px;

            box-sizing: border-box;
        }

        .reviewContent {
            min-width: 0;
        }

        .reviewCard h3 {
            margin-top: 0;
            margin-bottom: 5px;
        }

        .reviewCard p {
            margin: 8px 0;
        }

        .reviewDate {
            color: #666;
            font-size: 14px;
            margin-bottom: 18px;
        }

        .reviewText {
            margin-top: 18px;
            margin-bottom: 18px;
            line-height: 1.5;
        }

        .representativeResponse {
            background-color: white;

            padding: 16px 18px;
            margin-top: 12px;
            margin-bottom: 18px;

            border-radius: 14px;
            border-left: 4px solid #cccccc;
        }

        .representativeResponse h4 {
            margin-top: 0;
            margin-bottom: 8px;
        }

        .representativeResponse p {
            margin: 0 0 8px 0;
            line-height: 1.5;
        }

        .representativeResponse span {
            color: #777;
            font-size: 13px;
        }

        .ratingArea {
            background-color: white;

            padding: 15px;
            margin-top: 15px;
            margin-bottom: 15px;

            border-radius: 14px;
        }

        .ratingArea p {
            margin: 6px 0;
        }

        .reviewImage {
            width: 300px;
            height: 220px;

            object-fit: cover;

            border-radius: 14px;
        }

        .helpfulArea {
            margin-top: 15px;
        }

        .helpfulArea input {
            padding: 7px 12px;

            background-color: white;
            color: #222;

            border: 1px solid #d0d0d0;
            border-radius: 10px;

            cursor: pointer;
        }

        .helpfulArea input:hover {
            background-color: #dddddd;
        }

        #btnReview, #btnBack {
            padding: 10px 16px;
        }

</style>

</head>
<body>
    <form id="form1" runat="server">

            <asp:Panel ID="restaurantTop" runat="server" CssClass="restaurantTop">

                <div class="restaurantHeader">

                    <div class="restaurantIdentity">
                        <asp:Label ID="lblRestaurant" runat="server" Text="Restaurant Name"></asp:Label>
                        <p>
                            <asp:Image ID="imgRestaurant" runat="server" Height="156px" />
                        </p>
                    </div>

                    <div class="locationBox">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                        <p>
                            <asp:Label ID="lblCity" runat="server" Text="City / State / Zip"></asp:Label>
                        </p>
                        <asp:Label ID="lblHours" runat="server" Text="Hours"></asp:Label>
                    </div>

                </div>


                <div class="descriptionBox">
                    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                </div>


                <div class="cuisineBox">
                    <asp:Label ID="lblCuisine" runat="server" Text="Cuisine"></asp:Label>
                </div>


                <div class="restaurantBottom">

                    <div class="contactBox">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        <p>
                            <asp:Label ID="lblOwner" runat="server" Text="lblOwner"></asp:Label>
                        </p>
                        <p>
                            <asp:HyperLink ID="hlWebsite" runat="server">HL WebsiteURL</asp:HyperLink>
                        </p>
                        <p>
                            <asp:HyperLink ID="hlSocial" runat="server">HL SocialMediaURL</asp:HyperLink>
                        </p>
                    </div>


                    <div class="reviewButtonArea">
                        <asp:Button ID="btnBack"
                            runat="server"
                            OnClick="btnBack_Click"
                            Text="Back To Main Page" />

                        <asp:Button ID="btnReview"
                            runat="server"
                            Text="Write Review"
                            CssClass="writeReviewButton"
                            OnClick="btnReview_Click" />

                        <asp:Button ID="btnReservation"
                            runat="server"
                            Text="Make Reservation"
                            OnClick="btnReservation_Click" />
                    </div>

                </div>


                <br />
            </asp:Panel>


            <div class="restaurantPage">

                <h2 class="reviewTitle">Reviews</h2>

                <asp:GridView ID="gvReview"
                              runat="server"
                              AutoGenerateColumns="False"
                              ShowHeader="False"
                              GridLines="None"
                              CssClass="reviewGrid"
                              OnSelectedIndexChanged="gvReview_SelectedIndexChanged">

                    <Columns>

                        <asp:TemplateField>
                            <ItemTemplate>

                                <div class="reviewCard">

                                    <div class="reviewContent">

                                        <h3><%# Eval("ReviewerName") %></h3>

                                        <div class="reviewDate">
                                            <%# String.Format("{0:MM/dd/yyyy h:mm tt}", Eval("ReviewDate")) %>
                                        </div>

                                        <p class="reviewText">
                                            <%# Eval("ReviewText") %>
                                        </p>


                                        <asp:Panel
                                            ID="pnlResponse"
                                            runat="server"
                                            CssClass="representativeResponse"
                                            Visible='<%# Eval("ResponseText") != DBNull.Value && !String.IsNullOrEmpty(Eval("ResponseText").ToString()) %>'>

                                            <h4>Restaurant Response</h4>

                                            <p>
                                                <%# Eval("ResponseText") %>
                                            </p>

                                            <span>
                                                <%# Eval("ResponseDate") == DBNull.Value ? "" : String.Format("{0:MM/dd/yyyy h:mm tt}", Eval("ResponseDate")) %>
                                            </span>

                                        </asp:Panel>


                                        <div class="ratingArea">

                                            <p>Overall: <%# Eval("OverallRating") %> / 5</p>
                                            <p>Food: <%# Eval("FoodRating") %> / 5</p>
                                            <p>Service: <%# Eval("ServiceRating") %> / 5</p>
                                            <p>Price: <%# Eval("PriceRating") %> / 5</p>

                                        </div>


                                        <div class="helpfulArea">

                                            Helpful: <%# Eval("HelpfulCount") %>

                                            <asp:Button
                                                ID="btnHelpful"
                                                runat="server"
                                                Text="Helpful"
                                                CommandArgument='<%# Eval("ReviewID") %>'
                                                OnClick="btnHelpful_Click" />

                                            &nbsp;&nbsp;

                                            Not Helpful: <%# Eval("NotHelpfulCount") %>

                                            <asp:Button
                                                ID="btnNotHelpful"
                                                runat="server"
                                                Text="Not Helpful"
                                                CommandArgument='<%# Eval("ReviewID") %>'
                                                OnClick="btnNotHelpful_Click" />

                                        </div>

                                    </div>


                                    <asp:Image
                                        ID="imgReview"
                                        runat="server"
                                        CssClass="reviewImage"
                                        ImageUrl='<%# GetReviewImage(Eval("ImageData"), Eval("ImageContentType")) %>'
                                        Visible='<%# Eval("ImageData") != DBNull.Value %>' />

                                </div>

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

    </form>
</body>
</html>