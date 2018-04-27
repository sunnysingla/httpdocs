using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestAPIGoogle : System.Web.UI.Page
{
    static string ApplicationName = "Google Calendar API";


    static CalendarService CreateService(GoogleCredential credential)
    {
        var service = new CalendarService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = ApplicationName,
            GZipEnabled = true
        });
        return service;
    }
    [System.Security.Permissions.PermissionSet(System.Security.Permissions.SecurityAction.Demand, Name = "FullTrust")]
    private static GoogleCredential CreateCredential(string JsonKeypath)
    {
        using (var stream = new FileStream(JsonKeypath, FileMode.Open, FileAccess.Read))
        {
            string[] scopes = { CalendarService.Scope.Calendar, CalendarService.Scope.CalendarReadonly };
            var credential = GoogleCredential.FromStream(stream);
 
            credential = credential.CreateScoped(scopes);
            
            return credential;
        }
    }
    public static void CreatEevent(int Sleep, DateTime Start, DateTime End, String Emails, string Summary, string location, string APIPath, string Description, int InquiryID)
    {
 
            var credential = CreateCredential(APIPath);
            var service = CreateService(credential);

            List<EventAttendee> listAttendees = new List<EventAttendee>();
            for (int i = 0; i < Emails.Split(',').Length; i++)
            {
                EventAttendee Attendance = new EventAttendee();
                Attendance.Email = Emails.Split(',')[i];
                listAttendees.Add(Attendance);
            }
            Event InquiryEvents = new Event()
            {
                Summary = Summary,
                Start = new EventDateTime() { DateTime = Start },
                End = new EventDateTime() { DateTime = End },
                Location = location,
                Description = Description,
                Attendees = listAttendees
            };
            var list = service.CalendarList.List().Execute();
            var calendar = list.Items[0];
            var request = service.Events.Insert(InquiryEvents, calendar.Id);
            var result = request.Execute();
            SqlParameter[] PM = new SqlParameter[2];
            PM[0] = new SqlParameter("@InquiryId", SqlDbType.VarChar);
            PM[0].Value = InquiryID;
            PM[1] = new SqlParameter("@CalendarID", SqlDbType.VarChar);
            PM[1].Value = result.Id;

            DataSet dsResult = new DataSet();
            DataFunctions df = new DataFunctions();
            GenralFunction gf = new GenralFunction();
            dsResult = gf.Filldatasetvalue(PM, "USP_UpdateCalendarID", dsResult, null);
 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        var APIPath = HttpContext.Current.Server.MapPath("~/Api/") + "\\CalendarAPI-f8824a5d2164.json";

        string Time = (DateTime.Now.Hour % 12).ToString() + ":" + DateTime.Now.Minute.ToString() + "" + (((DateTime.Now.Hour % 12) >= 1) ? "PM" : "AM");
        DateTime start;
        DateTime end;
        DateTime.TryParseExact("03/03/2018" + ((Time == "") ? " 12:00 AM" : " " + ((Time.Length < 7) ? "0" + Time : Time).ToString().Replace("AM", " AM").Replace("PM", " PM")), "MM/dd/yyyy hh:mm tt", CultureInfo.InvariantCulture,
                DateTimeStyles.None, out start);

        end = start.AddMinutes(5);

        var addr = "Chandigarh";


 
            CreatEevent(1000,
                start, end,
                "ssingla1985@gmail.com",
                "New Inquiry Request", addr
                , APIPath, "sunny", 2310);
 

    }
}