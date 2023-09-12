<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Project_3.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="EditProfile.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
    <title></title>
    <style>
        .col {
            background-color:black;
            opacity: 1.0;
            border: double;
            color: white;
        
        }
        .column {
            background-color:black;
            opacity: 1.0;
            border: double;
            color: white;
        }
        .button {
            position: absolute;
            top: 50%;
            background-color: #0a0a23;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 15px;
            min-height: 50px;
            min-width: 200px;
        }

            .button:hover {
                background-color: #555;
            }
       .row{
           margin-left:100px;
           margin-right:100px;
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
             <div style="z-index: 1; left: 492px; top: 5px; position: absolute; height: 37px; width: 576px">
                <h2>Fantasy Flingz</h2>
            </div>
            <div class="container text-center" >
                <div class="row" style="position:absolute; left: 153px; top: 161px; height: 483px;">
                    <div class="col" style="height:466px; width:327px; position:absolute; top: 10px; left: 795px; margin-right: 65px;">
                        
                        <asp:Label ID="Label9" runat="server" Text="Profile Picture:" style="z-index: 1; left: 3px; top: 22px; position: absolute; height: 19px; width: 113px;"></asp:Label>
                        <asp:TextBox ID="txtImageURL" runat="server" style="z-index: 1; left: 155px; top: 18px; position: absolute; height: 25px; width: 128px;" >
</asp:TextBox>
                       
                        
                        &nbsp;<asp:Label ID="Label14" runat="server" Text="Commitment Type:" style="z-index: 1; left: 3px; top: 71px; position: absolute; height: 21px; width: 143px; "></asp:Label>
                        <asp:DropDownList ID="ddlCommitment" runat="server" style="position:absolute; top: 68px; left: 163px; height: 25px; width: 126px;">
                            <asp:ListItem>Select a Commitment Type</asp:ListItem>
                            <asp:ListItem>Short-term</asp:ListItem>
                            <asp:ListItem>Long-term</asp:ListItem>
                            <asp:ListItem>Just looking...</asp:ListItem>
                         </asp:DropDownList>

                        <asp:Label ID="Label17" runat="server" Text="Bio:" style="z-index: 1; left: 3px; top: 114px; position: absolute; height: 21px; width: 45px;"></asp:Label>
                        <asp:TextBox ID="txtBio" runat="server" style="z-index: 1; left: 13px; top: 146px; position: absolute; height: 103px; width: 268px;" TextMode="MultiLine"></asp:TextBox>
                      
                        <asp:Button ID="btnDeleteProfile" runat="server" Text="Delete Profile" style="position:absolute; top: 379px; left: 60px; width: 171px; height: 32px;" OnClick="btnDeleteProfile_Click" CssClass="button" />

                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Profile" style="position:absolute; top: 301px; left: 59px; height: 32px; width: 171px;" OnClick="btnSaveProfile_Click" CssClass="button" />

                    </div>

                    <div class="col" style="height:467px; width:439px; top: 9px; left: 346px; position: absolute;">
                        <asp:Label ID="Label11" runat="server" Text="Horoscope:" style="z-index: 1; left: 170px; top: 13px; position: absolute; height: 19px; width: 72px;"></asp:Label>
                        <asp:RadioButton ID="radCapricorn" runat="server" name="horoscope" style="z-index: 1; left: 18px; top: 41px; position: absolute; width: 83px; height: 18px; right: 313px;" Text="Capricorn" />
                        <asp:RadioButton ID="radAquarius" runat="server" name="horoscope" style="z-index: 1; left: 104px; top: 41px; position: absolute; width: 77px; height: 17px" Text="Aquarius" />
                        <asp:RadioButton ID="radPisces" runat="server" name="horoscope" style="z-index: 1; left: 181px; top: 41px; position: absolute; width: 59px; height: 19px; right: 174px;" Text="Pisces" />
                        <asp:RadioButton ID="radAries" runat="server" name="horoscope" style="z-index: 1; left: 242px; top: 41px; position: absolute; width: 55px; height: 18px" Text="Aries" />
                        <asp:RadioButton ID="radTaurus" runat="server" name="horoscope" style="z-index: 1; left: 298px; top: 41px; position: absolute; width: 62px; height: 18px" Text="Taurus" />
                        <asp:RadioButton ID="radGemini" runat="server" name="horoscope" style="z-index: 1; left: 16px; top: 74px; position: absolute; width: 69px; height: 18px; right: 329px;" Text="Gemini" />
                        <asp:RadioButton ID="radCancer" runat="server" name="horoscope" style="z-index: 1; left: 89px; top: 74px; position: absolute; width: 65px; height: 18px" Text="Cancer" />
                        <asp:RadioButton ID="radLeo" runat="server" name="horoscope" style="z-index: 1; left: 160px; top: 74px; position: absolute; width: 44px; height: 18px" Text="Leo" />
                        <asp:RadioButton ID="radVirgo" runat="server" name="horoscope" style="z-index: 1; left: 206px; top: 74px; position: absolute; width: 57px; height: 17px" Text="Virgo" />
                        <asp:RadioButton ID="radLibra" runat="server" name="horoscope" style="z-index: 1; left: 269px; top: 74px; position: absolute; width: 53px; height: 18px" Text="Libra" />
                        <asp:RadioButton ID="radScorpio" runat="server" name="horoscope" style="z-index: 1; left: 327px; top: 74px; position: absolute; width: 69px; height: 18px" Text="Scorpio" />
                        <asp:RadioButton ID="radSagittarius" runat="server" name="horoscope" style="z-index: 1; left: 16px; top: 106px; position: absolute; width: 89px; height: 18px" Text="Sagittarius" />
                       
                        <asp:Label ID="Label10" runat="server" Text="Intrests:" style="z-index: 1; left: 182px; top: 134px; position: absolute; height: 19px; width: 44px;"></asp:Label>
                        <asp:CheckBox ID="chkReading" runat="server" Groupname="intrests" style="z-index: 1; left: 12px; top: 162px; position: absolute; width: 83px; height: 18px; " Text="Reading" />
                        <asp:CheckBox ID="chkMagicSpells" runat="server" Groupname="intrests" style="z-index: 1; left: 99px; top: 162px; position: absolute; width: 115px; height: 18px" Text="Magic Spells" />
                        <asp:CheckBox ID="chkTravel" runat="server" Groupname="intrests" style="z-index: 1; left: 214px; top: 162px; position: absolute; width: 83px; height: 18px" Text="Travel" />
                        <asp:CheckBox ID="chkBalls" runat="server"  name="intrests" style="z-index: 1; left: 287px; top: 162px; position: absolute; width: 83px; height: 18px" Text="Balls" />
                        
                        <asp:Label ID="Label12" runat="server" Text="Likes:" style="z-index: 1; left: 186px; top: 200px; position: absolute; height: 19px; width: 38px; bottom: 247px;"></asp:Label>
                        <asp:CheckBox ID="chkMagic" runat="server" name="likes" style="z-index: 1; left: 277px; top: 229px; position: absolute; width: 83px; height: 18px" Text="Magic" />
                        <asp:CheckBox ID="chkDancing" runat="server" name="likes" style="z-index: 1; left: 12px; top: 228px; position: absolute; width: 83px; height: 18px; " Text="Dancing" />
                        <asp:CheckBox ID="chkCollecting" runat="server" name="likes" style="z-index: 1; left: 188px; top: 228px; position: absolute; width: 83px; height: 18px; " Text="Collecting" />
                        <asp:CheckBox ID="chkSinging" runat="server" name="likes" style="z-index: 1; left: 98px; top: 228px; position: absolute; width: 83px; height: 18px; right: 233px;" Text="Singing" />
                        <asp:CheckBox ID="chkGood" runat="server" name="likes" style="z-index: 1; left: 4px; top: 261px; position: absolute; width: 83px; height: 18px; bottom: 187px;" Text="Good" />
                        <asp:CheckBox ID="chkEvil" runat="server" name="likes" style="z-index: 1; left: 88px; top: 261px; position: absolute; width: 83px; height: 18px; bottom: 187px;" Text="Evil" />
                      
                        <asp:Label ID="Label13" runat="server" Text="Dislikes:" style="z-index: 1; left: 184px; top: 293px; position: absolute; height: 19px; width: 44px; right: 186px; bottom: 154px;"></asp:Label>
                        <asp:CheckBox ID="chkGoodD" runat="server" name="dislikes" style="z-index: 1; left: 4px; top: 354px; position: absolute; width: 83px; height: 18px" Text="Good" />
                        <asp:CheckBox ID="chkEvilD" runat="server" name="dislikes" style="z-index: 1; left: 86px; top: 354px; position: absolute; width: 83px; height: 18px" Text="Evil" />
                        <asp:CheckBox ID="chkMagicD" runat="server" name="dislikes" style="z-index: 1; left: 278px; top: 323px; position: absolute; width: 83px; height: 18px" Text="Magic" />
                        <asp:CheckBox ID="chkDancingD" runat="server" name="dislikes" style="z-index: 1; left: 11px; top: 323px; position: absolute; width: 83px; height: 18px; right: 320px;" Text="Dancing" />
                        <asp:CheckBox ID="chkCollectingD" runat="server" name="dislikes" style="z-index: 1; left: 189px; top: 323px; position: absolute; width: 86px; height: 18px" Text="Collecting" />
                        <asp:CheckBox ID="chkSingingD" runat="server" name="dislikes" style="z-index: 1; left: 96px; top: 323px; position: absolute; width: 83px; height: 18px" Text="Singing" />
                    
                        <asp:Label ID="Label15" runat="server" Text="Favorite Book:" style="z-index: 1; left: 14px; top: 425px; position: absolute; height: 21px; width: 110px;"></asp:Label>
                        <asp:DropDownList ID="ddlBook" runat="server" style="position:absolute; top: 424px; left: 128px;">
                            <asp:ListItem>Select a Book</asp:ListItem>
                            <asp:ListItem>Mulan</asp:ListItem>
                            <asp:ListItem>The Little Mermaid</asp:ListItem>
                            <asp:ListItem>The Jungle Book</asp:ListItem>
                            <asp:ListItem>Up</asp:ListItem>
                            <asp:ListItem>Lady and the Tramp</asp:ListItem>
                            <asp:ListItem>Peter Pan</asp:ListItem>
                            <asp:ListItem>Dumbo</asp:ListItem>
                            <asp:ListItem>The Parent Trap</asp:ListItem>
                            <asp:ListItem>Tarzan</asp:ListItem>
                            <asp:ListItem>Finding Nemo</asp:ListItem>
                        </asp:DropDownList>
                       
                        <asp:Label ID="Label16" runat="server" Text="Favorite Movie:" style="z-index: 1; left: 15px; top: 393px; position: absolute; height: 19px; width: 113px;"></asp:Label>
                        <asp:DropDownList ID="ddlMovie" runat="server" style="position:absolute; top: 390px; left: 127px;">
                            <asp:ListItem>Select a Movie</asp:ListItem>
                            <asp:ListItem>The Princess and the Frog</asp:ListItem>
                            <asp:ListItem>Tangled</asp:ListItem>
                            <asp:ListItem>Beauty and the Beast</asp:ListItem>
                            <asp:ListItem>Monsters, Inc.</asp:ListItem>
                            <asp:ListItem>Aladdin</asp:ListItem>
                            <asp:ListItem>Pocahontas</asp:ListItem>
                            <asp:ListItem>Hercules</asp:ListItem>
                            <asp:ListItem>A Bug&#39;s Life</asp:ListItem>
                            <asp:ListItem>Toy Story</asp:ListItem>
                            <asp:ListItem>The Lion King</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="column" style="height:466px; width:325px">
                        <asp:Label ID="Label1" runat="server" Text="Name:" style="z-index: 1; left: 36px; top: 34px; position: absolute; height: 19px; width: 44px;"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" style="z-index: 1; left: 117px; top: 29px; position: absolute"></asp:TextBox>
                      
                        <asp:Label ID="Label2" runat="server" Text="Address:" style="z-index: 1; left: 31px; top: 76px; position: absolute; height: 23px; width: 51px; bottom: 380px;"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" style="z-index: 1; left: 117px; top: 74px; position: absolute"></asp:TextBox>
                       
                        <asp:Label ID="Label18" runat="server" Text="City:" style="z-index: 1; left: 21px; top: 123px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtCity" runat="server" style="z-index: 1; left: 118px; top: 119px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label19" runat="server" Text="State:" style="z-index: 1; left: 22px; top: 171px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtState" runat="server" style="z-index: 1; left: 118px; top: 164px; position: absolute"></asp:TextBox>

                        <asp:Label ID="Label3" runat="server" Text="Phone:" style="z-index: 1; left: 30px; top: 221px; position: absolute; height: 19px; width: 45px;"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" style="z-index: 1; left: 118px; top: 209px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label4" runat="server" Text="Email:" style="z-index: 1; left: 35px; top: 261px; position: absolute; height: 19px; width: 36px;"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" style="z-index: 1; left: 119px; top: 254px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label5" runat="server" Text="Occupation:" style="z-index: 1; left: 23px; top: 303px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtOccupation" runat="server" style="z-index: 1; left: 120px; top: 299px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label6" runat="server" Text="Age:" style="z-index: 1; left: 21px; top: 346px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtAge" runat="server" style="z-index: 1; left: 121px; top: 344px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label7" runat="server" Text="Height:" style="z-index: 1; left: 22px; top: 392px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtHeight" runat="server" style="z-index: 1; left: 123px; top: 389px; position: absolute"></asp:TextBox>
                        
                        <asp:Label ID="Label8" runat="server" Text="Weight:" style="z-index: 1; left: 24px; top: 437px; position: absolute; height: 19px; width: 74px;"></asp:Label>
                        <asp:TextBox ID="txtWeight" runat="server" style="z-index: 1; left: 123px; top: 433px; position: absolute"></asp:TextBox>
                        <br />
                     </div>
                </div>
            </div>
        </form>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
