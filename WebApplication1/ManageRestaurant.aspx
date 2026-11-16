<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRestaurant.aspx.cs" Inherits="WebApplication1.ManageRestaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Restaurant</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .restaurantContainer {
            width: 800px;
            margin: 60px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .restaurantContainer h2 {
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 32px;
        }

        .section {
            background-color: #eeeeee;
            padding: 25px;
            margin-bottom: 25px;

            border-radius: 18px;
        }

        .section h3 {
            margin-top: 0;
            margin-bottom: 20px;
        }

        .formGroup {
            margin-bottom: 18px;
        }

        .formGroup:last-child {
            margin-bottom: 0;
        }

        .formGroup label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .formGroup input,
        .formGroup textarea {
            width: 100%;
            padding: 10px;

            box-sizing: border-box;

            background-color: white;
            border: none;
            border-radius: 12px;

            font-size: 14px;
        }

        .row {
            display: flex;
            gap: 15px;
        }

        .row .formGroup {
            flex: 1;
        }

        .uploadArea input[type=file] {
            width: 100%;
            padding: 10px;

            background-color: white;
            border-radius: 12px;

            box-sizing: border-box;
        }

        .buttonArea {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .buttonArea input {
            padding: 10px 18px;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .saveButton input,
        .uploadButton input {
            background-color: #222;
            color: white;
        }

        .saveButton input:hover,
        .uploadButton input:hover {
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
            margin-bottom: 20px;
            color: #b00020;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="restaurantContainer">

            <h2>
                <asp:Label ID="lblTitle" runat="server" Text="Manage Restaurant"></asp:Label>
            </h2>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

            <asp:HiddenField ID="hfRestaurantID" runat="server" />


            <div class="section">

                <h3>Restaurant Information</h3>

                <div class="formGroup">
                    <label>Restaurant Name</label>
                    <asp:TextBox ID="txtRestaurantName" runat="server"></asp:TextBox>
                </div>

                <div class="formGroup">
                    <label>Address</label>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </div>

                <div class="row">

                    <div class="formGroup">
                        <label>City</label>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </div>

                    <div class="formGroup">
                        <label>State</label>
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </div>

                    <div class="formGroup">
                        <label>Zip Code</label>
                        <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="formGroup">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server"
                        TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>

            </div>


            <div class="section">

                <h3>Contact Information</h3>

                <div class="row">

                    <div class="formGroup">
                        <label>Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </div>

                    <div class="formGroup">
                        <label>Owner Name</label>
                        <asp:TextBox ID="txtOwnerName" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="formGroup">
                    <label>Website</label>
                    <asp:TextBox ID="txtWebsite" runat="server"></asp:TextBox>
                </div>

                <div class="formGroup">
                    <label>Social Media</label>
                    <asp:TextBox ID="txtSocialMedia" runat="server"></asp:TextBox>
                </div>

                <div class="formGroup">
                    <label>Hours</label>
                    <asp:TextBox ID="txtHours" runat="server"></asp:TextBox>
                </div>

            </div>


            <div class="section uploadArea">

                <h3>Restaurant Photo</h3>

                <div class="formGroup">
                    <asp:FileUpload ID="fuRestaurantImage" runat="server" />
                </div>

                <div class="formGroup">
                    <label>Caption</label>
                    <asp:TextBox ID="txtImageCaption" runat="server"></asp:TextBox>
                </div>

                <div class="uploadButton">
                    <asp:Button ID="btnUploadImage" runat="server"
                        Text="Upload Photo"
                        OnClick="btnUploadImage_Click" />
                </div>

            </div>


            <div class="buttonArea">

                <span class="saveButton">
                    <asp:Button ID="btnSave" runat="server"
                        Text="Save Restaurant"
                        OnClick="btnSave_Click" />
                </span>

                <span class="backButton">
                    <asp:Button ID="btnBack" runat="server"
                        Text="Back"
                        OnClick="btnBack_Click" />
                </span>

            </div>

        </div>

    </form>
</body>
</html>