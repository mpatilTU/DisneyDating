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
    public partial class Matches : System.Web.UI.Page
    {
        DBConnect viewMatchedobjDB = new DBConnect();
        SqlCommand viewMatchedobjCommand = new SqlCommand();
        DataSet viewMatchedDS;

        DBConnect selectedobjDB = new DBConnect();
        SqlCommand selectedobjCommand = new SqlCommand();
        DataSet selectedDS;

        DBConnect myobjDB = new DBConnect();
        SqlCommand myobjCommand = new SqlCommand();

        DBConnect yobjDB = new DBConnect();
        SqlCommand yobjCommand = new SqlCommand();

        DBConnect RequestobjDB = new DBConnect();
        SqlCommand RequestobjCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            String profileUsername = Session["user"].ToString();

            if (IsPostBack == false)
            {
                viewMatchedobjCommand.CommandType = CommandType.StoredProcedure;
                viewMatchedobjCommand.CommandText = "ViewMatches";

                SqlParameter inputParameter = new SqlParameter("@profileUsername", profileUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                viewMatchedobjCommand.Parameters.Add(inputParameter);
                viewMatchedDS = viewMatchedobjDB.GetDataSet(viewMatchedobjCommand);

                CardRepeater.DataSource = viewMatchedDS;
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
                selectedobjCommand.CommandText = "ViewMatchProfile";

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

            if (e.CommandName == "Unmatch")
            {
                string selectedProfile = e.CommandArgument.ToString();

                myobjCommand.CommandType = CommandType.StoredProcedure;
                myobjCommand.CommandText = "Unmatch";

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
            else if (e.CommandName == "RequestDate")
            {
                string selectedProfile = e.CommandArgument.ToString();
                Session["user2"] = selectedProfile;

                profileCard.Visible = false;
                lblDate.Visible = true;
                Calendar1.Visible = true;
                lblDescription.Visible = true;
                Description.Visible = true;
                date.Visible = true;
                btnRequest.Visible = true;
               
            }
            else
            {
                profileCard.Visible = false;
                CardRepeater.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            date.Text = Calendar1.SelectedDate.ToString();
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            String user1 = Session["user"].ToString();
            String user2 = Session["user2"].ToString();

            RequestobjCommand.CommandType = CommandType.StoredProcedure;
            RequestobjCommand.CommandText = "RequestDate";

            SqlParameter inputParameter = new SqlParameter("@user1", user1);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            RequestobjCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@user2", user2);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            RequestobjCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@dt", date.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            RequestobjCommand.Parameters.Add(inputParameter);


            inputParameter = new SqlParameter("@description", Description.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            RequestobjCommand.Parameters.Add(inputParameter);

            RequestobjDB.GetDataSet(RequestobjCommand);

        }
    }
}