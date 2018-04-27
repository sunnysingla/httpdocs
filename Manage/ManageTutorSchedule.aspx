<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="ManageTutorSchedule.aspx.cs" Inherits="Manage_ManageTutorSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact">
        <div style="margin-left: 20px; width: 100%;">
            <button class="GetData" name="submit" type="submit" id="Monday" data-submit="...Sending" style="margin-left: 0%!important;">Monday</button>
            <button class="GetData" name="submit" type="submit" id="Tuesday" data-submit="...Sending" style="margin-left: 1%!important;">Tuesday</button>
            <button class="GetData" name="submit" type="submit" id="Wednesday" data-submit="...Sending" style="margin-left: 1%!important;">Wednesday</button>
            <button class="GetData" name="submit" type="submit" id="Thursday" data-submit="...Sending" style="margin-left: 1%!important;">Thursday</button>
            <button class="GetData" name="submit" type="submit" id="Friday" data-submit="...Sending" style="margin-left: 1%!important;">Friday</button>
            <button class="GetData" name="submit" type="submit" id="Saturday" data-submit="...Sending" style="margin-left: 1%!important;">Saturday</button>
            <button class="GetData" name="submit" type="submit" id="Sunday" data-submit="...Sending" style="margin-left: 1%!important;">Sunday</button>
            <button class="GetData" name="submit" type="submit" id="Summary" data-submit="...Sending" style="margin-left: 1%!important;">Summary</button>

            <br />
            <br />
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
        $(".GetData").click(function () {
            $(".GetData").attr('style', $(".GetData").attr('style').replace('background:Grey !important;'));
            $(this).attr('style', $(".GetData").attr('style') + ';background:Grey !important;');

            var data = {};
            data.Day = $(this).attr("id");
            var StringData = JSON.stringify(data);
            Getdata(StringData);
            if ($(this).attr("id") == "Summary")
            {
                $("#Data").attr("style", "width:30%;");
            }
            else
            {
                $("#Data").attr("style", "width:95%;");
            }
            return false;
        });
        function Getdata(Data) {
            $.ajax({
                type: "POST",
                url: "ManageTutorSchedule.aspx/TutorView",
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

