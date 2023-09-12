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
    public partial class CreateAccount : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();

        DBConnect myobjDB = new DBConnect();
        SqlCommand myobjCommand = new SqlCommand();

        DBConnect yourobjDB = new DBConnect();
        SqlCommand yourobjCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            int valid;

            // Set the SQLCommand object's properties for executing a Stored Procedure

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CreateAccounts";     // identify the name of the stored procedure to execute


            // Pass an input parameter value to the stored procedure that is used for the @theName built-in parameter
            // objCommand.Parameters.AddWithValue("@theName", txtUsername.Text);

            SqlParameter inputParameter = new SqlParameter("@userName", txtnewUsername.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@userPassword", txtnewPassword.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@userEmail", txtEmail.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);


            inputParameter = new SqlParameter("@fullName", txtName.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            objCommand.Parameters.Add(inputParameter);

            objDB.GetDataSet(objCommand);


            myobjCommand.CommandType = CommandType.StoredProcedure;
            myobjCommand.CommandText = "DuplicateAccount";

            inputParameter = new SqlParameter("@userName", txtName.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            myobjCommand.Parameters.Add(inputParameter);

            SqlParameter returnParameter = new SqlParameter("@Count", DbType.Int32);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            myobjCommand.Parameters.Add(returnParameter);

            myobjDB.GetDataSet(myobjCommand);

            valid = int.Parse(myobjCommand.Parameters["@Count"].Value.ToString());

            yourobjCommand.CommandType = CommandType.StoredProcedure;
            yourobjCommand.CommandText = "AddProfile";

            inputParameter = new SqlParameter("@userName", txtnewUsername.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            yourobjCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Name", txtName.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            yourobjCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Email", txtEmail.Text);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            yourobjCommand.Parameters.Add(inputParameter);

            yourobjDB.GetDataSet(yourobjCommand);

            if (valid == 2)
            {//throw error exception
                lblMessage.Text = "Username Already Exists, Choose different username";
            }
            if (valid == 1)
            {
                lblMessage.Text = "Account Successfully Created";
                Response.Redirect("Login.aspx");
            }
            if (valid == 0)
            {
                lblMessage.Text = "Account Was Not  Created";
            }
        }
    }
}
