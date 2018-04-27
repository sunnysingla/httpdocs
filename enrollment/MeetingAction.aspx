<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/Popup.master" AutoEventWireup="true" CodeFile="MeetingAction.aspx.cs" Inherits="Enrollment_MeetingAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../CustomJs/UpdateInquiry.js?v=14.5"></script>
    <script src="../CustomJs/Invoice.js?v=14.5"></script>
    <style>
        table#tblTutorAvailable {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 96%;
        }

        #tblTutorAvailable td, #tblTutorAvailable th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        #tblTutorAvailable tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
    <script type="text/javascript">
        var response;
        var InquiryId;
        var objSubjects;
        var SelectedStudents = [];
        function disabledAllcontrol() {
            isdisabled_IA = 1;
            document.getElementById("container").disabled = true;
            var nodes = document.getElementById("container").getElementsByTagName('fieldset');
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].disabled = true;
                $(nodes[i]).css("color", "grey");
            }
            //$(".AddMoreStdName").attr("class", "AddMoreNotes_dis");
            //$(".RemoveMoreStdName").attr("class", "RemoveMoreStdName_dis");
        }
        function enableAllcontrol() {
            isdisabled_IA = 0;
            document.getElementById("container").disabled = true;
            var nodes = document.getElementById("container").getElementsByTagName('fieldset');
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].disabled = false;
                $(nodes[i]).removeAttr("style");
            }
            //$(".AddMoreStdName_dis").attr("class", "AddMoreStdName");
            //$(".RemoveMoreStdName_dis").attr("class", "RemoveMoreStdName");
        }

        function GetEnrolementView() {
            var QueryStrings = window.location.href.split('?')[1];
            InquiryId = QueryStrings.split('&')[0].split('=')[1];


            $.ajax({
                type: "POST",
                url: "Inquiry.aspx/GetEnrolementView_ById",
                data: '{ Id:"' + InquiryId + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response_a) {
                    response = response_a;
                    LoadAgain();
                }
            });
        }
        $(document).ready(function () {
            GetEnrolementView();
        });
        var objTutorTimeSlots;
        var objTutor;
        var objTimes;
        function LoadAgain() {
            for (var x = 0; x < 5; x++) {
                $(".container input[number=" + x + "]").remove();
                $(".container textarea[number=" + x + "]").remove();
                $(".container1 input[number=" + x + "]").remove();
                $(".container1 textarea[number=" + x + "]").remove();
            }
            NumberAdded = 0;
            NumberAdded_Assessment = 0;
            var objInquiry = JSON.parse(response.d[0]);
            var ObjInquiryStudent = JSON.parse(response.d[1]);
            var objAssessment = JSON.parse(response.d[2]);
            var objMeeting = JSON.parse(response.d[3]);
            objTutorTimeSlots = JSON.parse(response.d[4]);
            objTutor = JSON.parse(response.d[5]);
            objSubjects = JSON.parse(response.d[6]);
            objSource = JSON.parse(response.d[7]);
            objGrade = JSON.parse(response.d[8]);

            objTimes = JSON.parse(response.d[10]);
            var htmlStudents = "<table class='ui-jqgrid-btable ui-common-table table table-bordered'><tr class='jqgrow ui-row-ltr'><td style='width:25px;!important' class='jqgrid-rownum active'></td><td class='jqgrid-rownum active'>Name</td></tr>";
            for (var x = 0; x < ObjInquiryStudent.length; x++) {
                htmlStudents = htmlStudents + "<tr class='jqgrow ui-row-ltr'><td class='jqgrid-rownum active'><input type='checkbox' checked='checked' id='" + ObjInquiryStudent[x].ID + "' /></td><td class='jqgrid-rownum active'>" + ObjInquiryStudent[x].StudentName + "</td></tr>";
            }
            htmlStudents = htmlStudents + "</table>";
            $("#TableStudents").html(htmlStudents);
            var weekdayXyz = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']; 
            var TimeDropDownHtml = "";
            //console.log(objTimes);
            for (var x = 0; x < weekdayXyz.length; x++) {
                var z = x + 1;
                if (z == 7)
                    z = 0;
                TimeDropDownHtml = TimeDropDownHtml + ' <optgroup label="' + weekdayXyz[x] + '">';
                for (var y = 0; y < objTimes.length; y++) {
                    if (z == objTimes[y].D && objTimes[y].Filetr=="1")
                        TimeDropDownHtml = TimeDropDownHtml + ' <option value="' + objTimes[y].ID + '">' + objTimes[y].Time + '</option>';
                }
                TimeDropDownHtml = TimeDropDownHtml + '</optgroup>';
                //ddlStudentAvabilitySP
            }

            $("#ddlStudentAvabilitySP").html(TimeDropDownHtml);
            LoadTriggerevents();
            objPaymentMethods = JSON.parse(response.d[11]);
            objPlanType = JSON.parse(response.d[12]);

            //AutoComplete_Single('Time', objTimes, "Time");

            AutoComplete('Subject', objSubjects, "SubjectName");
            AutoComplete_Single('Source', objSource, "Source");
            AutoComplete_Single('Grade', objGrade, "Grade");
            console.log(objPaymentMethods);
            console.log(objPlanType);
            AutoComplete('Payment', objPaymentMethods, "PaymentMethod");
            AutoComplete('Type', objPlanType, "PlanName");

            setTimeout(function () {
                GetInquiriesforAutoComplete();
            }, 1000);
            var tdvSubjects1 = "";
            var tdvStudents1 = "";

            for (var x = 0; x < objAssessment.length; x++) {
                if (x >= 1) {

                    $(".Add_new1").trigger('click');
                }
                $($("#dvDate").find("input[placeholder=Date]")[x]).val(objAssessment[x].Date);
                $($("#dvTime").find("input[placeholder=Time]")[x]).val(objAssessment[x].Time);
                //$($("#dvSName").find("input[placeholder*=Contact]")[0]).val();

                $($("#dvSName").find("input[placeholder*=Student]")[x]).val(objAssessment[x].Student);
                $($("#dvSubject").find("input[placeholder=Subject]")[x]).val(objAssessment[x]["Subject(s)"]);
                $($("#dvGrade").find("input[placeholder=Grade]")[x]).val(objAssessment[x].Grade);

            }
            if (objMeeting[0] != undefined) {
                $($("#dvDate1").find("input[placeholder=Date]")[0]).val(objMeeting[0].Date);
                $($("#dvDate1").find("input[placeholder=Time]")[0]).val(objMeeting[0].Time);
                $($("#dvCName1").find("input[placeholder*=Contact]")[0]).val(objMeeting[0]["Contact Name"]);
                $($("#dvphone1").find("input[placeholder*=phone]")[0]).val(objMeeting[0]["Contact Number"]);
                $($("#dvemail1").find("input[placeholder*=email]")[0]).val(objMeeting[0]["Contact Email"]);
                $($("#dvSName1").find("input[placeholder*=Student]")[0]).val(objMeeting[0]["Student(s)"]);
            }

            if (objInquiry[0] != undefined) {
                console.log(objInquiry[0]);
                $($("#StdName").find("input[placeholder=Date]")[0]).val(objInquiry[0].Date);
                $($("#Grade").find("input[placeholder*=Contact]")[0]).val(objInquiry[0]["Contact Name"]);
                $("#CPhone").val(objInquiry[0]["ContactPhone"]);
                $($("#Subject").find("input[placeholder=Email]")[0]).val(objInquiry[0]["Contact Email"]);
                $($("#School").find("input[placeholder=Source]")[0]).val(objInquiry[0].Source);
                $($("#Notes").find("textarea[placeholder=Notes]")[0]).val(objInquiry[0].Notes);
            }
            var Subject_Inquiry = "";
            var Subject_Assessment = "";

            SelectedStudents = [];
            for (var x = 0; x < ObjInquiryStudent.length; x++) {
                if (x >= 1) {

                    $(".AddMoreStdName").trigger('click');

                }
                var SelectedStudent = {};
                SelectedStudent.Name = ObjInquiryStudent[x].StudentName;

                SelectedStudents.push(SelectedStudent);
                $($("#StdName").find("input[placeholder*=Student]")[x]).val(ObjInquiryStudent[x].StudentName);
                $($("#Grade").find("input[placeholder=Grade]")[x]).val(ObjInquiryStudent[x].Grade);
                $($("#Subject").find("input[placeholder=Subject]")[x]).val(ObjInquiryStudent[x].Subjects);
                Subject_Inquiry = Subject_Inquiry + ObjInquiryStudent[x].Subjects + " [" + ObjInquiryStudent[x].Grade + "]" + ", ";
                //console.log(Subject_Inquiry);
                tdvStudents1 = tdvStudents1 + ((tdvStudents1 == "") ? "" : ", ") + ObjInquiryStudent[x].StudentName;
                tdvSubjects1 = tdvSubjects1 + ((tdvSubjects1 == "") ? "" : ", ") + ObjInquiryStudent[x]["Subjects"];
                $($("#School").find("input[placeholder=School]")[x]).val(ObjInquiryStudent[x].School);
                $($("#Notes").find("textarea[placeholder=Notes]")[x + 1]).val(ObjInquiryStudent[x].Notes);
            }

            for (var x = 0; x < objAssessment.length; x++) {
                //if (x >= 1) {

                //    $(".Add_new1").trigger('click');
                //}
                //$($("#dvDate").find("input[placeholder=Date]")[x]).val(objAssessment[x].Date);
                //$($("#dvSName").find("input[placeholder*=Contact]")[0]).val();
                //$($("#dvSName").find("input[placeholder*=Student]")[x]).val(objAssessment[x].Student);
                $($("#dvSubject").find("input[placeholder=Subject]")[x]).val(objAssessment[x]["Subject(s)"]);
                Subject_Assessment = Subject_Assessment + objAssessment[x]["Subject(s)"] + ", ";
                //$($("#dvGrade").find("input[placeholder=Grade]")[x]).val(objAssessment[x].Grade);


            }
            if (objMeeting[0] != undefined) {
                $($("#dvContactName").find("input[placeholder*=Contact]")[0]).val(objMeeting[0]["Contact Name"]);
                //$($("#dvAddress").find("input[placeholder*=Contact]")[0]).val(objMeeting[0]["Contact Name"]);
                $($("#dvEmail").find("input[placeholder*=email]")[0]).val(objMeeting[0]["Contact Email"]);
                //$($("#dvStudents").find("input[placeholder*=Student]")[0]).val(objMeeting[0]["Student(s)"]);
                //$($("#dvSubjects").find("input[placeholder*=Subject]")[0]).val(Subject_Inquiry.substring(0, Subject_Inquiry.length -2));
            }
            console.log(tdvStudents1, tdvSubjects1);
            $("#tdvStudents").val(tdvStudents1);
            $("#tdvSubjects").val(tdvSubjects1);
 
            ClearTime1($("#date1"));
            ClearTime1($("#date2")); 
            //disabledAllcontrol();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 style="margin-left: 20px !important;margin-top: 19px !important;width: 97% !important;">Meeting Action</h3>
    <div id="dvCreateInquiry">
                   <div class="container" id="container">
                <fieldset id="StdName">
                    <input placeholder="Date" type="text" tabindex="1"  autofocus>
                    <input placeholder="Student Name" type="text" tabindex="6"  class="next">
                    <span class="AddMoreStdName"><img src="../images/Add_Icon.jpg"  class="Add_removeIcon"style="width:18px;" /></span>

                </fieldset>
                <fieldset id="Grade">
                    <input placeholder="Contact Name" type="text" tabindex="2"  style="width:23%" >
                    <input id="CPhone" placeholder="Contact phone number" type="text" tabindex="2"  style="width:23%;margin-left: .7%;" >
                    <input placeholder="Grade" type="text" tabindex="7"  class="next">
                    <span class="AddMoreGrade"><img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width:18px;" /></span>
                </fieldset>
                <fieldset id="Subject">
                    <input placeholder="Email" type="email" tabindex="3" >
                    <input placeholder="Subject" type="text" tabindex="8"  class="next">
                    <span class="AddMoreSubject"><img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width:18px;" /></span>
                </fieldset>
                <fieldset id="School">
                    <input placeholder="Source" type="text" tabindex="4" >
                    <input placeholder="School" type="text" tabindex="9"  class="next">
                    <span class="AddMoreSchool"><img src="../images/Add_Icon.jpg"  class="Add_removeIcon" style="width:18px;"/></span>
                </fieldset>
                <fieldset id="Notes">
                    <textarea placeholder="Notes" tabindex="5" ></textarea>
                    <textarea placeholder="Notes" tabindex="10"  class="next"></textarea>
                    <span class="AddMoreNotes"><img src="../images/Add_Icon.jpg"  class="Add_removeIcon" style="width:18px;"/></span>
                    <span class="RemoveMoreStdName" style="display: none"><img class="Add_removeIcon" src="../images/Delete_Icon.jpg"  style="width:18px;" /></span>
                </fieldset>
            </div>
            
            <div class="container1">
                <table style="width: 100%;">

                    <tr>
                        <td style="width: 43.3%" id="container2">
                            <fieldset id="fsetAssessment">
                                <legend>Schedule Assessment</legend>
                                <div id="dvDate">
                                    <input placeholder="Date" type="text" tabindex="100"  autofocus class="field date1" id="date1">
                                    <span class="Add_new1">
                                        <img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width: 18px;" /></span>
                                </div>
                                                                <div id="dvTime">
                                    <input placeholder="Time" type="text" tabindex="101"  autofocus class="field time1" id="time1">
                                      <span class="Add_new11"></span>
                                </div>
                                <div id="dvSName">
                                    <input placeholder="Student Name" type="text" tabindex="102"  class="field">
                                    <span class="Add_new2">
                                        <img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width: 18px;" /></span>
                                </div>
                                <div id="dvGrade">
                                    <input placeholder="Grade" type="text" tabindex="103"  class="field">
                                    <span class="Add_new4">
                                        <img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width: 18px;" /></span>

                                </div>
                                <div id="dvSubject">
                                    <input placeholder="Subject" type="text" tabindex="104"  class="field">
                                    <span class="Add_new3">
                                        <img src="../images/Add_Icon.jpg" class="Add_removeIcon" style="width: 18px;" /></span>
                                    <span class="Remove_new1" style="display: none">
                                        <img class="Add_removeIcon" src="../images/Delete_Icon.jpg" style="width: 18px;" /></span>
                                </div>

 

                            </fieldset>
                            
                        </td>
                
                        <td style="width: 47.7%">
                            <fieldset id="fsetMeeting">
                                <legend>Schedule Meeting</legend>
                                <div id="dvDate1">
                                    <input placeholder="Date" type="text" tabindex="200"  autofocus class="field date2" style="width:31%;" id="date2">
                                    <input placeholder="Time" type="text" tabindex="201"  autofocus class="field time2" style="width:15%;" id="time2">
                                </div>
                                <div id="dvCName1">
                                    <input placeholder="Contact Name" type="text" tabindex="202"  class="field">
                                 
                                </div>
                                <div id="dvphone1">
                                    <input placeholder="Contact phone number" type="phone" tabindex="203"  class="field">
                                </div>
                                <div id="dvemail1">
                                    <input placeholder="Contact email" type="email" tabindex="204"  class="field">
                                </div>
                                <div id="dvSName1">
                                    <input placeholder="Student Name(s)" type="text" tabindex="205"  class="field">
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </div>
            <button name="Update" type="submit" id="Inquiry-Update" data-submit="...Sending">Update Inquiry</button>
            

        <%--<button name="Edit" style="float: right; width: auto !important;" type="submit">Edit</button>--%>
        <div class="container2">
            <fieldset id="fsetAssessment">
                <legend>Generate Invoice</legend>
                <table style="width: 100%;">

                    <tr>
                        <td style="width: 43%" id="container2">

                            <div id="dvContactName">
                                <input id="tdvContactName" placeholder="Contact name" type="text" tabindex="400"  autofocus class="field" style="width: 80%;" >
                            </div>
                            <div id="dvAddress">
                                <textarea id="tdvAddress" placeholder="Contact address" tabindex="401"  style="width: 80%;" ></textarea>
                            </div>
                            <div id="dvEmail">
                                <input id="tdvEmail" placeholder="Contact email" type="email" tabindex="402"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvStudents">
                                <input id="tdvStudents" placeholder="Student(s)" type="text" tabindex="403"  class="field" style="width: 80%;">
                            </div>
                            <div id="dvSubjects">
                                <input id="tdvSubjects" placeholder="Subject(s)" type="text" tabindex="404"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvHrs">
                                <input id="tdvHrs" placeholder="Total tutoring hours purchased" type="text" tabindex="405"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvStudyHrs">
 
                                <select id="drpdvStudyHrs" class="field" style="width: 42.5%;border: 1px solid #ccc;background: #FFF;" tabindex="406">
                                    <option value="0">--Study Hall Hours--</option>
                                    <option value="1">Yes</option>
                                     <option value="2">No</option>
                                </select>
                                
                            </div>
                           <div id="dvPlan">
                                <input id="tdvPlan" placeholder="Type of plan" type="text" tabindex="407"  autofocus class="field" style="width: 80%;">
                            </div>
                        </td>
                        
                        <td style="width: 47%">

                            <div id="dvRetail">
                                <input id='tdvRetail' placeholder="Retail Rate" type="text" tabindex="500"  autofocus class="field" style="width: 80%;">
                            </div>
                            <div id="dvHRate">
                                <input id="tdvDRate"  placeholder="Discounted Rate" type="text" tabindex="501"  class="field" style="width: 80%;">
                            </div>
                            <div id="dvPaymentMethod">
                                <input id="tdvPaymentMethod"  placeholder="Payment method" type="text" tabindex="502"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvNFee">
                                <input id="tdvNFee" placeholder="Subtotal" type="text" tabindex="503"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvDPayment">
                                <input id= "tdvDPayment" placeholder="Today's payment" type="text" tabindex="504"  class="field" style="width: 80%;" >
                            </div>
                            <div id="dvDiscount">
                                <input id="tdvDiscount" disabled placeholder="Discount" type="text" tabindex="505"  class="field" style="width: 80%;" >
                            </div>

                            <div id="dvBalance">
                                <input id="tdvBalance" placeholder="Balance outstanding" type="text" tabindex="506"  class="field" style="width: 80%;" >
                            </div>
                             <div id="dvSplitHrs">
                                <textarea id="tdvSplitHrs" placeholder="Hrs Details" tabindex="507"  style="width: 80%;"></textarea>
                            </div>

                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <button name="Update" type="submit" id="CreateInvoice" data-submit="...Sending">Create Invoice</button>
       <br />
        <div id="styled-select" style="display:none;">
              <br />
            <b>Select Student</b>
            <select id="ddlInvoiceStudents" class="styled-select">
                <option value="0">Select Student</option>
            </select>
        </div>
        <br />
        <div class="container1" style="display:none">
            <fieldset id="fSetScheduling">
                <legend>Scheduling Preferences</legend>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <div id="dvSubjectSP">
                                <input placeholder="Subject" type="text" tabindex="600"  autofocus class="field" style="width: 50%;"  id="ScheduleSubject" />
                            </div>
                            <div id="dvTutorGendorSP">
                                <select id="ddlGenderSP" class="style-multiple" size="2">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div id="dvStudentAvaibality">

                                <select id="ddlStudentAvabilitySP" name="ddlStudentAvabilitySP" size="10" multiple class="style-multiple">
  
                                </select>
                            </div>

                        </td>
                    </tr>

                </table>
            </fieldset>

        </div>
        <br />

        <fieldset id="fSetAvailableTutor" style="display:none;">
            <legend>Master Schedule
                <span  style="float: right;margin-right: 10px; cursor:pointer; display:none;"><img src="../images/Add_Icon.jpg" style="width:18px;" class="aAdd_top"></span>
             </legend>
            <table id="tblTutorAvailable" class="ui-jqgrid-btable ui-common-table table table-bordered">
                <tr class='jqgrow ui-row-ltr' id="0">
                    <td class='jqgrid-rownum active'>
                        <input type='checkbox' id="chkAll" />
                    </td>
                    <td class='jqgrid-rownum active'>Tutor Name</td>
                    <td class='jqgrid-rownum active'>Day</td>
                    <td class='jqgrid-rownum active'>Time</td>
                    <td class='jqgrid-rownum active'>Subject</td>
                    <td class='jqgrid-rownum active'>Gender</td>
                    <td class='jqgrid-rownum active' >Enrolled Students</td> 
                    <td class='jqgrid-rownum active'>Add Student</td>
                     <td class='jqgrid-rownum active'>Tutoring Hours</td>
                     <td class='jqgrid-rownum active' >Study Hall Hours</td>
                    <td class='jqgrid-rownum active'>Action</td>
                </tr>
            </table>
        </fieldset>

        <br />
        <div style="width:97%;">     <button name="Schedule_Student" type="submit" id="Schedule_Student" data-submit="...Sending" style="width: 180px ! important;margin-left: 1.5% ! important;">Schedule Student</button>
        
                <button name="Enrollment_Complete" type="submit" id="Enrollment_Complete" data-submit="...Sending" style="width: 180px ! important;margin-left: 1.5% ! important;">Enroll Students </button>
        

  <%--      <button name="Enroll_and_refresh" type="submit" id="Enroll_and_refresh" data-submit="...Sending" style="width: 180px ! important;margin-left: 1.5% ! important;">Enroll and refresh</button>
        
        <button name="discard" type="submit" id="btnDiscardComplete" data-submit="...Sending"  style="margin-top: -40px; margin-left: 1.5% ! important; width: 200px !important;">Inquiry fully completed</button>--%>
        <button name="discard" type="submit" id="btnDiscard" data-submit="...Sending" style="margin-left: 1.5% ! important">Close Inquiry</button>
        <button name="discard" type="submit" id="btnDiscardMeeting" data-submit="...Sending" style="float: right; margin-left:0px !important;">Discard Meeting</button>
</div>
   
    </div>

    <table id="calendar-demo" class="calendar"></table>
     <div id="dialog" style="display: none;" title="Please select students for enrollment:">
        <div id="TableStudents"></div>
                 <button name="Schedule_Student" type="submit" id="Enrollment_Complete_next" data-submit="...Sending" style="width: 180px ! important;margin-left: 1.5% ! important;">Enroll Students</button>
        
     </div>

    <script>

        $('input[placeholder=Date]').dcalendarpicker();
        $('#calendar-demo').dcalendar(); //creates the calendar
        $('#calendar-demo').hide();

        $("#Schedule_Student").click(function () {
            event.preventDefault();
            window.open('../Scheduling/MasterSchedule.aspx', "_blank");
            return false;
           // location.href = '../Scheduling/MasterSchedule.aspx';
        });

        $("#Enrollment_Complete").click(function () {
            event.preventDefault();
            $("#dialog").dialog({
                width: 500,
                height: 300,
                modal: true,
                close: function (event, ui) {
                    // window.location.href = location.href;
                    //window.close();
                }
            });
        });

        $("#Enrollment_Complete_next").click(function () {
            var SelectedStudents = $("#TableStudents table").find("tr input[type=checkbox]:checked");

            if (SelectedStudents.length == 0) {
                alert('Please select atleast one student to enroll');
            }
            else {
                //if (confirm('After enrollment you are not able to access this Inquiry.')) {
                    var Ids = "";
                    for (var x = 0; x < SelectedStudents.length; x++) {
                        Ids = Ids + "," + $(SelectedStudents[x]).attr("id");
                    }
                    var EnrollObject = {};
                    EnrollObject.InqiryId = InquiryId;
                    EnrollObject.StudentIds = Ids;
                    
                var StringData = JSON.stringify(EnrollObject);
                PostDataGenericPP("EnrollStudent", "Inquiry.aspx", StringData, false, this);

                }
            //}

        });

        function PostDataGeneric(MethodName, url, Data, Refresh,closeWindow) {

            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    alert(objMessage[0].SucessMsg, Refresh);
                    if (closeWindow) {
                        window.close();
                    }

                }

            });

        }

        function PostDataGenericPP(MethodName, url, Data, Refresh, closePopup) {

            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    alert(objMessage[0].SucessMsg, Refresh);
                    //if (closeWindow) {
                    $("#dialog").dialog("close");
                    //}

                }

            });

        }
        $("#Enroll_and_refresh").click(function () {
            var Objects = $("#tblTutorAvailable").find("tr").find(".chkUpdate:checked");
            var EnrollObjects = [];
            var EnrollObject = {};
            if (Objects.length == 0)
            {
                alert('Please select at least one Available Tutor timeslot.', false);
                return false;
            }
            for (var x = 0; x < Objects.length; x++) {
                EnrollObject = {};
                EnrollObject._TutorName = $($(Objects[x]).parent().parent().find("input[placeholder*=Tutor]")[0]).val();
                EnrollObject._Day = $(Objects[x]).parent().parent().find("#ddlDaysAT").val();
                EnrollObject._Time = $($(Objects[x]).parent().parent().find("input[placeholder*=Time]")[0]).val();
                EnrollObject._Subject = $($(Objects[x]).parent().parent().find("input[placeholder*=Subject]")[0]).val();
                EnrollObject._Gender = $($(Objects[x]).parent().parent().find("#ddlGenderAT")[0]).val();
                EnrollObject._Student = $($(Objects[x]).parent().parent().find("input[placeholder=Student]")[0]).val();
                EnrollObject._SubjectsHrs = $($(Objects[x]).parent().parent().find("input[placeholder*=Total]")[0]).val();
                EnrollObject._StudyHallHrs = $($(Objects[x]).parent().parent().find("input[placeholder*=Total]")[1]).val();
                if ($($(Objects[x]).parent().parent().find("input[placeholder=Student]")[0]).val() == "")
                {
                    alert("Student Name can't be blank!!", false);
                    $($(Objects[x]).parent().parent().find("input[placeholder=Student]")[0]).focus();
                    return false;
                }
                EnrollObjects.push(EnrollObject);

            }
 
            var str = JSON.stringify(EnrollObjects).replace(/"/g, '\\"');
            //console.log('{obj_Enroll:"' + str + '", InqiryId:"' + InquiryId + '" }');
            if (confirm('Please confirm you wish to save Master Schedule above.')) {
                if (EnrollObjects.length >= 1) {
                    $.ajax({
                        type: "POST",
                        url: "Inquiry.aspx/EnrollStudents",
                        data: '{obj_Enroll:"' + str + '", InqiryId:"' + InquiryId + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            $("#ScheduleSubject").val("");
                            $("select[name=ddlStudentAvabilitySP]").val(0);
                            $("#ddlGenderSP").val(0);
                            $("#tblTutorAvailable").html(HtmlMain);
                            //location.reload();
                            //Complete_Inquiry_Assessment_Meeting(1, InquiryId);

                            //DELETE_Inquiry_Assessment_Meeting(1, InquiryId);
                        }
                    });
                }
            }
            return false;
        });
        var RowsAdded = 0;
        var lastId = 100;
        $(".aAdd_top").click(function () {
            RowsAdded = RowsAdded + 1;
            lastId = lastId + 1;
            tabIndex = tabIndex + 12;
            var html = "";
            html = html + "<tr class='jqgrow ui-row-ltr' id='" + lastId + "'><td class='jqgrid-rownum active' ><input class='chkUpdate' type='checkbox' id='chk_" + lastId + "' tabindex='" + parseInt(tabIndex) + 1 + "'/></td>";
            html = html + '<td class="jqgrid-rownum active"><input disabled="disabled" autofill="tutor" placeholder="Tutor Name" type="text" tabindex="' + parseInt(tabIndex) + 2 + '"  autofocus class="field"  style="width:100px;padding-bottom: 10px;" ></td>';
            html = html + '<td class="jqgrid-rownum active"><select disabled="disabled" id="ddlDaysAT" class="styled-select"  tabindex="' + parseInt(tabIndex) + 3 + '"    style="width:118px ! important;">';
            var Days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
            for (var y = 0; y < Days.length; y++) {
                //if ($(options[x]).parent().attr("label") == Days[y])
                //    html = html + '<option value="' + Days[y] + '" selected>' + Days[y] + '</option>';
                //else
                html = html + '<option value="' + Days[y] + '">' + Days[y] + '</option>';
            }
            html = html + '</select></td>';
            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" placeholder="Time" type="text"   autofocus class="field"     tabindex="' + parseInt(tabIndex) + 4 + '"   style="width:100px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" placeholder="Subject" type="text"    autofocus class="field"  tabindex="' + parseInt(tabIndex) + 5 + '"      style="width:80px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"><select disabled="disabled" class="styled-select" id="ddlGenderAT"   style="width:100px ! important;" tabindex="' + parseInt(tabIndex) + 6 + '"><option value= "Male" > Male</option ><option value="Female"  >Female</option></select ></td>';
            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" placeholder="Enrolled Students" type="text"   autofocus class="field"  tabindex="' + parseInt(tabIndex) + 7 + '"  style="width:150px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"><input placeholder="Student" type="text" tabindex="' + parseInt(tabIndex) + 8 + '"  autofocus class="field"     style="width:120px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"><input placeholder="Total Hours" type="text" tabindex="' + parseInt(tabIndex) + 9 + '"  autofocus class="field"     style="width:100px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"  ><input placeholder="Total Hours" type="text" tabindex="' + parseInt(tabIndex) + 10 + '"  autofocus class="field"     style="width:100px;"></td>';
            html = html + '<td  class="jqgrid-rownum active"><a href="javascript:void(0)" class="aDelete">Delete</a><a href="javascript:void(0)" class="aAdd" style="display:none;">Add</a></td>'
            var LstRowId = $('#tblTutorAvailable tr:last').attr('id');

            html = html + "</tr>";
            $('#tblTutorAvailable tr:last').after(html);
            $(".aDelete").unbind("click");
            $(".aDelete").click(function () {
                if (confirm('Please confirm you wish to delete this row.')) {
                    RowsAdded = RowsAdded - 1;
                    $(this).parent().parent().remove();
                }
            });
            $("#chkAll").unbind("click");
            $("#chkAll").click(function () {
                //alert($("#chkAll").is(':checked'));
                $("input[type=checkbox][id*=chk_]").attr("checked", $("#chkAll").is(':checked'));
            });
            var ObjTutor = [];
 
            AutoComplete('Tutor', objTutor, "TutorName");
            //$('input[autofill=tutor]').magicsearch({
            //    dataSource: objTutor,
            //    fields: ['FirstName', 'LastName'],
            //    id: 'TutorId',
            //    format: '%FirstName% · %LastName%'

            //});

            AutoComplete('Subject', objSubjects, "SubjectName");

            var obj = [];
            var found = 0;
            for (var x = 0; x < objTutorTimeSlots.length; x++) {
                found = 0;
                for (var y = 0; y < obj.length; y++) {
                    if (objTutorTimeSlots[x].TimeAction == obj[y].TimeAction) {
                        found = 1;
                    }

                }
                if (found == 0)
                    obj.push(objTutorTimeSlots[x]);
            }
 
            AutoComplete_Single('Time', obj, "TimeAction");
            //console.log(SelectedStudents);
            AutoComplete_Single('Student', SelectedStudents, "Name");
        });
        $.jgrid.defaults.width = 780;
        $.jgrid.defaults.responsive = true;
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $('input[placeholder=Date]').dcalendarpicker();
        $('#calendar-demo').dcalendar(); //creates the calendar
        $('#calendar-demo').hide();
        var tabIndex = 750;
        var HtmlMain = "<tr class='jqgrow ui-row-ltr' ><td class='jqgrid-rownum active'><input type='checkbox' id='chkAll' /></td> <td class='jqgrid-rownum active'>Tutor Name</td> <td class='jqgrid-rownum active'>Day</td> <td class='jqgrid-rownum active'>Time</td> <td class='jqgrid-rownum active'>Subject</td> <td class='jqgrid-rownum active'>Gender</td> <td class='jqgrid-rownum active' >Enrolled Students</td><td class='jqgrid-rownum active'>Add Student</td><td class='jqgrid-rownum active'>Tutoring Hours</td><td class='jqgrid-rownum active'>Study Hall Hours</td><td class='jqgrid-rownum active'>Action</td></tr>";

        $(document).ready(function () {
            enableAllcontrol();
            $("#tdvRetail").val('<%=Session["RetailRate"]%>');
            $("#tdvRetail").blur(function () {
                $("#tdvRetail").val(parseFloat($("#tdvRetail").val()).toFixed(2));
                if ($("#tdvRetail").val() == NaN)
                    $("#tdvRetail").val("0.00");
            });

            $('button[name=discard]').click(function () {
                //LoadAgain();
                window.location.href = location.href;
                return false;
            });

            $('button[name=Edit]').click(function () {
                enableAllcontrol();
                return false;
            });

 
            //$gridEnroll = $("#EnrollList");
            //var colModelEnroll = [
            //    { name: "Tutor Name", width: 200, editable: true },
            //    { name: "Day", width: 100, editable: true },
            //    { name: "Time", width: 100, editable: true },
            //    { name: "Subject", width: 150, editable: true },
            //    { name: "Gender", width: 100, editable: true },
            //    { name: "Students", width: 300, editable: true }
            //];
            //var objEnroll = {};


            ////$gridAssessment
            //setTimeout(function () {
            //    LoadGrid_Add(colModelEnroll, objEnroll, 'EnrollList', 'EnrollPager', $gridEnroll);

            //}, 2000);

            $("#sData").on("click", function () {
   
            });
            $("#btnDiscard").click(function () {
                if (confirm("Please confirm you wish to delete this inquiry, including any scheduled assessments and meetings.")) {
                    DELETE_Inquiry_Assessment_Meeting_RedirectToEnrolement(1, InquiryId);
                }
            });

            $("#btnDiscardMeeting").click(function () {
                if (confirm("Please confirm you wish to delete this meeting.")) {
                    DELETE_Inquiry_Assessment_Meeting_RedirectToEnrolement(3, InquiryId);
                }
            });

            $("#btnDiscardComplete").click(function () {
                if (confirm("Please confirm the enrollment process is complete, and you wish to remove the inquiry, assessment and meetings from the enrollment view.")) {
                    Complete_Inquiry_Assessment_Meeting_RedirectToEnrolement(1, InquiryId);
                }
            });


            $("#tdvRetail, #tdvDRate, #tdvHrs").on("change", function () {

 

                var A = parseFloat($("#tdvRetail").val());
                var B;
                if ($("#tdvDRate").val() != "")
                    B = parseFloat($("#tdvDRate").val());
                else 
                    B = parseFloat($("#tdvRetail").val());

                var C = parseFloat($("#tdvHrs").val());
 
                var D =  ((A - B) * C)*100 / ((A * C));
                
                $("#tdvDiscount").val(D);
                $("#tdvNFee").val(B * C);
                if ($("#tdvDiscount").val() == "NaN") {
                    $("#tdvDiscount").val("");
                    $("#tdvNFee").val("");
                }
                else {
                    var valDiscountPer = parseFloat($("#tdvDiscount").val());
                    var valDiscountPerstr = valDiscountPer.toFixed(0).toString();
 
                    $("#tdvDiscount").val(valDiscountPerstr + '%');
                }

                if ($("#tdvDRate").val() != "NaN" && $("#tdvDRate").val() != NaN && $("#tdvDRate").val() != "")
                    $("#tdvDRate").val(parseFloat($("#tdvDRate").val().toString()).toFixed(2));
                else
                    $("#tdvDRate").val("");

                if ($("#tdvNFee").val() != "NaN" && $("#tdvNFee").val() != NaN && $("#tdvNFee").val() != "") {
                    $("#tdvNFee").val(parseFloat($("#tdvNFee").val().toString()).toFixed(2));
                }
                else {
                    $("#tdvNFee").val("");
                }

                if ($("#tdvDPayment").val() != "NaN" && $("#tdvDPayment").val() != NaN && $("#tdvDPayment").val() != "")
                    $("#tdvDPayment").val(parseFloat($("#tdvDPayment").val().toString()).toFixed(2));
                else
                    $("#tdvDPayment").val("");

                if ($("#tdvBalance").val() != "NaN" && $("#tdvBalance").val() != NaN && $("#tdvBalance").val() != "")
                    $("#tdvBalance").val(parseFloat($("#tdvBalance").val().toString()).toFixed(2));
                else
                    $("#tdvBalance").val("");

                $("#tdvDPayment").trigger("change");

            });

            $("#tdvDPayment, #tdvNFee").on("change", function () {

                var A = parseFloat($("#tdvNFee").val());
                var B = parseFloat($("#tdvDPayment").val());
                var C = A - B;
                $("#tdvBalance").val(C);

                if ($("#tdvDRate").val() != "NaN" && $("#tdvDRate").val() != NaN && $("#tdvDRate").val() != "")
                    $("#tdvDRate").val(parseFloat($("#tdvDRate").val().toString()).toFixed(2));
                else
                    $("#tdvDRate").val("");

                if ($("#tdvNFee").val() != "NaN" && $("#tdvNFee").val() != NaN && $("#tdvNFee").val() != "") {
                    $("#tdvNFee").val(parseFloat($("#tdvNFee").val().toString()).toFixed(2));
                }
                else {
                    $("#tdvNFee").val("");
                }

                if ($("#tdvDPayment").val() != "NaN" && $("#tdvDPayment").val() != NaN && $("#tdvDPayment").val() != "")
                    $("#tdvDPayment").val(parseFloat($("#tdvDPayment").val().toString()).toFixed(2));
                else
                    $("#tdvDPayment").val("");

                if ($("#tdvBalance").val() != "NaN" && $("#tdvBalance").val() != NaN && $("#tdvBalance").val() != "")
                    $("#tdvBalance").val(parseFloat($("#tdvBalance").val().toString()).toFixed(2));
                else
                    $("#tdvBalance").val("");

            });
 
        });

        function LoadTriggerevents()
        {
            $("select[name=ddlStudentAvabilitySP] option").on("click", function () {

                //alert($(this).parent().attr("label"));
     
                var options = $("select[name=ddlStudentAvabilitySP] option:checked");
                var html = HtmlMain;
                var Subject = $($("#dvSubjectSP").find("input[placeholder=Subject]")[0]).val();
                var Gender = $("#ddlGenderSP").val();

                var Time = "";
                for (var x = 0; x < options.length; x++) {
                    Time = ((Time == "") ? "" : Time + ",") + $(options[x]).parent().attr("label") + "|" + $(options[x]).html().split('-')[0];
                }
                $.ajax({
                    type: "POST",
                    url: "Inquiry.aspx/getMasterSchedule",
                    data: '{ TimeSelected:"' + Time + '" , Subjects:"' + Subject + '" , Gender:"' + Gender + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response_a) {
                        //value = "' + objEnroll[x].TutorName+'"
                        var objEnroll = JSON.parse(response_a.d[0]);
                        for (var x = 0; x < objEnroll.length; x++) {
                            tabIndex = tabIndex + 12;
                            html = html + "<tr class='jqgrow ui-row-ltr' id='rw_" + objEnroll[x].rw + "' ><td class='jqgrid-rownum active' ><input  class='chkUpdate' type='checkbox' id='chk_" + lastId + "' tabindex='" + parseInt(tabIndex) + 1 + "'/></td>";
                            html = html + '<td class="jqgrid-rownum active"><input disabled="disabled" autofill="tutor" placeholder="Tutor Name" type="text" tabindex="' + parseInt(tabIndex) + 2 + '"  autofocus class="field"  style="width:100px;padding-bottom: 10px;" value="' + objEnroll[x].TutorName + '" ></td>';
                            html = html + '<td class="jqgrid-rownum active"><select disabled="disabled" id="ddlDaysAT" class="styled-select" tabindex="' + parseInt(tabIndex) + 3 + '"    style="width:118px ! important;">';
                            var Days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
                            for (var y = 0; y < Days.length; y++) {
                                if (objEnroll[x].Day == Days[y])
                                    html = html + '<option value="' + Days[y] + '" selected>' + Days[y] + '</option>';
                                else
                                    html = html + '<option value="' + Days[y] + '">' + Days[y] + '</option>';
                            }
                            html = html + '</select></td>';
                            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" value = "' + objEnroll[x].Time + '" placeholder="Time" type="text" tabindex="100"  autofocus class="field"   value="' + $(options[x]).html() + '" tabindex="' + parseInt(tabIndex) + 4 + '"   style="width:100px;"></td>';
                            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" value = "' + objEnroll[x].SubjectName + '" placeholder="Subject" type="text"    autofocus class="field"  tabindex="' + parseInt(tabIndex) + 5 + '"      style="width:80px;"></td>';
                            if (objEnroll[x].Gender == "Male")
                                html = html + '<td  class="jqgrid-rownum active"><select disabled="disabled" class="styled-select" id="ddlGenderAT"   style="width:100px ! important;" tabindex="' + parseInt(tabIndex) + 6 + '"><option value= "Male" selected> Male</option ><option value="Female"  >Female</option></select ></td>';
                            else
                                html = html + '<td  class="jqgrid-rownum active"><select disabled="disabled"  class="styled-select" id="ddlGenderAT"   style="width:100px ! important;" tabindex="' + parseInt(tabIndex) + 6 + '"><option value= "Male" > Male</option ><option value="Female"  selected>Female</option></select ></td>';

                            html = html + '<td  class="jqgrid-rownum active"><input disabled="disabled" value = "' + objEnroll[x].FirstName.replace(', NA', '').replace('NA,', '').replace('NA','') + '"  placeholder="Enrolled Students" type="text"    autofocus class="field"  tabindex="' + parseInt(tabIndex) + 7 + '"  style="width:150px;"></td>';
                            html = html + '<td  class="jqgrid-rownum active"><input placeholder="Student" type="text"    autofocus class="field"  tabindex="' + parseInt(tabIndex) + 8 + '"   style="width:120px;"></td>';
                            html = html + '<td  class="jqgrid-rownum active"><input placeholder="Total Hours" type="text" tabindex="' + parseInt(tabIndex) + 9 + '"  autofocus class="field"     style="width:100px;"></td>';
                            html = html + '<td  class="jqgrid-rownum active"><input placeholder="Total Hours" type="text" tabindex="' + parseInt(tabIndex) + 10 + '"  autofocus class="field"     style="width:100px;"></td>';
                            html = html + '<td  class="jqgrid-rownum active"><a href="javascript:void(0)" class="aDelete">Hide</a><a href="javascript:void(0)" class="aAdd" style="display:none;">Add</a></td>'
                            html = html + "</tr>";
                        }
                        $("#tblTutorAvailable").html(html);

                        $(".aDelete").unbind("click");
                        $(".aDelete").click(function () {
                            if (confirm('Please confirm you wish to hide this Row?')) {
                                RowsAdded = RowsAdded - 1;
                                $(this).parent().parent().remove();
                            }
                        });
                        $("#chkAll").unbind("click");
                        $("#chkAll").click(function () {
                            //alert($("#chkAll").is(':checked'));
                            $("input[type=checkbox][id*=chk_]").attr("checked", $("#chkAll").is(':checked'));
                        });
                        var ObjTutor = [];

                        //Tutor Name

                        AutoComplete('Tutor', objTutor, "TutorName");


                        AutoComplete('Subject', objSubjects, "SubjectName");
                        AutoComplete_Single('Student', SelectedStudents, "Name");


                        var obj = [];
                        var found = 0;
                        for (var x = 0; x < objTutorTimeSlots.length; x++) {
                            found = 0;
                            for (var y = 0; y < obj.length; y++) {
                                if (objTutorTimeSlots[x].TimeAction == obj[y].TimeAction) {
                                    found = 1;
                                }

                            }
                            if (found == 0)
                                obj.push(objTutorTimeSlots[x]);
                        }

                        AutoComplete_Single('Time', obj, "TimeAction");
                    }
                });

            });
        }
    </script>
    <style>
        #dialog {
        height:100% !important;
        }

    </style>



</asp:Content>

