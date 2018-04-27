<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="StudentDetails.aspx.cs" Inherits="Manage_StudentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="js/utils.js"></script>
    <script src="js/Chart.bundle.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="margin-left: -1.2% !important;">
        <div id="leftDiv" style="height: 360px !important;width: 50%; margin-left:0%; ">
            <h3>Student Details</h3>
            <table style="width: 70%;">
                <tr>
                    <td>Student Name</td>
                    <td>
                        <input type="text" id="StuName" tabindex="1" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Grade</td>
                    <td>
                        <input type="text" id="StuGrade" tabindex="2" class="txtbox" placeholder="Grade" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Subject</td>
                    <td>
                        <input type="text" id="StuSubject" tabindex="3" class="txtbox" placeholder="Subject" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>School</td>
                    <td>
                        <input type="text" id="StuSchool" tabindex="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Student Hour balance</td>
                    <td>
                        <input type="text" id="StuHours" tabindex="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Student Token balance</td>
                    <td>
                        <input type="text" id="StuToken" tabindex="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>
                        <button name="submit" type="submit" id="OpenStudentInformation" data-submit="...Sending" style="margin-top: 2px; width: 200px !important; margin-left: 0% !important;">Student Information</button>
                    </td>
                    <td></td>
                </tr>
            </table>

        </div>
        <div id="rightDiv" style=" margin-top:-360px; position:relative; margin-left: 50.2% !important; height: 360px !important; width: 49.8%!important; ">
            <h3>Contact Details</h3>
            <table style="width: 70%;">
                <tr>
                    <td>Contact Name</td>
                    <td>
                        <input type="text" id="ConName" tabindex="5" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Contact Phone Number</td>
                    <td>
                        <input type="text" id="ConPhone" tabindex="6" class="Phone txtbox" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" id="ConEmail" tabindex="7" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>

            </table>
        </div>

        <button name="submit" type="submit" id="SaveUpdates" data-submit="...Sending" style="margin-top: 10px;">Save Updates</button>

<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Student and Contact Notes</h3>
            <div id="dvLogNotes">
                <table id="NotesList"></table>
                <div id="NotesPager"></div>
            </div>
        </div>

<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Log Note</h3>
            <table class="btnMailBox" style="width: 100%">

                <tr>
                    <td style="width: 50px;">Type: </td>
                    <td style="width: 100px;">
                        <select class="knackStyle" id="drpStudentContact">
                            <option value="Student">Student</option>
                            <option value="Contact">Contact</option>
                        </select>

                    </td>
                    <td style="width: 85px; padding-left: 23px;">Priority: </td>
                    <td style="width: 100px;">
                        <select class="knackStyle" id="drpPriority">
                            <option value="None">None</option>
                            <option value="High">High</option>
                        </select>

                    </td>
                    <td style="width: 300px; padding-left: 23px;">
                        <input type="text" placeholder="Date" id="LogDate" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="6" class="blanlTd"></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <textarea id="txtNotes" style="width: 100%;"></textarea>

                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="width: 20px;"></td>
                </tr>
                <tr>
                    <td style="width: 103px; margin-top: 10px;" colspan="6">
                        <button name="submit" type="submit" id="btnLogRequest" data-submit="...Sending" style="margin-top: 6px;">+ Create</button>

                    </td>
                </tr>
            </table>
        </div>

<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Files</h3>
            <table>
                <tr>
                    <td style="width: 90px;">File Name:
                    </td>
                    <td style="width: 300px;">
                        <asp:TextBox ID="txtFilename" runat="server" Style="width: 80%"></asp:TextBox></td>
                    <td>
                        <asp:FileUpload ID="UploadFile" runat="server" Style="margin-left: -20px;" ClientIDMode="Static" />
                    </td>
                    <td>
                        <asp:Button ID="btnFileUpload" runat="server" ClientIDMode="Static" Text="Upload File" OnClick="btnFileUpload_Click" Style="margin-left: -21px!important;" />
                    </td>
                </tr>
            </table>

            <div id="dvFiles" style="margin-top: 6px;">
                <table id="FilesList"></table>
                <div id="FilesPager"></div>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Upload" Style="display: none;" />
        </div>
<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Upcoming Sessions</h3>
            <div id="dvSessions" style="margin-top: 6px;">
                <table id="SessionsList"></table>
                <div id="SessionsPager"></div>
            </div>

        </div>
<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Past Sessions</h3>
            <div id="dvPSessions" style="margin-top: 6px;">
                <table id="PSessionsList"></table>
                <div id="PSessionsPager"></div>
            </div>

        </div>
        <br />
        <br />
Student Sessions By Subject Hours
    <div id="container" style="width: 100%;">
        <canvas id="canvas"></canvas>
    </div>
        <br /><br />
<%--    <button class="Getgraphdata" id="dta2018">2018</button>
    <button class="Getgraphdata" id="dta2017">2017</button>
    <button class="Getgraphdata" id="dta2016">2016</button>
    <button class="Getgraphdata" id="dta2015">2015</button>
    <button class="Getgraphdata" id="dta2014">2014</button>--%>

 
<div style="margin-top: 6px;" >
            <h3 style="margin-top: 6px !important; width: 100% !important;">Invoices</h3>
            <table>
                <tr>
                    <td style="width: 90px;">Invoice Title:
                    </td>
                    <td style="width: 300px;">
                        <asp:TextBox ID="txtInvoicetitle" runat="server" Style="width: 80%"></asp:TextBox></td>
                    <td>
                        <asp:FileUpload ID="UploadInvoice" runat="server" Style="margin-left: -20px;" ClientIDMode="Static" />
                    </td>
                    <td>
                        <asp:Button ID="btnInvoiceUpload" ClientIDMode="Static" runat="server" Text="Upload Invoice" OnClick="btnInvoiceUpload_Click" Style="margin-left: -21px!important;" />
                    </td>
                </tr>
            </table>

            <div id="dvInvoice" style="margin-top: 6px;">
                <table id="InvoiceList"></table>
                <div id="InvoicePager"></div>
            </div>


            <br />
            <asp:Button ID="Button2" runat="server" Text="Upload" Style="display: none;" />
        </div>
        <table id="calendar-demo" class="calendar"></table>

    </div>

    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>
    <script>
        $("#btnFileUpload").click(function () {
            if (document.getElementById("UploadFile").files.length == 0) {
                alert("You must select a file for upload.");
                $("#UploadFile").focus();
                return false;
            }
        });
        $("#btnInvoiceUpload").click(function () {
            if (document.getElementById("UploadInvoice").files.length == 0) {
                alert("You must select a file for upload.");
                $("#UploadInvoice").focus();
                return false;
            }
        });

        $("#OpenStudentInformation").click(function () {

            event.preventDefault();
            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            location.href = '../Public/StudentInformation.aspx?id=' + StudentId;
            return false;
            var height = (window.innerHeight - 100) / 2;
            var width = (window.innerWidth - 100) / 2;
            var height1 = window.innerHeight - 10;;
            var width1 = window.innerWidth - 10;


            $("#frameEdit").attr('src', '../Public/StudentInformation.aspx?id=' + StudentId);

            $("#dialog").dialog({
                width: width1,
                height: height1,
                modal: true,
                close: function (event, ui) {
                    location.href = location.href;
                }
            });
            return false;

        });
        $(".Getgraphdata").click(function () {
 
            var year = $(this).html();
            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            LoadChartData(year, StudentId);
            return false;
        });
        $("#dta2018").trigger("click");

        var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var color = Chart.helpers.color;
        var barChartData = {
            labels: MONTHS,
            datasets: []

        };

        window.onload = function () {
            var ctx = document.getElementById("canvas").getContext("2d");

            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: ''
                    }
                }
            });

        };
        function LoadChartData(year,id)
        {
            $.ajax({
                type: "POST",
                url: "StudentDetails.aspx/SessionScheduling_Chart",
                data: '{ Year:"' + year + '", StudentId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var data = JSON.parse(response.d[0]);
                    var Year = JSON.parse(response.d[1]);
                    console.log(data)
                    var datasets = [];
                    for (var x = 0; x < data.length; x++)
                    {
                        var dataset = {};
                        dataset.label = data[x].label;
                        dataset.data = data[x].Data.split(',');

                        dataset.borderWidth = data[x].borderWidth;
                        dataset.backgroundColor = window.chartColors[data[x].backgroundColor];// color(window.chartColors[data[x].backgroundColor]).alpha(0.5).rgbString();
                        dataset.borderColor = window.chartColors[data[x].backgroundColor];
                        datasets.push(dataset);

                    }
                    barChartData.datasets = datasets;
 
                    window.myBar.update();
                }
            });
        }

        function LoadStudentDetails(id) {
            $NotesList = $("#NotesList");
            $FilesList = $("#FilesList");
            $InvoiceList = $("#InvoiceList");

            $SessionsList = $("#SessionsList");
            $PSessionsList = $("#PSessionsList");

            $.ajax({
                type: "POST",
                url: "StudentDetails.aspx/StudentSessions",
                data: '{ StudentId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var Sessions = JSON.parse(response.d[0]);
                    var PSessions = JSON.parse(response.d[1]);

                    var ColNotes = [{ name: "Date", width: 15 },
                        { name: "Time", width: 15 },
                        { name: "Student", width: 20 },
                        { name: "Tutor", width: 20 },
                        { name: "Attendance", width: 30 }];

                    var PColNotes = [{ name: "Date", width: 15 },
                    { name: "Time", width: 15 },
                    { name: "Student", width: 20 },
                    { name: "Tutor", width: 20 },
                    { name: "Attendance", width: 25 },
                    {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }];
                    LoadGrid(ColNotes, Sessions, 'SessionsList', 'SessionsPager', $SessionsList);
                    LoadGrid(PColNotes, PSessions, 'PSessionsList', 'PSessionsPager', $PSessionsList);

                }
            });

            $.ajax({
                type: "POST",
                url: "StudentDetails.aspx/StudentDetails",
                data: '{ StudentId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objStudent = JSON.parse(response.d[0]);
                    var objNotes = JSON.parse(response.d[1]);
                    var objFiles = JSON.parse(response.d[2]);
                    var objInvoice = JSON.parse(response.d[3]);

                    var objSubjects = JSON.parse(response.d[4]);
                    var objGrade = JSON.parse(response.d[5]);

                    AutoComplete_SingleX('Subject', objSubjects, "SubjectName");

                    AutoComplete_SingleX('Grade', objGrade, "Grade");

                    var ColNotes = [{ name: "Type", width: 50 },
                    { name: "Priority", width: 50 },
                    { name: "Date", width: 50 },
                    { name: "Author", width: 50 },
                    { name: "Notes", autowidth: true },
                    {
                        width: 30,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }];

                    LoadGrid(ColNotes, objNotes, 'NotesList', 'NotesPager', $NotesList);

                    var ColFile = [{ name: "Date", width: 7 },
                    { name: "File Name", width: 88 },
                    {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }];

                    LoadGrid(ColFile, objFiles, 'FilesList', 'FilesPager', $FilesList);

                    var ColInvoice = [{ name: "Date", width: 7 },
                    { name: "Invoice Title", width: 88 },
                    {
                        width: 5,
                        name: 'Delete',
                        formatter: imageLinkFormatter,
                        formatoptions: {
                            icon: 'ui-icon-trash',
                            link_class: 'edit-link-class',
                            action: 'Delete'
                        }
                    }];

                    LoadGrid(ColInvoice, objInvoice, 'InvoiceList', 'InvoicePager', $InvoiceList);

                    $("#StuName").val(objStudent[0].Name);
                    $("#StuGrade").val(objStudent[0].Grade);
                    $("#StuSubject").val(objStudent[0].Subject);
                    $("#StuSchool").val(objStudent[0].SchoolName);

                    $("#StuHours").val(objStudent[0].BalanceHours);
                    $("#StuToken").val(objStudent[0].TokenBalance);

                    //--Contact 

                    $("#ConName").val(objStudent[0].ContactName);
                    $("#ConPhone").val(objStudent[0].ContactPhone);
                    $("#ConEmail").val(objStudent[0].Email);

                }
            });
        }
        function UpdateStudentInfo(id) {
            var objStudent = {};
            objStudent.Name = $("#StuName").val();
            objStudent.Grade = $("#StuGrade").val();
            objStudent.Subject = $("#StuSubject").val();
            objStudent.School = $("#StuSchool").val();
            objStudent.BalanceHours = $("#StuHours").val();
            objStudent.TokenBalance = $("#StuToken").val();

            objStudent.ContactName = $("#ConName").val();
            objStudent.ContactPhone = $("#ConPhone").val();
            objStudent.ContactEmail = $("#ConEmail").val();
            objStudent.StudentId = id;
            var StringData = JSON.stringify(objStudent);

            PostDataGenericStudent("UpdateStudentDetails", "StudentDetails.aspx", StringData, false);
            return false;
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
                if (confirm('Are you sure you want to delete this Invoice?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_ArchiveStudentInvoice');
                }
                return false;
            }
            else if (Lavel == 5) {
                if (confirm('Are you sure to delete this past session?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true, 'USP_DeleteStudent_Session');
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
                    //alert(objMessage[0].SucessMsg, true);
                    location.reload();
                }

            });
        }
        $(document).ready(function () {
            $("#SaveUpdates").click(function () {
                var QueryStrings = window.location.href.split('?')[1];
                var StudentId = QueryStrings.split('&')[0].split('=')[1];
                UpdateStudentInfo(StudentId);
                return false;
            });

            $('input[placeholder=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            $.jgrid.defaults.responsive = true;
            $.jgrid.defaults.styleUI = 'Bootstrap';

            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            LoadStudentDetails(StudentId);
            var phones = [{ "mask": "(###) ###-####" }, { "mask": "(###) ###-####" }];
            $('.Phone').inputmask({
                mask: phones,
                greedy: false,
                definitions: { '#': { validator: "[0-9]", cardinality: 1 } }
            });
            $("#btnLogRequest").click(function () {
                var id = location.href.split('=')[1];

                var data = {};

                data.Type = $("#drpStudentContact").val();
                data.Priority = $("#drpPriority").val();
                data.Date = $("#LogDate").val();
                data.StudentId = id;
                data.Notes = $("#txtNotes").val();

                var StringData = JSON.stringify(data);
                PostDataGenericStudent("LogNote", "StudentDetails.aspx", StringData, true);
                return false;
            });
        });

        function PostDataGenericStudent(MethodName, url, Data, Refresh) {
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
        function AutoComplete_SingleX(placeholder, src, column) {
            var availableTags = [];
            for (var x = 0; x < src.length; x++) {
                availableTags.push(src[x][column]);
            }
            $('input[placeholder=' + placeholder + ']').on("keydown", function (event) {
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
                        availableTags, extractLast(",")));
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
                    this.value = ui.item.value;// terms.join(", ");

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
        var QueryStrings = window.location.href.split('?')[1];
        var StudentId_init = QueryStrings.split('&')[0].split('=')[1];
        LoadChartData("2018", StudentId_init);
     

    </script>
    <style>
        .fullDiv {
            width: 102%;
            float: right;
            border: none !important;
        }
                #canvas {
               max-height: 500px;
        }
    </style>
</asp:Content>

