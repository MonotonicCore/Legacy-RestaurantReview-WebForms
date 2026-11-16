<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditReview.aspx.cs" Inherits="WebApplication1.EditReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Review</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .editContainer {
            width: 700px;
            margin: 60px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .editContainer h2 {
            margin-top: 0;
            margin-bottom: 25px;
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
        .formGroup textarea,
        .formGroup select {
            width: 100%;
            padding: 10px;

            box-sizing: border-box;

            background-color: #eeeeee;
            border: none;
            border-radius: 12px;

            font-size: 14px;
        }

        .ratingArea {
            background-color: #eeeeee;
            padding: 22px;
            border-radius: 18px;
            margin-bottom: 25px;
        }

        .ratingRow {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 15px;
        }

        .ratingRow:last-child {
            margin-bottom: 0;
        }

        .ratingRow label {
            font-weight: bold;
        }

        .ratingRow select {
            width: 120px;
            padding: 8px;

            border: none;
            border-radius: 10px;
        }

        .buttonArea {
            display: flex;
            gap: 10px;
        }

        .buttonArea input {
            padding: 10px 18px;

            border: none;
            border-radius: 12px;

            cursor: pointer;
        }

        .saveButton input {
            background-color: #222;
            color: white;
        }

        .saveButton input:hover {
            background-color: #444;
        }

        .cancelButton input {
            background-color: #eeeeee;
            color: #222;
        }

        .cancelButton input:hover {
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

        <div class="editContainer">

            <h2>Edit Review</h2>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

            <div class="formGroup">
                <label>Visit Date</label>

                <asp:TextBox ID="txtVisitDate"
                    runat="server"
                    TextMode="Date">
                </asp:TextBox>
            </div>

            <div class="formGroup">
                <label>Review</label>

                <asp:TextBox ID="txtReview"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="6">
                </asp:TextBox>
            </div>

            <div class="ratingArea">

                <div class="ratingRow">
                    <label>Overall</label>
                    <asp:DropDownList ID="ddlOverall" runat="server"></asp:DropDownList>
                </div>

                <div class="ratingRow">
                    <label>Food</label>
                    <asp:DropDownList ID="ddlFood" runat="server"></asp:DropDownList>
                </div>

                <div class="ratingRow">
                    <label>Service</label>
                    <asp:DropDownList ID="ddlService" runat="server"></asp:DropDownList>
                </div>

                <div class="ratingRow">
                    <label>Atmosphere</label>
                    <asp:DropDownList ID="ddlAtmosphere" runat="server"></asp:DropDownList>
                </div>

                <div class="ratingRow">
                    <label>Price</label>
                    <asp:DropDownList ID="ddlPrice" runat="server"></asp:DropDownList>
                </div>

            </div>

            <div class="buttonArea">

                <span class="saveButton">
                    <asp:Button ID="btnSave" runat="server"
                        Text="Save Changes"
                        OnClick="btnSave_Click" />
                </span>

                <span class="cancelButton">
                    <asp:Button ID="btnCancel" runat="server"
                        Text="Cancel"
                        OnClick="btnCancel_Click" />
                </span>

            </div>

        </div>

    </form>
</body>
</html>