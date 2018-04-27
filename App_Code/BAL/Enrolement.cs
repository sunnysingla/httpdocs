using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Enrolement
/// </summary>
public class Enrolement
{
    public Enrolement()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable CreateInquary(_Inquiry _InquiryObj)
    {
        DataTable dt = new DataTable();
        return dt;
    }


}
public class _EnrollObject
{
    public String _TutorName { get; set; }
    public String _Day { get; set; }
    public String _Time { get; set; }
    public String _Subject { get; set; }
    public String _Gender { get; set; }
    public String _Student { get; set; }
    public String _SubjectsHrs { get; set; }
    public String _StudyHallHrs { get; set; }

}
public class _EnrollObjects
{
    public List<_EnrollObject> obj_EnrollObject { get; set; }
}
public class _Inquiry
{
    public int _ID { get; set; }
    public String _Date { get; set; }
    public String _ContactName { get; set; }
    public String _Email { get; set; }
    public String _Source { get; set; }
    public String _Notes { get; set; }
    public List<_InquiryStudent> obj_InquiryStudent { get; set; }
    public List<_Assessment> obj_Assessment { get; set; }
    public List<_Meetings> obj_Meetings { get; set; }
    public String _ContactPhone { get; set; }
}

public class _InquiryStudent
{
    public int _ID { get; set; }
    public int _InquiryID { get; set; }
    public String _StudentName { get; set; }
    public String _Grade { get; set; }
    public String _Subjects { get; set; }
    public String _School { get; set; }
    public String _Notes { get; set; }
}



public class _Assessment
{
    public int _ID { get; set; }
    public int _InquiryID { get; set; }
    public String _Date { get; set; }
    public String _ContactName { get; set; }
    public String _StudentName { get; set; }
    public String _Subjects { get; set; }
    public String _Grade { get; set; }
    public String _Time { get; set; }
}


public class _Meetings
{
    public int _ID { get; set; }
    public int _InquiryID { get; set; }
    public String _Date { get; set; }
    public String _ContactName { get; set; }
    public String _ContactNumber { get; set; }
    public String _Contactemail { get; set; }
    public String _StudentName { get; set; }
    public String _Time { get; set; }
}

public class _CallLogs
{

    public int _ID { get; set; }
    public int _InquiryID { get; set; }
    public String _Date { get; set; }
    public String _Notes { get; set; }
    public String _Auther { get; set; }

}

public class _StudentInvoice
{
    public int _ID { get; set; }
    public int _InquiryID { get; set; }
    public String _StudentName { get; set; }
    public String _Subjects { get; set; }
    public String _PurchasedHoursPerSubject { get; set; }
    public String _PurchasedStudyHallHours { get; set; }
    public String _TypeOfplan { get; set; }
    public String _HourlyRate { get; set; }
    public String _PaymentMethod { get; set; }
    public String _DownPayment { get; set; }
    public String _Discount { get; set; }
    public String _NetFee { get; set; }
    public String _BalanceOutstanding { get; set; }
    public String _ContactName { get; set; }
    public String _ContactAddress { get; set; }
    public String _ContactEmail { get; set; }
    public String _SplitHrs { get; set; }
    public String _RetailRate { get; set; }
}