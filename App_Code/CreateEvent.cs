using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for CreateEvent
/// </summary>
public class CreateEvent
{
    public CreateEvent()
    {
        //
        // TODO: Add constructor logic here
        //
    }
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
    public static void CreatEevent(int Sleep, DateTime Start, DateTime End, String Emails, string Summary,string location,string APIPath, string Description,int InquiryID)
    {
        try
        {
            string tz = TimeZoneInfo.Local.DisplayName;
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
                Start = new EventDateTime() { DateTime = Start, TimeZone= TimeZoneInfo.Local.DisplayName },
                End = new EventDateTime() { DateTime = End, TimeZone = TimeZoneInfo.Local.DisplayName },
               
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
        catch (Exception ex)
        {

        }
    }

    public static void DeleteEvent(string APIPath, string EventId)
    {
        try
        {
            var credential = CreateCredential(APIPath);
            var service = CreateService(credential);
            var list = service.CalendarList.List().Execute();
            var calendar = list.Items[0];

            var request = service.Events.Delete(calendar.Id, EventId);
            request.Execute();
 
        }
        catch (Exception ex)
        { }
    }
}