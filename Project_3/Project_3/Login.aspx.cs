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
    public partial class Login1 : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
             int valid;
             

             // Set the SQLCommand object's properties for executing a Stored Procedure

             objCommand.CommandType = CommandType.StoredProcedure;
             objCommand.CommandText = "ValidateAccount";     // identify the name of the stored procedure to execute


             // Pass an input parameter value to the stored procedure that is used for the @theName built-in parameter
            // objCommand.Parameters.AddWithValue("@theName", txtUsername.Text);

             SqlParameter inputParameter = new SqlParameter("@userName", txtUsername.Text);
             inputParameter.Direction = ParameterDirection.Input;
             inputParameter.SqlDbType = SqlDbType.VarChar;
             inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
             objCommand.Parameters.Add(inputParameter);

             inputParameter = new SqlParameter("@userPassword", txtPassword.Text);
             inputParameter.Direction = ParameterDirection.Input;
             inputParameter.SqlDbType = SqlDbType.VarChar;
             inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
             objCommand.Parameters.Add(inputParameter);

             SqlParameter returnParameter = new SqlParameter("@Count", DbType.Int32);
             returnParameter.Direction = ParameterDirection.ReturnValue;
             objCommand.Parameters.Add(returnParameter);

             // Execute the stored procedure using the DBConnect object and the SQLCommand object

             objDB.GetDataSet(objCommand);

             valid = int.Parse(objCommand.Parameters["@Count"].Value.ToString());

            if (valid > 0)
            {
                // Redirect to the "MyPage.aspx" page
                Session["user"] = txtUsername.Text;
                Response.Redirect("EditProfile.aspx");

            }
            else
            {
                 lblMessage.Text = "Account doesn't exist, or login information incorect.";
            }
             
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }
    }
}