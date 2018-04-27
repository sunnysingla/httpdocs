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

public partial class Tutor_Schedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> MasterScheduling(string Time, string Day, string Date)
    {
        HttpContext.Current.Session["Time"] = Time;
        HttpContext.Current.Session["Day"] = Day;
        HttpContext.Current.Session["Date"] = Date;

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[4];
        PM[0] = new SqlParameter("@FranchiseId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString();
        PM[1] = new SqlParameter("@Time", SqlDbType.VarChar);
        PM[1].Value = Time;
        PM[2] = new SqlParameter("@Day", SqlDbType.VarChar);
        PM[2].Value = Day;
        PM[3] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[3].Value = Date;

        dsResult = gf.Filldatasetvalue(PM, "USP_SessionScheduling", dsResult, null);
        string tblTables = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblTutor = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblStudent = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        List<string> obj_list = new List<string>();
        obj_list.Add(tblTables);
        obj_list.Add(tblTutor);
        obj_list.Add(tblStudent);

        return obj_list;
    }
    [WebMethod]
    public static List<string> DeleteStudent(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@MasterScheduleId", SqlDbType.BigInt);
        PM[0].Value = ID;

        dsResult = gf.Filldatasetvalue(PM, "USP_DeleteStudent_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> DeleteTutor(string ID1, string ID2, string ID3)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[3];

        PM[0] = new SqlParameter("@MSID1", SqlDbType.BigInt);
        PM[0].Value = ID1;
        PM[1] = new SqlParameter("@MSID2", SqlDbType.BigInt);
        PM[1].Value = ID2;
        PM[2] = new SqlParameter("@MSID3", SqlDbType.BigInt);
        PM[2].Value = ID3;

        dsResult = gf.Filldatasetvalue(PM, "USP_DeleteTutor_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> GETTimes(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GETTimes", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> DeleteTble(string ID)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@Ids", SqlDbType.VarChar);
        PM[0].Value = ID;

        dsResult = gf.Filldatasetvalue(PM, "USP_DeleteTble_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> Swipe_Student(string ID1, string ID2)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@MasterScheduleID1", SqlDbType.VarChar);
        PM[0].Value = ID1;
        PM[1] = new SqlParameter("@MasterScheduleID2", SqlDbType.VarChar);
        PM[1].Value = ID2;

        dsResult = gf.Filldatasetvalue(PM, "Swipe_Student_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> Swipe_Student_BlankMSID(string ID1, string Tablenumber)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@MasterScheduleID1", SqlDbType.VarChar);
        PM[0].Value = ID1;
        PM[1] = new SqlParameter("@TableNumber", SqlDbType.VarChar);
        PM[1].Value = Tablenumber;

        dsResult = gf.Filldatasetvalue(PM, "Swipe_Student_BlankMSID_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> Swipe_Tutor(string SID1, string SID2, string SID3, string TID1, string TID2, string TID3)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[6];
        PM[0] = new SqlParameter("@SourceStudent1", SqlDbType.VarChar);
        PM[0].Value = SID1;
        PM[1] = new SqlParameter("@SourceStudent2", SqlDbType.VarChar);
        PM[1].Value = SID2;
        PM[2] = new SqlParameter("@SourceStudent3", SqlDbType.VarChar);
        PM[2].Value = SID2;

        PM[3] = new SqlParameter("@TargetStudent1", SqlDbType.VarChar);
        PM[3].Value = TID1;
        PM[4] = new SqlParameter("@TargetStudent2", SqlDbType.VarChar);
        PM[4].Value = TID2;
        PM[5] = new SqlParameter("@TargetStudent3", SqlDbType.VarChar);
        PM[5].Value = TID3;

        dsResult = gf.Filldatasetvalue(PM, "USP_SwipeTutor_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> GetSubject()
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GetSubject", dsResult, null);
        string tblSubjects = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblSubjects);
        return obj_list;

    }

    [WebMethod]
    public static List<string> CreateAttendance(string MSIDs, string Reasons, string Date)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[3];
        PM[0] = new SqlParameter("@MSIDs", SqlDbType.VarChar);
        PM[0].Value = MSIDs;
        PM[1] = new SqlParameter("@Reasons", SqlDbType.VarChar);
        PM[1].Value = Reasons;
        PM[2] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[2].Value = Date;

        dsResult = gf.Filldatasetvalue(PM, "USP_CreateAttendance", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

    [WebMethod]
    public static List<string> UpdateSubject(string Subject, String MasterScheduleId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Subject", SqlDbType.VarChar);
        PM[0].Value = Subject;
        PM[1] = new SqlParameter("@MasterScheduleId", SqlDbType.BigInt);
        PM[1].Value = MasterScheduleId;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateSubject_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;

    }

    [WebMethod]
    public static List<string> MasterSchedule_ADD_Update(string TutorID, string StudentID, string SubjectID, string ID, string Tablenumber)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[9];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString(); ;
        PM[1] = new SqlParameter("@TutorID", SqlDbType.BigInt);
        PM[1].Value = ((TutorID == "null" || TutorID == "") ? "0" : TutorID);
        PM[2] = new SqlParameter("@StudentID", SqlDbType.BigInt);
        PM[2].Value = StudentID;
        PM[3] = new SqlParameter("@SubjectID", SqlDbType.BigInt);
        PM[3].Value = SubjectID;
        PM[4] = new SqlParameter("@ID", SqlDbType.BigInt);
        PM[4].Value = ((ID == "null" || ID == "") ? "0" : ID);

        PM[5] = new SqlParameter("@Day", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["Day"].ToString();
        PM[6] = new SqlParameter("@TimeID", SqlDbType.VarChar);
        PM[6].Value = HttpContext.Current.Session["Time"].ToString();
        PM[7] = new SqlParameter("@Tablenumber", SqlDbType.BigInt);
        PM[7].Value = Tablenumber;

        PM[8] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[8].Value = HttpContext.Current.Session["Date"];


        dsResult = gf.Filldatasetvalue(PM, "USP_SessionSchedule_ADD_Update", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> MasterSchedule_ADD_Update_All(string TutorID, string StudentID, string SubjectID, string ID, string Tablenumber, string TimeID, string Day, string Date)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[9];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString(); ;
        PM[1] = new SqlParameter("@TutorID", SqlDbType.BigInt);
        PM[1].Value = ((TutorID == "null" || TutorID == "") ? "0" : TutorID);
        PM[2] = new SqlParameter("@StudentID", SqlDbType.BigInt);
        PM[2].Value = StudentID;
        PM[3] = new SqlParameter("@SubjectID", SqlDbType.BigInt);
        PM[3].Value = SubjectID;
        PM[4] = new SqlParameter("@ID", SqlDbType.BigInt);
        PM[4].Value = ((ID == "null" || ID == "") ? "0" : ID);

        PM[5] = new SqlParameter("@Day", SqlDbType.VarChar);
        PM[5].Value = Day;
        PM[6] = new SqlParameter("@TimeID", SqlDbType.VarChar);
        PM[6].Value = TimeID;
        PM[7] = new SqlParameter("@Tablenumber", SqlDbType.BigInt);
        PM[7].Value = Tablenumber;

        PM[8] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[8].Value = Date;


        dsResult = gf.Filldatasetvalue(PM, "USP_SessionSchedule_ADD_Update", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> MasterSchedule_ADD_Update_Tutor(string TutorID, string ID1, string ID2, string ID3, string Tablenumber)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[9];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString(); ;
        PM[1] = new SqlParameter("@TutorID", SqlDbType.BigInt);
        PM[1].Value = ((TutorID == "null" || TutorID == "") ? "0" : TutorID);


        PM[2] = new SqlParameter("@ID1", SqlDbType.BigInt);
        PM[2].Value = ((ID1 == "null" || ID1 == "") ? "0" : ID1);

        PM[3] = new SqlParameter("@ID2", SqlDbType.BigInt);
        PM[3].Value = ((ID2 == "null" || ID2 == "") ? "0" : ID2);

        PM[4] = new SqlParameter("@ID3", SqlDbType.BigInt);
        PM[4].Value = ((ID3 == "null" || ID3 == "") ? "0" : ID3);

        PM[5] = new SqlParameter("@Day", SqlDbType.VarChar);
        PM[5].Value = HttpContext.Current.Session["Day"].ToString();
        PM[6] = new SqlParameter("@TimeID", SqlDbType.VarChar);
        PM[6].Value = HttpContext.Current.Session["Time"].ToString();
        PM[7] = new SqlParameter("@Tablenumber", SqlDbType.BigInt);
        PM[7].Value = Tablenumber;

        PM[8] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[8].Value = HttpContext.Current.Session["Date"];

        dsResult = gf.Filldatasetvalue(PM, "USP_SessionSchedule_ADD_Update_Tutor", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }
    [WebMethod]
    public static List<string> MasterSchedule_ADD_Update_Tutor_All(string TutorID, string ID1, string ID2, string ID3, string Tablenumber, string TimeID, string Day, string Date)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[9];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["TutorFranchiseID"].ToString(); ;
        PM[1] = new SqlParameter("@TutorID", SqlDbType.BigInt);
        PM[1].Value = ((TutorID == "null" || TutorID == "") ? "0" : TutorID);


        PM[2] = new SqlParameter("@ID1", SqlDbType.BigInt);
        PM[2].Value = ((ID1 == "null" || ID1 == "") ? "0" : ID1);

        PM[3] = new SqlParameter("@ID2", SqlDbType.BigInt);
        PM[3].Value = ((ID2 == "null" || ID2 == "") ? "0" : ID2);

        PM[4] = new SqlParameter("@ID3", SqlDbType.BigInt);
        PM[4].Value = ((ID3 == "null" || ID3 == "") ? "0" : ID3);

        PM[5] = new SqlParameter("@Day", SqlDbType.VarChar);
        PM[5].Value = Day;
        PM[6] = new SqlParameter("@TimeID", SqlDbType.VarChar);
        PM[6].Value = TimeID;
        PM[7] = new SqlParameter("@Tablenumber", SqlDbType.BigInt);
        PM[7].Value = Tablenumber;

        PM[8] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[8].Value = Date;

        dsResult = gf.Filldatasetvalue(PM, "USP_SessionSchedule_ADD_Update_Tutor", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

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

    [WebMethod]
    public static List<string> UpdateTableNumber(string MSID1, string MSID2, string MSID3, string Tablenumber)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[8];

        PM[0] = new SqlParameter("@MSID1", SqlDbType.BigInt);
        PM[0].Value = ((MSID1 == "null" || MSID1 == "") ? "0" : MSID1);

        PM[1] = new SqlParameter("@MSID2", SqlDbType.BigInt);
        PM[1].Value = ((MSID2 == "null" || MSID2 == "") ? "0" : MSID2);

        PM[2] = new SqlParameter("@MSID3", SqlDbType.BigInt);
        PM[2].Value = ((MSID3 == "null" || MSID3 == "") ? "0" : MSID3);


        PM[3] = new SqlParameter("@Tablenumber", SqlDbType.BigInt);
        PM[3].Value = Tablenumber;

        dsResult = gf.Filldatasetvalue(PM, "USP_UpdateTableNumber_Session", dsResult, null);
        string tblMessage = Tutor_Schedule.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);
        return obj_list;
    }

}