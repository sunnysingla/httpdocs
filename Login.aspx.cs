using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Password", SqlDbType.VarChar);
        PM[0].Value = txtPassword.Text.ToString();

        PM[1] = new SqlParameter("@UserName", SqlDbType.VarChar);
        PM[1].Value = txtEmail.Text.ToString();

        dsResult = gf.Filldatasetvalue(PM, "usp_login", dsResult, null);
        if (dsResult.Tables.Count == 1)
        {
            lblError.Text = dsResult.Tables[0].Rows[0][0].ToString();
        }
        else if (dsResult.Tables.Count > 1)
        {
            Session["Role"] = dsResult.Tables[0].Rows[0][0].ToString();
            if (dsResult.Tables[0].Rows[0][0].ToString() == "2")
            {
                Session["UserLogin"] = dsResult.Tables[1];
                
                Session["User"] = dsResult.Tables[1].Rows[0]["FranchiesName"].ToString();
                Session["GmailId"] = dsResult.Tables[1].Rows[0]["GmailID"].ToString();
                if (Session["User"] != null)
                {
                    Session["Id"] = dsResult.Tables[1].Rows[0]["ID"].ToString();
                    Session["FranchiseID"] = dsResult.Tables[1].Rows[0]["ID"].ToString();

                    Session["Franchise_Name"] = dsResult.Tables[1].Rows[0]["FranchiesName"].ToString();
                    Session["Email"] = dsResult.Tables[1].Rows[0]["FranchiesEmail"].ToString();
                    Session["Address"] = dsResult.Tables[1].Rows[0]["FranchiesAddress"].ToString();
                    //Session["SchoolID"] = "1";
                    Session["RetailRate"] = dsResult.Tables[1].Rows[0]["RetailRate"].ToString();
                    Session.Timeout = 1200;
                   
                    Response.Redirect("enrollment/enrollment.aspx",false);
                }
                
            }
            if (dsResult.Tables[0].Rows[0][0].ToString() == "3")
            {
                Session["UserLogin"] = dsResult.Tables[1];

                Session["User"] = dsResult.Tables[1].Rows[0]["Name"].ToString();

                if (Session["User"] != null)
                {
                    Session["Id"] = dsResult.Tables[1].Rows[0]["ID"].ToString();
                    Session["TutorId"] = dsResult.Tables[1].Rows[0]["ID"].ToString();
                    Session["TutorFranchiseID"] = dsResult.Tables[1].Rows[0]["FranchiseID"].ToString();
                    Session["FranchiseID"] = dsResult.Tables[1].Rows[0]["FranchiseID"].ToString();
                    Session["Name"] = dsResult.Tables[1].Rows[0]["Name"].ToString();
                    Session["Email"] = dsResult.Tables[1].Rows[0]["Email"].ToString();
                    Session["Address"] = dsResult.Tables[1].Rows[0]["Address"].ToString();
                    //Session["SchoolID"] = "1";
                    Session["RetailRate"] = dsResult.Tables[1].Rows[0]["RetailRate"].ToString();
                    Session.Timeout = 1200;
                   
                    Session["IspendingMessages"]= dsResult.Tables[2].Rows[0]["ct"].ToString();
                    
                    Response.Redirect("Tutor/Schedule.aspx", false);
                }

            }
        }
        //Session["UserID"] = txtEmail.Text;
        //Response.Redirect("~/index.aspx", false);

        //Response.Redirect("Index.aspx");
        //string domainname = User.Identity.Name.Substring(0, User.Identity.Name.IndexOf("\\"));
        //bool isValidate = WindowsAuthenticate(txtEmail.Text, txtPassword.Text, domainname);

        //if (isValidate)
        //{
        //    Session["UserID"] = txtEmail.Text;
        //Response.Redirect("~/Default.aspx", false);
        //Common.InsertSessionLog(txtEmail.Text);
        //Common.InsertUserState("Login", Session["SessionId"].ToString());
        //}
        //else
        //    lblError.Text = "Invalid username or password";


    }

}
 