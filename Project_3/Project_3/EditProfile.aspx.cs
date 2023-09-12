using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Utilities;
using System.Data;
using System.Data.SqlClient;

namespace Project_3
{
    public partial class EditProfile : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();

        DBConnect myobjDB = new DBConnect();
        SqlCommand myobjCommand = new SqlCommand();
        DataSet myDS;

        DBConnect yourobjDB = new DBConnect();
        SqlCommand yourobjCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Session["user"].ToString();


            myobjCommand.CommandType = CommandType.StoredProcedure;
            myobjCommand.CommandText = "DataBindProfile";

            SqlParameter inputParameter = new SqlParameter("@userName", user);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            myobjCommand.Parameters.Add(inputParameter);

          
            myDS = myobjDB.GetDataSet(myobjCommand);
            txtName.Text = myDS.Tables[0].Rows[0][0].ToString();
            txtAddress.Text = myDS.Tables[0].Rows[0][2].ToString();
            txtEmail.Text = myDS.Tables[0].Rows[0][1].ToString();
            txtPhone.Text = myDS.Tables[0].Rows[0][3].ToString();
            txtCity.Text = myDS.Tables[0].Rows[0][14].ToString();
            txtState.Text = myDS.Tables[0].Rows[0][15].ToString();
            txtAge.Text = myDS.Tables[0].Rows[0][5].ToString();
            txtWeight.Text = myDS.Tables[0].Rows[0][7].ToString();
            txtHeight.Text = myDS.Tables[0].Rows[0][6].ToString();
            txtBio.Text = myDS.Tables[0].Rows[0][16].ToString();
            txtImageURL.Text = myDS.Tables[0].Rows[0][8].ToString();
            txtOccupation.Text = myDS.Tables[0].Rows[0][4].ToString();
            ddlCommitment.SelectedValue = myDS.Tables[0].Rows[0][13].ToString();
            ddlBook.SelectedValue = myDS.Tables[0].Rows[0][12].ToString();
            ddlMovie.SelectedValue = myDS.Tables[0].Rows[0][11].ToString();

            //horoscope
            string horoscope = myDS.Tables[0].Rows[0][18].ToString();
            if (horoscope == "Capricorn")
            {
                radCapricorn.Checked = true;  
            }
            if (horoscope == "Aquarius")
            {
                radAquarius.Checked = true;
            }
            if (horoscope == "Pisces")
            {
                radPisces.Checked= true;
            }
            if (horoscope == "Aries")
            {
                radAries.Checked = true;
            }
            if (horoscope == "Taurus")
            {
                radTaurus.Checked = true;
            }
            if (horoscope == "Gemini")
            {
                radGemini.Checked = true;
            }
            if ( horoscope == "Cancer")
            {
                radCancer.Checked = true;
            }
            if (horoscope == "Leo")
            {
                radLeo.Checked = true;
            }
            if (horoscope == "Virgo")
            {
                radVirgo.Checked = true;
            }
            if ( horoscope == "Libra")
            {
                radLibra.Checked = true;
            }
            if (horoscope == "Scorpio")
            {
                radScorpio.Checked = true;
            }
            if (horoscope == "Sagittarius")
            {
                radSagittarius.Checked = true;
            }

            //intrests
            string intrests = myDS.Tables[0].Rows[0][9].ToString();
            if (intrests.Contains("Reading"))
            {
                chkReading.Checked = true;
            }
            if (intrests.Contains("Magic Spells"))
            {
                chkMagicSpells.Checked = true;
            }
            if (intrests.Contains("Balls"))
            {
                chkBalls.Checked = true;
            }
            if (intrests.Contains("Travel"))
            {
                chkTravel.Checked = true;
            }

            //likes
            string likes = myDS.Tables[0].Rows[0][10].ToString();
            if (likes.Contains("Magic"))
            {
                chkMagic.Checked = true;
            }
            if (likes.Contains("Dancing"))
            {
                chkDancing.Checked = true;
            }
            if (likes.Contains("Singing"))
            {
                chkSinging.Checked = true;
            }
            if (likes.Contains("Collecting"))
            {
                chkCollecting.Checked = true;
            }
            if (likes.Contains("Good"))
            {
                chkGood.Checked = true;
            }
            if (likes.Contains("Evil"))
            {
                chkEvil.Checked = true;
            }

            //dislikes
            string dislikes = myDS.Tables[0].Rows[0][17].ToString();
            if (dislikes.Contains("Magic"))
            {
                chkMagicD.Checked = true;
            }
            if (dislikes.Contains("Dancing"))
            {
                chkDancingD.Checked = true;
            }
            if (dislikes.Contains("Singing"))
            {
                chkSingingD.Checked = true;
            }
            if (dislikes.Contains("Collecting"))
            {
                chkCollectingD.Checked = true;
            }
            if (dislikes.Contains("Good"))
            {
                chkGoodD.Checked = true;
            }
            if (dislikes.Contains("Evil"))
            {
                chkEvilD.Checked = true;
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            String user = Session["user"].ToString();

            //horoscope
            string horoscope = string.Empty;

            if (radCapricorn.Checked)
            {
                horoscope = "Capricorn";
            }
            if (radAquarius.Checked)
            {
                horoscope = "Aquarius";
            }
            if (radPisces.Checked)
            {
                horoscope = "Pisces";
            }
            if (radAries.Checked)
            {
                horoscope = "Aries";
            }
            if (radTaurus.Checked)
            {
                horoscope = "Taurus";
            }
            if (radGemini.Checked)
            {
                horoscope = "Gemini";
            }
            if (radCancer.Checked)
            {
                horoscope = "Cancer";
            }
            if (radLeo.Checked)
            {
                horoscope = "Leo";
            }
            if (radVirgo.Checked)
            {
                horoscope = "Virgo";
            }
            if (radLibra.Checked)
            {
                horoscope = "Libra";
            }
            if (radScorpio.Checked)
            {
                horoscope = "Scorpio";
            }
            if (radSagittarius.Checked)
            {
                horoscope = "Sagittarius";
            }

            //intrests

            string selectedIntrestsText = string.Empty;
            CheckBox[] checkboxes = new CheckBox[] { chkBalls, chkReading, chkTravel, chkMagicSpells };
            
            foreach (CheckBox c in checkboxes)
            {
                if (c.Checked == true)
                {
                    if (selectedIntrestsText.Length > 1)
                    {
                        selectedIntrestsText += ", ";
                    }
                    selectedIntrestsText += c.Text;
                }
            }

            //likes
            string selectedLikesText = string.Empty;
            CheckBox[]likesCheckboxes = new CheckBox[] { chkMagic, chkDancing, chkCollecting, chkSinging, chkEvil, chkGood };

            foreach (CheckBox c in likesCheckboxes)
            {
                if (c.Checked == true)
                {
                    if (selectedLikesText.Length > 1)
                    {
                        selectedLikesText += ", ";
                    }
                    selectedLikesText += c.Text;
                }
            }

            //dislikes
            string selectedDislikesText = string.Empty;
            CheckBox[] dislikesCheckboxes = new CheckBox[] { chkMagicD, chkDancingD, chkCollectingD, chkSingingD, chkEvilD, chkGoodD };

            foreach (CheckBox c in dislikesCheckboxes)
            {
                if (c.Checked == true)
                {
                    if (selectedDislikesText.Length > 1)
                    {
                        selectedDislikesText += ", ";
                    }
                    selectedDislikesText += c.Text;
                }
            }

            //favorite book
            string favBook = string.Empty;
            favBook = ddlBook.SelectedItem.Value;

            //favorite movie
            string favMovie = string.Empty;
            favMovie = ddlMovie.SelectedItem.Value;

            //commitment
            string commitment = string.Empty;
            commitment = ddlCommitment.SelectedItem.Value;

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "SaveProfile";

            SqlParameter inputParameter = new SqlParameter("@Horoscope", horoscope);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);
            
            inputParameter = new SqlParameter("@Intrests", selectedIntrestsText);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Email", txtEmail.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Address", txtAddress.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Phone", txtPhone.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Occupation", txtOccupation.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Age", int.Parse(txtAge.Text));
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.Int;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Height", txtHeight.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Weight", int.Parse(txtWeight.Text));
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.Int;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@ProfilePhoto", txtImageURL.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 4000;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Likes", selectedLikesText);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@FavoriteMovie", favMovie);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@FavoriteBook", favBook);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Commitment", commitment);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@City", txtCity.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@State", txtState.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Bio", txtBio.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 4000;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Name", txtName.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Dislikes", selectedDislikesText);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            //use this as a  session
            inputParameter = new SqlParameter("@userName", user);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            objDB.GetDataSet(objCommand);
        }

        protected void btnDeleteProfile_Click(object sender, EventArgs e)
        {
            yourobjCommand.CommandType = CommandType.StoredProcedure;
            yourobjCommand.CommandText = "DeleteProfile";

            SqlParameter inputParameter = new SqlParameter("@userName", "mickey123");
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            yourobjCommand.Parameters.Add(inputParameter);

            yourobjDB.GetDataSet(yourobjCommand);
        }
    }
}



	
		


	
