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


public partial class Tutor_MailBox : System.Web.UI.Page
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
    public static List<string> UpdateTutorInfo(string Name, string Address, string Email, string Phone, string Avail, string TutorId, string Subjects)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[7];

        PM[0] = new SqlParameter("@Name", SqlDbType.VarChar);
        PM[0].Value = Name;
        PM[1] = new SqlParameter("@Address", SqlDbType.VarChar);
        PM[1].Value = Address;
        PM[2] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[2].Value = Email;
        PM[3] = new SqlParameter("@Phone", SqlDbType.VarChar);
        PM[3].Value = Phone;
        PM[4] = new SqlParameter("@Avail", SqlDbType.VarChar);
        PM[4].Value = Avail;
        PM[5] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[5].Value = TutorId;
        PM[6] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[6].Value = Subjects;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateTutorInfo", dsResult, null);
        string tblUpdateMessage = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);
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
        string tblMessage = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);


        return obj_list;
    }
    [WebMethod]
    public static List<string> CreateTutor(string FirstName, string LastName, string PrimaryPhone,
        string SecondryPhone, string Email, string Gender, string Availability, string Subjects)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[9];

        PM[0] = new SqlParameter("@FirstName", SqlDbType.VarChar);
        PM[0].Value = FirstName;
        PM[1] = new SqlParameter("@LastName", SqlDbType.VarChar);
        PM[1].Value = LastName;
        PM[2] = new SqlParameter("@PrimaryPhone", SqlDbType.VarChar);
        PM[2].Value = PrimaryPhone;
        PM[3] = new SqlParameter("@SecondryPhone", SqlDbType.VarChar);
        PM[3].Value = SecondryPhone;
        PM[4] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[4].Value = Email;
        PM[5] = new SqlParameter("@Gender", SqlDbType.VarChar);
        PM[5].Value = Gender;
        PM[6] = new SqlParameter("@Availability", SqlDbType.VarChar);
        PM[6].Value = Availability;

        PM[7] = new SqlParameter("@FranchiseId", SqlDbType.Int);
        PM[7].Value = HttpContext.Current.Session["FranchiseID"].ToString(); ;
        PM[8] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[8].Value = Subjects;

        dsResult = gf.Filldatasetvalue(PM, "USP_CreateTutor", dsResult, null);
        string tblUpdateMessage = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);
        return obj_list;

    }
    [WebMethod]
    public static List<string> LogTransferRequest(string Date, string StartTime, string Endtime, string Message, string TutorId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];

        PM[0] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[0].Value = Date;
        PM[1] = new SqlParameter("@StartTime", SqlDbType.VarChar);
        PM[1].Value = StartTime;
        PM[2] = new SqlParameter("@Endtime", SqlDbType.VarChar);
        PM[2].Value = Endtime;
        PM[3] = new SqlParameter("@Message", SqlDbType.VarChar);
        PM[3].Value = Message;
        PM[4] = new SqlParameter("@TutorId", SqlDbType.VarChar);
        PM[4].Value = TutorId;
        PM[5] = new SqlParameter("@Author", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["User"].ToString();

        //Session["User"]

        dsResult = gf.Filldatasetvalue(PM, "USP_LogTransferRequest", dsResult, null);
        string tblUpdateMessage = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblRequestLogged = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);
        obj_list.Add(tblRequestLogged);
        return obj_list;

    }

    [WebMethod]
    public static List<string> GetTutor(string TutorId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["Id"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_Gettutor_ReadMsg", dsResult, null);
        string tblTutor = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblTutorList = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblInbox = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblSend = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTutor);
        obj_list.Add(tblTutorList);
        obj_list.Add(tblInbox);
        obj_list.Add(tblSend);

        return obj_list;

    }
    [WebMethod]
    public static List<string> GetTransferRequest(string TutorId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[0].Value = TutorId;

        dsResult = gf.Filldatasetvalue(PM, "USP_GetTransferRequest", dsResult, null);
        string tblTransferReq = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTransferReq);

        return obj_list;

    }

    [WebMethod]
    public static List<string> SaveMessage(string To, string From, string Message)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@To", SqlDbType.VarChar);
        PM[0].Value = To;
        PM[1] = new SqlParameter("@From", SqlDbType.VarChar);
        PM[1].Value = ((HttpContext.Current.Session["Role"].ToString() == "3") ? HttpContext.Current.Session["Id"].ToString() : From);

        PM[2] = new SqlParameter("@Message", SqlDbType.VarChar);
        PM[2].Value = Message;

        PM[3] = new SqlParameter("@Author", SqlDbType.VarChar);
        PM[3].Value = HttpContext.Current.Session["User"].ToString();

        PM[4] = new SqlParameter("@AuthorId", SqlDbType.VarChar);
        PM[4].Value = HttpContext.Current.Session["Id"].ToString();

        PM[5] = new SqlParameter("@RoleId", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["Role"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_SaveMessage", dsResult, null);
        string tblTransferReq = Tutor_MailBox.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTransferReq);

        return obj_list;

    }
}