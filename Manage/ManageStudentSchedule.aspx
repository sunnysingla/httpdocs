<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="ManageStudentSchedule.aspx.cs" Inherits="Manage_ManageStudentSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="contact">
        <div style="margin-left: 20px; width: 100%;">
 
            <table id="Data" class="ui-jqgrid-btable ui-common-table table table-bordered" style="width:95%;"></table>
        </div>
    </div>
    <style>
        #Data td, #Data th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        td[color="0"] {
            background: grey;
         color: white;
        }
    </style>
    <script>
        $(document).ready(function () {
            var data = {};
            data.Day = "";
            var StringData = JSON.stringify(data);
            Getdata(StringData);

        });

   
        function Getdata(Data) {
            $.ajax({
                type: "POST",
                url: "ManageStudentSchedule.aspx/StudentView",
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var Objresults = JSON.parse(response.d[0]);
                    console.log(Objresults);
                    $("#Data").html(Objresults[0].FinalOutPut);
                }
            });
        }

    </script>

</asp:Content>

