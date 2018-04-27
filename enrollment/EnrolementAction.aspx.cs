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

public partial class Enrollment_EnrolementAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserId"] = "3";
    }


    [WebMethod]
    public static List<string> InsertIntoCallLogs(object Obj_CallLogs)
    {
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _CallLogs objCallLogs = jsonSerializer.Deserialize<_CallLogs>(Obj_CallLogs.ToString());

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[4];
        PM[0] = new SqlParameter("@Inqueryid", SqlDbType.BigInt);
        PM[0].Value = objCallLogs._InquiryID;
        PM[1] = new SqlParameter("@Date", SqlDbType.DateTime);
        PM[1].Value = objCallLogs._Date;
        PM[2] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[2].Value = objCallLogs._Notes;
        PM[3] = new SqlParameter("@UserId", SqlDbType.BigInt);
        PM[3].Value = HttpContext.Current.Session["UserId"];
 
        dsResult = gf.Filldatasetvalue(PM, "USP_InsertIntoCallLogs", dsResult, null);
        string tblCallLogs = Enrollment_EnrolementAction.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblCallLogs);
 
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

