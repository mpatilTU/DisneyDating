<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_3.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="Login.css"/> 
    <title></title>
     <style type="text/css">
         #form1 {
             height: 774px;
         }
         .login-box{
              position: fixed;
    margin-top: 148px;
    margin-left: 100px;
    margin-right: 800px;
    width: 399px;
    height: 293px;
    transform: translate(-50%, -50%);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.6);
    border-radius: 10px;
         }
     </style>
</head>
<body>
     <div class="hero">
    <form id="form1" runat="server">
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
         <div style="z-index: 1; left: 553px; top: 12px; position: absolute; height: 37px; width: 477px">
                <h2>Fantasy Flingz</h2>
            </div>
        <div class="login-box" style="background-color: #000000; left: 151px;"> 
        
        <div class="user-box">
                <asp:Label ID="Label1" runat="server" Text="Enter Username:" style="z-index: 1; left: 15px; top: 24px; position: absolute"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" style="z-index: 1; left: 167px; top: 5px; position: absolute"></asp:TextBox>
            </div>
            <div class="user-box">
                <asp:Label ID="Label2" runat="server" Text="Enter Password:" style="z-index: 1; left: 13px; top: 59px; position: absolute"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" style="z-index: 1; left: 167px; top: 44px; position: absolute; height: 15px;"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" style="z-index: 1; left: 263px; top: 462px; position: absolute; width: 321px"></asp:Label>
                <asp:Button ID="btnLogin" runat="server" CssClass="button" style="z-index: 1; left: 35px; top: 179px; position: absolute; right: 825px;" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnCreateAccount" runat="server" CssClass="button" style="z-index: 1; left: 173px; top: 180px; position: absolute" Text="Create Account" OnClick="btnCreateAccount_Click" />
            </div>
          </div>
    </form>
         </div>
</body>
</html>

