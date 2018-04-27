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

public partial class Public_StudentInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static List<string> SaveStudentInformation(string ID,string SchoolName, 
        string FirstName,  string Grade, 
        string Birthdate, string Age, string HomeAddress, 
        string City, string State, string Zip, string HomePhone, 
        string HowManySibLings, string Ages, string Know_tutoringClub, 
        string FatherName, string FatherOccupation, string FatherEmployer, 
        string FatherWorkPhone, string FatherCellPhone, string FatherEmail, 
        string MotherName, string MotherOccupation, string MotherEmployer, 
        string MotherWorkPhone, string MotherCellPhone, string MotherEmail, 
        string Question1, string Question2, string Question3, string Question4, 
        string Question5, string AdditionalComments, string MedicalQuestion1, 
        string MedicalQuestion2, string MedicalQuestion3, string MedicalQuestion4, 
        string MedicalQuestion5, string MedicalQuestion6, string MedicalQuestion7, 
        string MedicalQuestion8, string DoctorName, 
        string DoctorPhone, string EmergencyContact1Type, string EmergencyContact1Name, 
        string EmergencyContact1Phone)
    {
        DataSet dsResult = new DataSet();
        DataFunctions df = new DataFunctions();
        GenralFunction gf = new GenralFunction();
        SqlParameter[] PM = new SqlParameter[46];

        PM[0] = new SqlParameter("@ID", SqlDbType.VarChar);
        PM[0].Value = ID;
 
        PM[1] = new SqlParameter("@SchoolName", SqlDbType.VarChar);
        PM[1].Value = SchoolName;
 
        PM[2] = new SqlParameter("@FirstName", SqlDbType.VarChar);
        PM[2].Value = FirstName;
 
 
        PM[3] = new SqlParameter("@Grade", SqlDbType.VarChar);
        PM[3].Value = Grade;
        PM[4] = new SqlParameter("@Birthdate", SqlDbType.VarChar);
        PM[4].Value = Birthdate;
 
        PM[5] = new SqlParameter("@Age", SqlDbType.VarChar);
        PM[5].Value = Age;
        PM[6] = new SqlParameter("@HomeAddress", SqlDbType.VarChar);
        PM[6].Value = HomeAddress;
        PM[7] = new SqlParameter("@City", SqlDbType.VarChar);
        PM[7].Value = City;
        PM[8] = new SqlParameter("@State", SqlDbType.VarChar);
        PM[8].Value = State;
        PM[9] = new SqlParameter("@Zip", SqlDbType.VarChar);
        PM[9].Value = Zip;
        PM[10] = new SqlParameter("@HomePhone", SqlDbType.VarChar);
        PM[10].Value = HomePhone;
        PM[11] = new SqlParameter("@HowManySibLings", SqlDbType.VarChar);
        PM[11].Value = HowManySibLings;
        PM[12] = new SqlParameter("@Ages", SqlDbType.VarChar);
        PM[12].Value = Ages;
        PM[13] = new SqlParameter("@Know_tutoringClub", SqlDbType.VarChar);
        PM[13].Value = Know_tutoringClub;
        PM[14] = new SqlParameter("@FatherName", SqlDbType.VarChar);
        PM[14].Value = FatherName;
        PM[15] = new SqlParameter("@FatherOccupation", SqlDbType.VarChar);
        PM[15].Value = FatherOccupation;
        PM[16] = new SqlParameter("@FatherEmployer", SqlDbType.VarChar);
        PM[16].Value = FatherEmployer;
        PM[17] = new SqlParameter("@FatherWorkPhone", SqlDbType.VarChar);
        PM[17].Value = FatherWorkPhone;
        PM[18] = new SqlParameter("@FatherCellPhone", SqlDbType.VarChar);
        PM[18].Value = FatherCellPhone;
        PM[19] = new SqlParameter("@FatherEmail", SqlDbType.VarChar);
        PM[19].Value = FatherEmail;
        PM[20] = new SqlParameter("@MotherName", SqlDbType.VarChar);
        PM[20].Value = MotherName;
        PM[21] = new SqlParameter("@MotherOccupation", SqlDbType.VarChar);
        PM[21].Value = MotherOccupation;
        PM[22] = new SqlParameter("@MotherEmployer", SqlDbType.VarChar);
        PM[22].Value = MotherEmployer;
        PM[23] = new SqlParameter("@MotherWorkPhone", SqlDbType.VarChar);
        PM[23].Value = MotherWorkPhone;
        PM[24] = new SqlParameter("@MotherCellPhone", SqlDbType.VarChar);
        PM[24].Value = MotherCellPhone;
        PM[25] = new SqlParameter("@MotherEmail", SqlDbType.VarChar);
        PM[25].Value = MotherEmail;
        PM[26] = new SqlParameter("@Question1", SqlDbType.VarChar);
        PM[26].Value = Question1;
        PM[27] = new SqlParameter("@Question2", SqlDbType.VarChar);
        PM[27].Value = Question2;
        PM[28] = new SqlParameter("@Question3", SqlDbType.VarChar);
        PM[28].Value = Question3;
        PM[29] = new SqlParameter("@Question4", SqlDbType.VarChar);
        PM[29].Value = Question4;
        PM[30] = new SqlParameter("@Question5", SqlDbType.VarChar);
        PM[30].Value = Question5;
        PM[31] = new SqlParameter("@AdditionalComments", SqlDbType.VarChar);
        PM[31].Value = AdditionalComments;
        PM[32] = new SqlParameter("@MedicalQuestion1", SqlDbType.VarChar);
        PM[32].Value = MedicalQuestion1;
        PM[33] = new SqlParameter("@MedicalQuestion2", SqlDbType.VarChar);
        PM[33].Value = MedicalQuestion2;
        PM[34] = new SqlParameter("@MedicalQuestion3", SqlDbType.VarChar);
        PM[34].Value = MedicalQuestion3;
        PM[35] = new SqlParameter("@MedicalQuestion4", SqlDbType.VarChar);
        PM[35].Value = MedicalQuestion4;
        PM[36] = new SqlParameter("@MedicalQuestion5", SqlDbType.VarChar);
        PM[36].Value = MedicalQuestion5;
        PM[37] = new SqlParameter("@MedicalQuestion6", SqlDbType.VarChar);
        PM[37].Value = MedicalQuestion6;
        PM[38] = new SqlParameter("@MedicalQuestion7", SqlDbType.VarChar);
        PM[38].Value = MedicalQuestion7;
        PM[39] = new SqlParameter("@MedicalQuestion8", SqlDbType.VarChar);
        PM[39].Value = MedicalQuestion8;
 
        PM[40] = new SqlParameter("@DoctorName", SqlDbType.VarChar);
        PM[40].Value = DoctorName;
        PM[41] = new SqlParameter("@DoctorPhone", SqlDbType.VarChar);
        PM[41].Value = DoctorPhone;
        PM[42] = new SqlParameter("@EmergencyContact1Type", SqlDbType.VarChar);
        PM[42].Value = EmergencyContact1Type;
        PM[43] = new SqlParameter("@EmergencyContact1Name", SqlDbType.VarChar);
        PM[43].Value = EmergencyContact1Name;
        PM[44] = new SqlParameter("@EmergencyContact1Phone", SqlDbType.VarChar);
        PM[44].Value = EmergencyContact1Phone;
        PM[45] = new SqlParameter("@UpdatedBy", SqlDbType.VarChar);
        PM[45].Value = HttpContext.Current.Session["User"].ToString();

        //Session["User"]
        dsResult = gf.Filldatasetvalue(PM, "USP_SaveStudentInformation", dsResult, null);
        string tblStudent = Public_StudentInformation.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);

        List<string> obj_list = new List<string>();
        obj_list.Add(tblStudent);

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

        dsResult = gf.Filldatasetvalue(PM, "USP_GetStudentInfo", dsResult, null);
        string tblStudent = Public_StudentInformation.DataTableToJSONWithJavaScriptSerializer(dsResult.Tables[0]);
 
        List<string> obj_list = new List<string>();
        obj_list.Add(tblStudent);
 
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


}