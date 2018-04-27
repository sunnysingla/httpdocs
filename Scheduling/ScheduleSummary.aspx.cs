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

public partial class Scheduling_ScheduleSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> ScheduleSummary()
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_ScheduleSummary", dsResult, null);
        string tblSummary = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblDays = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblTimes = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblSummary);
        obj_list.Add(tblDays);
        obj_list.Add(tblTimes);
        return obj_list;

    }
    [WebMethod]
    public static List<string> WeeklySummary(string Date)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();
        PM[1] = new SqlParameter("@ScheduleDate", SqlDbType.VarChar);
        PM[1].Value = Date;

        dsResult = gf.Filldatasetvalue(PM, "USP_WeeklySummary", dsResult, null);
        string tblSummary = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblDays = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblTimes = Scheduling_ScheduleSummary.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblSummary);
        obj_list.Add(tblDays);
        obj_list.Add(tblTimes);
        return obj_list;

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

}