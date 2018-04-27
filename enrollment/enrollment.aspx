<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="enrollment.aspx.cs" Inherits="Enrollment_Enrolement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script src="../CustomJs/CreateInquiry.js?v=14.5"></script>

        <script type="text/javascript"> 
            var objTimes;
                $(document).ready(function () {
                    //jqGrid
                    var colModel = [];
                    var columns = {};
                    var data = {};
                    $gridInquiry = $("#InquiryList");
                    $gridAssessment = $("#AssessmentList");
                    $gridMeeting = $("#MeetingList");

                    $.ajax({
                        type: "POST",
                        url: "Inquiry.aspx/GetEnrolementView",
                        data: '{ obj_Inquiry:"" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
 
                            var objInquiry = JSON.parse(response.d[0]);
                            var objAssessment = JSON.parse(response.d[1]);
                            var objMeeting = JSON.parse(response.d[2]);
                            var objTutorTimeSlots = JSON.parse(response.d[3]);
                            objSubjects = JSON.parse(response.d[4]);
                            objSource = JSON.parse(response.d[5]);
                            objGrade = JSON.parse(response.d[6]);
                            objTimes = JSON.parse(response.d[7]);

                            objPaymentMethods = JSON.parse(response.d[8]);
                            objPlanType = JSON.parse(response.d[9]);


                            setTimeout(function () {
                                AutoComplete('Subject', objSubjects, "SubjectName");
                                AutoComplete_Single('Source', objSource, "Source");
                                AutoComplete_Single('Grade', objGrade, "Grade");
                            }, 1000);

 
                            var colModelInquiry = [{ name: "Date", autowidth: true},
                                { name: "Contact Name", autowidth: true},
                                { name: "Student(s)", autowidth: true },
                                { name: "ContactPhone", autowidth: true, label: "Contact Phone Number" },
                                { name: "Contact Email", autowidth: true },
                                {
                                    width: 30,
                                    name: 'Details',
                                    formatter: imageLinkFormatter_main,
                                    formatoptions: {
                                        icon: 'ui-icon-folder-open',
                                        link_class: 'edit-link-class',
                                        action: 'Edit'
                                    }
                                },
                                {
                                    width: 30,
                                    name: 'Action',
                                    formatter: imageLinkFormatter,
                                    formatoptions: {
                                        icon: 'ui-icon-folder-open',
                                        link_class: 'edit-link-class',
                                        action: 'Edit'
                                    }
                                }];


                            var colModelAssessments = [{ name: "Date", autowidth: true },
                                { name: "Time", autowidth: true },
                                { name: "Student", autowidth: true },
                                { name: "Subject(s)", autowidth: true},
                                { name: "Grade", autowidth: true },
                                { name: 'Text Sent',label:'Text', autowidth: true },
                            {
                                width: 50,
                                name: 'Details',
                                formatter: imageLinkFormatter_main,
                                formatoptions: {
                                    icon: 'ui-icon-folder-open',
                                    link_class: 'edit-link-class',
                                    action: 'Edit'
                                }
                            },
                            {
                                width: 50,
                                name: 'Action',
                                formatter: imageLinkFormatter,
                                formatoptions: {
                                    icon: 'ui-icon-folder-open',
                                    link_class: 'edit-link-class',
                                    action: 'Edit'
                                }
                            }];



                            var colModelMeeting = [{ name: "Date", autowidth: true },
                                { name: "Time", autowidth: true },
                                { name: "Contact Name", autowidth: true },
                                { name: "Contact Number", autowidth: true },
                                { name: "Contact Email", autowidth: true },
                                { name: "Student's", autowidth: true },
                            {
                                width: 50,
                                name: 'Details',
                                formatter: imageLinkFormatter_main,
                                formatoptions: {
                                    icon: 'ui-icon-folder-open',
                                    link_class: 'edit-link-class',
                                    action: 'Edit'
                                }
                            },
                            {
                                width: 50,
                                name: 'Action',
                                formatter: imageLinkFormatter,
                                formatoptions: {
                                    icon: 'ui-icon-folder-open',
                                    link_class: 'edit-link-class',
                                    action: 'Edit'
                                }
                            }];



                            //$gridAssessmentEnrollement
                            LoadGrid(colModelInquiry, objInquiry, 'InquiryList', 'InquiryPager', $gridInquiry);
                            LoadGrid(colModelAssessments, objAssessment, 'AssessmentList', 'AssessmentPager', $gridAssessment);
                            LoadGrid(colModelMeeting, objMeeting, 'MeetingList', 'MeetingPager', $gridMeeting);
 
                            $(".UpdateTextSend").change(function () {
                                var Value = $(this).val();
                                var Id = $(this).attr("id");
 
                                var data = {};
                                data.Value = Value;
                                data.Id = Id;
                                var StringData = JSON.stringify(data);
                                PostDataGeneric_NoMessage("updateAssessment", "Inquiry.aspx", StringData, false);
                            });
                            ClearTime1($("#date1"));
                            ClearTime1($("#date2"));
                            //$('td[aria-describedby*=AssessmentList_Text]').html("hello")
                        },
                        failure: function (response) {
                            alert(response.d, false);
                        }
                    });
                    $('input[placeholder=Date]').dcalendarpicker();
                    $('#calendar-demo').dcalendar(); //creates the calendar
                    $('#calendar-demo').hide();
                    $("#AssessmentList").bind("jqGridAfterGridComplete", function () {
 
                        var TxtObj = $('td[aria-describedby*=AssessmentList_Text]');
                        var textSend = ["Confirmed", "No Response", "Re-Schedule", "Cancel"];

                        for (var x = 0; x < TxtObj.length; x++) {
                            console.log($(TxtObj[x]).html());
                            var html = "<select id='" + $(TxtObj[x]).html().split('_')[1] + "' class='UpdateTextSend' style='width: 180px;'>";
                            html = html + "<option value=0 >Select..</option>";
                            for (var y = 0; y < textSend.length; y++) {

                                if (textSend[y] == $(TxtObj[x]).html().split('_')[0] || $(TxtObj[x]).html().split('_')[0] == y + 1)
                                    html = html + "<option value='" + (y + 1) + "' selected>" + textSend[y] + "</option>";
                                else
                                    html = html + "<option value='" + (y + 1) + "'>" + textSend[y] + "</option>";
                            }
                            html = html + "</select>";
                            $(TxtObj[x]).html(html);
                            //if ($(TxtObj[x]).html().split('_')[0] == "No")
                            //    $(TxtObj[x]).html("<select id='" + $(TxtObj[x]).html().split('_')[1]+"' class='UpdateTextSend' style='width: 100px;'><option value='0' selected>No</option><option value='1' >Yes</option></select>");
                            //else
                            //    $(TxtObj[x]).html("<select id='" + $(TxtObj[x]).html().split('_')[1] +"' class='UpdateTextSend' style='width: 100px;'><option value='1' selected>Yes</option><option value='0' >No</option></select>");
                        }
                    });
 
                    //$.datepicker.formatDate('dd-mm-yy', dateTypeVar);
                });
        </script>
        <script>

                var height = window.innerHeight - 100;
                var width = window.innerWidth - 100;
                var height1 = window.innerHeight - 10;
                var width1 = window.innerWidth - 10;
                function CheckId(obj) {
                    height = window.innerHeight - 100;
                    width = window.innerWidth - 100;
                    height1 = window.innerHeight - 10;
                    width1 = window.innerWidth - 10;

                    //alert($(obj).attr('rel'));
                    var Lavel = $(obj).attr('lavel');
 
                    //$("body").attr("style", "overflow: hidden;");
                    if (Lavel == 0)
                        location.href = 'EnrolementAction.aspx?inquiry=' + $(obj).attr('rel');

                    //window.open('EnrolementAction.aspx?inquiry=' + $(obj).attr('rel'), "_blank");

                    //$("#frameEdit").attr('src', 'EnrolementAction.aspx?inquiry=' + $(obj).attr('rel'));
                    else if (Lavel == 1)
                        location.href = 'InquiryAction.aspx?inquiry=' + $(obj).attr('rel');
                    //window.open('InquiryAction.aspx?inquiry=' + $(obj).attr('rel'), "_blank");
                    //$("#frameEdit").attr('src', 'InquiryAction.aspx?inquiry=' + $(obj).attr('rel'));
                    else if (Lavel == 3)
                        location.href = 'AccessmentAction.aspx?inquiry=' + $(obj).attr('rel');

                    //window.open('AccessmentAction.aspx?inquiry=' + $(obj).attr('rel'), "_blank");
                    //$("#frameEdit").attr('src', 'AccessmentAction.aspx?inquiry=' + $(obj).attr('rel'));
                    else if (Lavel == 4)
                        location.href = 'MeetingAction.aspx?inquiry=' + $(obj).attr('rel');
                        //window.open('MeetingAction.aspx?inquiry=' + $(obj).attr('rel'), "_blank");
                        //$("#frameEdit").attr('src', 'MeetingAction.aspx?inquiry=' + $(obj).attr('rel'));
                    if (Lavel != 10) {
                        //$("#dialog").dialog({
                        //    width: width1,
                        //    height: height1,
                        //    modal: true,
                        //    close: function (event, ui) {
                        //       // window.location.href = location.href;
                        //    }
                        //});
                    }
                    else
                    {
                        window.open('DownLoadInvoice.aspx?inquiry=' + $(obj).attr('rel'), "_blank");
                    }
                }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="contact">
        <h3 style="margin-left: 20px !important;width: 97% !important;">Create Inquiry<a class="show" id="aShow">+</a><a class="hide" id="aHide">-</a></h3>
        <div id="dvCreateInquiry">
            <div class="container" id="container">
                <fieldset id="StdName">
                    <input placeholder="Date" type="text" tabindex="1"  autofocus>
                    <input placeholder="Student Name" type="text" tabindex="6"  class="next">
                    <span class="AddMoreStdName"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>

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
            <div class="container1">
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
                                    <input placeholder="Subject" type="text" tabindex="104"  class="field">
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
                                     <input placeholder="Time" type="text" tabindex="201"  autofocus class="field time2" style="width:15%;"  id="time2">
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
                                <div id="dvSName1" class="tags1">
                                    <input placeholder="Student Name(s)" type="text" tabindex="205"  class="field">
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </div>
            <button name="submit" type="submit" id="Inquiry-submit" data-submit="...Sending">+ Create Inquiry</button>
        </div>
        <div style="margin-left: 20px;margin-top: 6px;" >
            <h3 style="width: 100% !important;">Inquiry</h3>
            <table id="InquiryList" ></table>
            <div id="InquiryPager"></div>
            <br />
            <h3  style="width: 100% !important;">Assessment</h3>
            <table id="AssessmentList"></table>
            <div id="AssessmentPager"></div>

            <br />
            <h3  style="width: 100% !important;">Meeting</h3>
            <table id="MeetingList"></table>
            <div id="MeetingPager"></div>
            <br />
            <iframe src='https://calendar.google.com/calendar/embed?title=TC%20Calendar&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;height=600&amp;wkst=1&amp;hl=en_GB&amp;bgcolor=%23ffffff&amp;src=<%=Session["GmailId"] %>&amp;color=%23865A5A&amp;ctz=Las%23Vegas' style="border-width:0" width="99%" height="600" frameborder="0" scrolling="no"></iframe>
        </div>

        <table id="calendar-demo" class="calendar"></table>

    </div>
    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow:hidden;height:100%;width:100%" height="100%" width="100%" id="frameEdit" ></iframe>
    </div>
    <script>

                $("#aEnrollment").attr("class", "active");
                $("#aEnrollment").attr("href", "javascript:void(0);");
                $("#aShow").attr("style", "display:none ! important;");
                $("#aHide").attr("style", "display:block ! important;");
    </script>
</asp:Content>

