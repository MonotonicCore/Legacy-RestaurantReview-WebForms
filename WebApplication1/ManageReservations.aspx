<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageReservations.aspx.cs" Inherits="WebApplication1.ManageReservations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Reservations</title>

    <style>
        body {
            margin: 0;
            background-color: #f3f3f3;
            font-family: Arial, sans-serif;
            color: #222;
        }

        .reservationContainer {
            width: 1200px;
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

        .message {
            display: block;
            margin-bottom: 20px;
            color: #555;
        }

        .reservationGrid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;

            border-radius: 16px;
        }

        .reservationGrid th {
            background-color: #222;
            color: white;

            padding: 12px;
            text-align: left;
        }

        .reservationGrid td {
            padding: 12px;
            background-color: #eeeeee;

            border-bottom: 1px solid #d5d5d5;
            vertical-align: top;
        }

        .reservationGrid tr:last-child td {
            border-bottom: none;
        }

        .reservationGrid a {
            color: #222;
            font-weight: bold;
            text-decoration: none;
        }

        .reservationGrid a:hover {
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

        <div class="reservationContainer">

            <h2>Manage Reservations</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:GridView ID="gvReservations"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="reservationGrid"
                GridLines="None">

                <Columns>

                    <asp:BoundField
                        DataField="Name"
                        HeaderText="Customer" />

                    <asp:BoundField
                        DataField="Phone"
                        HeaderText="Phone" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="ReservationDate"
                        HeaderText="Date / Time"
                        DataFormatString="{0:MM/dd/yyyy h:mm tt}" />

                    <asp:BoundField
                        DataField="PartySize"
                        HeaderText="Party Size" />

                    <asp:BoundField
                        DataField="Comments"
                        HeaderText="Comments" />

                    <asp:BoundField
                        DataField="Status"
                        HeaderText="Status" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:LinkButton
                                ID="btnConfirm"
                                runat="server"
                                Text="Confirm"
                                CommandArgument='<%# Eval("ReservationID") %>'
                                OnClick="btnConfirm_Click">
                            </asp:LinkButton>

                            &nbsp;

                            <asp:HyperLink
                                ID="hlEdit"
                                runat="server"
                                Text="Edit"
                                NavigateUrl='<%# "EditReservation.aspx?id=" + Eval("ReservationID") %>'>
                            </asp:HyperLink>

                            &nbsp;

                            <asp:LinkButton
                                ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CommandArgument='<%# Eval("ReservationID") %>'
                                OnClick="btnDelete_Click"
                                OnClientClick="return confirm('Delete this reservation?');">
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