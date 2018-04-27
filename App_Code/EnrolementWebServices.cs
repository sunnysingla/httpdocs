using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// Summary description for EnrolementWebServices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EnrolementWebServices : System.Web.Services.WebService
{

    public EnrolementWebServices()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public string CreateInquary(object obj_Inquiry)
    {
        //_Inquiry a = obj_Inquiry;
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _Inquiry objCustomer = jsonSerializer.Deserialize<_Inquiry>(obj_Inquiry.ToString());
        SqlParameter[] PM = new SqlParameter[8];
        PM[0] = new SqlParameter("@Date", SqlDbType.DateTime);
        PM[0].Value = objCustomer._Date;
        PM[1] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[1].Value = objCustomer._ContactName;
        PM[2] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[2].Value = objCustomer._Email;
        PM[3] = new SqlParameter("@Source", SqlDbType.VarChar);
        PM[3].Value = objCustomer._Source;
        PM[4] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[4].Value = objCustomer._Notes;

        #region "Inquiry Student Object for usp_CreateInquary"
        DataTable dtIS = new DataTable();
        dtIS.Columns.Add("ID");
        dtIS.Columns.Add("InquiryID");
        dtIS.Columns.Add("Grade");
        dtIS.Columns.Add("Subjects");
        dtIS.Columns.Add("School");
        dtIS.Columns.Add("Notes");
        dtIS.Columns.Add("StudentName");

        for (int x = 0; x < objCustomer.obj_InquiryStudent.Count; x++)
        {
            DataRow dr = dtIS.NewRow();
            dr[0] = objCustomer.obj_InquiryStudent[x]._ID;
            dr[1] = objCustomer.obj_InquiryStudent[x]._InquiryID;
            dr[2] = objCustomer.obj_InquiryStudent[x]._Grade;
            dr[3] = objCustomer.obj_InquiryStudent[x]._Subjects;
            dr[4] = objCustomer.obj_InquiryStudent[x]._School;
            dr[5] = objCustomer.obj_InquiryStudent[x]._Notes;
            dr[6] = objCustomer.obj_InquiryStudent[x]._StudentName;
            dtIS.Rows.Add(dr);
        }
        PM[5] = new SqlParameter("@typeInquiryStudent", SqlDbType.Structured);
        PM[5].Value = dtIS;
        #endregion

        #region "Assessment Object for usp_CreateInquary"
        DataTable dtAssesment = new DataTable();
        dtAssesment.Columns.Add("ID");
        dtAssesment.Columns.Add("InquiryID");
        dtAssesment.Columns.Add("Date");
        dtAssesment.Columns.Add("ContactName");
        dtAssesment.Columns.Add("StudentName");
        dtAssesment.Columns.Add("Subjects");
        dtAssesment.Columns.Add("Grade");

        for (int x = 0; x < objCustomer.obj_Assessment.Count; x++)
        {
            DataRow dr = dtAssesment.NewRow();
            dr[0] = objCustomer.obj_Assessment[x]._ID;
            dr[1] = objCustomer.obj_Assessment[x]._InquiryID;
            dr[2] = objCustomer.obj_Assessment[x]._Date;
            dr[3] = objCustomer.obj_Assessment[x]._ContactName;
            dr[4] = objCustomer.obj_Assessment[x]._StudentName;
            dr[5] = objCustomer.obj_Assessment[x]._Subjects;
            dr[6] = objCustomer.obj_Assessment[x]._Grade;
            dtAssesment.Rows.Add(dr);
        }

        PM[6] = new SqlParameter("@typeAssessments", SqlDbType.Structured);
        PM[6].Value = dtAssesment;
        #endregion

        #region "Meetings Object for usp_CreateInquary"
        DataTable dtMeeting = new DataTable();
        dtMeeting.Columns.Add("ID");
        dtMeeting.Columns.Add("InquiryID");
        dtMeeting.Columns.Add("Date");
        dtMeeting.Columns.Add("ContactName");
        dtMeeting.Columns.Add("ContactNumber");
        dtMeeting.Columns.Add("Contactemail");
        dtMeeting.Columns.Add("StudentNames");

        for (int x = 0; x < objCustomer.obj_Meetings.Count; x++)
        {
            DataRow dr = dtMeeting.NewRow();
            dr[0] = objCustomer.obj_Meetings[x]._ID;
            dr[1] = objCustomer.obj_Meetings[x]._InquiryID;
            dr[2] = objCustomer.obj_Meetings[x]._Date;
            dr[3] = objCustomer.obj_Meetings[x]._ContactName;
            dr[4] = objCustomer.obj_Meetings[x]._ContactNumber;
            dr[5] = objCustomer.obj_Meetings[x]._Contactemail;
            dr[6] = objCustomer.obj_Meetings[x]._StudentName;
            dtMeeting.Rows.Add(dr);
        }

        PM[7] = new SqlParameter("@typeMeetings", SqlDbType.Structured);
        PM[7].Value = dtMeeting;
        #endregion

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        dsResult = gf.Filldatasetvalue(PM, "usp_CreateInquary", dsResult, null);

        return "Added Successfully";//dsResult;
    }

    [WebMethod]
    public string UpdateInquary(object obj_Inquiry)
    {
        //_Inquiry a = obj_Inquiry;
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _Inquiry objCustomer = jsonSerializer.Deserialize<_Inquiry>(obj_Inquiry.ToString());
        SqlParameter[] PM = new SqlParameter[9];
        PM[0] = new SqlParameter("@Date", SqlDbType.DateTime);
        PM[0].Value = objCustomer._Date;
        PM[1] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[1].Value = objCustomer._ContactName;
        PM[2] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[2].Value = objCustomer._Email;
        PM[3] = new SqlParameter("@Source", SqlDbType.VarChar);
        PM[3].Value = objCustomer._Source;
        PM[4] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[4].Value = objCustomer._Notes;

        #region "Inquiry Student Object for usp_CreateInquary"
        DataTable dtIS = new DataTable();
        dtIS.Columns.Add("ID");
        dtIS.Columns.Add("InquiryID");
        dtIS.Columns.Add("Grade");
        dtIS.Columns.Add("Subjects");
        dtIS.Columns.Add("School");
        dtIS.Columns.Add("Notes");
        dtIS.Columns.Add("StudentName");

        for (int x = 0; x < objCustomer.obj_InquiryStudent.Count; x++)
        {
            DataRow dr = dtIS.NewRow();
            dr[0] = objCustomer.obj_InquiryStudent[x]._ID;
            dr[1] = objCustomer.obj_InquiryStudent[x]._InquiryID;
            dr[2] = objCustomer.obj_InquiryStudent[x]._Grade;
            dr[3] = objCustomer.obj_InquiryStudent[x]._Subjects;
            dr[4] = objCustomer.obj_InquiryStudent[x]._School;
            dr[5] = objCustomer.obj_InquiryStudent[x]._Notes;
            dr[6] = objCustomer.obj_InquiryStudent[x]._StudentName;
            dtIS.Rows.Add(dr);
        }
        PM[5] = new SqlParameter("@typeInquiryStudent", SqlDbType.Structured);
        PM[5].Value = dtIS;
        #endregion

        #region "Assessment Object for usp_CreateInquary"
        DataTable dtAssesment = new DataTable();
        dtAssesment.Columns.Add("ID");
        dtAssesment.Columns.Add("InquiryID");
        dtAssesment.Columns.Add("Date");
        dtAssesment.Columns.Add("ContactName");
        dtAssesment.Columns.Add("StudentName");
        dtAssesment.Columns.Add("Subjects");
        dtAssesment.Columns.Add("Grade");

        for (int x = 0; x < objCustomer.obj_Assessment.Count; x++)
        {
            DataRow dr = dtAssesment.NewRow();
            dr[0] = objCustomer.obj_Assessment[x]._ID;
            dr[1] = objCustomer.obj_Assessment[x]._InquiryID;
            dr[2] = objCustomer.obj_Assessment[x]._Date;
            dr[3] = objCustomer.obj_Assessment[x]._ContactName;
            dr[4] = objCustomer.obj_Assessment[x]._StudentName;
            dr[5] = objCustomer.obj_Assessment[x]._Subjects;
            dr[6] = objCustomer.obj_Assessment[x]._Grade;
            dtAssesment.Rows.Add(dr);
        }

        PM[6] = new SqlParameter("@typeAssessments", SqlDbType.Structured);
        PM[6].Value = dtAssesment;
        #endregion

        #region "Meetings Object for usp_CreateInquary"
        DataTable dtMeeting = new DataTable();
        dtMeeting.Columns.Add("ID");
        dtMeeting.Columns.Add("InquiryID");
        dtMeeting.Columns.Add("Date");
        dtMeeting.Columns.Add("ContactName");
        dtMeeting.Columns.Add("ContactNumber");
        dtMeeting.Columns.Add("Contactemail");
        dtMeeting.Columns.Add("StudentNames");

        for (int x = 0; x < objCustomer.obj_Meetings.Count; x++)
        {
            DataRow dr = dtMeeting.NewRow();
            dr[0] = objCustomer.obj_Meetings[x]._ID;
            dr[1] = objCustomer.obj_Meetings[x]._InquiryID;
            dr[2] = objCustomer.obj_Meetings[x]._Date;
            dr[3] = objCustomer.obj_Meetings[x]._ContactName;
            dr[4] = objCustomer.obj_Meetings[x]._ContactNumber;
            dr[5] = objCustomer.obj_Meetings[x]._Contactemail;
            dr[6] = objCustomer.obj_Meetings[x]._StudentName;
            dtMeeting.Rows.Add(dr);
        }

        PM[7] = new SqlParameter("@typeMeetings", SqlDbType.Structured);
        PM[7].Value = dtMeeting;

        PM[8] = new SqlParameter("@Inquiryid", SqlDbType.VarChar);
        PM[8].Value = objCustomer._ID;
        #endregion

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        dsResult = gf.Filldatasetvalue(PM, "usp_UpdateInquary", dsResult, null);

        return "Updated Successfully";//dsResult;
    }


    [WebMethod]
    public List<string> GetEnrolementView(string obj_Inquiry)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        dsResult = gf.Filldatasetvalue(null, "USP_GetEnrolementView", dsResult, null);
        string tblInquiry = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblInquiryStudents = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblAssessments = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblMeetings = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        List<string> obj_list = new List<string>();
        obj_list.Add(tblInquiry);
        //obj_list.Add(tblInquiryStudents);
        obj_list.Add(tblAssessments);
        obj_list.Add(tblMeetings);
        return obj_list;
    }
    [WebMethod]
    public List<string> GetEnrolementView_ById(Int64 Id)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@Inqueryid", SqlDbType.BigInt);
        PM[0].Value = Id;

        dsResult = gf.Filldatasetvalue(PM, "USP_GetEnrolementView", dsResult, null);
        string tblInquiry = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblInquiryStudents = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblAssessments = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblMeetings = DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        List<string> obj_list = new List<string>();
        obj_list.Add(tblInquiry);
        obj_list.Add(tblInquiryStudents);
        obj_list.Add(tblAssessments);
        obj_list.Add(tblMeetings);
        return obj_list;
    }

    public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
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
