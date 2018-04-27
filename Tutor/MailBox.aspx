<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="MailBox.aspx.cs" Inherits="Tutor_MailBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Manage/CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="../Manage/js/Manage.js?v=14.5"></script>
    <script src="../CustomJs/GridTables.js?v=14.5"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="width: 100%;">

        <div class="fullDiv" style="width: 100%;">
            <h3 style="margin-top: 6px !important; width: 98% !important;">Mailbox</h3>
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

                        <input type="text" id="txtMessage" placeholder="Message content" style="width: 97%; margin-left: .5%;" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <div id="DvInbox" style="margin-top: 10px;">
                            <table id="InboxList"></table>
                            <div id="InboxPager"></div>
                        </div>
                        <div id="DivSend" style="display: none; margin-top: 10px;">
                            <table id="SendList"></table>
                            <div id="SendPager"></div>
                        </div>
                    </td>
                </tr>
            </table>


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
                    alert(objMessage[0].SucessMsg, true);
                }
            });
        }
        var MessagesInbox = [];
        var MessagesSend = [];
        var Tutor = [];
        var loginTutor = '<%=Session["Id"]%>';
        function LoadList(id) {

            $InboxList = $("#InboxList");
            $SendList = $("#SendList");


            $.ajax({
                type: "POST",
                url: "MailBox.aspx/Gettutor",
                data: '{ TutorId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var objtutor = JSON.parse(response.d[1]);
                    var objInbox = JSON.parse(response.d[2]);
                    var objSend = JSON.parse(response.d[3]);


                    //recipent
                    var html = '<option value="0" >Select Recipient</option>';
                    for (var x = 0; x < objtutor.length; x++) {
                        if (objtutor[x].Name.trim() != "Breaker" && objtutor[x].Name.trim() != "Overflow") {
                            if (loginTutor == objtutor[x].ID) {
                                // html = html + '<option selected value="' + objtutor[x].ID + '">' + objtutor[x].Name + '</option>';
                            }
                            else
                                html = html + '<option value="' + objtutor[x].ID + '">' + objtutor[x].Name + '</option>';
                        }
                    }
                    $("#recipent").html(html);

                    var ColInbox = [{ name: "Date", width: 10 },
                    { name: "Author", width: 10 },
                    { name: "Message", width: 75 }
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
                        { name: "Recipient", width: 10 },
                    { name: "Message", width: 75 }
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
                    LoadGridWheight(ColInbox, objInbox, 'InboxList', 'InboxPager', $InboxList,600);
                    LoadGridWheight(ColSend, objSend, 'SendList', 'SendPager', $SendList,600);
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
            //var TutorId = QueryStrings.split('&')[0].split('=')[1];
            LoadList("0");

            $("#Create").click(function () {
                var data = {};
                //var id = location.href.split('=')[1];
                data.To = $("#recipent").val();
                data.From = "0";
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
                PostDataGenericTutor("SaveMessage", "MailBox.aspx", StringData, false);
                LoadList("0");
                return false;
            });


            var phones = [{ "mask": "(###) ###-####" }, { "mask": "(###) ###-####" }];
            $('.Phone').inputmask({
                mask: phones,
                greedy: false,
                definitions: { '#': { validator: "[0-9]", cardinality: 1 } }
            });

        });

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
        function CheckId(obj) {

            //alert($(obj).attr('rel'));
            var Lavel = $(obj).attr('lavel');

            if (Lavel == 'M') {
                if (confirm('Are you sure you want to delete this message?')) {
                    DeleteGenericSP('ArchiveGeneric', 'MailBox.aspx', $(obj).attr('rel'), true, 'USP_DeleteMessage');
                }
                return false;
            }
        }


        $("#aMailBox").attr("class", "active");
        $("#aMailBox").attr("href", "javascript:void(0);");
    </script>
    <style>
        .fullDiv {
            width: 102%;
            float: right;
            border: none !important;
        }
    </style>
</asp:Content>

