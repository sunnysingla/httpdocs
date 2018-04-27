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

public partial class Reports_SalesReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<string> SalesReport(string Year)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Year", SqlDbType.VarChar);
        PM[0].Value = Year;
        PM[1] = new SqlParameter("@FranchiesId", SqlDbType.BigInt);
        PM[1].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_SalesReport", dsResult, null);
        string OutPut = Reports_SalesReport.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(OutPut);

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