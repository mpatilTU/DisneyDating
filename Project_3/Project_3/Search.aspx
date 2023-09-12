<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Project_3.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Search.css"/> 
    <style type="text/css">
        .displayProfile {
            z-index: 1;
            left: 897px;
            top: 242px;
            position: absolute;
            height: 738px;
            width: 564px;
            margin-right: 29px;
        }
        
    </style>
</head>
<body>
    <div class="hero">
    <form id="form2" runat="server" style="height: 1022px; width: 1617px; margin-right: 20px;">
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
         <div style="z-index: 1; left: 524px; top: 29px; position: absolute; height: 37px; width: 494px">
                <h2>Fantasy Flingz</h2>
            </div>
            <asp:DropDownList ID="ddlLikes" runat="server" style="z-index: 1; left: 538px; top: 187px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlLikes_SelectedIndexChanged">
                <asp:ListItem>Select Like</asp:ListItem>
                <asp:ListItem>Magic</asp:ListItem>
                <asp:ListItem>Collecting</asp:ListItem>
                <asp:ListItem>Dancing</asp:ListItem>
                <asp:ListItem>Singing</asp:ListItem>
                <asp:ListItem>Good</asp:ListItem>
                <asp:ListItem>Evil</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlHoroscope" runat="server" style="z-index: 1; left: 536px; top: 186px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlHoroscope_SelectedIndexChanged">
                <asp:ListItem>Select Horoscope</asp:ListItem>
                <asp:ListItem>Capricorn</asp:ListItem>
                <asp:ListItem>Aries</asp:ListItem>
                <asp:ListItem>Gemini</asp:ListItem>
                <asp:ListItem>Vrigo</asp:ListItem>
                <asp:ListItem>Taurus</asp:ListItem>
                <asp:ListItem>Pisces</asp:ListItem>
                <asp:ListItem>Libra</asp:ListItem>
                <asp:ListItem>Aquarius</asp:ListItem>
                <asp:ListItem>Scorpio</asp:ListItem>
                <asp:ListItem>Sagittarius</asp:ListItem>
                <asp:ListItem>Cancer</asp:ListItem>
                <asp:ListItem>Leo</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlState" runat="server" style="z-index: 1; left: 535px; top: 186px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                <asp:ListItem>Select State</asp:ListItem>
                <asp:ListItem>England</asp:ListItem>
                <asp:ListItem>Far Far Away</asp:ListItem>
                <asp:ListItem>Persia</asp:ListItem>
                <asp:ListItem>Arabia</asp:ListItem>
                <asp:ListItem>Disney World</asp:ListItem>
                <asp:ListItem>France</asp:ListItem>
                <asp:ListItem>Ocean</asp:ListItem>
                <asp:ListItem>Virginia</asp:ListItem>
                <asp:ListItem>Surface</asp:ListItem>
                <asp:ListItem>Neverland</asp:ListItem>
                <asp:ListItem>Mount Olympus</asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="gvUsers" runat="server" DataKeyNames="userName" style="z-index: 1; left: 57px; top: 238px; position: absolute; height: 610px; width: 830px; right: 223px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvUsers_PageIndexChanging" AutoGenerateColumns="False" OnRowCommand="gvUsers_RowCommand">
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="Username" />
                    <asp:TemplateField HeaderText="Flingz">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfilePhoto") %>'  Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Horoscope" HeaderText="Horoscope" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Bio" HeaderText="Bio" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" CommandName="Select" CommandArgument='<%# Eval("userName") %>'  />
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
            <asp:DropDownList ID="ddlType" runat="server" style="z-index: 1; left: 344px; top: 189px; position: absolute" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>Select Type of Search</asp:ListItem>
                <asp:ListItem>State</asp:ListItem>
                <asp:ListItem>Horoscope</asp:ListItem>
                <asp:ListItem>Likes</asp:ListItem>
                <asp:ListItem>Dislikes</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDislikes" runat="server" style="z-index: 1; left: 537px; top: 186px; position: absolute; height: 22px;" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlDislikes_SelectedIndexChanged">
                <asp:ListItem>Select Dislike</asp:ListItem>
                <asp:ListItem>Magic</asp:ListItem>
                <asp:ListItem>Good</asp:ListItem>
                <asp:ListItem>Evil</asp:ListItem>
                <asp:ListItem>Collecting</asp:ListItem>
                <asp:ListItem>Singing</asp:ListItem>
                <asp:ListItem>Dancing</asp:ListItem>
            </asp:DropDownList>
        <div class="displayProfile">
            <asp:Label ID="lblName" runat="server" Text="Name:" style="z-index: 1; left: 14px; top: 133px; position: absolute; height: 19px; width: 44px;" Visible="false" ></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Style="z-index: 1; left: 90px; top: 131px; position: absolute; width: 120px;" Visible="false" ></asp:TextBox>

            <asp:Label ID="lblAddress" runat="server" Text="Address:" Style="z-index: 1; left: 14px; top: 165px; position: absolute; height: 23px; width: 51px; bottom: 550px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" Style="z-index: 1; left: 90px; position: absolute; bottom: 551px;" Visible="false" height="22"></asp:TextBox>

            <asp:Image ID="imgProfile" runat="server" Height="98px" style="z-index: 1; left: 239px; top: 11px; position: absolute" Width="101px" Visible="false"/>

            <asp:Label ID="lblCity" runat="server" Text="City:" Style="z-index: 1; left: 14px; top: 199px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" Style="z-index: 1; left: 90px; top: 198px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblState" runat="server" Text="State:" Style="z-index: 1; left: 14px; top: 232px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtState" runat="server" Style="z-index: 1; left: 90px; top: 231px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblPhone" runat="server" Text="Phone:" Style="z-index: 1; left: 14px; top: 268px; position: absolute; height: 19px; width: 45px; bottom: 451px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" Style="z-index: 1; left: 90px; position: absolute; bottom: 449px;" Visible="false" height="22"></asp:TextBox>

            <asp:Label ID="lblEmail" runat="server" Text="Email:" Style="z-index: 1; left: 14px; top: 302px; position: absolute; height: 18px; width: 36px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Style="z-index: 1; left: 90px; top: 300px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblOccupation" runat="server" Text="Occupation:" Style="z-index: 1; left: 14px; top: 332px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtOccupation" runat="server" Style="z-index: 1; left: 90px; top: 331px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblAge" runat="server" Text="Age:" Style="z-index: 1; left: 14px; top: 366px; position: absolute; height: 19px; width: 74px; right: 403px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtAge" runat="server" Style="z-index: 1; left: 90px; top: 365px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblHeight" runat="server" Text="Height:" Style="z-index: 1; left: 14px; top: 405px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtHeight" runat="server" Style="z-index: 1; left: 90px; top: 402px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblWeight" runat="server" Text="Weight:" Style="z-index: 1; left: 14px; top: 440px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtWeight" runat="server" Style="z-index: 1; left: 90px; top: 439px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblHoroscope" runat="server" Text="Horoscope:" Style="z-index: 1; left: 289px; top: 133px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtHoroscope" runat="server" Style="z-index: 1; left: 418px; top: 133px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblIntrests" runat="server" Text="Intrests:" Style="z-index: 1; left: 289px; position: absolute; height: 19px; width: 74px; bottom: 552px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtIntrests" runat="server" Style="z-index: 1; left: 419px; position: absolute; bottom: 548px; height: 20px; width: 119px;" Visible="false"></asp:TextBox>

            <asp:Label ID="lblLikes" runat="server" Text="Likes:" Style="z-index: 1; left: 289px; top: 199px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtLikes" runat="server" Style="z-index: 1; left: 418px; top: 198px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblDislikes" runat="server" Text="Dislikes:" Style="z-index: 1; left: 289px; top: 232px; position: absolute; height: 19px; width: 74px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtDislikes" runat="server" Style="z-index: 1; left: 418px; top: 231px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblMovie" runat="server" Text="Favorite Movie:" Style="z-index: 1; left: 289px; top: 302px; position: absolute; height: 19px; width: 108px; " Visible="false"></asp:Label>
            <asp:TextBox ID="txtMovie" runat="server" Style="z-index: 1; left: 418px; top: 298px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblBook" runat="server" Text="Favorite Book:" Style="z-index: 1; left: 289px; position: absolute; height: 19px; width: 101px; bottom: 451px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtBook" runat="server" Style="z-index: 1; left: 418px; position: absolute; bottom: 449px;" Visible="false" height="22"></asp:TextBox>

            <asp:Label ID="lblCommitment" runat="server" Text="Commitment Type:" Style="z-index: 1; left: 289px; top: 332px; position: absolute; height: 19px; width: 133px;" Visible="false"></asp:Label>
            <asp:TextBox ID="txtCommitment" runat="server" Style="z-index: 1; left: 418px; top: 331px; position: absolute" Visible="false"></asp:TextBox>

            <asp:Label ID="lblBio" runat="server" Text="Bio:" Style="z-index: 1; left: 289px; top: 366px; position: absolute; height: 19px; width: 74px;" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBio" runat="server" Style="z-index: 1; left: 290px; top: 402px; position: absolute; height: 53px; width: 250px;" Visible="false" TextMode="MultiLine"></asp:TextBox>

             <asp:Button ID="btnLike" runat="server" CssClass="button" style="z-index: 1; left: 183px; top: 517px; position: absolute; right: 317px;" Text="Like" OnClick="btnLike_Click" Visible="false"/>
             <asp:Button ID="btnClose" runat="server" CssClass="button" style="z-index: 1; left: 291px; top: 517px; position: absolute" Text="Close" OnClick="btnClose_Click" Visible="false" />
        </div>
    </form>
    </div>
</body>
</html>
