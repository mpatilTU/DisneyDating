<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Date.aspx.cs" Inherits="Project_3.Dates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="Dates.css"/>
</head>
<body>
     <div class="hero">
        <form runat="server">
            <asp:GridView ID="gvDates" runat="server" style="z-index: 1; left: 256px; top: 127px; position: absolute; height: 133px; width: 426px" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="user1" HeaderText="Username" />
                    <asp:BoundField DataField="datetime" HeaderText="Date/Time" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField />
                     <asp:TemplateField>
                        <ItemTemplate>
                     <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("userName") %>'  />
                     </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:Menu ID="Menu1" runat="server" Orientation="Vertical">
                <Items>

                    <asp:MenuItem Text="Castle" NavigateUrl="~/DatingHomePage.aspx">
                        <asp:MenuItem Text="Login" NavigateUrl="~/Login.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Create Account" NavigateUrl="~/CreateAccount.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Royal Profile">
                        <asp:MenuItem Text="Edit Royal Profile" NavigateUrl="~/EditProfile.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Find Happily Ever After">
                        <asp:MenuItem Text="Princes and Princesses" NavigateUrl="~/Search.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Secret Admirer" NavigateUrl="~/Likes.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Soulmates" NavigateUrl="~/Matches.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Court" NavigateUrl="~/Date.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
            <div style="z-index: 1; left: 5px; top: 5px; position: absolute; height: 37px; width: 1063px">
                <h2>Fantasy Flingz</h2>
            </div>
    </form>
</div>
</body>
</html>
