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
    public partial class SecretAdmirer : System.Web.UI.Page
    {
        DBConnect viewLikedobjDB = new DBConnect();
        SqlCommand viewLikedobjCommand = new SqlCommand();
        DataSet viewLikedDS;

        DBConnect selectedobjDB = new DBConnect();
        SqlCommand selectedobjCommand = new SqlCommand();
        DataSet selectedDS;

        DBConnect myobjDB = new DBConnect();
        SqlCommand myobjCommand = new SqlCommand();

        DBConnect yobjDB = new DBConnect();
        SqlCommand yobjCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            String profileUsername = Session["user"].ToString();

            if (IsPostBack == false)
            {
                viewLikedobjCommand.CommandType = CommandType.StoredProcedure;
                viewLikedobjCommand.CommandText = "ViewWhoLikedMe";

                SqlParameter inputParameter = new SqlParameter("@profileUsername", profileUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                viewLikedobjCommand.Parameters.Add(inputParameter);
                viewLikedDS = viewLikedobjDB.GetDataSet(viewLikedobjCommand);

                CardRepeater.DataSource = viewLikedDS;
                CardRepeater.DataBind();
            }
        }

        protected void CardRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewProfile")
            {
                CardRepeater.Visible = false;
                profileCard.Visible = true;

                string selectedProfile = e.CommandArgument.ToString();

                selectedobjCommand.CommandType = CommandType.StoredProcedure;
                selectedobjCommand.CommandText = "ViewCardProfile";

                SqlParameter inputParameter = new SqlParameter("@userName", selectedProfile);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                selectedobjCommand.Parameters.Add(inputParameter);

                selectedDS = selectedobjDB.GetDataSet(selectedobjCommand);

                profileCard.DataSource = selectedDS;
                profileCard.DataBind();
            }

        }

        protected void profileCard_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string profileUsername = Session["user"].ToString();

            if (e.CommandName == "Match")
            {
                string selectedProfile = e.CommandArgument.ToString();

                myobjCommand.CommandType = CommandType.StoredProcedure;
                myobjCommand.CommandText = "Match";

                SqlParameter inputParameter = new SqlParameter("@selectedUsername", selectedProfile);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                myobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@profileUsername", profileUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                myobjCommand.Parameters.Add(inputParameter);

                myobjDB.GetDataSet(myobjCommand);
            }
            else if (e.CommandName == "Pass")
            {
                string selectedProfile = e.CommandArgument.ToString();

                yobjCommand.CommandType = CommandType.StoredProcedure;
                yobjCommand.CommandText = "SetNoMatch";

                SqlParameter inputParameter = new SqlParameter("@selectedUsername", selectedProfile);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                yobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@profileUsername", profileUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                yobjCommand.Parameters.Add(inputParameter);

                yobjDB.GetDataSet(yobjCommand);
            }
            else
            {
                profileCard.Visible = false;
                CardRepeater.Visible = true;
            }
        }
    }
}
 