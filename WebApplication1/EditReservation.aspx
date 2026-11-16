<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditReservation.aspx.cs" Inherits="WebApplication1.EditReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Reservation</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .editContainer {
            width: 650px;
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

        .editSection {
            background-color: #eeeeee;
            padding: 25px;

            border-radius: 18px;
        }

        .formGroup {
            margin-bottom: 20px;
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
        .formGroup textarea,
        .formGroup select {
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

            <h2>Edit Reservation</h2>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

            <div class="editSection">

                <div class="formGroup">
                    <label>Date and Time</label>

                    <asp:TextBox ID="txtReservationDate"
                        runat="server"
                        TextMode="DateTimeLocal">
                    </asp:TextBox>
                </div>

                <div class="row">

                    <div class="formGroup">
                        <label>Party Size</label>

                        <asp:DropDownList ID="ddlPartySize" runat="server">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="formGroup">
                        <label>Status</label>

                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem Value="Pending">Pending</asp:ListItem>
                            <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>

                <div class="formGroup">
                    <label>Comments</label>

                    <asp:TextBox ID="txtComments"
                        runat="server"
                        TextMode="MultiLine"
                        Rows="4">
                    </asp:TextBox>
                </div>

            </div>

            <div class="buttonArea">

                <span class="saveButton">
                    <asp:Button ID="btnSave"
                        runat="server"
                        Text="Save Changes"
                        OnClick="btnSave_Click" />
                </span>

                <span class="cancelButton">
                    <asp:Button ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        OnClick="btnCancel_Click" />
                </span>

            </div>

        </div>

    </form>
</body>
</html>