<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="WeeklySchedule.aspx.cs" Inherits="Scheduling_WeeklySchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/WeeklySchedular.js?v=14.5"></script>
    <link href="../CSS/Schedular.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="https://pagead2.googlesyndication.com/pagead/osd.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="min-height: 1000px;">
        <h3 style="margin-left: 20px; margin-top: -12px;">Weekly Schedule</h3>
        <table style="margin-left: 20px;">
            <tr>
                <td>Day: </td>
                <td>

                    <input placeholder="Date" type="text" tabindex="1" autofocus style="width: 200px; margin-left: 10px;" id="txtDate" /></td>
                <td width="100"></td>
                <td>Time: </td>
                <td>
                    <select id="selectTime" style="border: 1px solid #ccc; background: #FFF; margin-left: 10px;">
                        <option value="-1">--Select Time--</option>

                    </select>

                </td>
                <td width="100"></td>
                <td>

                    <input type="button" value="Refresh" id="btnRefreshSchedule" style="display: none" />
                </td>
            </tr>

        </table>

        <div id="Datacontained">
            <div id="leftDiv">
            </div>
            <div id="rightDiv">
                <input id="btnCreateTable" type="button" value="Create Table" style="margin-top: -34px; position: absolute; display: none;" onclick="CreateTable();" />
                <input id="btnMove" type="button" value="Move" style="margin-top: -34px; position: absolute; margin-left: 0px;" />

                <input id="btnBulkUpdate" type="button" value="Bulk Update" style="margin-top: -34px; position: absolute; margin-left: 58px;" />
                <input id="btnWeeklySummary" type="button" value="Summary View" style="margin-top: -34px; position: absolute; margin-left: 163px;" />
                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Tutors</span>
                    <input type="text" placeholder="Search" id="txtTutor" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">

                    <ul class="scroll" id="dvTutor" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
                        <%--                    <li ondragstart="dragStart(event,this)" draggable="true" id="57fc0d51df94d4af35d85fa1" forstudent="0">David Vu 
                    </li>--%>
                    </ul>
                </div>
                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Students</span>
                    <input type="text" placeholder="Search" id="txtStudent" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">
                    <ul class="scroll" id="dvStudent" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
                        <%--                    <li subject="Writing,Math" ondragstart="dragStart(event,this)" draggable="true" id="57cef3bbea93536c062df837" forstudent="1">Aaron Easterday 
                    </li>--%>
                    </ul>
                </div>
                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Absent

                                                <img class="show" src="../images/Add_Icon.jpg" style="width: 20px; height: 20px; float: right; display: none!important;" id="dvStudent_AB_show">
                        <img class="hide" src="../images/Delete_Icon.jpg" style="width: 20px; height: 20px; float: right;" id="dvStudent_AB_hide">
                    </span>
                    <input type="text" placeholder="Search" id="txtStudent_AB" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">
                    <ul tableid="-1" forstudent="1" class="scroll" id="dvStudent_AB" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
                        <%--                    <li subject="Writing,Math" ondragstart="dragStart(event,this)" draggable="true" id="57cef3bbea93536c062df837" forstudent="1">Aaron Easterday 
                    </li>--%>
                    </ul>
                </div>

                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Study Hall

                <img class="show" src="../images/Add_Icon.jpg" style="width: 20px; height: 20px; float: right; display: none!important;" id="dvStudent_SH_show">
                        <img class="hide" src="../images/Delete_Icon.jpg" style="width: 20px; height: 20px; float: right;" id="dvStudent_SH_hide">
                    </span>
                    <input type="text" placeholder="Search" id="txtStudent_SH" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">
                    <ul tableid="0" forstudent="1" class="scroll" id="dvStudent_SH" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
                        <%--                    <li subject="Writing,Math" ondragstart="dragStart(event,this)" draggable="true" id="57cef3bbea93536c062df837" forstudent="1">Aaron Easterday 
                    </li>--%>
                    </ul>
                </div>

            </div>

        </div>
    </div>
    <table id="calendar-demo" class="calendar"></table>

    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>

    <div id="dialogx" title="Bulk Update" style="display: none;">
        Attendance:
        <select id="drpAttendance">
            <option value="">Select..</option>
            <option value="Present (On Time)">Present (On Time)</option>
            <option value="Present (Came Late)">Present (Came Late)</option>
            <option value="Absence (No Notice)">Absence (No Notice)</option>
            <option value="Absence (Late Notice)">Absence (Late Notice)</option>
            <option value="Excused">Excused</option>
        </select>

        <input type="button" id="btnUpdateSelectedRcd" value="Apply Update" style="margin-top: 6px;" />

    </div>

    <div id="dialog_Move" title="Move Record" style="display: none;">
                <input type="button" id="btnYes" value="Yes" style="margin-top: 6px;" />
        <input type="button" id="btnNo" value="No" style="margin-top: 6px;" />
        <input type="button" id="btnUndo" value="Undo Move Action" style="margin-top: 6px;" />
    </div>
    <script>

        var weekday = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        $("#aWeeklySchedule").attr("class", "active");
        $("#aWeeklySchedule").attr("href", "javascript:void(0);");
        var objTimes;
        var CurrentTime;
        var diff;

        $(document).ready(function () {
            //$('input[placeholder=Date]').dcalendarpicker();
            LoadSubjects();
            $('input[placeholder=Date]').dcalendarpicker({
                format: 'XYZ dd-mm-yyyy'
            });

            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();


            $.ajax({
                type: "POST",
                url: "MasterSchedule.aspx/GETTimes",
                data: '{ ID:"" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    diff = 24 * 60;
                    var dt = new Date();
                    CurrentTime = ((new Date()).getHours()) * 60 + (new Date()).getMinutes();
                    objTimes = JSON.parse(response.d[0]);
                    fillDays(objTimes)
                }
            });
        });

        function fillDays(objTimes) {

            var d = new Date();

            var Dayname = weekday[d.getDay()].substr(0, 3);
            var MonthName = month[d.getMonth()].substr(0, 3);
            var year = d.getFullYear();
            var Day = d.getDate();
            $("#txtDate").val(Dayname + ", " + MonthName + " " + Day + ", " + year);
            getTimes(Dayname);


        }
        function getTimes1(daySelected) {
            getTimes(daySelected);
        }
        function getTimes(daySelected) {
            $('#selectTime').html('<option value="-1">--Select Time--</option>');
            diff = 24 * 60;
            for (var x = 0; x < objTimes.length; x++) {
                if (daySelected == objTimes[x].ShortDay) {

                    var dt = new Date();
                    CurrentTime = ((new Date()).getHours()) * 60 + (new Date()).getMinutes();
                    var DateDiff = CurrentTime - objTimes[x].TotalMiinute;
                    if (DateDiff < 0)
                        DateDiff = -1 * DateDiff;
                    if (DateDiff < diff && daySelected == objTimes[x].ShortDay) {
                        diff = DateDiff;
                        $('#selectTime').append($('<option>', {
                            value: objTimes[x].ID,
                            text: objTimes[x].Time,
                            ShortDay: objTimes[x].ShortDay,
                            LongDay: objTimes[x].LongDay,
                            class: objTimes[x].ShortDay + " " + objTimes[x].LongDay,
                            selected: true
                        }));
                    }
                    else if (daySelected == objTimes[x].ShortDay) {
                        $('#selectTime').append($('<option>', {
                            value: objTimes[x].ID,
                            text: objTimes[x].Time,
                            ShortDay: objTimes[x].ShortDay,
                            LongDay: objTimes[x].LongDay,
                            class: objTimes[x].ShortDay + " " + objTimes[x].LongDay
                        }));
                    }
                }
            }
            //$('#selectTime').val("1");
            $("#selectTime").trigger("change");
        }

        function WeeklySummary() {

        }
        $(window).scroll(function () {
            //console.log($(window).scrollTop());
        });
        $("#btnMove").click(function () {
            if (Selectedrecords.length == 1) {
                var txtbox = $("input[msid=" + Selectedrecords[0] + "][forstudent=1]");
                $(txtbox).css("background-color", "#336699");
                $(txtbox).css("color", "white");
                //$($(txtbox).parent().find("img.Selected")[0]).toggle();
                createCookie("Rcd", Selectedrecords[0], 1);

            }
            else if (Selectedrecords.length > 1) {
                alert('Please select only one student to move.', false);
            }
            else {
                alert('Please select student.', false);
            }
        });

        $("#btnBulkUpdate").click(function () {
            if (Selectedrecords.length >= 1) {
                $("#dialogx").dialog();
                setTimeout(function () {
                    $(".ui-dialog-titlebar").attr("style", "padding: .5em 1em !important;background-color: #2065ac !important;color: white;")
                }, 1);
            }
            else {
                alert('Please select atleast one student.', false);
            }
        });
        $("#btnWeeklySummary").click(function () {
            location.href = 'WeeklySummary.aspx';
        });
        $("#btnYes").click(function () {
            var StringData = JSON.stringify(data_toPost);
            console.log(StringData);
            PostDataGeneric("Swipe_Student_BlankMSID_Move", "WeeklySchedule.aspx", StringData, true);
            var rcdValue = getCookie("Rcd");
            createCookie("Rcd", rcdValue, -1);
            $("#dialog_Move").dialog("close");
            data_toPost = {};
        });
        $("#btnNo").click(function () {
            $("#dialog_Move").dialog("close");
            data_toPost = {};
        });
        $("#btnUndo").click(function () {
            var rcdValue = getCookie("Rcd");
            var txtbox = $("input[msid=" + rcdValue + "][forstudent=1]");

            $(txtbox).css("background-color", "white");
            $(txtbox).css("color", "black");
            createCookie("Rcd", rcdValue, -1);
            $("#dialog_Move").dialog("close");
            data_toPost = {};
        });
        $("#btnUpdateSelectedRcd").click(function () {
            var MSIDs = Selectedrecords.toString();
            var Reasons = $("#drpAttendance").val();
            if (Reasons == "0") {
                alert('Please select Attendance!!', false);
                return false;
            }
            var Date = $("#txtDate").val();
            var data = {};
            data.MSIDs = MSIDs;
            data.Reasons = Reasons;
            data.Date = Date;
            var StringData = JSON.stringify(data);

            PostDataGeneric("CreateAttendance", "MasterSchedule.aspx", StringData, true);
            setTimeout(function () { $("#dialogx").dialog( "close" ); }, 1000);

            Selectedrecords = [];
        });




    </script>



</asp:Content>

