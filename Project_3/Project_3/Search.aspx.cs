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
    public partial class Search : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS;

        DBConnect myobjDB = new DBConnect();
        SqlCommand myobjCommand = new SqlCommand();
        DataSet objDS;

        DBConnect yourobjDB = new DBConnect();
        SqlCommand yourobjCommand = new SqlCommand();
        DataSet yourobjDS;

        DBConnect likeobjDB = new DBConnect();
        SqlCommand likeobjCommand = new SqlCommand();
        DataSet likeobjDS;

        DBConnect viewobjDB = new DBConnect();
        SqlCommand viewobjCommand = new SqlCommand();
        DataSet viewobjDS;

        DBConnect dislikeobjDB = new DBConnect();
        SqlCommand dislikeobjCommand = new SqlCommand();
        DataSet dislikeobjDS;

        DBConnect viewDobjDB = new DBConnect();
        SqlCommand viewDobjCommand = new SqlCommand();
        DataSet viewDobjDS;

        DBConnect selectedobjDB = new DBConnect();
        SqlCommand selectedobjCommand = new SqlCommand();
        DataSet selectedDS;

        DBConnect swiperlikedobjDB = new DBConnect();
        SqlCommand swiperlikedobjCommand = new SqlCommand();

        DBConnect targetlikedobjDB = new DBConnect();
        SqlCommand targetlikedobjCommand = new SqlCommand();

        DBConnect addSwiperobjDB = new DBConnect();
        SqlCommand addSwiperobjCommand = new SqlCommand();

        DBConnect validateobjDB = new DBConnect();
        SqlCommand validateobjCommand = new SqlCommand();

        DBConnect existingSwiperLikedobjDB = new DBConnect();
        SqlCommand existingSwiperLikedobjCommand = new SqlCommand();

        DBConnect matchobjDB = new DBConnect();
        SqlCommand matchobjCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)    // if it's the first page load
            {
                string strSQL = "SELECT userName, ProfilePhoto, Name, Age, City, State, Bio, Horoscope FROM userProfile ORDER BY Name";
                
                myDS= objDB.GetDataSet(strSQL);
                gvUsers.DataSource = myDS;
                gvUsers.DataBind();

                Session["theDataSet"] = myDS;
            }
        }

        protected void gvUsers_PageIndexChanging(Object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)

        {

            // Set the GridView to display the correct page

            gvUsers.PageIndex = e.NewPageIndex;
            myDS = (DataSet)Session["theDataSet"];
            gvUsers.DataSource = myDS;
            gvUsers.DataBind();

        }
   

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string searchValue = ddlType.SelectedValue.ToString() ;
            if (searchValue == "Horoscope")
            {
                ddlHoroscope.Visible = true;
            }
            else
            {
                ddlHoroscope.Visible = false;
            }
            if (searchValue == "State")
            {
                ddlState.Visible = true;
            }
            else
            {
                ddlState.Visible = false;
            }
            if (searchValue == "Likes")
            {
                ddlLikes.Visible = true;
            }
            else
            {
                ddlLikes.Visible = false;
            }
            if (searchValue == "Dislikes")
            {
                ddlDislikes.Visible = true;
            }
            else
            {
                ddlDislikes.Visible = false;
            }
        }

        protected void ddlHoroscope_SelectedIndexChanged(object sender, EventArgs e)
        {
            myobjCommand.CommandType = CommandType.StoredProcedure;
            myobjCommand.CommandText = "FilterByHoroscope";

            string searchHoroscope = ddlHoroscope.SelectedValue.ToString();

            SqlParameter inputParameter = new SqlParameter("@Horoscope", searchHoroscope);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            myobjCommand.Parameters.Add(inputParameter);


            objDS = myobjDB.GetDataSet(myobjCommand);
            gvUsers.DataSource = objDS;
            gvUsers.DataBind();
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            yourobjCommand.CommandType = CommandType.StoredProcedure;
            yourobjCommand.CommandText = "FilterByState";

            string searchState = ddlState.SelectedValue.ToString();

            SqlParameter inputParameter = new SqlParameter("@state", searchState);
            inputParameter.Direction = ParameterDirection.Input;
            inputParameter.SqlDbType = SqlDbType.VarChar;
            inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
            yourobjCommand.Parameters.Add(inputParameter);

            yourobjDS = yourobjDB.GetDataSet(yourobjCommand);
            gvUsers.DataSource = yourobjDS;
            gvUsers.DataBind();
        }

        protected void ddlLikes_SelectedIndexChanged(object sender, EventArgs e)
        {
            likeobjCommand.CommandType = CommandType.StoredProcedure;
            likeobjCommand.CommandText = "FilterByLikes";
            likeobjDS = likeobjDB.GetDataSet(likeobjCommand);

            viewobjCommand.CommandType = CommandType.StoredProcedure;
            viewobjCommand.CommandText = "ViewAllProfiles";
         

            string searchLike = ddlLikes.SelectedValue.ToString();
            string likes = string.Empty;
            string userName = string.Empty;

            for (int index = 0; index < likeobjDS.Tables[0].Rows.Count; index++)
            {
                likes = likeobjDS.Tables[0].Rows[index]["Likes"].ToString();
                userName = likeobjDS.Tables[0].Rows[index]["userName"].ToString();
                if (likes.Contains(searchLike))
                {
                    SqlParameter inputParameter = new SqlParameter("@userName", userName);
                    inputParameter.Direction = ParameterDirection.Input;
                    inputParameter.SqlDbType = SqlDbType.VarChar;
                    inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                    viewobjCommand.Parameters.Add(inputParameter);
                    viewobjDS = viewobjDB.GetDataSet(viewobjCommand);
                    gvUsers.DataSource = viewobjDS;
                    gvUsers.DataBind();
                }
            }
        }
        protected void ddlDislikes_SelectedIndexChanged(object sender, EventArgs e)
        {
            dislikeobjCommand.CommandType = CommandType.StoredProcedure;
            dislikeobjCommand.CommandText = "FilterByDislikes";
            dislikeobjDS = dislikeobjDB.GetDataSet(dislikeobjCommand);

            viewDobjCommand.CommandType = CommandType.StoredProcedure;
            viewDobjCommand.CommandText = "ViewAllProfiles";


            string searchDislike = ddlDislikes.SelectedValue.ToString();
            string dislikes = string.Empty;
            string userName = string.Empty;

            for (int index = 0; index < dislikeobjDS.Tables[0].Rows.Count; index++)
            {
                dislikes = dislikeobjDS.Tables[0].Rows[index]["Dislikes"].ToString();
                userName = dislikeobjDS.Tables[0].Rows[index]["userName"].ToString();
                if (dislikes.Contains(searchDislike))
                {
                    SqlParameter inputParameter = new SqlParameter("@userName", userName);
                    inputParameter.Direction = ParameterDirection.Input;
                    inputParameter.SqlDbType = SqlDbType.VarChar;
                    inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                    viewDobjCommand.Parameters.Add(inputParameter);

                    viewDobjDS = viewDobjDB.GetDataSet(viewDobjCommand);
                    gvUsers.DataSource = viewDobjDS;
                    gvUsers.DataBind();
                }
            }
        }
        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string selectedValue = e.CommandArgument.ToString();
                Session["targetUsername"] = selectedValue;

                selectedobjCommand.CommandType = CommandType.StoredProcedure;
                selectedobjCommand.CommandText = "DataBindProfile";

                SqlParameter inputParameter = new SqlParameter("@userName", selectedValue);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                selectedobjCommand.Parameters.Add(inputParameter);

                selectedDS = selectedobjDB.GetDataSet(selectedobjCommand);

                txtName.Text = selectedDS.Tables[0].Rows[0][0].ToString();
                txtName.Visible = true;
                lblName.Visible = true;

                txtAddress.Text = selectedDS.Tables[0].Rows[0][2].ToString();
                txtAddress.Visible = true;
                lblAddress.Visible = true;

                txtEmail.Text = selectedDS.Tables[0].Rows[0][1].ToString();
                txtEmail.Visible = true;
                lblEmail.Visible = true;

                txtPhone.Text = selectedDS.Tables[0].Rows[0][3].ToString();
                txtPhone.Visible = true;
                lblPhone.Visible = true;


                txtCity.Text = selectedDS.Tables[0].Rows[0][14].ToString();
                txtCity.Visible = true;
                lblCity.Visible = true;

                txtState.Text = selectedDS.Tables[0].Rows[0][15].ToString();
                txtState.Visible = true;
                lblState.Visible = true;


                txtAge.Text = selectedDS.Tables[0].Rows[0][5].ToString();
                txtAge.Visible = true;
                lblAge.Visible = true;

                txtWeight.Text = selectedDS.Tables[0].Rows[0][7].ToString();
                txtWeight.Visible = true;
                lblWeight.Visible = true;


                txtHeight.Text = selectedDS.Tables[0].Rows[0][6].ToString();
                txtHeight.Visible = true;
                lblHeight.Visible = true;

                txtBio.Text = selectedDS.Tables[0].Rows[0][16].ToString();
                txtBio.Visible = true;
                lblBio.Visible = true;

                txtOccupation.Text = selectedDS.Tables[0].Rows[0][4].ToString();
                txtOccupation.Visible = true;
                lblOccupation.Visible = true;

                imgProfile.ImageUrl = selectedDS.Tables[0].Rows[0][8].ToString();
                imgProfile.Visible = true;

                txtCommitment.Text = selectedDS.Tables[0].Rows[0][13].ToString();
                txtCommitment.Visible = true;
                lblCommitment.Visible = true;

                txtBook.Text = selectedDS.Tables[0].Rows[0][12].ToString();
                txtBook.Visible = true;
                lblBook.Visible = true;

                txtMovie.Text = selectedDS.Tables[0].Rows[0][11].ToString();
                txtMovie.Visible = true;
                lblMovie.Visible = true;

                txtIntrests.Text = selectedDS.Tables[0].Rows[0][9].ToString();
                txtIntrests.Visible = true;
                lblIntrests.Visible = true;

                txtHoroscope.Text = selectedDS.Tables[0].Rows[0][18].ToString();
                txtHoroscope.Visible = true;
                lblHoroscope.Visible = true;

                txtLikes.Text = selectedDS.Tables[0].Rows[0][10].ToString();
                txtLikes.Visible = true;
                lblLikes.Visible = true;

                txtDislikes.Text = selectedDS.Tables[0].Rows[0][17].ToString();
                txtDislikes.Visible = true;
                lblDislikes.Visible = true;

                btnClose.Visible = true;
                btnLike.Visible = true;
            }
        }
        protected void btnLike_Click(object sender, EventArgs e)
        {
            String swiperUsername = Session["user"].ToString();
            String targetUsername = Session["targetUsername"].ToString();

             validateobjCommand.CommandType = CommandType.StoredProcedure;
             validateobjCommand.CommandText = "ValidateSwiperandTarget";

             SqlParameter inputParameter = new SqlParameter("@swiperUsername", swiperUsername);
             inputParameter.Direction = ParameterDirection.Input;
             inputParameter.SqlDbType = SqlDbType.VarChar;
             inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
             validateobjCommand.Parameters.Add(inputParameter);

             inputParameter = new SqlParameter("@targetUsername", targetUsername);
             inputParameter.Direction = ParameterDirection.Input;
             inputParameter.SqlDbType = SqlDbType.VarChar;
             inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
             validateobjCommand.Parameters.Add(inputParameter);

             SqlParameter returnParameter = new SqlParameter("@count", DbType.Int32);
             returnParameter.Direction = ParameterDirection.ReturnValue;
             validateobjCommand.Parameters.Add(returnParameter);

             int count;
             validateobjDB.GetDataSet(validateobjCommand);
             count = int.Parse(validateobjCommand.Parameters["@count"].Value.ToString());

            if (count == 0)
             {
                addSwiperobjCommand.CommandType = CommandType.StoredProcedure;
                addSwiperobjCommand.CommandText = "AddSwiperandTarget";

                inputParameter = new SqlParameter("@swiperUsername", swiperUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                addSwiperobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@targetUsername", targetUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                addSwiperobjCommand.Parameters.Add(inputParameter);

                addSwiperobjDB.GetDataSet(addSwiperobjCommand);

                swiperlikedobjCommand.CommandType = CommandType.StoredProcedure;
                swiperlikedobjCommand.CommandText = "SwiperLike";

                 inputParameter = new SqlParameter("@swiperUsername", swiperUsername);
                 inputParameter.Direction = ParameterDirection.Input;
                 inputParameter.SqlDbType = SqlDbType.VarChar;
                 inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                 swiperlikedobjCommand.Parameters.Add(inputParameter);

                 inputParameter = new SqlParameter("@targetUsername", targetUsername);
                 inputParameter.Direction = ParameterDirection.Input;
                 inputParameter.SqlDbType = SqlDbType.VarChar;
                 inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                 swiperlikedobjCommand.Parameters.Add(inputParameter);

                 swiperlikedobjDB.GetDataSet(swiperlikedobjCommand);
             }
             else if (count == 1)
             {
                existingSwiperLikedobjCommand.CommandType = CommandType.StoredProcedure;
                existingSwiperLikedobjCommand.CommandText = "SwiperLike";

                inputParameter = new SqlParameter("@swiperUsername", swiperUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                existingSwiperLikedobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@targetUsername", targetUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                existingSwiperLikedobjCommand.Parameters.Add(inputParameter);

                existingSwiperLikedobjDB.GetDataSet(existingSwiperLikedobjCommand);

                targetlikedobjCommand.CommandType = CommandType.StoredProcedure;
                targetlikedobjCommand.CommandText = "TargetLike";

                inputParameter = new SqlParameter("@profileUsername", swiperUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                targetlikedobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@targetUsername", targetUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                targetlikedobjCommand.Parameters.Add(inputParameter);

                targetlikedobjDB.GetDataSet(targetlikedobjCommand);

                matchobjCommand.CommandType = CommandType.StoredProcedure;
                matchobjCommand.CommandText = "SetMatch";

                inputParameter = new SqlParameter("@swiperUsername", swiperUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;                                // 50-bytes ~ varchar(50)
                matchobjCommand.Parameters.Add(inputParameter);

                inputParameter = new SqlParameter("@targetUsername", targetUsername);
                inputParameter.Direction = ParameterDirection.Input;
                inputParameter.SqlDbType = SqlDbType.VarChar;
                inputParameter.Size = 50;
                matchobjCommand.Parameters.Add(inputParameter);

                matchobjDB.GetDataSet(matchobjCommand);
            } 
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            txtDislikes.Visible = false;
            lblDislikes.Visible = false;
            txtLikes.Visible = false;
            lblLikes.Visible = false;
            txtHoroscope.Visible = false;
            lblHoroscope.Visible = false;
            txtIntrests.Visible = false;
            lblIntrests.Visible = false;
            txtMovie.Visible = false;
            lblMovie.Visible = false;
            txtBook.Visible = false;
            lblBook.Visible = false;
            txtCommitment.Visible = false;
            lblCommitment.Visible = false;
            txtName.Visible = false;
            lblName.Visible = false;
            txtAddress.Visible = false;
            lblAddress.Visible = false;
            txtEmail.Visible = false;
            lblEmail.Visible = false;
            txtPhone.Visible = false;
            lblPhone.Visible = false;
            txtCity.Visible = false;
            lblCity.Visible = false;
            txtState.Visible = false;
            lblState.Visible = false;
            txtAge.Visible = false;
            lblAge.Visible = false;
            txtWeight.Visible = false;
            lblWeight.Visible = false;
            txtHeight.Visible = false;
            lblHeight.Visible = false;
            txtBio.Visible = false;
            lblBio.Visible = false;
            txtOccupation.Visible = false;
            lblOccupation.Visible = false;
            imgProfile.Visible = false;
            btnClose.Visible = false;
            btnLike.Visible = false;
        }
    }
}