<<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationPage.aspx.cs" Inherits="WebApplication1.ReservationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Make Reservation</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .reservationContainer {
            width: 700px;
            margin: 60px auto;
            padding: 35px;

            background-color: white;
            border-radius: 22px;

            box-sizing: border-box;
        }

        .reservationContainer h2 {
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 32px;
        }

        .reservationSection {
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

        .submitButton input {
            background-color: #222;
            color: white;
        }

        .submitButton input:hover {
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

        <div class="reservationContainer">

            <h2>Make Reservation</h2>

            <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>

            <div class="reservationSection">

                <div class="formGroup">
                    <label>Name</label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>

                <div class="row">

                    <div class="formGroup">
                        <label>Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </div>

                    <div class="formGroup">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">

                    <div class="formGroup">
                        <label>Date and Time</label>

                        <asp:TextBox ID="txtReservationDate"
                            runat="server"
                            TextMode="DateTimeLocal">
                        </asp:TextBox>
                    </div>

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

                <span class="submitButton">
                    <asp:Button ID="btnSubmit"
                        runat="server"
                        Text="Make Reservation"
                        OnClick="btnSubmit_Click" />
                </span>

                <span class="backButton">
                    <asp:Button ID="btnBack"
                        runat="server"
                        Text="Back"
                        OnClick="btnBack_Click" />
                </span>

            </div>

        </div>

    </form>
</body>
</html>