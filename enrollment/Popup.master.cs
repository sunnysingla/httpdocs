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

public partial class Enrollment_Popup : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        if (Session["Role"].ToString() == "2")
        {
            aSchedule.Visible = false;
            aMailBox.Visible = false;
            aShift.Visible = false;
            
        }
        else if (Session["Role"].ToString() == "3")
        {
            if (Request.Url.ToString().ToLower().IndexOf("highpriority.aspx") < 0)
            {
                if (Session["Notes"] != null)
                {
                    Response.Redirect("highpriority.aspx", false);
                    return;
                }
                DataSet dsResult = new DataSet();
                DataFunctions df = new DataFunctions();
                GenralFunction gf = new GenralFunction();
                SqlParameter[] PM = new SqlParameter[1];
                PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
                PM[0].Value = Session["Id"].ToString();

                dsResult = gf.Filldatasetvalue(PM, "USP_GetHighPriorityNotes", dsResult, null);
                if (dsResult.Tables[0].Rows.Count >= 1)
                {
                    string tblNotes = Enrollment_Popup.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

                    List<string> obj_list = new List<string>();
                    obj_list.Add(tblNotes);
                    Session["Notes"] = obj_list;
                    Response.Redirect("highpriority.aspx", false);
                    return;
                }
            }
            aSetting.Visible = false;
            aEnrollment.Visible = false;
            aMasterSchedule.Visible = false;
            aWeeklySchedule.Visible = false;
            aManage.Visible = false;
            aReport.Visible = false;
            aManage1.Visible = false;
            if (Session["IspendingMessages"].ToString() != "0" && Request.Url.ToString().ToLower().IndexOf("mailbox.aspx") < 0)
            {
                aWarning.Visible = true;
            }
            else
                aWarning.Visible = false;
            if (Request.Url.ToString().ToLower().IndexOf("mailbox.aspx") >= 0)
            {
                Session["IspendingMessages"] = "0";
            }
            //aMasterSchedule.Visible = false;
        }
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