<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Likes.aspx.cs" Inherits="Project_3.SecretAdmirer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="Likes.css"/> 
    <title></title>
    
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

   <style type="text/css">
    .card {
        width: 300px;
        height: 400px;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        gap:-300px;
    }
    .card-header {
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        padding: 10px;
        color: #333;
    }
    .card-img-top {
        max-width: 100%;
        max-height: 150px;
        margin: 0 auto;
        display:block
    }
    .card-footer {
        text-align: center;
        padding: 10px;
        color: #333;
        min-height: 150px;
        
    }
     .card-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* Three equal-width columns */
        justify-items: center; /* Center cards horizontally */
        margin-bottom: -50px;
        margin-top:50px;
        margin-right:200px;
        margin-left:200px;
    }
 .profileCard-container {
  margin-top: 50px;
  margin-left:600px;
  margin-right:600px;
}

.profileCard {
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 5px #ccc;
  margin: 10px;
  min-width: 300px;
  min-height: 500px;
}

.profileCard-header {
  background-color: #ddd;
  border-bottom: 1px solid #ccc;
  border-radius: 5px 5px 0 0;
  padding: 10px;
}

.profileCard-body {
  padding: 10px;
}

.profileCard-footer {
  background-color: #ddd;
  border-top: 1px solid #ccc;
  border-radius: 0 0 5px 5px;
  padding: 10px;
}

.profileCard-img-top {
  max-width: 100%;
  
}

.profileCard-footer button {
  margin-top: 10px;
}
.profileCard, .profileCard-header, .profileCard-body, .profileCard-footer {
  background-color: #f2f2f2;
  color: black;
  text-align: center;
  padding: 10px;
  margin: 10px;
}

</style>
</head>
<body>
    <div class="hero">
        <form runat="server">
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
            <div style="z-index: 1; left: 420px; top: 5px; position: absolute; height: 37px; width: 648px">
                <h2>Fantasy Flingz</h2>
            </div>
            <div class="card-container">
            <asp:Repeater ID="CardRepeater" runat="server" OnItemCommand="CardRepeater_ItemCommand" Visible="true">
                <ItemTemplate>
                    <div class="card">
                        <div class="card-header">
                            <%# Eval("Name") %>
                        </div>
                        <div class="card-body">
                            <img src='<%# Eval("ProfilePhoto") %>' alt="Image" class="card-img-top" />
                        </div>
                        <div class="card-footer">
                            <%# Eval("Bio") %>
                            <br />
                            <br />
                            <asp:Button ID="ViewProfile" runat="server" Text="ViewProfile" CommandArgument='<%# Eval("swiperUsername") %>' CommandName="ViewProfile" CssClass="profileCard-buttonView" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
            <div class="profileCard-container">
            <asp:Repeater ID="profileCard" runat="server" Visible ="false" OnItemCommand="profileCard_ItemCommand">
                <ItemTemplate>
            <div class="profileCard" >
                <div class="profileCard-header">
                    <img src='<%# Eval("ProfilePhoto") %>' alt="Image" class="profileCard-img-top" />
                </div>
                <div class="profileCard-body">
                  <label>Name:</label>
                     <%# Eval("Name") %>
                    <br />
                    <label>City:</label>
                    <%# Eval("City") %>
                    <br />
                    <label>State:</label>
                    <%# Eval("State") %>
                    <br />
                    <label>Occupation:</label>
                    <%# Eval("Occupation") %>
                    <br />
                    <label>Age:</label>
                    <%# Eval("Age") %>
                    <br />
                    <label>Height:</label>
                    <%# Eval("Height") %>
                    <br />
                    <label>Weight:</label>
                    <%# Eval("Weight") %>
                    <br />
                    <label>Horoscope:</label>
                    <%# Eval("Horoscope") %>
                    <br />
                    <label>Intrests:</label>
                    <%# Eval("Intrests") %>
                    <br />
                    <label>Likes:</label>
                    <%# Eval("Likes") %>
                    <br />
                    <label>Dislikes:</label>
                    <%# Eval("Dislikes") %>
                    <br />
                    <label>Favorite Movie:</label>
                    <%# Eval("FavoriteMovie") %>
                    <br />
                    <label>Favorite Book:</label>
                    <%# Eval("FavoriteBook") %>
                    <br />
                    <label>Commitment Type:</label>
                    <%# Eval("Commitment") %>
                    <br />
                    <label>Bio:</label>
                    <%# Eval("Bio") %>
                </div>
                <div class="profileCard-footer">
                    <asp:Button ID="Match" runat="server" Text="Match" CommandArgument='<%# Eval("userName") %>' CommandName="Match" CssClass="profileCard-button" />
                    <asp:Button ID="Pass" runat="server" Text="Pass" CssClass="profileCard-button"  CommandArgument='<%# Eval("userName") %>' CommandName="Pass"  />
                    <asp:Button ID="Close" runat="server" Text="Close" CssClass="profileCard-button"   />
                </div>
            </div>
              </ItemTemplate>
            </asp:Repeater>
           </div>
        </form>
    </div>   
</body>
</html>
