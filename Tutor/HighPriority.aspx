<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="HighPriority.aspx.cs" Inherits="Tutor_HighPriorityaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact">
        <div style="margin-left: 20px; margin-top: 6px;">
            <h3 style="width: 98% !important;background-color:#c62d28">Important Student Notifications</h3>
            <table id="NotificationList"></table>
            <div id="NotificationPager"></div>

            <centre>
                    
                    <button name="submit" type="submit" id="btnUpdateWatchHighPriority" data-submit="...Sending" style="margin-top: 6px;">OK</button>


                </centre>
        </div>
    </div>
    <script>
        function PostDataGeneric(MethodName, url, Data, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    location.href = 'Schedule.aspx';
                }
            });
        }

        $(document).ready(function () {
            $("#btnUpdateWatchHighPriority").click(function () {
                var StringData = "{}";
                PostDataGeneric("SaveNotesRead", "HighPriority.aspx", StringData, false);
            });

            $("#myTopnav").hide();

            $.jgrid.defaults.responsive = true;
            $.jgrid.defaults.styleUI = 'Bootstrap';
            $NotificationList = $("#NotificationList");


            $.ajax({
                type: "POST",
                url: "HighPriority.aspx/GetHighPriorityMessages",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objNotification = JSON.parse(response.d[0]);

                    var ColNotification = [{ name: "Type", width: 10 },
                    { name: "Priority", width: 10 },
                    { name: "Date", width: 10 },
                    { name: "Author", width: 15 },
                    { name: "Notes", width: 55 }];

                    //$gridAssessmentEnrollement
                    LoadGrid(ColNotification, objNotification, 'NotificationList', 'NotificationPager', $NotificationList);

                }
            });
        });
    </script>
</asp:Content>

