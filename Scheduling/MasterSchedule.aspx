<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="MasterSchedule.aspx.cs" Inherits="Scheduling_MasterSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Schedular.js?v=14.5"></script>
    <link href="../CSS/Schedular.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="https://pagead2.googlesyndication.com/pagead/osd.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="min-height: 1000px;">
        <h3 style="margin-left: 20px; margin-top: -12px;">Master Schedule</h3>
        <table style="margin-left: 20px;">
            <tr>
                <td>Day: </td>
                <td>

                    <input placeholder="Date" type="text" tabindex="1" autofocus style="width: 200px; margin-left: 10px;" id="txtDate" /></td>
                <td width="20"></td>
                <td>Time: </td>
                <td>
                    <select id="selectTime" style="border: 1px solid #ccc; background: #FFF; margin-left: 10px;">
                        <option value="-1">--Select Time--</option>

                    </select>

                </td>
                <td width="20"></td>
                <td>
                    <input type="button" value="Refresh" id="btnRefreshSchedule" style="display: none" />
                </td>
                <td style="display:none;">Effective Date: 
                </td>
                <td style="display:none;">

                    <input type="text" tabindex="1" autofocus style="width: 200px; margin-left: 10px;" id="txtWeeklyDate" />
                </td>
                <td width="20"></td>
                <td>
                    <input type="button" value="Generate Weekly Schedule" id="btnchangeWeeklySchedule" />
                </td>
            </tr>

        </table>

        <div id="Datacontained">
            <div id="leftDiv">
            </div>
            <div id="rightDiv">
                <input id="btnCreateTable" type="button" value="Create Table" style="margin-top: -34px; position: absolute; display: none;" onclick="CreateTable();" />
                <input id="btnSummaryView" type="button" value="Summary View" style="margin-top: -34px; position: absolute; margin-left: 0px;" />
                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Tutors 

                        <img class="show" src="../images/Add_Icon.jpg" style="width: 20px; height: 20px; float: right; display: none!important;" id="dvTutor_show">
                        <img class="hide" src="../images/Delete_Icon.jpg" style="width: 20px; height: 20px; float: right;" id="dvTutor_hide">
                    </span>
                    <input type="text" placeholder="Search" id="txtTutor" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">

                    <ul class="scroll" id="dvTutor" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
                        <%--                    <li ondragstart="dragStart(event,this)" draggable="true" id="57fc0d51df94d4af35d85fa1" forstudent="0">David Vu 
                    </li>--%>
                    </ul>
                </div>
                <div style="border: 1px solid #ccc; margin-bottom: 5px;">
                    <span class="searchTxtPlaceholder">Students

                                                <img class="show" src="../images/Add_Icon.jpg" style="width: 20px; height: 20px; float: right; display: none!important;" id="dvStudent_show">
                        <img class="hide" src="../images/Delete_Icon.jpg" style="width: 20px; height: 20px; float: right;" id="dvStudent_hide">
                    </span>
                    <input type="text" placeholder="Search" id="txtStudent" style="width: 95%; margin-left: 2.5%; height: 28px; margin-top: 3px;">
                    <ul class="scroll" id="dvStudent" ondrop="drop(event,this)" ondragover="allowDrop(event,this)">
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

    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>

        <div id="dialogy" title="Generate Weekly Schedule" style="display: none;" >
               
        <table style="width:200px;">

             
            <tr><td colspan="3" style="height:10px;"></td></tr>
            <tr>
                <td>Start Date<br /><input type="text" tabindex="1" autofocus style="width:150px; " id="txtWeeklyDatefrm" /></td>
                <td style="width:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>End Date<br /><input type="text" tabindex="1" autofocus style=" width:150px; " id="txtWeeklyDateto"  /></td>
            </tr>
        </table>
            <br />
     <input type="button" value="Generate Weekly Schedule" id="btnchangeWeeklyScheduleRng" />
    
    </div>
    <script>
        $("#btnchangeWeeklySchedule").click(function () {
           // $("#dialogx").dialog();

            opendia();
        });
        function opendia() {
            
            $("#dialogy").dialog({
                width: 400,
                height: 175,
                modal: true,
                close: function (event, ui) {
                    // window.location.href = location.href;
                    //window.close();
                }
            });
        }
        var weekday = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        $("#aMasterSchedule").attr("class", "active");
        $("#aMasterSchedule").attr("href", "");
        var objTimes;
        var CurrentTime;
        var diff;


        $(document).ready(function () {
            $(".show").hide();
            $(".show").click(function () {

                $(this).hide();
                var Id = $(this).attr("id");

                $("#" + Id.replace("show", "hide")).show();
                $("#" + Id.replace("_show", "")).show();
            });
            $(".hide").click(function () {
                $(this).hide();
                var Id = $(this).attr("id");
                $("#" + Id.replace("hide", "show")).show();
                $("#" + Id.replace("_hide", "")).hide();

            });
            LoadSubjects();
            $('#txtWeeklyDate').dcalendarpicker({
                format: 'XYZ dd-mm-yyyy'
            });

            $('#txtWeeklyDatefrm').dcalendarpicker({
                format: 'XYZ dd-mm-yyyy'
            });
            $('#txtWeeklyDateto').dcalendarpicker({
                format: 'XYZ dd-mm-yyyy'
            });


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

            var DayName_temp = weekday[d.getDay()];
            var Dayname_main = ""; weekday[d.getDay()]//.substr(0, 3);
            var MonthName = month[d.getMonth()]//.substr(0, 3);
            var year = d.getFullYear();
            var Day = d.getDate();

            //$("#txtDate").val(Dayname + ", " + MonthName + " " + Day + ", " + year);

            d = d.addDays(-d.getDay());

            var Dates = [];

            for (var x = 1; x < 8; x++) {
                d = d.addDays(1);
                var Dayname = weekday[d.getDay()]//.substr(0, 3);
                var MonthName = month[d.getMonth()]//.substr(0, 3);

                var year = d.getFullYear();
                var Day = d.getDate();
                var dt = {};
                dt.name = Dayname;
                for (var y = 0; y < objTimes.length; y++) {
                    if (DayName_temp == objTimes[y].LongDay) {
                        Dayname_main = DayName_temp;
                    }
                    if (objTimes[y].LongDay == Dayname) {
                        Dates.push(dt);
                        break;
                    }
                }
            }
            $("#txtDate").val(Dayname_main);
            getTimes($("#txtDate").val());

            AutoComplete_SingleX('Date', Dates, "name");
            $("#txtWeeklyDate").focus();
        }
        function getTimes(daySelected) {
            $('#selectTime').html('<option value="-1">--Select Time--</option>');
            diff = 24 * 60;
            for (var x = 0; x < objTimes.length; x++) {
                if (daySelected == objTimes[x].LongDay) {

                    var dt = new Date();
                    CurrentTime = ((new Date()).getHours()) * 60 + (new Date()).getMinutes();
                    var DateDiff = CurrentTime - objTimes[x].TotalMiinute;

                    if (parseInt(DateDiff) < 0)
                        DateDiff = -1 * DateDiff;


                    if (DateDiff < diff && daySelected == objTimes[x].LongDay) {
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
                    else if (daySelected == objTimes[x].LongDay) {
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


        Date.prototype.addDays = function (days) {
            var dat = new Date(this.valueOf());
            dat.setDate(dat.getDate() + days);
            return dat;
        };


        $("#btnSummaryView").click(function () {
            location.href = 'ScheduleSummary.aspx';
        });

        var date = new Date();
        $("#btnchangeWeeklySchedule_x").click(function () {


            if ($("#txtWeeklyDate").val() == "") {
                alert('Please select an effective date.', false);
                $("#txtWeeklyDate").focus();
                return false;
            }

            else {
                $.ajax({
                    type: "POST",
                    url: "MasterSchedule.aspx/CheckOverRide",
                    data: '{ Date:"' + $("#txtWeeklyDate").val() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var objMessage = JSON.parse(response.d[0]);
                        if (objMessage[0].SucessMsg == "This will overwrite any changes made to the Weekly Schedule from the effective date onward.") {
                            if (confirm(objMessage[0].SucessMsg)) {
                                $.ajax({
                                    type: "POST",
                                    url: "MasterSchedule.aspx/Schedular_Date",
                                    data: '{ Date:"' + $("#txtWeeklyDate").val() + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response1) {
                                        var objMessage1 = JSON.parse(response1.d[0]);
                                        alert(objMessage1[0].SucessMsg, false);
                                    }
                                });
                            }
                        }
                        else {
                            alert(objMessage[0].SucessMsg, false);
                        }
                    }
                });
            }
        });


        $("#aMasterSchedule").attr("class", "active");
        $("#aMasterSchedule").attr("href", "javascript:void(0);");


        $("#btnchangeWeeklyScheduleRng").click(function () {
            event.preventDefault();

            if ($("#txtWeeklyDatefrm").val() == "") {
                alert('Please select from date.', false);
                //opendia();
                $("#txtWeeklyDatefrm").focus();
                return false;
            }
            else  if ($("#txtWeeklyDateto").val() == "") {
                alert('Please select to date.', false);
                //opendia();
                $("#txtWeeklyDateto").focus();
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "MasterSchedule.aspx/CheckOverRideFrm_to",
                    data: '{ from:"' + $("#txtWeeklyDatefrm").val() + '", to:"' + $("#txtWeeklyDateto").val() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var objMessage = JSON.parse(response.d[0]);
                        if (objMessage[0].SucessMsg == "This will overwrite any changes made to the Weekly Schedule from the effective date onward.") {
                            if (confirm(objMessage[0].SucessMsg)) {
                                $.ajax({
                                    type: "POST",
                                    url: "MasterSchedule.aspx/USP_Schedular_Date_frm_to",
                                   data: '{ from:"' + $("#txtWeeklyDatefrm").val() + '", to:"' + $("#txtWeeklyDateto").val() + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response1) {
                                        var objMessage1 = JSON.parse(response1.d[0]);
                                        alert(objMessage1[0].SucessMsg, false);
                                        if (objMessage1[0].SucessMsg == "Weekly Schedule updated.") {
                                            $("#dialogy").dialog("close");
                                        }
                                    }
                                });
                            }
                        }
                        else {
                            alert(objMessage[0].SucessMsg, false);
                            if (objMessage[0].SucessMsg == "Weekly Schedule updated.") {
                                $("#dialogy").dialog("close");
                            }
                        }
                    }
                });
            }
        });
    </script>

    <style>
        .ui-dialog-titlebar {
        margin-top: -6px;
        background-color: #2065ac !important;
            color: white;
    font-size: 20px;
    padding-top: 7px !important;
     padding-bottom: 7px !important;
      padding-right: 7px !important;
       padding-left: 7px !important;

        }

        .ui-dialog .ui-dialog-titlebar {
    padding: 7px !important;
}
        div[role=dialog] {
        
        padding:0px !important;
        }

    </style>
</asp:Content>

