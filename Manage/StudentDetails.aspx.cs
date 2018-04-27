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

public partial class Manage_StudentDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> UpdateStudentInline( 
    string BalanceHours, string TokenBalance, string StudyHall_Hrs,
    string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[10];
        PM[0] = new SqlParameter("@BalanceHours", SqlDbType.VarChar);
        PM[0].Value = BalanceHours;
        PM[1] = new SqlParameter("@TokenBalance", SqlDbType.VarChar);
        PM[1].Value = TokenBalance;

        PM[2] = new SqlParameter("@StudentId", SqlDbType.VarChar);
        PM[2].Value = StudentId;
        PM[3] = new SqlParameter("@HallHrs", SqlDbType.VarChar);
        PM[3].Value = StudyHall_Hrs;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateStudentInline", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    public static List<string> UpdateStudentInlineH(
string BalanceHours, string TokenBalance,string StudyHall_Hrs,
string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[4];

        PM[0] = new SqlParameter("@BalanceHours", SqlDbType.VarChar);
        PM[0].Value = BalanceHours;
        PM[1] = new SqlParameter("@TokenBalance", SqlDbType.VarChar);
        PM[1].Value = TokenBalance;

        PM[2] = new SqlParameter("@StudentId", SqlDbType.VarChar);
        PM[2].Value = StudentId;
        PM[3] = new SqlParameter("@HallHrs", SqlDbType.VarChar);
        PM[3].Value = StudyHall_Hrs;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateStudentInline", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> UpdateStudentDetails(string Name, 
        string Grade, string Subject, string School, 
        string BalanceHours, string TokenBalance, 
        string ContactEmail,string ContactPhone, 
        string ContactName, string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[10];
        PM[0] = new SqlParameter("@Name", SqlDbType.VarChar);
        PM[0].Value = Name;
        PM[1] = new SqlParameter("@Grade", SqlDbType.VarChar);
        PM[1].Value = Grade;
        PM[2] = new SqlParameter("@Subject", SqlDbType.VarChar);
        PM[2].Value = Subject;
        PM[3] = new SqlParameter("@School", SqlDbType.VarChar);
        PM[3].Value = School;
        PM[4] = new SqlParameter("@BalanceHours", SqlDbType.VarChar);
        PM[4].Value = BalanceHours;
        PM[5] = new SqlParameter("@TokenBalance", SqlDbType.VarChar);
        PM[5].Value = TokenBalance;
        PM[6] = new SqlParameter("@ContactEmail", SqlDbType.VarChar);
        PM[6].Value = ContactEmail;
        PM[7] = new SqlParameter("@ContactPhone", SqlDbType.VarChar);
        PM[7].Value = ContactPhone;
        PM[8] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[8].Value = ContactName;
        PM[9] = new SqlParameter("@StudentId", SqlDbType.VarChar);
        PM[9].Value = StudentId;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateStudentDetails", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
 

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
 
        return obj_list;

    }
    [WebMethod]
    public static List<string> StudentSessions(string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@StudentId", SqlDbType.BigInt);
        PM[0].Value = StudentId;

        dsResult = gf.Filldatasetvalue(PM, "USP_StudentSessions", dsResult, null);
        string SessionList = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string PSessionList = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);

        List<string> obj_list = new List<string>();
        obj_list.Add(SessionList);
        obj_list.Add(PSessionList);
        return obj_list;

    }
    [WebMethod]
    public static List<string> SessionScheduling_Chart(string Year, string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Year", SqlDbType.BigInt);
        PM[0].Value = Year;
        PM[1] = new SqlParameter("@StudentId", SqlDbType.BigInt);
        PM[1].Value = StudentId;

        dsResult = gf.Filldatasetvalue(PM, "USP_SessionScheduling_Chart", dsResult, null);
        string data = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string Years = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);

        List<string> obj_list = new List<string>();
        obj_list.Add(data);
        obj_list.Add(Years);
        return obj_list;

    }


    [WebMethod]
    public static List<string> StudentDetails(string StudentId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@StudentId", SqlDbType.BigInt);
        PM[0].Value = StudentId;

        dsResult = gf.Filldatasetvalue(PM, "USP_StudentDetails", dsResult, null);
        string tblStudent = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblNotes = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblFiles = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblInvoice = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        string tblSubjects = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[4]);
        string tblGrade = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[5]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblStudent);
        obj_list.Add(tblNotes);
        obj_list.Add(tblFiles);
        obj_list.Add(tblInvoice);
        obj_list.Add(tblSubjects);
        obj_list.Add(tblGrade);
        return obj_list;

    }
    [WebMethod]
    public static List<string> ArchiveTutor(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.VarChar);
        PM[0].Value = ID;
 
        dsResult = gf.Filldatasetvalue(PM, "USP_ArchiveTutor", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);


        return obj_list;
    }
    [WebMethod]
    public static List<string> GETFeedBack(string SessionId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@SessionId", SqlDbType.VarChar);
        PM[0].Value = SessionId;

        dsResult = gf.Filldatasetvalue(PM, "USP_GETFeedBack", dsResult, null);
        string tblFeedback = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblFeedback);

        return obj_list;
    }
    [WebMethod]
    public static List<string> SaveFeedback(string SessionId, string CoverdstudentMaterials, string CoverdstudentMaterials_Text, 
        string Studentattitude, string Studentattitude_Text, string OtherFeedback)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[7];
        PM[0] = new SqlParameter("@SessionId", SqlDbType.VarChar);
        PM[0].Value = SessionId;
        PM[1] = new SqlParameter("@CoverdstudentMaterials", SqlDbType.VarChar);
        PM[1].Value = CoverdstudentMaterials;
        PM[2] = new SqlParameter("@CoverdstudentMaterials_Text", SqlDbType.VarChar);
        PM[2].Value = CoverdstudentMaterials_Text;
        PM[3] = new SqlParameter("@Studentattitude", SqlDbType.VarChar);
        PM[3].Value = Studentattitude;
        PM[4] = new SqlParameter("@Studentattitude_Text", SqlDbType.VarChar);
        PM[4].Value = Studentattitude_Text;
        PM[5] = new SqlParameter("@OtherFeedback", SqlDbType.VarChar);
        PM[5].Value = OtherFeedback;
        PM[6] = new SqlParameter("@TutorId", SqlDbType.VarChar);
        PM[6].Value = HttpContext.Current.Session["Id"].ToString();

        
        dsResult = gf.Filldatasetvalue(PM, "USP_SaveFeedback", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);


        return obj_list;
    }
    [WebMethod]
    public static List<string> ArchiveGeneric(string ID, string Spname)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@Id", SqlDbType.VarChar);
        PM[0].Value = ID;

        dsResult = gf.Filldatasetvalue(PM, Spname, dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);


        return obj_list;
    }
    [WebMethod]
    public static List<string> ArchiveStudent(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@StudentId", SqlDbType.VarChar);
        PM[0].Value = ID;

        dsResult = gf.Filldatasetvalue(PM, "USP_ArchiveStudent", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
 
        return obj_list;
    }
    [WebMethod]
    public static List<string> LogNote(string Type,string Priority, string Date,string StudentId, string Notes)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@Type", SqlDbType.VarChar);
        PM[0].Value = Type;
        PM[1] = new SqlParameter("@Priority", SqlDbType.VarChar);
        PM[1].Value = Priority;
        PM[2] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[2].Value = Date;
        PM[3] = new SqlParameter("@StudentId", SqlDbType.VarChar);
        PM[3].Value = StudentId;
        PM[4] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[4].Value = Notes;
        PM[5] = new SqlParameter("@Author", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["User"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_LogNote", dsResult, null);
        string tblMessage = Manage_StudentDetails.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
 

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
 

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


    protected void btnFileUpload_Click(object sender, EventArgs e)
    {
        try
        {
            string FileName = txtFilename.Text.ToString();
            String FilePath =MapPath("")+ "/file/" + DateTime.Now.Year.ToString()+"_"+DateTime.Now.Month.ToString()+"_"+DateTime.Now.Day.ToString() + "_" + UploadFile.PostedFile.FileName.Replace(" ", "");

            UploadFile.PostedFile.SaveAs(FilePath);
            DataSet dsResult = new DataSet();
            DataFunctions df = new DataFunctions();
            GenralFunction gf = new GenralFunction();

            SqlParameter[] PM = new SqlParameter[5];
            PM[0] = new SqlParameter("@Filename", SqlDbType.VarChar);
            PM[0].Value = FileName;
            PM[1] = new SqlParameter("@StudentId", SqlDbType.VarChar);
            PM[1].Value = Request["StudentId"].ToString();
            PM[2] = new SqlParameter("@filepath ", SqlDbType.VarChar);
            PM[2].Value = FilePath;
            PM[3] = new SqlParameter("@FileTitle", SqlDbType.VarChar);
            PM[3].Value = FileName;

            PM[4] = new SqlParameter("@Author", SqlDbType.VarChar);
            PM[4].Value = Session["User"].ToString();
            dsResult = gf.Filldatasetvalue(PM, "USP_Uploadfiles", dsResult, null);
            txtFilename.Text = "";
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
    }

    protected void btnInvoiceUpload_Click(object sender, EventArgs e)
    {
        try
        {
            string FileName = txtInvoicetitle.Text.ToString();
            String FilePath = MapPath("") + "/file/" + DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "_" + UploadInvoice.PostedFile.FileName.Replace(" ", "");

            UploadInvoice.PostedFile.SaveAs(FilePath);
            DataSet dsResult = new DataSet();
            DataFunctions df = new DataFunctions();
            GenralFunction gf = new GenralFunction();

            SqlParameter[] PM = new SqlParameter[5];
            PM[0] = new SqlParameter("@Filename", SqlDbType.VarChar);
            PM[0].Value = FileName;

            PM[1] = new SqlParameter("@StudentId", SqlDbType.VarChar);
            PM[1].Value = Request["StudentId"].ToString();

            PM[2] = new SqlParameter("@filepath ", SqlDbType.VarChar);
            PM[2].Value = FilePath;

            PM[3] = new SqlParameter("@InvoiceTitle", SqlDbType.VarChar);
            PM[3].Value = FileName;

            PM[4] = new SqlParameter("@Author", SqlDbType.VarChar);
            PM[4].Value = Session["User"].ToString();

            dsResult = gf.Filldatasetvalue(PM, "USP_UploadInvoiceFile", dsResult, null);
            txtInvoicetitle.Text = "";
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
    }
}