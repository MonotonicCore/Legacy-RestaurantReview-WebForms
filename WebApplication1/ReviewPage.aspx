<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="WebApplication1.ReviewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Write a Review</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .reviewPage {
            width: 100%;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: flex-start;

            padding: 50px 30px;
            box-sizing: border-box;
        }

        .reviewBox {
            width: 1200px;

            display: flex;
            gap: 25px;

            background-color: white;
            padding: 30px;

            border-radius: 22px;
            box-sizing: border-box;
        }

        .restaurantTab {
            width: 32%;

            background-color: #eeeeee;
            padding: 28px;

            box-sizing: border-box;
            border-radius: 18px;

            font-size: 24px;
            font-weight: bold;
        }

        .restaurantImage {
            display: block;

            width: 100%;
            height: 240px;

            object-fit: cover;

            margin-top: 20px;

            border-radius: 16px;
        }

        .reviewFields {
            padding: 0;
        }

        .reviewContent {
            width: 68%;
            padding: 10px 20px;

            box-sizing: border-box;
        }

        .reviewTitle h2 {
            margin-top: 0;
            margin-bottom: 25px;

            font-size: 32px;
        }

        .fieldGroup {
            margin-bottom: 20px;
        }

        .fieldGroup label {
            display: block;

            margin-bottom: 7px;

            font-weight: bold;
        }

        .fieldGroup input {
            width: 100%;

            box-sizing: border-box;
            padding: 10px;

            background-color: #eeeeee;

            border: none;
            border-radius: 12px;
        }

        .fieldGroup textarea {
            width: 100%;

            box-sizing: border-box;
            padding: 10px;

            background-color: #eeeeee;

            border: none;
            border-radius: 12px;

            resize: vertical;

            font-family: Arial, sans-serif;
        }

        .fieldGroup input[type=file] {
            background-color: #eeeeee;
            padding: 10px;
        }

        .ratingArea {
            background-color: #eeeeee;

            padding: 20px;
            margin-top: 25px;

            border-radius: 18px;
        }

        .ratingRow {
            display: flex;
            align-items: center;

            margin-bottom: 12px;
        }

        .ratingRow:last-child {
            margin-bottom: 0;
        }

        .ratingRow label {
            width: 130px;
            font-weight: bold;
        }

        .ratingRow select {
            width: 90px;
            padding: 8px;

            border: none;
            border-radius: 10px;

            background-color: white;
        }

        .formActions {
            border-top: 1px solid #ddd;

            margin-top: 30px;
            padding-top: 20px;

            text-align: right;
        }

        .formActions input {
            padding: 10px 18px;

            border: none;
            border-radius: 12px;

            cursor: pointer;

            margin-left: 8px;
        }

        #btnBack {
            background-color: #eeeeee;
            color: #222;
        }

        #btnBack:hover {
            background-color: #dddddd;
        }

        #btnSubmit {
            background-color: #222;
            color: white;
        }

        #btnSubmit:hover {
            background-color: #444;
        }

        #lblError {
            display: block;

            margin-bottom: 10px;

            color: #b00020;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="reviewPage">
            <div class="reviewBox">

                <div class="restaurantTab">
                    <asp:Label ID="lblRestaurant" runat="server" Text="Restaurant Name"> </asp:Label>

                    <asp:Image
                        ID="imgRestaurant"
                        runat="server"
                        CssClass="restaurantImage" />
                </div>

                <div class="reviewContent">

                    <div class="reviewFields">

                        <div class="reviewTitle">
                            <h2>Write a Review</h2>
                        </div>

                        <div class="fieldGroup">
                            <label>Reviewer Name</label>

                            <asp:TextBox
                                ID="txtReviewer"
                                runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="fieldGroup">
                            <label>Visit Date</label>

                            <asp:TextBox
                                ID="txtVisitDate"
                                runat="server"
                                TextMode="Date">
                            </asp:TextBox>
                        </div>

                        <div class="fieldGroup">
                            <label>Review</label>

                            <asp:Label
                                ID="lblError"
                                runat="server">
                            </asp:Label>

                            <asp:TextBox
                                ID="txtReview"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="6">
                            </asp:TextBox>
                        </div>

                        <div class="fieldGroup">
                            <label>Review Photo</label>

                            <asp:FileUpload
                                ID="fuReviewImage"
                                runat="server" />
                        </div>


                        <div class="ratingArea">

                            <div class="ratingRow">
                                <label>Overall</label>

                                <asp:DropDownList
                                    ID="ddlOverall"
                                    runat="server">
                                </asp:DropDownList>
                            </div>

                            <div class="ratingRow">
                                <label>Food</label>

                                <asp:DropDownList
                                    ID="ddlFood"
                                    runat="server">
                                </asp:DropDownList>
                            </div>

                            <div class="ratingRow">
                                <label>Service</label>

                                <asp:DropDownList
                                    ID="ddlService"
                                    runat="server">
                                </asp:DropDownList>
                            </div>

                            <div class="ratingRow">
                                <label>Atmosphere</label>

                                <asp:DropDownList
                                    ID="ddlAtmosphere"
                                    runat="server"
                                    OnSelectedIndexChanged="ddlAtmosphere_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="ratingRow">
                                <label>Price</label>

                                <asp:DropDownList
                                    ID="ddlPrice"
                                    runat="server">
                                </asp:DropDownList>
                            </div>

                        </div>

                    </div>


                    <div class="formActions">

                        <asp:Button
                            ID="btnBack"
                            runat="server"
                            Text="Back To Restaurant"
                            OnClick="btnBack_Click" />

                        <asp:Button
                            ID="btnSubmit"
                            runat="server"
                            Text="Submit Review"
                            OnClick="btnSubmit_Click" />

                    </div>

                </div>

            </div>
        </div>


    </form>
</body>
</html>