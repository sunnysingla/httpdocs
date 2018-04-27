using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_FranchiseSetting : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static string DataTableToJSONWithJavaScriptSerializer(DataTable table)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);
    }
    [WebMethod]
    public static List<string> GetSettings()
    {
        List<string> userSettings = new List<string>();
        userSettings.Add(Admin_FranchiseSetting.DataTableToJSONWithJavaScriptSerializer((DataTable)HttpContext.Current.Session["UserLogin"]));
        return userSettings;

    }
    [WebMethod]
    public static List<string> GETTimes_All(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GETTimes_All", dsResult, null);
        string tblMessage = Admin_FranchiseSetting.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> GETTimes(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GETTimes", dsResult, null);
        string tblMessage = Admin_FranchiseSetting.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> UpdateFranchise(string Addr,string PrimaryPhone,string FranchiesEmail, string Conditions, string Rate,
        string MaxTables, string LowHrs, 
        string MondayOpen, string MondayClose,
        string TuesdayOpen, string TuesdayClose,
        string WednesdayOpen, string WednesdayClose,
        string ThursdayOpen, string ThursdayClose,
        string FridayOpen, string FridayClose,
        string SaturdayOpen, string SaturdayClose,
        string SundayOpen, string SundayClose, String Subjects)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[23];

        PM[0] = new SqlParameter("@Addr", SqlDbType.VarChar);
        PM[0].Value = Addr;
        PM[1] = new SqlParameter("@Conditions", SqlDbType.VarChar);
        PM[1].Value = Conditions;
        PM[2] = new SqlParameter("@Rate", SqlDbType.VarChar);
        PM[2].Value = Rate;
        PM[3] = new SqlParameter("@MaxTables", SqlDbType.VarChar);
        PM[3].Value = MaxTables;
        PM[4] = new SqlParameter("@LowHrs", SqlDbType.VarChar);
        PM[4].Value = LowHrs;
        PM[5] = new SqlParameter("@MondayOpen", SqlDbType.VarChar);
        PM[5].Value = MondayOpen;
        PM[6] = new SqlParameter("@MondayClose", SqlDbType.VarChar);
        PM[6].Value = MondayClose;

        PM[7] = new SqlParameter("@TuesdayOpen", SqlDbType.VarChar);
        PM[7].Value = TuesdayOpen;
        PM[8] = new SqlParameter("@TuesdayClose", SqlDbType.VarChar);
        PM[8].Value = TuesdayClose;

        PM[9] = new SqlParameter("@WednesdayOpen", SqlDbType.VarChar);
        PM[9].Value = WednesdayOpen;
        PM[10] = new SqlParameter("@WednesdayClose", SqlDbType.VarChar);
        PM[10].Value = WednesdayClose;

        PM[11] = new SqlParameter("@ThursdayOpen", SqlDbType.VarChar);
        PM[11].Value = ThursdayOpen;
        PM[12] = new SqlParameter("@ThursdayClose", SqlDbType.VarChar);
        PM[12].Value = ThursdayClose;

        PM[13] = new SqlParameter("@FridayOpen", SqlDbType.VarChar);
        PM[13].Value = FridayOpen;
        PM[14] = new SqlParameter("@FridayClose", SqlDbType.VarChar);
        PM[14].Value = FridayClose;

        PM[15] = new SqlParameter("@SaturdayOpen", SqlDbType.VarChar);
        PM[15].Value = SaturdayOpen;
        PM[16] = new SqlParameter("@SaturdayClose", SqlDbType.VarChar);
        PM[16].Value = SaturdayClose;

        PM[17] = new SqlParameter("@SundayOpen", SqlDbType.VarChar);
        PM[17].Value = SundayOpen;
        PM[18] = new SqlParameter("@SundayClose", SqlDbType.VarChar);
        PM[18].Value = SundayClose;

        PM[19] = new SqlParameter("@FranchiseId", SqlDbType.Int);
        PM[19].Value = HttpContext.Current.Session["FranchiseID"].ToString(); ;

        PM[20] = new SqlParameter("@PrimaryPhone", SqlDbType.VarChar);
        PM[20].Value = PrimaryPhone;
        PM[21] = new SqlParameter("@FranchiesEmail", SqlDbType.VarChar);
        PM[21].Value = FranchiesEmail;
        PM[22] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[22].Value = Subjects;



        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateFranchise", dsResult, null);
        string tblUpdateMessage = Admin_FranchiseSetting.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);

        HttpContext.Current.Session["UserLogin"] = dsResult.Tables[1];

        HttpContext.Current.Session["User"] = dsResult.Tables[1].Rows[0]["FranchiesName"].ToString();

        if (HttpContext.Current.Session["User"] != null)
        {

            HttpContext.Current.Session["FranchiseID"] = dsResult.Tables[1].Rows[0]["ID"].ToString();

            HttpContext.Current.Session["Franchise_Name"] = dsResult.Tables[1].Rows[0]["FranchiesName"].ToString();
            HttpContext.Current.Session["Email"] = dsResult.Tables[1].Rows[0]["FranchiesEmail"].ToString();
            HttpContext.Current.Session["Address"] = dsResult.Tables[1].Rows[0]["FranchiesAddress"].ToString();
            //Session["SchoolID"] = "1";
            HttpContext.Current.Session["RetailRate"] = dsResult.Tables[1].Rows[0]["RetailRate"].ToString();
           // Response.Redirect("enrollment/enrollment.aspx", false);
        }

        return obj_list;
    }
}