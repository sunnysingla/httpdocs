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

public partial class Tutor_Shifts : System.Web.UI.Page
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
    public static List<string> UpdateTutorInfo(string Name, string Address, string Email,  string Phone, string SPhone, string Avail, string TutorId, string Subjects,
    string MondayOpen,
    string MondayClose, string TuesdayOpen, string TuesdayClose, string WednesdayOpen,
    string WednesdayClose, string ThursdayOpen, string ThursdayClose, string FridayOpen,
    string FridayClose, string SaturdayOpen, string SaturdayClose, string SundayOpen, string SundayClose)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[25];

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
        PM[5].Value = HttpContext.Current.Session["Id"].ToString();
        PM[6] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[6].Value = Subjects;
        PM[7] = new SqlParameter("@Password", SqlDbType.VarChar);
        PM[7].Value = DBNull.Value;
        PM[8] = new SqlParameter("@Password1", SqlDbType.VarChar);
        PM[8].Value = DBNull.Value;
        PM[9] = new SqlParameter("@Password2", SqlDbType.VarChar);
        PM[9].Value = DBNull.Value;

        PM[10] = new SqlParameter("@MondayOpen", SqlDbType.VarChar);
        PM[10].Value = MondayOpen;
        PM[11] = new SqlParameter("@MondayClose", SqlDbType.VarChar);
        PM[11].Value = MondayClose;
        PM[12] = new SqlParameter("@TuesdayOpen", SqlDbType.VarChar);
        PM[12].Value = TuesdayOpen;
        PM[13] = new SqlParameter("@TuesdayClose", SqlDbType.VarChar);
        PM[13].Value = TuesdayClose;
        PM[14] = new SqlParameter("@WednesdayOpen", SqlDbType.VarChar);
        PM[14].Value = WednesdayOpen;
        PM[15] = new SqlParameter("@WednesdayClose", SqlDbType.VarChar);
        PM[15].Value = WednesdayClose;
        PM[16] = new SqlParameter("@ThursdayOpen", SqlDbType.VarChar);
        PM[16].Value = ThursdayOpen;
        PM[17] = new SqlParameter("@ThursdayClose", SqlDbType.VarChar);
        PM[17].Value = ThursdayClose;
        PM[18] = new SqlParameter("@FridayOpen", SqlDbType.VarChar);
        PM[18].Value = FridayOpen;
        PM[19] = new SqlParameter("@FridayClose", SqlDbType.VarChar);
        PM[19].Value = FridayClose;
        PM[20] = new SqlParameter("@SaturdayOpen", SqlDbType.VarChar);
        PM[20].Value = SaturdayOpen;
        PM[21] = new SqlParameter("@SaturdayClose", SqlDbType.VarChar);
        PM[21].Value = SaturdayClose;
        PM[22] = new SqlParameter("@SundayOpen", SqlDbType.VarChar);
        PM[22].Value = SundayOpen;
        PM[23] = new SqlParameter("@SundayClose", SqlDbType.VarChar);
        PM[23].Value = SundayClose;
        PM[24] = new SqlParameter("@SPhone", SqlDbType.VarChar);
        PM[24].Value = SPhone;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateTutorInfo", dsResult, null);
        string tblUpdateMessage = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);
        return obj_list;

    }

    [WebMethod]
    public static List<string> CreateTutor(string FirstName, string LastName, string PrimaryPhone,
        string SecondryPhone, string Email,string Password, string Gender, string Availability, string Subjects)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[10];

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
        PM[9] = new SqlParameter("@Password", SqlDbType.VarChar);
        PM[9].Value = Password;

        dsResult = gf.Filldatasetvalue(PM, "USP_CreateTutor", dsResult, null);
        string tblUpdateMessage = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

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
        PM[4].Value = HttpContext.Current.Session["Id"].ToString();
        PM[5] = new SqlParameter("@Author", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["User"].ToString();

        //Session["User"]

        dsResult = gf.Filldatasetvalue(PM, "USP_LogTransferRequest", dsResult, null);
        string tblUpdateMessage = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblRequestLogged = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblUpdateMessage);
        obj_list.Add(tblRequestLogged);
        return obj_list;

    }

    [WebMethod]
    public static List<string> UpcommingSession(string TutorId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["Id"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_UpcommingSession", dsResult, null);
        string tblSession = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
 
        List<string> obj_list = new List<string>();
        obj_list.Add(tblSession);
 
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
        PM[0].Value = HttpContext.Current.Session["Id"].ToString(); ;

        dsResult = gf.Filldatasetvalue(PM, "USP_Gettutor", dsResult, null);
        string tblTutor = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblTutorList = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblInbox = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblSend = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        string tblSubjects = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[4]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTutor);
        obj_list.Add(tblTutorList);
        obj_list.Add(tblInbox);
        obj_list.Add(tblSend);
        obj_list.Add(tblSubjects);

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
        PM[0].Value = HttpContext.Current.Session["Id"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GetTransferRequest", dsResult, null);
        string tblTransferReq = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTransferReq);

        return obj_list;

    }

    [WebMethod]
    public static List<string> GetATransferRequest(string TutorId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@TutorId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["Id"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GetATransferRequest", dsResult, null);
        string tblTransferReq = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

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
        string tblTransferReq = Tutor_Shifts.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTransferReq);

        return obj_list;

    }
}