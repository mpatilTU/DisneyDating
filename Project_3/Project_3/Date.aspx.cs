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
    public partial class Dates : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)    // if it's the first page load
            {
                string strSQL = "SELECT * FROM Dates ORDER BY Name";

                myDS = objDB.GetDataSet(strSQL);
                gvDates.DataSource = myDS;
                gvDates.DataBind();

                Session["theDataSet"] = myDS;
            }
        }
    }
}