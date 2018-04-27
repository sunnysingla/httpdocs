﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/Popup.master" AutoEventWireup="true" CodeFile="EnrolementAction.aspx.cs" Inherits="Enrollment_EnrolementAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../CustomJs/UpdateInquiry.js?v=14.5"></script>
    <script type="text/javascript">
        var response;
        var InquiryId;
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

            objSubjects = JSON.parse(response.d[6]);
            objSource = JSON.parse(response.d[7]);
            objGrade = JSON.parse(response.d[8]);
            response_Logs = JSON.parse(response.d[9]);

            objTimes = JSON.parse(response.d[10]);



            //AutoComplete_Single('Time', objTimes, "Time");

            fillNotes(response_Logs);


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 style="margin-left: 20px !important;margin-top: 19px !important;width: 97% !important;">Student Details</h3>
    <div id="dvCreateInquiry">
        <div class="container" id="container">
            <fieldset id="StdName">
                <input placeholder="Date" type="text" tabindex="1"  autofocus>
                <input placeholder="Student Name" type="text" tabindex="6"  class="next">
                <span class="AddMoreStdName"><img src="../images/Add_Icon.jpg"  style="width:18px;"/></span>

            </fieldset>
            <fieldset id="Grade">
                <input placeholder="Contact Name" type="text" tabindex="2"  style="width:23%" >
                <input id="CPhone" placeholder="Contact phone number" type="text" tabindex="2"  style="width:23%;margin-left: .7%;" >
                <input placeholder="Grade" type="text" tabindex="7"  class="next">
                <span class="AddMoreGrade"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
            </fieldset>
            <fieldset id="Subject">
                <input placeholder="Email" type="email" tabindex="3" >
                <input placeholder="Subject" type="text" tabindex="8"  class="next">
                <span class="AddMoreSubject"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
            </fieldset>
            <fieldset id="School">
                <input placeholder="Source" type="text" tabindex="4" >
                <input placeholder="School" type="text" tabindex="9"  class="next">
                <span class="AddMoreSchool"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
            </fieldset>
            <fieldset id="Notes">
                <textarea placeholder="Notes" tabindex="5" ></textarea>
                <textarea placeholder="Notes" tabindex="10"  class="next"></textarea>
                <span class="AddMoreNotes"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                <span class="RemoveMoreStdName" style="display: none"><img src="../images/Delete_Icon.jpg"  style="width:18px;" /></span>
            </fieldset>
        </div>
        <%--<button name="Edit" style="float: right; width: auto !important;display:none;" type="submit">Edit</button>--%>
        <div class="container1" >
            <table style="width: 100%;">

                <tr>
                    <td style="width: 43.3%">
                        <fieldset id="fsetAssessment">
                            <legend>Schedule Assessment</legend>
                            <div id="dvDate">
                                <input placeholder="Date" type="text" tabindex="100"  autofocus class="field date1" id="date1">
                                <span class="Add_new1"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                            </div>
                            <div id="dvTime">
                                    <input placeholder="Time" type="text" tabindex="101"  autofocus class="field time1" id="time1">
                                      <span class="Add_new11"></span>
                                </div>
                            <div id="dvSName">
                                <input placeholder="Student Name" type="text" tabindex="102"  class="field">
                                <span class="Add_new2"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                            </div>
                            <div id="dvGrade">
                                <input placeholder="Grade" type="text" tabindex="103"  class="field">
                                <span class="Add_new4"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                                
                            </div>
                            <div id="dvSubject">
                                <input placeholder="Subject" type="email" tabindex="104"  class="field">
                                <span class="Add_new3"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                                <span class="Remove_new1" style="display: none"><img src="../images/Delete_Icon.jpg"  style="width:18px;" /></span>
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

    </div>
 
      <h3 style="margin-left: 20px !important;width: 97% !important;">Log Note</h3>
    <div  id="dvLogEntry">
       
        <div id="dvLogDate">
            <input placeholder="Date" type="text" tabindex="400"  autofocus class="field DateDefault" id="DateDefault">
        </div>

        <div id="dvLogNotes">

            <textarea placeholder="Notes" tabindex="500" ></textarea>
        </div>

    </div>
    <button name="Save" type="submit" id="SaveInquiryLog" data-submit="...Sending">Save</button>
 
     <h3 style="margin-left: 20px !important;width: 97% !important;">Logged Notes</h3>
    <div  id="dvLogsDetails">
        
        <table id="tblTutorAvailable" class="ui-jqgrid-btable ui-common-table table table-bordered">
            <thead>
                <tr class='jqgrow ui-row-ltr' id="0">
                    <td class='jqgrid-rownum active' style="width:150px;">Date</td>
                    <td class='jqgrid-rownum active'  style="width:150px;">Author</td>
                    <td class='jqgrid-rownum active'>Note</td>
                </tr>
            </thead>
            <tbody id="callLogsBody">
            </tbody>
        </table>
    </div>
    <table id="calendar-demo" class="calendar"></table>
    <script>
        var response_Logs;
        $("#SaveInquiryLog").on("click", function () {

            var _CallLogs = {};
            _CallLogs._InquiryID = InquiryId;
            _CallLogs._Date = $($("#dvLogDate").find("input[placeholder=Date]")[0]).val();
  
            _CallLogs._Notes = $($("#dvLogNotes").find("textarea[placeholder=Notes]")[0]).val();
            var str = JSON.stringify(_CallLogs).replace(/"/g, '\\"');

            $.ajax({
                type: "POST",
                url: "EnrolementAction.aspx/InsertIntoCallLogs",
                data: '{Obj_CallLogs:"' + str + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert('Note saved.', false);
                    //response_Logs = response;
                    response_Logs = JSON.parse(response.d[0]);
                    $($("#dvLogNotes").find("textarea[placeholder=Notes]")[0]).val('');
                    fillNotes(response_Logs);
                },
                failure: function (response) {
                    alert(response.d, false);
                }
            });
            return false;
        });
        $('input[placeholder=Date]').dcalendarpicker();
        $('#calendar-demo').dcalendar(); //creates the calendar
        $('#calendar-demo').hide();
        $(document).ready(function () {

            $('button[name=discard]').click(function () {
                //LoadAgain();
                location.reload();
                return false;
            });
            enableAllcontrol();
            $('button[name=Edit]').click(function () {

                enableAllcontrol();
                return false;
            });
        });

        function fillNotes(object) {
            var html = "";
            for (var x = 0; x < object.length; x++) {
                html = html + "<tr class='jqgrow ui-row-ltr'  ><td class='jqgrid-rownum active' >" + object[x].Date + "</td><td class='jqgrid-rownum active' >" + object[x].UserName + "</td><td class='jqgrid-rownum active' >" + object[x].Notes+"</td></tr>";

            }
            if (object.length == 0)
            {
                html = "<tr class='jqgrow ui-row-ltr'><td class='jqgrid-rownum active'  colspan=3><center>There are no logged notes for this customer.</center></td></tr>";
            }
            $("#callLogsBody").html(html);
        }
        var dt = new Date();
        var strDate = (dt.getMonth() + 1) + "/" + dt.getDate() + "/" + "20" + dt.getYear().toString().substring(1, 3);
        $(".DateDefault").val(strDate);
    </script>
</asp:Content>