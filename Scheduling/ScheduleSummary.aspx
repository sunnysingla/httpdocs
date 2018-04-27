<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="ScheduleSummary.aspx.cs" Inherits="Scheduling_ScheduleSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="../Scripts/SummarySchedule.js?v=14.5"></script>
    <link href="../CSS/Schedular.css?v=14.5" rel="stylesheet" />
    <link href="../CSS/SummarySchedule.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="https://pagead2.googlesyndication.com/pagead/osd.js"></script>
    <link href="../CSS/HighLightCell.css?v=14.5" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="contact" style="min-height: 1000px; margin-left: -20px;">
        <h3 style="margin-left: 20px!important; width: 99% !important;">Schedule Summary</h3>
        <div style="width: 80%; float: left; margin-left: 20px;" id="DayTimeCheckBox">
 
        </div>
 
        <div id="Datacontained" style="font-size: 13px;">
            <div id="leftDiv" style="width: 98%;">
                <div id="MasterEntry" style="margin-top: -15px;"></div>
            </div>
            <div id="rightDiv" style="display:none;margin-left: 78.5%; width: 20%;">
                 <input type="button" value="Back to Master Schedule" style="float: right;" id="bckMasterSchedule" />
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
    <script>
        $("#bckMasterSchedule").click(function () {
            location.href = 'MasterSchedule.aspx';
        });
        $("#aMasterSchedule").attr("class", "active");
        //$("#aMasterSchedule").attr("href", "javascript:void(0);");
    </script>
    <style>
        .TableIndex {
            padding: 0% !important;
            margin-left: 0% !important;
            margin-top: 1px !important;
            width: 17px !important;
            height: 10px !important;
            font-size: 10px !important;
            border: .4px solid #aaa !important;
            position: relative !important;
            background-color: #e3e2e2 !important;
        }
    </style>
</asp:Content>

