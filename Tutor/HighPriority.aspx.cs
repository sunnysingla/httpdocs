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


public partial class Tutor_HighPriorityaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> GetHighPriorityMessages()
    {
 
        List<string> obj_list =  HttpContext.Current.Session["Notes"] as List<string>;
        return obj_list;

    }
    [WebMethod]
    public static List<string> SaveNotesRead()
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["Id"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_SaveNotesRead", dsResult, null);
        string tblTransferReq = Tutor_HighPriorityaspx.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]); ;

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTransferReq);
        HttpContext.Current.Session.Remove("Notes");

        //HttpContext.Current.Session["Notes"] = null;
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