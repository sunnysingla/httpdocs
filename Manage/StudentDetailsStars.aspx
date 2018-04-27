<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="StudentDetailsStars.aspx.cs" Inherits="Manage_StudentDetailsStars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <style>
 
input.star { display: none; }
label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact">
        <div class="fullDiv" style="border: 1px solid #8080804a !important;">
            <h3 style="width: 100.1% !important;">Student Information</h3>
            <table style="width: 40%;    margin-left: 20px;">
                <tr>
                    <td>Student Name</td>
                    <td>
                        <input type="text" id="StuName" tabindex="1" class="txtbox" disabled="disabled" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Grade</td>
                    <td>
                        <input type="text" id="StuGrade" tabindex="2" class="txtbox" placeholder="Grade" disabled="disabled" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Subject</td>
                    <td>
                        <input disabled="disabled"  type="text" id="StuSubject" tabindex="3" class="txtbox" placeholder="Subject" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>School</td>
                    <td>
                        <input disabled="disabled"  type="text" id="StuSchool" tabindex="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Student Token Balance</td>
                    <td>
                        <input  type="text" id="StuToken" tabindex="4" class="txtbox" />

                         <input  type="text" id="StuHours" tabindex="4" class="txtbox"  style="display:none"/>
                    </td>
                </tr>
                                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
 
            </table>

        </div>
       
  <div class="fullDiv" style="border: 1px solid #8080804a !important; margin-top:15px;">
            <h3 style="width: 100.1% !important;">Session Feedback</h3>
             <table style="   margin-left: 20px;    width: 97.8%;">
                 <tr><td><span>How did the student do with the covered material this session?</span></td></tr>
                 <tr><td>
                       <div class="CoverdstudentMaterials" style="  margin-top: -10px;  float: left;">
      <input class="star star-5" id="star-5" type="radio" name="CoverdstudentMaterials" value="5" />
      <label class="star star-5" for="star-5"></label>
      <input class="star star-4" id="star-4" type="radio" name="CoverdstudentMaterials" value="4"/>
      <label class="star star-4" for="star-4"></label>
      <input class="star star-3" id="star-3" type="radio" name="CoverdstudentMaterials" value="3"/>
      <label class="star star-3" for="star-3"></label>
      <input class="star star-2" id="star-2" type="radio" name="CoverdstudentMaterials" value="2"/>
      <label class="star star-2" for="star-2"></label>
      <input class="star star-1" id="star-1" type="radio" name="CoverdstudentMaterials" value="1"/>
      <label class="star star-1" for="star-1"></label>
  </div>
                     </td></tr>
                 <tr><td>  <input   type="text" id="CoverdstudentMaterials_Text" class="txtbox"  style="       margin-bottom: 10px; width: 100%;    margin-top: -10px;"  /></td></tr>
                    <tr><td><span>How would you rate the student's attitude towords the session?</span></td></tr>

                               <tr><td>
                       <div class="Studentattitude" style="float: left;    margin-top: -10px;">
      <input class="star star-5" id="star1-5" type="radio" name="Studentattitude" value="5"/>
      <label class="star star-5" for="star1-5"></label>
      <input class="star star-4" id="star1-4" type="radio" name="Studentattitude" value="4"/>
      <label class="star star-4" for="star1-4"></label>
      <input class="star star-3" id="star1-3" type="radio" name="Studentattitude" value="3"/>
      <label class="star star-3" for="star1-3"></label>
      <input class="star star-2" id="star1-2" type="radio" name="Studentattitude" value="2"/>
      <label class="star star-2" for="star1-2"></label>
      <input class="star star-1" id="star1-1" type="radio" name="Studentattitude" value="1"/>
      <label class="star star-1" for="star1-1"></label>
  </div>
                     </td></tr>
                 <tr><td>  <input   type="text" id="Studentattitude_Text" class="txtbox"  style="margin-bottom: 10px; width: 100%;    margin-top: -10px;"  /></td></tr>
                 <tr><td>Do you have other feedback or relevant details for the student?</td></tr>
                  <tr><td>  <input   type="text" id="OtherFeedback" class="txtbox"  style="    width: 100%;"  /></td></tr>
                                 <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>           <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>           <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
             </table>
        </div>
        <button name="submit" type="submit" id="SaveUpdates" data-submit="...Sending" style="margin-top: 10px;">Save Feedback</button>
 
        <div class="fullDiv">
            <h3 style="margin-top: 14px !important;width: 100.1% !important;">Student and Contact Notes</h3>
            <div id="dvLogNotes" >
                <table id="NotesList"></table>
                <div id="NotesPager"></div>
            </div>
        </div>

        <div class="fullDiv"  >
            <h3 style="margin-top: 6px !important;width: 100.1% !important;">Log Note</h3>
            <table class="btnMailBox" style="width: 100%">
                 
                <tr>
                    <td style="width: 50px;"> Type: </td><td style="width: 100px;">
                        <select class="knackStyle" id="drpStudentContact" >
                            <option value="Student">Student</option>
                            <option value="Contact">Contact</option>
                        </select>

                    </td>
                    <td style="width: 85px;padding-left: 23px;">Priority: </td><td style="width: 100px;">
                        <select class="knackStyle" id="drpPriority" >
                            <option value="None">None</option>
                            <option value="High">High</option>
                        </select>

                    </td>
                    <td style="width: 300px;padding-left: 23px;">
                        <input type="text" placeholder="Date" id="LogDate" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="6" class="blanlTd"></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <textarea id="txtNotes" style="width: 99.3%;"></textarea>

                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="width:20px;"></td>
                </tr>
                <tr>
                    <td style="width: 103px;margin-top: 10px;" colspan="6">
                        <button name="submit" type="submit" id="btnLogRequest" data-submit="...Sending" style="    margin-top: 6px;">+ Create</button>

                    </td>
                </tr>
            </table>
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
 
        });
        function LoadStudentDetails(id) {
            $NotesList = $("#NotesList");
            //$FilesList = $("#FilesList");
            //$InvoiceList = $("#InvoiceList");
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

                    //AutoComplete_SingleX('Subject', objSubjects, "SubjectName");

                    //AutoComplete_SingleX('Grade', objGrade, "Grade");

                    var ColNotes = [{ name: "Type", width: 10 },
                    { name: "Priority", width: 10 },
                    { name: "Date", width: 10 },
                    { name: "Author", width: 15 },
                    { name: "Notes", width: 55 }];

                    LoadGrid(ColNotes, objNotes, 'NotesList', 'NotesPager', $NotesList);

 
                    $("#StuName").val(objStudent[0].Name);
                    $("#StuGrade").val(objStudent[0].Grade);
                    $("#StuSubject").val(objStudent[0].Subject);
                    $("#StuSchool").val(objStudent[0].SchoolName);

                    $("#StuHours").val(objStudent[0].BalanceHours);
                    $("#StuToken").val(objStudent[0].TokenBalance);

                    //--Contact 

                    //$("#ConName").val(objStudent[0].ContactName);
                    //$("#ConPhone").val(objStudent[0].ContactPhone);
                    //$("#ConEmail").val(objStudent[0].Email);

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
 
            if (Lavel == 1)
            {
                if (confirm('Are you sure you want to delete this note?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true,'USP_ArchiveNotes');
                }
                return false;
            }
            else if (Lavel == 2) {
                if (confirm('Are you sure you want to delete this file?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true,'USP_ArchiveFles');
                }
                return false;
            }
            else if (Lavel == 3) {
                if (confirm('Are you sure you want to delete this Invoice?')) {
                    DeleteGenericSP('ArchiveGeneric', 'StudentDetails.aspx', $(obj).attr('rel'), true,'USP_ArchiveStudentInvoice');
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
        function LoadFeedback(id)
        {
            $.ajax({
                type: "POST",
                url: "StudentDetails.aspx/GETFeedBack",
                data: '{ SessionId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    var data = objMessage[0];
                    console.log(objMessage);
                    if (objMessage.length != 0) {
                        $('input[name=CoverdstudentMaterials][value=' + data.CoverdstudentMaterials + ']').trigger('click');
                        $('input[name=Studentattitude][value=' + data.Studentattitude + ']').trigger('click');
                        $("#CoverdstudentMaterials_Text").val(data.CoverdstudentMaterials_Text);
                        $("#Studentattitude_Text").val(data.Studentattitude_Text);
                        $("#OtherFeedback").val(data.OtherFeedback);
                        //$('input[name=CoverdstudentMaterials]:checked').val(1);
                        return;
                    }

                }
            });
        }
        $(document).ready(function () {
            $("#SaveUpdates").click(function () {
                event.preventDefault();
                var QueryStrings = window.location.href.split('?')[1];
                var StudentId = QueryStrings.split('&')[0].split('=')[1];
                var data = {};
                data.SessionId = QueryStrings.split('&')[1].split('=')[1];

                data.CoverdstudentMaterials = $('input[name=CoverdstudentMaterials]:checked').val();
                if (data.CoverdstudentMaterials == undefined)
                {
                    data.CoverdstudentMaterials = "0";
                    //alert('Feedback How did the student do with the covered material this session? is mandatory', false);
                    //return false;
                }
                data.CoverdstudentMaterials_Text = $("#CoverdstudentMaterials_Text").val();
                data.Studentattitude = $('input[name=Studentattitude]:checked').val();
                if (data.Studentattitude == undefined) {
                    data.Studentattitude = "0";
                    //alert('Feedback How did the student do with the covered material this session? is mandatory', false);
                    //return false;
                }
                data.Studentattitude_Text = $("#Studentattitude_Text").val();
                data.OtherFeedback = $("#OtherFeedback").val();

                var StringData = JSON.stringify(data);

                PostDataGenericStudent("SaveFeedback", "StudentDetails.aspx", StringData, false);
                return false;
            });

            $('input[placeholder=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            $.jgrid.defaults.responsive = true;
            $.jgrid.defaults.styleUI = 'Bootstrap';

            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            var SessionId = QueryStrings.split('&')[1].split('=')[1];
            LoadStudentDetails(StudentId);
            LoadFeedback(SessionId);
            var phones = [{ "mask": "(###) ###-####" }, { "mask": "(###) ###-####" }];
            $('.Phone').inputmask({
                mask: phones,
                greedy: false,
                definitions: { '#': { validator: "[0-9]", cardinality: 1 } }
            });
            $("#btnLogRequest").click(function () {
                var QueryStrings = window.location.href.split('?')[1];
                var StudentId = QueryStrings.split('&')[0].split('=')[1];

                var data = {};

                data.Type = $("#drpStudentContact").val();
                data.Priority = $("#drpPriority").val();
                data.Date = $("#LogDate").val();
                data.StudentId = StudentId;
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
        function PostDataGenericStudent_NM(MethodName, url, Data, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);

                    //alert(objMessage[0].SucessMsg, Refresh);
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

        $("#StuToken").change(function () {
            var objStudent = {};
            objStudent.BalanceHours = $("#StuHours").val();
            objStudent.TokenBalance = $("#StuToken").val();
            objStudent.StudyHall_Hrs = '0';

            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];


            objStudent.StudentId = StudentId;
            var StringData = JSON.stringify(objStudent);

            PostDataGenericStudent_NM("UpdateStudentInline", "StudentDetails.aspx", StringData, false);
            return false;
        });
    </script>
    <style>
        .fullDiv {
            width: 102%;
            float: right;
            border: none!important;
        }
    </style>
</asp:Content>

