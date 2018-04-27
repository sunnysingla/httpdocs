using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Enrollment_Inquiry : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataFunctions df = new DataFunctions();
    GenralFunction gf = new GenralFunction();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = gf.Filldatatablevalue(null, "sp_selecttest", dt, null);
    }

    [WebMethod]
    public static string EnrollStudents(object obj_Enroll,Int64 InqiryId)
    {
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
       // _EnrollObjects obj_EnrollObjects = jsonSerializer.Deserialize<_EnrollObjects>(obj_Enroll.ToString());
        List<_EnrollObject> obj_EnrollObjects = jsonSerializer.Deserialize<List<_EnrollObject>>(obj_Enroll.ToString());
        SqlParameter[] PM = new SqlParameter[2];
        #region "Inquiry Student Object for usp_CreateInquary"
        DataTable dtIS = new DataTable();
        dtIS.Columns.Add("TutorName");
        dtIS.Columns.Add("Day");
        dtIS.Columns.Add("Time");
        dtIS.Columns.Add("Subject");
        dtIS.Columns.Add("Gender");
        dtIS.Columns.Add("Student");
        dtIS.Columns.Add("SubjectHrs");
        dtIS.Columns.Add("StudyHallHrs");

        for (int x = 0; x < obj_EnrollObjects.Count; x++)
        {
            DataRow dr = dtIS.NewRow();
            dr[0] = obj_EnrollObjects[x]._TutorName;
            dr[1] = obj_EnrollObjects[x]._Day;
            dr[2] = obj_EnrollObjects[x]._Time.Split('-')[0];
            dr[3] = obj_EnrollObjects[x]._Subject;
            dr[4] = obj_EnrollObjects[x]._Gender;
            dr[5] = obj_EnrollObjects[x]._Student;
            dr[6] = obj_EnrollObjects[x]._SubjectsHrs;
            dr[7] = obj_EnrollObjects[x]._StudyHallHrs;
            dtIS.Rows.Add(dr);
        }
        PM[0] = new SqlParameter("@Enroll", SqlDbType.Structured);
        PM[0].Value = dtIS;
        #endregion
 
        PM[1] = new SqlParameter("@InquiryId", SqlDbType.VarChar);
        PM[1].Value = InqiryId;

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        dsResult = gf.Filldatasetvalue(PM, "USP_EnrollStudents", dsResult, null);

        return dsResult.Tables[0].Rows[0][0].ToString();//dsResult;
    }

    [WebMethod]
    public static List<string> EnrollStudent(String StudentIds, String InqiryId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@InquiryId", SqlDbType.VarChar);
        PM[0].Value = InqiryId;
        PM[1] = new SqlParameter("@StudentIds", SqlDbType.VarChar);
        PM[1].Value = StudentIds;

        dsResult = gf.Filldatasetvalue(PM, "USP_EnrollStudent", dsResult, null);
        string tblMessage = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);

        return obj_list;
    }

    [WebMethod]
    public static List<string> SaveSignature(String InqiryId, String Sinature)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@InqiryId", SqlDbType.VarChar);
        PM[0].Value = InqiryId;
        PM[1] = new SqlParameter("@Sinature", SqlDbType.VarChar);
        PM[1].Value = Sinature;

        dsResult = gf.Filldatasetvalue(PM, "UPS_SaveSignature", dsResult, null);
        string tblMessage = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);

        return obj_list;
    }

    [WebMethod]
    public static string CreateInquary(object obj_Inquiry)
    {
        //_Inquiry a = obj_Inquiry;
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _Inquiry objCustomer = jsonSerializer.Deserialize<_Inquiry>(obj_Inquiry.ToString());
        SqlParameter[] PM = new SqlParameter[10];
        PM[0] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[0].Value = objCustomer._Date;
        PM[1] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[1].Value = objCustomer._ContactName;
        PM[2] = new SqlParameter("@ContactPhone", SqlDbType.VarChar);
        PM[2].Value = objCustomer._ContactPhone;
        PM[3] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[3].Value = objCustomer._Email;
        PM[4] = new SqlParameter("@Source", SqlDbType.VarChar);
        PM[4].Value = objCustomer._Source;
        PM[5] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[5].Value = objCustomer._Notes;

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
        PM[6] = new SqlParameter("@typeInquiryStudent", SqlDbType.Structured);
        PM[6].Value = dtIS;
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
        dtAssesment.Columns.Add("Time");
       
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
            dr[7] = objCustomer.obj_Assessment[x]._Time;
 
            dtAssesment.Rows.Add(dr);
        }

        PM[7] = new SqlParameter("@typeAssessments", SqlDbType.Structured);
        PM[7].Value = dtAssesment;
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
        dtMeeting.Columns.Add("Time");
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
            dr[7] = objCustomer.obj_Meetings[x]._Time;
            dtMeeting.Rows.Add(dr);
        }

        PM[8] = new SqlParameter("@typeMeetings", SqlDbType.Structured);
        PM[8].Value = dtMeeting;
        #endregion

        PM[9] = new SqlParameter("@FranchiseID", SqlDbType.VarChar);
        PM[9].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();

        var APIPath= HttpContext.Current.Server.MapPath("~/Api/") + "\\CalendarAPI123.json"; 

        dsResult = gf.Filldatasetvalue(PM, "usp_CreateInquary", dsResult, null);

      
        List<string> datepart = objCustomer._Date.Split('/').ToList<string>();

 

        string Time = (DateTime.Now.Hour % 12).ToString() + ":" + DateTime.Now.Minute.ToString() + "" + (((DateTime.Now.Hour % 12) >= 1) ? "PM" : "AM");
        DateTime start;
        DateTime end;
        DateTime start1;
        DateTime end1;
        DateTime start2;
        DateTime end2;

        DateTime.TryParseExact(objCustomer._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture,
                DateTimeStyles.None, out start);

        end = start.AddMinutes(5);
        string Gmail = Convert.ToString(HttpContext.Current.Session["GmailId"]);

        var addr = HttpContext.Current.Session["Address"].ToString();
        //try
        //{
        //    //var background = new Thread(() => CreateEvent.CreatEevent(1000,
        //    //    start, end,
        //    //    Gmail + "," + objCustomer._Email,
        //    //    "New Inquiry Request", addr
        //    //    , APIPath, objCustomer._ContactName, int.Parse(dsResult.Tables[0].Rows[0][0].ToString())));

        //    //background.IsBackground = true;
        //    //background.Start();

        //}
        //catch
        //{

        //}
        for (int x = 0; x < objCustomer.obj_Assessment.Count; x++)
        {
            Time = objCustomer.obj_Assessment[x]._Time;
            if (Time != "")
            {
                DateTime.TryParseExact(objCustomer.obj_Assessment[x]._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.CurrentCulture,
                DateTimeStyles.None, out start1);
                String CEmail = objCustomer._Email;
                String Name = objCustomer.obj_Assessment[x]._StudentName;
                String InquiryId = dsResult.Tables[0].Rows[0][0].ToString();

                end1 = start1.AddHours(1);
                DateTime dt = new DateTime(start1.Year, start1.Month, start1.Day, start1.Hour, start1.Minute, start1.Second, DateTimeKind.Utc);
                DateTime dt1 = new DateTime(end1.Year, end1.Month, end1.Day, end1.Hour, end1.Minute, end1.Second, DateTimeKind.Utc);

                try
                {
                    var background = new Thread(() => CreateEvent.CreatEevent((x + 1) * 1000,
                    start1, end1,
                    Gmail + "," + CEmail,
                    "New Assessment Request", addr
                    , APIPath, Name,
                    int.Parse(InquiryId)));

                    background.IsBackground = true;
                    background.Start();

                }
                catch
                {
                }
            }
        }
        for (int x = 0; x < objCustomer.obj_Meetings.Count; x++)
        {
            Time = objCustomer.obj_Meetings[x]._Time;
            if (Time != "")
            {
                DateTime.TryParseExact(objCustomer.obj_Meetings[x]._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.CurrentCulture,
                DateTimeStyles.None, out start2);
                String CEmail = objCustomer.obj_Meetings[x]._Contactemail;
                String Name = objCustomer.obj_Meetings[x]._StudentName;
                String InquiryId = dsResult.Tables[0].Rows[0][0].ToString();
                end2 = start2.AddHours(1);

                DateTime dt = new DateTime(start2.Year, start2.Month, start2.Day, start2.Hour, start2.Minute, start2.Second, DateTimeKind.Local);
                DateTime dt1 = new DateTime(end2.Year, end2.Month, end2.Day, end2.Hour, end2.Minute, end2.Second, DateTimeKind.Local);

                try
                {
                    var background = new Thread(() => CreateEvent.CreatEevent((x + 1) * 2000,
                    start2, end2,
                    Gmail + "," + CEmail,
                   "New Meeting Request", addr
                   , APIPath, Name,
                   int.Parse(InquiryId)));

                    background.IsBackground = true;
                    background.Start();

                }
                catch
                {

                }
            }
        }
        return "Added Successfully";//dsResult;
 
   
    }

    [WebMethod]
    public static string UpdateInquary(object obj_Inquiry)
    {
        //_Inquiry a = obj_Inquiry;
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        _Inquiry objCustomer = jsonSerializer.Deserialize<_Inquiry>(obj_Inquiry.ToString());
        SqlParameter[] PM = new SqlParameter[11];
        SqlParameter[] PM1 = new SqlParameter[1];
       
        // for DEleting Calendar inquiries 
        PM1[0] = new SqlParameter("@InquiryID", SqlDbType.VarChar);
        PM1[0].Value = objCustomer._ID;

        PM[0] = new SqlParameter("@Date", SqlDbType.VarChar);
        PM[0].Value = objCustomer._Date;
        PM[1] = new SqlParameter("@ContactName", SqlDbType.VarChar);
        PM[1].Value = objCustomer._ContactName;
        PM[2] = new SqlParameter("@ContactPhone", SqlDbType.VarChar);
        PM[2].Value = objCustomer._ContactPhone;
        PM[3] = new SqlParameter("@Email", SqlDbType.VarChar);
        PM[3].Value = objCustomer._Email;
        PM[4] = new SqlParameter("@Source", SqlDbType.VarChar);
        PM[4].Value = objCustomer._Source;
        PM[5] = new SqlParameter("@Notes", SqlDbType.VarChar);
        PM[5].Value = objCustomer._Notes;

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
        PM[6] = new SqlParameter("@typeInquiryStudent", SqlDbType.Structured);
        PM[6].Value = dtIS;
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
        dtAssesment.Columns.Add("Time");
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
            dr[7] = objCustomer.obj_Assessment[x]._Time;
            dtAssesment.Rows.Add(dr);
        }

        PM[7] = new SqlParameter("@typeAssessments", SqlDbType.Structured);
        PM[7].Value = dtAssesment;
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
        dtMeeting.Columns.Add("Time");

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
            dr[7] = objCustomer.obj_Meetings[x]._Time;
            dtMeeting.Rows.Add(dr);
        }

        PM[8] = new SqlParameter("@typeMeetings", SqlDbType.Structured);
        PM[8].Value = dtMeeting;

        PM[9] = new SqlParameter("@Inquiryid", SqlDbType.VarChar);
        PM[9].Value = objCustomer._ID;
        #endregion

        PM[10] = new SqlParameter("@FranchiseID", SqlDbType.VarChar);
        PM[10].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        DataSet dsResult = new DataSet();
        DataSet dsResult2 = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        dsResult = gf.Filldatasetvalue(PM, "usp_UpdateInquary", dsResult, null);

        dsResult2 = gf.Filldatasetvalue(PM1, "USP_GetCalendarIds", dsResult2, null);
        string[] Ids = dsResult2.Tables[0].Rows[0][0].ToString().Split(',');

        var APIPath = HttpContext.Current.Server.MapPath("~/Api/") + "\\CalendarAPI123.json";



        foreach (string str in Ids)
        {
            if (str.Trim() != "")
            {
                var background = new Thread(() => CreateEvent.DeleteEvent(APIPath, str));
                background.IsBackground = true;
                background.Start();
            }
        }
    

 
        string Time = (DateTime.Now.Hour % 12).ToString() + ":" + DateTime.Now.Minute.ToString() + "" + (((DateTime.Now.Hour % 12) >= 1) ? "PM" : "AM");
        DateTime start;
        DateTime end;

        DateTime start1;
        DateTime end1;
        DateTime start2;
        DateTime end2;

        DateTime.TryParseExact(objCustomer._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture,
                DateTimeStyles.None, out start);

        end = start.AddMinutes(5);

        var addr = HttpContext.Current.Session["Address"].ToString();

        string Gmail = Convert.ToString(HttpContext.Current.Session["GmailId"]);
        //try
        //{
        //    //var background = new Thread(() => CreateEvent.CreatEevent(1000,
        //    //    start, end,
        //    //     Gmail + "," + objCustomer._Email,
        //    //    "New Inquiry Request", addr
        //    //    , APIPath, objCustomer._ContactName, int.Parse(objCustomer._ID.ToString())));

        //    //background.IsBackground = true;
        //    //background.Start();

        //}
        //catch
        //{
        //}

        for (int x = 0; x < objCustomer.obj_Assessment.Count; x++)
        {
            Time = objCustomer.obj_Assessment[x]._Time;
            if (Time != "")
            {
                DateTime.TryParseExact(objCustomer.obj_Assessment[x]._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture,
                DateTimeStyles.None, out start1);

                end1 = start1.AddHours(1);

                String CEmail = objCustomer._Email;
                String Name = objCustomer.obj_Assessment[x]._StudentName;
                String InquiryId = objCustomer._ID.ToString();

                try
                {
                    var background = new Thread(() => CreateEvent.CreatEevent((x + 1) * 1000,
                    start1, end1,
                     Gmail + "," + CEmail,
                    "New Assessment Request", addr
                    , APIPath, Name,
                    int.Parse(InquiryId)));

                    background.IsBackground = true;
                    background.Start();

                }
                catch
                {
                }
            }
        }
        for (int x = 0; x < objCustomer.obj_Meetings.Count; x++)
        {
            if (Time != "")
            {
                Time = objCustomer.obj_Meetings[x]._Time;
                DateTime.TryParseExact(objCustomer.obj_Meetings[x]._Date + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture,
                DateTimeStyles.None, out start2);

                String CEmail = objCustomer.obj_Meetings[x]._Contactemail;
                String Name = objCustomer.obj_Meetings[x]._StudentName;
                String InquiryId = objCustomer._ID.ToString();

                end2 = start2.AddHours(1);
                try
                {
                    var background = new Thread(() => CreateEvent.CreatEevent((x + 1) * 2000,
                   start2, end2,
                   Gmail + "," + CEmail,
                   "New Meeting Request", addr
                   , APIPath, Name,
                   int.Parse(InquiryId)));

                    background.IsBackground = true;
                    background.Start();

                }
                catch
                {

                }
            }
        }


        return dsResult.Tables[0].Rows[0][0].ToString();//dsResult;
    }
 
    [WebMethod]
    public static List<string> GetEnrolementView(string obj_Inquiry)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@FranchiseID", SqlDbType.VarChar);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GetEnrolementView", dsResult, null);
        string tblInquiry = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblInquiryStudents = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblAssessments = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblMeetings = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        string tblTutorTimeSlots = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[4]);
        string tblSubjects = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[6]);

        string tblSource = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[7]);
        string tblGrade = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[8]);
        string tblTime = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[10]);

        string tblPaymentMethods = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[11]);
        string tblPlanType = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[12]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblInquiry);
        //obj_list.Add(tblInquiryStudents);
        obj_list.Add(tblAssessments);
        obj_list.Add(tblMeetings);
        obj_list.Add(tblTutorTimeSlots);
        obj_list.Add(tblSubjects);
        obj_list.Add(tblSource);
        obj_list.Add(tblGrade);
        obj_list.Add(tblTime);
        obj_list.Add(tblPaymentMethods);
        obj_list.Add(tblPlanType);
        return obj_list;
    }
    [WebMethod]
    public static List<string> GetEnrolementView_ById(Int64 Id)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Inqueryid", SqlDbType.BigInt);
        PM[0].Value = Id;
        PM[1] = new SqlParameter("@FranchiseID", SqlDbType.VarChar);
        PM[1].Value = HttpContext.Current.Session["FranchiseID"].ToString();

        dsResult = gf.Filldatasetvalue(PM, "USP_GetEnrolementView", dsResult, null);
        string tblInquiry = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
        string tblInquiryStudents = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[1]);
        string tblAssessments = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[2]);
        string tblMeetings = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[3]);
        string tblTutorTimeSlots = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[4]);
        string tblTutor = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[5]);
        string tblSubjects = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[6]);
        string tblSource = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[7]);
        string tblGrade = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[8]);
        string tblCalllogs = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[9]);
        string tblTime = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[10]);
        string tblPaymentMethods = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[11]);
        string tblPlanType = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[12]);


        List<string> obj_list = new List<string>();
        obj_list.Add(tblInquiry);
        obj_list.Add(tblInquiryStudents);
        obj_list.Add(tblAssessments);
        obj_list.Add(tblMeetings);
        obj_list.Add(tblTutorTimeSlots);
        obj_list.Add(tblTutor);
        obj_list.Add(tblSubjects);
        obj_list.Add(tblSource);
        obj_list.Add(tblGrade);
        obj_list.Add(tblCalllogs);
        obj_list.Add(tblTime);
        obj_list.Add(tblPaymentMethods);
        obj_list.Add(tblPlanType);
        return obj_list;
    }
    [WebMethod]
    public static List<string> GetTutorTimeSlots(string Day_time)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[1];
        PM[0] = new SqlParameter("@Day_time", SqlDbType.VarChar);
        PM[0].Value = Day_time;

        dsResult = gf.Filldatasetvalue(PM, "USP_GetTutorTimeSlots", dsResult, null);
        string tblTutorTimeSlots = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblTutorTimeSlots);

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
    public static List<string> DELETE_Inquiry_Assessment_Meeting(Int64 DeleteId, Int64 InquiryId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@DeleteId", SqlDbType.BigInt);
        PM[0].Value = DeleteId;
        PM[1] = new SqlParameter("@InquiryId", SqlDbType.BigInt);
        PM[1].Value = InquiryId;

        dsResult = gf.Filldatasetvalue(PM, "USP_DELETE_Inquiry_Assessment_Meeting", dsResult, null);
        string tblResults = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblResults);

        return obj_list;
    }
    [WebMethod]
    public static List<string> updateAssessment(int Id, int Value)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@Id", SqlDbType.BigInt);
        PM[0].Value = Id;
        PM[1] = new SqlParameter("@Value", SqlDbType.BigInt);
        PM[1].Value = Value;

        dsResult = gf.Filldatasetvalue(PM, "usp_updateAssessment", dsResult, null);
        string tblMessage = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblMessage);

        return obj_list;
    }


    [WebMethod]
    public static List<string> Complete_Inquiry_Assessment_Meeting(Int64 DeleteId, Int64 InquiryId)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[2];
        PM[0] = new SqlParameter("@DeleteId", SqlDbType.BigInt);
        PM[0].Value = DeleteId;
        PM[1] = new SqlParameter("@InquiryId", SqlDbType.BigInt);
        PM[1].Value = InquiryId;

        dsResult = gf.Filldatasetvalue(PM, "USP_Complete_Inquiry_Assessment_Meeting", dsResult, null);
        string tblResults = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblResults);

        return obj_list;
    }

    [WebMethod]
    public static List<string> getMasterSchedule(string TimeSelected, string Subjects, string Gender)
    {
        
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[4];
        PM[0] = new SqlParameter("@FranchiseId", SqlDbType.BigInt);
        PM[0].Value = HttpContext.Current.Session["FranchiseID"].ToString();
        PM[1] = new SqlParameter("@TimeSelected", SqlDbType.VarChar);
        PM[1].Value = TimeSelected;
        PM[2] = new SqlParameter("@Subjects", SqlDbType.VarChar);
        PM[2].Value = Subjects;
        PM[3] = new SqlParameter("@Gender", SqlDbType.VarChar);
        PM[3].Value = Gender;
 
 

        dsResult = gf.Filldatasetvalue(PM, "USP_getMasterSchedule", dsResult, null);
        string tblResults = Enrollment_Inquiry.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblResults);

        return obj_list;
    }

}