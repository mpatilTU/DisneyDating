<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatingHomePage.aspx.cs" Inherits="Project_3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fantastically Fated</title>
   <link rel="stylesheet" href="DatingHomePage.css"/>  
   

</head>
<body>
   <div class="hero">

       <form runat="server" >
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
           <div style="z-index: 1; left: 6px; top: 5px; position: absolute; height: 18px; width: 1062px">
           <h2>Fantasy Flingz</h2>
           </div>
 

        </form>
    </div>

             
      
       
</body>
</html>
