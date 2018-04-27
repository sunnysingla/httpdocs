<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="TutorDetail.aspx.cs" Inherits="Manage_TutorDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="js/Manage.js?v=14.5"></script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="margin-left: -1.2% !important;">
        <div id="leftDiv"  style="height: 445px !important;width: 50%; margin-left:0%; ">
            <h3>Tutor Information</h3>
            <table style="width: 95%;">
                <tr>
                    <td>Name</td>
                    <td style="width: 82%">
                        <input type="text" id="tutName" tabindex="1" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea id="tutAddr" tabindex="2" class="txtbox" style="width: 100%"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd" style="height: 4px;"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" id="tutEmail" tabindex="1" class="txtbox" placeholder="Email" style="width: 49% !important" />
                        <span style="width: 2%"></span>
                        <input type="text" id="tutPassword" tabindex="1" class="txtbox" placeholder="Password" style="width: 50% !important" />
                        </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Primary No.</td>
                    <td>
                        <input type="text" id="tutPhone" tabindex="4" class="Phone txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                                <tr>
                    <td>Secondry No.</td>
                    <td>
                        <input type="text" id="tutSPhone" tabindex="4" class="Phone txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Subjects</td>
                    <td><div id="tutSubjects" style="height: 100px;overflow-y: scroll; overflow-x: hidden;border: 1px solid #dbdbdb;"></div></td>
                </tr>
            </table>

        </div>
        <div id="rightDiv" style=" margin-top:-445px; position:relative; margin-left: 50.2% !important; height: 445px !important; width: 49.8%!important; ">
            <h3>Tutor Availability</h3>
            <table style="width: 90%;">
                                <tr>
                    <td><b>Day</b></td>
                    <td><b>Start</b></td>
                    <td><b>End</b></td>

                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Monday</td>
                    <td>
                        <input type="text" id="txtMondayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtMondayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Tuesday</td>
                    <td>
                        <input type="text" id="txtTuesdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtTuesdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Wednesday</td>
                    <td>
                        <input type="text" id="txtWednesdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtWednesdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <td>
                        <input type="text" id="txtThursdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtThursdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Friday</td>
                    <td>
                        <input type="text" id="txtFridayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtFridayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Saturday</td>
                    <td>
                        <input type="text" id="txtSaturdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtSaturdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <td>
                        <input type="text" id="txtSundayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtSundayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>

            </table>
            <%--<textarea id="tutorAvailabilityTxt" style="margin-left: 1.5%; width: 97%; height: 80%;"></textarea>--%>

        </div>

        <button name="submit" type="submit" id="SaveUpdates" data-submit="...Sending" style="margin-top: 10px;">Save Updates</button>

               <div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Mailbox</h3>
            <table class="btnMailBox" style="width: 100%; margin-top: 16px;">
                <tr>
                    <td style="width: 150px;">
                        <button name="submit" type="submit" id="Inbox" data-submit="...Sending" style="margin-top: -10px; margin-left: 0px !important;">Inbox</button></td>
                    <td style="width: 150px;">
                        <button name="submit" type="submit" id="Send" data-submit="...Sending" style="margin-top: -10px; margin-left: -10px !important;">Sent</button></td>
                    <td>
                        <button name="submit" type="submit" id="Create" data-submit="...Sending" style="margin-top: -10px; margin-left: 0px !important;">Send Message</button></td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 4px;"></td>
                </tr>
                <tr>
                    <td>
                        <select id="recipent" style="height: 32px;">
                            <option value="0" selected>Select Recipient</option>
                        </select>

                    </td>
                    <td colspan="2">

                        <input type="text" id="txtMessage" placeholder="Message content" style="width: 100%;" />
                    </td>
                </tr>
            </table>


            <div id="DvInbox" style="margin-top: 10px;">
                <table id="InboxList"></table>
                <div id="InboxPager"></div>
            </div>
            <div id="DivSend" style="display: none; margin-top: 10px;">
                <table id="SendList"></table>
                <div id="SendPager"></div>
            </div>


        </div>

               <div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Shift Transfer Requests</h3>
            <table class="btnMailBox" style="width: 100%; margin-top: 16px;">
                <tr>
                    <td style="width: 103px;">
                        <button name="submit" type="submit" id="btnLogRequest" data-submit="...Sending" style="margin-top: -10px; margin-left: 0px !important;">+ Create</button></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 4px;"></td>
                </tr>
                <tr>
                    <td style="width: 103px;">
                        <input type="text" placeholder="Date" id="DtShift" style="width: 99%;" />

                    </td>
                    <td style="width: 100px;">
                        <input class="RestrictedTime" type="text" placeholder="Start Time" id="startTime" style="width: 99%;" />

                    </td>
                    <td style="width: 100px;">
                        <input class="RestrictedTime" type="text" placeholder="End Time" id="endTime" style="width: 99%;" />

                    </td>
                    <td>

                        <input type="text" id="tctShiftMessage" style="width: 100%;" placeholder="Message" />
                    </td>
                </tr>
            </table>

            <div id="dvShift" style="margin-top: 10px;">
                <table id="ShiftList"></table>
                <div id="ShiftPager"></div>

            </div>

        </div>
        <table id="calendar-demo" class="calendar"></table>

    </div>

    <script>
        $("#Inbox").click(function () {
            $("#DivSend").hide();
            $("#DvInbox").show();
            return false;
        });
        $("#Send").click(function () {
            $("#DivSend").show();
            $("#DvInbox").hide();
            return false;
        });

        function PostDataGenericTutor(MethodName, url, Data, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    alert(objMessage[0].SucessMsg, Refresh);
                }
            });
        }
        var MessagesInbox = [];
        var MessagesSend = [];
        var Tutor = [];
        var objTutor;
        function LoadList(id) {

            $InboxList = $("#InboxList");
            $SendList = $("#SendList");


            $.ajax({
                type: "POST",
                url: "TutorDetail.aspx/Gettutor",
                data: '{ TutorId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
      
                    var objtutor = JSON.parse(response.d[1]);
                    var objInbox = JSON.parse(response.d[2]);
                    var objSend = JSON.parse(response.d[3]);
                    var objSubjects = JSON.parse(response.d[4]);
               
                    $("#tutSubjects").html(objSubjects[0].Subjects);

                    objTutor = JSON.parse(response.d[0]);

                    var id = location.href.split('=')[1];
                    var objs = [];
                    var obj = {};
                    obj.key = "tutName";
                    obj.value = "TutorName";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutAddr";
                    obj.value = "Address";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutEmail";
                    obj.value = "Email";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutPassword";
                    obj.value = "Password";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutPhone";
                    obj.value = "PrimaryPhone";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutSPhone";
                    obj.value = "SecondryPhone";
                    objs.push(obj);
                    var obj = {};
                    obj.key = "tutorAvailabilityTxt";
                    obj.value = "TutorAvailability";
                    objs.push(obj);
                    //var obj = {};
                    //obj.key = "tutSubjects";
                    //obj.value = "Subjects";
                    //objs.push(obj);

                    LoadTutorDetails_Existed(objs);
                    //recipent
                    var html = '<option value="0" >Select Recipient</option>';
                    for (var x = 0; x < objtutor.length; x++) {
                        if (objtutor[x].Name.trim() != "Breaker" && objtutor[x].Name.trim() != "Overflow") {
                            if (location.href.split('=')[1] == objtutor[x].ID)
                                html = html + '<option selected value="' + objtutor[x].ID + '">' + objtutor[x].Name + '</option>';
                            else
                                html = html + '<option value="' + objtutor[x].ID + '">' + objtutor[x].Name + '</option>';
                        }
                    }
                    $("#recipent").html(html);

                    var ColInbox = [{ name: "Date", width: 10 },
                    { name: "Author", width: 10 },
                    { name: "Message", width: 65 }
                        , {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }
                    ];

                    var ColSend = [{ name: "Date", width: 10 },
                    { name: "Message", width: 85 }
                        , {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }
                    ];


                    //$gridAssessmentEnrollement
                    LoadGrid(ColInbox, objInbox, 'InboxList', 'InboxPager', $InboxList);
                    LoadGrid(ColSend, objSend, 'SendList', 'SendPager', $SendList);
                }
            });
        }
        function LoadShiftList(id) {

            $ShiftList = $("#ShiftList");


            $.ajax({
                type: "POST",
                url: "TutorDetail.aspx/GetTransferRequest",
                data: '{ TutorId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var objShift = JSON.parse(response.d[0]);



                    var ColShift = [{ name: "Date", width: 10 },
                    { name: "Start Time", width: 10 },
                    { name: "End Time", width: 10 },
                    { name: "Message", width: 65 }, {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }];

                    //$gridAssessmentEnrollement
                    LoadGrid(ColShift, objShift, 'ShiftList', 'ShiftPager', $ShiftList);

                }
            });
        }

        $(document).ready(function () {
            $('input[placeholder=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            $.jgrid.defaults.responsive = true;
            $.jgrid.defaults.styleUI = 'Bootstrap';

            var QueryStrings = window.location.href.split('?')[1];
            var TutorId = QueryStrings.split('&')[0].split('=')[1];
            LoadList(TutorId);
            LoadShiftList(TutorId);
            $("#Create").click(function () {
                var data = {};
                var id = location.href.split('=')[1];
                data.To = $("#recipent").val();
                data.From = id;
                data.Message = $("#txtMessage").val();
                var StringData = JSON.stringify(data);
                if ($("#recipent").val() == "0") {
                    alert("Please select recipient.", false);
                    $("#recipent").focus();
                    return false;
                }
                else if ($("#txtMessage").val() == "") {
                    alert("You cannot send a blank message.", false);
                    $("#txtMessage").focus();
                    return false;
                }
                PostDataGenericTutor("SaveMessage", "TutorDetail.aspx", StringData, false);
                LoadList(id);
                return false;
            });
            $("#btnLogRequest").click(function () {
                var data = {};
                var id = location.href.split('=')[1];
                data.Date = $("#DtShift").val();
                data.StartTime = $("#startTime").val();
                data.Endtime = $("#endTime").val();
                data.Message = $("#tctShiftMessage").val();
                data.TutorId = id;
                var StringData = JSON.stringify(data);

                PostDataGenericTutor("LogTransferRequest", "TutorDetail.aspx", StringData, false);
                LoadShiftList(id);
                return false;
            });
            $("#SaveUpdates").click(function () {
                var data = {};
                data.Name = $("#tutName").val();
                data.Address = $("#tutAddr").val();
                data.Email = $("#tutEmail").val();
                data.Password = $("#tutPassword").val();
                data.Phone = $("#tutPhone").val();
                data.SPhone = $("#tutSPhone").val();
                data.Avail = "";

                var id = location.href.split('=')[1];
                data.TutorId = id;
                var Subjects = $("#tutSubjects").find("input:checked");
                
                var Subjects_txt = "";
                for (var x = 0; x < Subjects.length; x++)
                {
                    Subjects_txt = Subjects_txt + "," + $(Subjects[x]).val();
                }


    
                data.Subjects = Subjects_txt;// $("#tutSubjects").val();

                data.MondayOpen = $("#txtMondayOpen").val();
                data.MondayClose = $("#txtMondayClose").val();
                data.TuesdayOpen = $("#txtTuesdayOpen").val();
                data.TuesdayClose = $("#txtTuesdayClose").val();
                data.WednesdayOpen = $("#txtWednesdayOpen").val();
                data.WednesdayClose = $("#txtWednesdayClose").val();
                data.ThursdayOpen = $("#txtThursdayOpen").val();
                data.ThursdayClose = $("#txtThursdayClose").val();
                data.FridayOpen = $("#txtFridayOpen").val();
                data.FridayClose = $("#txtFridayClose").val();
                data.SaturdayOpen = $("#txtSaturdayOpen").val();
                data.SaturdayClose = $("#txtSaturdayClose").val();
                data.SundayOpen = $("#txtSundayOpen").val();
                data.SundayClose = $("#txtSundayClose").val();

                var StringData = JSON.stringify(data);
                if (Subjects_txt == "") {
                    alert('Subject cannot be blank.');
                    return false;
                }

                PostDataGenericTutor("UpdateTutorInfo", "TutorDetail.aspx", StringData, false);
                return false;
            });

            var phones = [{ "mask": "(###) ###-####" }, { "mask": "(###) ###-####" }];
            $('.Phone').inputmask({
                mask: phones,
                greedy: false,
                definitions: { '#': { validator: "[0-9]", cardinality: 1 } }
            });

        });
        function LoadTutorDetails_Existed(objIds)
        {
            for (var x = 0; x < objIds.length; x++) {

                $("#" + objIds[x]["key"]).val(objTutor[0][objIds[x]["value"]]);
            }

            $("#txtMondayOpen").val(objTutor[0].MondayOpen);
            $("#txtMondayClose").val(objTutor[0].MondayClose);
            $("#txtTuesdayOpen").val(objTutor[0].TuesdayOpen);
            $("#txtTuesdayClose").val(objTutor[0].TuesdayClose);
            $("#txtWednesdayOpen").val(objTutor[0].WednesdayOpen);
            $("#txtWednesdayClose").val(objTutor[0].WednesdayClose);
            $("#txtThursdayOpen").val(objTutor[0].ThursdayOpen);
            $("#txtThursdayClose").val(objTutor[0].ThursdayClose);
            $("#txtFridayOpen").val(objTutor[0].FridayOpen);
            $("#txtFridayClose").val(objTutor[0].FridayClose);
            $("#txtSaturdayOpen").val(objTutor[0].SaturdayOpen);
            $("#txtSaturdayClose").val(objTutor[0].SaturdayClose);
            $("#txtSundayOpen").val(objTutor[0].SundayOpen);
            $("#txtSundayClose").val(objTutor[0].SundayClose);
        }
        function CheckId(obj) {

            //alert($(obj).attr('rel'));
            var Lavel = $(obj).attr('lavel');

            if (Lavel == 1) {
                if (confirm('Are you sure you want to delete this note?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_ArchiveNotes');
                }
                return false;
            }
            else if (Lavel == 2) {
                if (confirm('Are you sure you want to delete this file?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_ArchiveFles');
                }
                return false;
            }
            else if (Lavel == 3) {
                if (confirm('Are you sure you want to delete this sfift request?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_DeleteTransfer');
                }
                return false;
            }
            else if (Lavel == 'M') {
                if (confirm('Are you sure you want to delete this message?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_DeleteMessage');
                }
                return false;
            }
        }
        function DeleteGenericSP(MethodName, url, Id, Refresh, Spname) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: '{ ID:"' + Id + '",Spname:"' + Spname + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    console.log(objMessage[0].SucessMsg, true);
                    location.reload();
                }

            });
        }

        var Subjects = [];

        function LoadSubjects() {

            $.ajax({
                type: "POST",
                url: "../Scheduling/MasterSchedule.aspx/GetSubject",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objSubject = JSON.parse(response.d[0]);
                    Subjects = objSubject
                    AutoComplete('Subject', Subjects, "SubjectName");
                }

            });
        }
        LoadSubjects();


        function AutoComplete(placeholder, src, column) {

            var availableTags = [];
            for (var x = 0; x < src.length; x++) {
                availableTags.push(src[x][column]);
            }
            $('input[placeholder*=' + placeholder + ']').on("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).autocomplete("instance").menu.active) {
                    event.preventDefault();
                }
            }).autocomplete({
                minLength: 0,
                maxLength: 5,
                source: function (request, response) {
                    // delegate back to autocomplete, but extract the last term
                    response($.ui.autocomplete.filter(
                        availableTags, extractLast(request.term)));
                },
                focus: function () {
                    // prevent value inserted on focus
                    return false;
                },
                select: function (event, ui) {
                    var terms = split(this.value);
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push(ui.item.value);
                    // add placeholder to get the comma-and-space at the end
                    terms.push("");
                    var val = terms.join(", ");

                    this.value = val.substring(0, val.length - 2);
                    return false;
                }
            }).focus(function () {
                // The following works only once.
                // $(this).trigger('keydown.autocomplete');
                // As suggested by digitalPBK, works multiple times
                // $(this).data("autocomplete").search($(this).val());
                // As noted by Jonny in his answer, with newer versions use uiAutocomplete
                $(this).data("uiAutocomplete").search($(this).val());
            });
        }

        function split(val) {
            return val.split(/,\s*/);
        }
        function extractLast(term) {
            return split(term).pop();
        }

        function ClearTime(id) {
            var date = (new Date($("#DtShift").val())).toString().substr(0, 3);


            var objTimes_1 = [];
            for (var x = 0; x < objTimes_Restricted.length; x++) {
                if (objTimes_Restricted[x].ShortDay == date) {
                    objTimes_1.push(objTimes_Restricted[x]);
                }
            }
            AutoComplete_Single_StartEnd(objTimes_1, "Time");
             
        }
        setTimeout(function () {
            $("#ShiftList").setGridWidth($(window).width());
            $("#InboxList").setGridWidth($(window).width());
            $("#SendList").setGridWidth($(window).width());
        }, 20000);

    </script>
    <style>
        .fullDiv {
            width: 102%;
            float: right;
            border: none !important;
        }
    </style>
</asp:Content>

