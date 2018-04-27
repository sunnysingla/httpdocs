<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="Tutor_Schedule" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/TutorSchedular.js?v=14.5"></script>
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
                    
                    <input placeholder="Date" type="text" tabindex="1"  autofocus style="width: 200px;    margin-left: 10px;" id="txtDate" /></td>
                <td width="100"></td>
                <td>Time: </td>
                <td> 
                    <select id="selectTime" style="border: 1px solid #ccc; background: #FFF;    margin-left: 10px;">
                        <option value="-1">--Select Time--</option>

                    </select>

                </td>
                <td width="100"></td>
                <td>

                    <input type="button" value="Refresh" id="btnRefreshSchedule" style="display:none" />
                </td>
            </tr>

        </table>

        <div id="Datacontained">
            <div id="leftDiv" style="width:100%;">
            </div>
 
        </div>
    </div>
    <table id="calendar-demo" class="calendar"></table>

    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>

 
    <script>

        var weekday = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        $("#aSchedule").attr("class", "active");
        $("#aSchedule").attr("href", "javascript:void(0);");
        var objTimes;
        var CurrentTime;
        var diff;

        $(document).ready(function () {
            //$('input[placeholder=Date]').dcalendarpicker();
            $('input[placeholder=Date]').dcalendarpicker({
                format: 'XYZ dd-mm-yyyy'
            });

            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();


            $.ajax({
                type: "POST",
                url: "Schedule.aspx/GETTimes",
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
 
 
        var height = window.innerHeight - 100;
        var width = window.innerWidth - 100;
        var height1 = window.innerHeight - 10;
        var width1 = window.innerWidth - 10;
        function CheckId(Id, IsStudent, obj) {
            height = window.innerHeight - 100;
            width = window.innerWidth - 100;
            height1 = window.innerHeight - 10;
            width1 = window.innerWidth - 10;


            $("body").attr("style", "overflow: hidden;");
            if (IsStudent == 1)
                $("#frameEdit").attr('src', '../Manage/StudentDetailsStars.aspx?StudentId=' + Id + "&msid=" + $(obj).attr("msid"));
            else
                $("#frameEdit").attr('src', '../Manage/TutorDetail.aspx?TutorId=' + Id);


            $("#dialog").dialog({
                width: width1,
                height: height1,
                modal: true,
                close: function (event, ui) {
                    $("body").attr("style", "");
                }
            });
        }
 



    </script>
    <style>
        .Warning {
           display:none!important;
        }

    </style>


</asp:Content>

