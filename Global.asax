<%@ Application Language="C#" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Timers" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    public static System.Timers.Timer timer1 = new System.Timers.Timer();

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        //timer1.Interval = 3 * 60 * 1000;
        //timer1.Elapsed += timer1_Elapsed;
        //timer1.Start();
    }
    void timer1_Elapsed(object sender, ElapsedEventArgs e)
    {
        try
        {
            DataSet dsResult = new DataSet();
            GenralFunction gf = new GenralFunction();
            SqlParameter[] PM = new SqlParameter[1];
            PM[0] = new SqlParameter("@Schedule", SqlDbType.BigInt);
            PM[0].Value = "1";

            dsResult = gf.Filldatasetvalue(PM, "USP_Schedular", dsResult, null);
        }
        catch (Exception ex)
        {
        }
    }
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
