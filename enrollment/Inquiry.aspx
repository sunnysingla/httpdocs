<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inquiry.aspx.cs" Inherits="Enrollment_Inquiry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

 
    <script type="text/javascript">

    </script>
</head>
<body>

    <form id="contact" runat="server">
         <h3 style="margin-left:20px;">Create Inquiry<a class="show" id="aShow">+</a><a class="hide" id="aHide">-</a></h3>
         <div id="dvCreateInquiry" style="display:none;">
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
                    <span class="AddMoreGrade"><img src="../images/Add_Icon.jpg"  style="width:18px;"/></span>
                </fieldset>
                <fieldset id="Subject">
                    <input placeholder="Email" type="email" tabindex="3" >
                    <input placeholder="Subject" type="text" tabindex="8"  class="next">
                    <span class="AddMoreSubject"><img src="../images/Add_Icon.jpg" style="width:18px;" /></span>
                </fieldset>
                <fieldset id="School">
                    <input placeholder="Source" type="text" tabindex="4" >
                    <input placeholder="School" type="text" tabindex="9"  class="next">
                    <span class="AddMoreSchool"><img src="../images/Add_Icon.jpg"  style="width:18px;"/></span>
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
                                <div id="dvSubject">
                                    <input placeholder="Subject" type="email" tabindex="103"  class="field">
                                    <span class="Add_new3"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                                </div>
                                <div id="dvGrade">
                                    <input placeholder="Grade" type="text" tabindex="104"  class="field">
                                    <span class="Add_new4"><img src="../images/Add_Icon.jpg"  style="width:18px;" /></span>
                                    <span class="Remove_new1" style="display: none"><img src="../images/Delete_Icon.jpg"  style="width:18px;" /></span>
                                </div>
                                <div id="dvSNamex" style="visibility:hidden;">
                                    <input placeholder="Student Name(s)" type="text" tabindex="204"  class="field">
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
                                    <input placeholder="Contact Name" type="text" tabindex="201"  class="field">
                                </div>
                                <div id="dvphone1">
                                    <input placeholder="Contact phone number" type="phone" tabindex="202"  class="field">
                                </div>
                                <div id="dvemail1">
                                    <input placeholder="Contact email" type="email" tabindex="203"  class="field">
                                </div>
                                <div id="dvSName1">
                                    <input placeholder="Student Name(s)" type="text" tabindex="204"  class="field">
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </div>
            <button name="submit" type="submit" id="Inquiry-submit" data-submit="...Sending">+ Create Inquiry</button>
        </div>
        <div style="margin-left:20px">
               <h3>Inquiry</h3>
    <table id="InquiryList"></table>
    <div id="InquiryPager"></div>
            <br />
            <h3>Assessment</h3>
    <table id="AssessmentList"></table>
    <div id="AssessmentPager"></div>

             <br />
            <h3>Meeting</h3>
    <table id="MeetingList"></table>
    <div id="MeetingPager"></div>
</div>
    <script type="text/javascript"> 
 
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
                    console.log(response);
                    var objInquiry = JSON.parse(response.d[0]);
                    var objAssessment = JSON.parse(response.d[1]);
                    var objMeeting = JSON.parse(response.d[2]);
                    //console.log(obj1);
                    //obj1.Details = '<a href="javascript:void(0)" class="DetailView"><u>Click</u></a>';
                    //obj1.Action = '<a href="javascript:void(0)" class="ActionView"><u>Click</u></a>';
                    var colModelInquiry = [{ name: "Date", width: 110 },
                    { name: "ContactName", width: 150 },
                    { name: "Student's", width: 300 },
                    { name: "Email", width: 150 },
                    {
                        width:50,
                        name: 'Details',
                        formatter: imageLinkFormatter,
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

                    var colModelAssessments = [{ name: "Date", width: 110 },
                    { name: "Student", width: 150 },
                    { name: "Subject's", width: 300 },
                    { name: "Grade", width: 150 },
                    {
                        width: 50,
                        name: 'Details',
                        formatter: imageLinkFormatter,
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



                    var colModelMeeting = [{ name: "Date", width: 110 },
                        { name: "Contact Name", width: 150 },
                        { name: "Contact Number", width: 100 },
                        { name: "Contact Email", width: 150 },
                        { name: "Student's", width: 300 },
                    {
                        width: 50,
                        name: 'Details',
                        formatter: imageLinkFormatter,
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



                    //$gridAssessment
                    LoadGrid(colModelInquiry, objInquiry, 'InquiryList', 'InquiryPager', $gridInquiry);
                    LoadGrid(colModelAssessments, objAssessment, 'AssessmentList', 'AssessmentPager', $gridAssessment);
                    LoadGrid(colModelMeeting, {}, 'MeetingList', 'MeetingPager', $gridMeeting);
                },
                failure: function (response) {
                    alert(response.d, false);
                }
            });

        });
    </script>
        <table id="calendar-demo" class="calendar"></table>
        <script>
            $('input[placeholder=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            var height = window.innerHeight-100;
            var width = window.innerWidth-100;
            $(function () {
 
 
            });
            function CheckId(obj) {
                //alert($(obj).attr('rel'));
                $("#frameEdit").attr('width', width-100);
                $("#frameEdit").attr('src', 'InquiryAction.html?inquiry=' + $(obj).attr('rel'))
                $("#dialog").dialog({
                    width: width,
                    height: height,
                    modal: true
                });
            }
       </script>

     

     
    </form>
     <div id="dialog" style="display:none;" title=" ">
  <iframe frameborder="0"   width="1000" height="1000" id="frameEdit"  src="InquiryAction.html" ></iframe>
</div>
</body>
</html>
