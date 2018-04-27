<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/Popup.master" AutoEventWireup="true" CodeFile="AccessmentAction.aspx.cs" Inherits="Enrollment_AccessmentAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="../CustomJs/UpdateInquiry.js?v=14.5"></script>
    <script type="text/javascript">
        var response;
        var InquiryId;
        function disabledAllcontrol() {
            isdisabled_IA = 1;
            document.getElementById("container2").disabled = true;
            var nodes = document.getElementById("container2").getElementsByTagName('*');
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].disabled = true;
                $(nodes[i]).css("color", "grey");
            }
            $("button[name=Edit]").removeAttr('disabled');
 
            //$(".AddMoreStdName").attr("class", "AddMoreNotes_dis");
            //$(".RemoveMoreStdName").attr("class", "RemoveMoreStdName_dis");
        }
        function enableAllcontrol() {
            isdisabled_IA = 0;
      
            document.getElementById("container2").disabled = true;
            var nodes = document.getElementById("container2").getElementsByTagName('*');
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].disabled = false;
                $(nodes[i]).removeAttr("style");
            }
            $("button[name=Edit]").attr("style", "float: right;width:auto !important;");
            //$(".AddMoreStdName_dis").attr("class", "AddMoreStdName");
            //$(".RemoveMoreStdName_dis").attr("class", "RemoveMoreStdName");
        }

        function GetEnrolementView()
        {
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
        var objTimes;
        function LoadAgain()
        {
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

            objSubjects = JSON.parse(response.d[6]);
            objSource = JSON.parse(response.d[7]);
            objGrade = JSON.parse(response.d[8]);
            objTimes = JSON.parse(response.d[10]);

            //AutoComplete_Single('Time', objTimes, "Time");
            AutoComplete('Subject', objSubjects, "SubjectName");
            AutoComplete_Single('Source', objSource, "Source");
            AutoComplete_Single('Grade', objGrade, "Grade");

            setTimeout(function () {
                GetInquiriesforAutoComplete();
            }, 1000);
            if (objInquiry[0] != undefined) {
                $($("#StdName").find("input[placeholder=Date]")[0]).val(objInquiry[0].Date);
                $($("#Grade").find("input[placeholder*=Contact]")[0]).val(objInquiry[0]["Contact Name"]);
                $("#CPhone").val(objInquiry[0]["ContactPhone"]);
                $($("#Subject").find("input[placeholder=Email]")[0]).val(objInquiry[0]["Contact Email"]);
                $($("#School").find("input[placeholder=Source]")[0]).val(objInquiry[0].Source);
                $($("#Notes").find("textarea[placeholder=Notes]")[0]).val(objInquiry[0].Notes);
            }
            for (var x = 0; x < ObjInquiryStudent.length; x++) {
                if (x >= 1) {

                    $(".AddMoreStdName").trigger('click');

                }

                $($("#StdName").find("input[placeholder*=Student]")[x]).val(ObjInquiryStudent[x].StudentName);
                $($("#Grade").find("input[placeholder=Grade]")[x]).val(ObjInquiryStudent[x].Grade);
                $($("#Subject").find("input[placeholder=Subject]")[x]).val(ObjInquiryStudent[x].Subjects);
                $($("#School").find("input[placeholder=School]")[x]).val(ObjInquiryStudent[x].School);
                $($("#Notes").find("textarea[placeholder=Notes]")[x + 1]).val(ObjInquiryStudent[x].Notes);
            }

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
            ClearTime1($("#date1"));
            ClearTime1($("#date2"));
            //disabledAllcontrol();
        }
 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <h3 style="margin-left: 20px !important;margin-top: 19px !important;width: 97% !important;">Inquiry and Assessment Actions</h3>
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
                                    <input placeholder="Subject" type="email" tabindex="104"  class="field">
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
            <button name="discard" type="submit" id="btnDiscard" data-submit="...Sending" style="float: right;margin-top: -40px;">Discard</button>
        </div>

        <table id="calendar-demo" class="calendar"></table>
        <script>
            $('input[placeholder=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            $(document).ready(function () {

                $("#btnDiscard").click(function () {
                    if (confirm("Please confirm you wish to delete this assessment.")) {
                        DELETE_Inquiry_Assessment_Meeting_RedirectToEnrolement(2, InquiryId);
                    }
                });
                enableAllcontrol();
                $('button[name=Edit]').click(function () {

                    enableAllcontrol();
                    return false;
                });
            });
        </script>
</asp:Content>

