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


public partial class Enrollment_MeetingAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static string CreateInvoice(object obj_Invoice)
    {
        //_Inquiry a = obj_Inquiry;
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _StudentInvoice objCustomer = jsonSerializer.Deserialize<_StudentInvoice>(obj_Invoice.ToString());
        SqlParameter[] PM = new SqlParameter[17];
 
        PM[0] = new SqlParameter("@InquiryID", SqlDbType.VarChar);
        PM[0].Value = objCustomer._InquiryID;

        PM[1] = new SqlParameter("@StudentName", SqlDbType.VarChar);
        PM[1].Value = objCustomer._StudentName;

        PM[2] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[2].Value = objCustomer._Subjects;

        PM[3] = new SqlParameter("@PurchasedHoursPerSubject", SqlDbType.VarChar);
        PM[3].Value = objCustomer._PurchasedHoursPerSubject;

        PM[4] = new SqlParameter("@PurchasedStudyHallHours", SqlDbType.VarChar);
        PM[4].Value = objCustomer._PurchasedStudyHallHours;

        PM[5] = new SqlParameter("@TypeOfplan", SqlDbType.VarChar);
        PM[5].Value = objCustomer._TypeOfplan;

        PM[6] = new SqlParameter("@HourlyRate", SqlDbType.VarChar);
        PM[6].Value = objCustomer._HourlyRate;

        PM[7] = new SqlParameter("@PaymentMethod", SqlDbType.VarChar);
        PM[7].Value = objCustomer._PaymentMethod;

        PM[8] = new SqlParameter("@DownPayment", SqlDbType.VarChar);
        PM[8].Value = objCustomer._DownPayment;

        PM[9] = new SqlParameter("@Discount", SqlDbType.VarChar);
        PM[9].Value = objCustomer._Discount;

        PM[10] = new SqlParameter("@NetFee", SqlDbType.VarChar);
        PM[10].Value = objCustomer._NetFee;

        PM[11] = new SqlParameter("@BalanceOutstanding", SqlDbType.VarChar);
        PM[11].Value = objCustomer._BalanceOutstanding;


        PM[12] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[12].Value = objCustomer._ContactName;

        PM[13] = new SqlParameter("@ContactAddress", SqlDbType.VarChar);
        PM[13].Value = objCustomer._ContactAddress;

        PM[14] = new SqlParameter("@ContactEmail", SqlDbType.VarChar);
        PM[14].Value = objCustomer._ContactEmail;

        PM[15] = new SqlParameter("@SplitHrs", SqlDbType.VarChar);
        PM[15].Value = objCustomer._SplitHrs;

        PM[16] = new SqlParameter("@RetailRate", SqlDbType.VarChar);
        PM[16].Value = objCustomer._RetailRate;

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        dsResult = gf.Filldatasetvalue(PM, "USP_CreateStudentInvoice", dsResult, null);

        return "Added Successfully";//dsResult;
    }

    [WebMethod]
    public static List<string> GetInvoice(int InquiryId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@InquiryId", SqlDbType.BigInt);
        PM[0].Value = InquiryId;

        dsResult = gf.Filldatasetvalue(PM, "USP_GETStudentInvoice", dsResult, null);
        string tblInvoiceStudent = Enrollment_MeetingAction.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        List<string> obj_list = new List<string>();
        obj_list.Add(tblInvoiceStudent);
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


