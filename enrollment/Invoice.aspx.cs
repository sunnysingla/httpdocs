using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Enrollment_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = (DataTable)Session["UserLogin"];

        Session["FranchiseName"] = dt.Rows[0]["FranchiesName"];
        Session["FranchisePhone"] = dt.Rows[0]["PrimaryPhone"];
        Session["FranchiseEmail"] = dt.Rows[0]["FranchiesEmail"];
        Session["FranchiesAddress"] = dt.Rows[0]["FranchiesAddress"].ToString().Replace("\n", "<br/>"); ;
        //Session["FranchiseStreet2"] = dt.Rows[0]["FranchiesName"];
        //Session["FranchiseCity"] = dt.Rows[0]["FranchiesName"];
        //Session["FranchiseState"] = dt.Rows[0]["FranchiesName"];
        //Session["FranchiseZip"] = dt.Rows[0]["FranchiesName"];
        //Session["FranchiseCountry"] = dt.Rows[0]["FranchiesName"];


        //Session["FranchiseName"] = "Test Franchise";
        //Session["Email"] = "test@test.com";
        //Session["Address"] = "ABC Building US 123456";
        //Session["Frenshies"] = dt.Rows[0]["TermsConditions"];
        termsAndConditions.InnerHtml = dt.Rows[0]["TermsConditions"].ToString();
        txtTermas.Enabled = false;
        CurrentDate.Text = DateTime.Now.ToShortDateString();
        CurrentDate.Enabled = false;

    }
}