<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="WeeklySummary.aspx.cs" Inherits="Scheduling_SessionSumamry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/WeeklySummary.js?v=14.5"></script>
    <link href="../CSS/Schedular.css?v=14.5" rel="stylesheet" />
    <link href="../CSS/SummarySchedule.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="https://pagead2.googlesyndication.com/pagead/osd.js"></script>
    <link href="../CSS/HighLightCell.css?v=14.5" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="contact" style="min-height: 1000px; margin-left: -20px;">
        <h3 style="margin-left: 20px!important; width: 99% !important;">Weekly Summary</h3>

        <div id="Datacontained">

            <div id="leftDiv" style="width: 98%;">
                <div style="display:none;">
                    <br />
                    <br />
                    <table style="margin-left: 20px; height: 69px; width: 12%; margin-top: -68px;">
                        <tbody>
                            <tr>
                                <td style="border: 0px solid white !important;">Day: </td>
                                <td style="border: 0px solid white !important;">
                                    <input placeholder="Date" type="text" tabindex="1" autofocus="" style="border: .4px solid #aaa !important; position: relative!important; width: 150px; margin-left: 10px; text-align: left;" id="txtDate"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style="width: 80%; float: left; margin-left: 20px;" id="DayTimeCheckBox">
                </div>
                <div id="MasterEntry" style="margin-top: -15px;"></div>
            </div>
            <div id="rightDiv" style="margin-left: 78.5%; width: 20%; display:none;">
                <input type="button" value="Back to Weekly Schedule" style="float: right;" id="bckMasterSchedule" />
                <br />
                <br />
                <div style="border: 1px solid #ccc; margin-bottom: 5px; margin-top: -5px;">
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

            </div>

        </div>


    </div>

    <table id="calendar-demo" class="calendar"></table>

    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>

    <script>
        $("#bckMasterSchedule").click(function () {
            location.href = 'WeeklySchedule.aspx';
        });

        $('input[placeholder=Date]').dcalendarpicker({
            format: 'XYZ dd-mm-yyyy'
        });
        var weekday = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];


        $(document).ready(function () {

            var d = new Date();
            var Dayname = weekday[d.getDay()].substr(0, 3);
            var MonthName = month[d.getMonth()].substr(0, 3);
            var year = d.getFullYear();
            var Day = d.getDate();

            WeeklySummary(year + '-' + (parseInt(d.getMonth()) + 1).toString() + '-' + Day);

            $("#txtDate").val(Dayname + ", " + MonthName + " " + Day + ", " + year);
        });

        $("#aWeeklySchedule").attr("class", "active");
        //$("#aWeeklySchedule").attr("href", "javascript:void(0);");

    </script>
    <style>
        .TableIndex {
            padding: 0% !important;
            margin-left: 0% !important;
            margin-top: 2px !important;
            border: .4px solid #aaa !important;
            position: relative !important;
            background-color: #e3e2e2 !important;
        }
    </style>
</asp:Content>

