<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Project_3.CreateAccount" %>

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
    width: 388px;
    height: 422px;
    transform: translate(-50%, -50%);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.6);
    border-radius: 10px;
         }
     </style>
</head>
<body>
       <div class="hero">
    <form id="form1" runat="server" style="height: 962px; width: 986px">
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
        <div style="z-index: 1; left: 465px; top: 122px; position: absolute; height: 18px; width: 561px">
           <h2>Fantasy Flingz</h2>
           </div>
        <div class="login-box" style="background-color: #000000; left: 120px;"> 
        <div class="user-box">
                <asp:Label ID="Label1" runat="server" Text="Create Username:" style="z-index: 1; left: 27px; top: 87px; position: absolute"></asp:Label>
                <asp:TextBox ID="txtnewUsername" runat="server" style="z-index: 1; left: 183px; top: 77px; position: absolute"></asp:TextBox>
            </div>
            <div class="user-box">
                <asp:Label ID="Label2" runat="server" Text="Create Password:" style="z-index: 1; left: 29px; top: 144px; position: absolute"></asp:Label>
                <asp:TextBox ID="txtnewPassword" runat="server" style="z-index: 1; left: 183px; top: 136px; position: absolute; height: 15px;"></asp:TextBox>
            </div>
             <div class="user-box">
                <asp:Label ID="Label3" runat="server" Text="Enter Full Name:" style="z-index: 1; left: 26px; top: 28px; position: absolute; right: 200px;"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" style="z-index: 1; left: 183px; top: 20px; position: absolute; height: 15px;"></asp:TextBox>
            </div>
            <div class="user-box">
                <asp:Label ID="Label4" runat="server" Text="Enter Email:" style="z-index: 1; left: 31px; top: 194px; position: absolute"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" style="z-index: 1; left: 183px; top: 186px; position: absolute; height: 15px;"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnCreateAccount" runat="server" CssClass="button" style="z-index: 1; left: 104px; top: 352px; position: absolute" Text="Create Account" OnClick="btnCreateAccount_Click" />
                <asp:Label ID="lblMessage" runat="server" style="z-index: 1; left: 354px; top: 711px; position: absolute"></asp:Label>
            </div>
          </div>
    </form>
         </div>
</body>
</html>
