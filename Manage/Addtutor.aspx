<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="Addtutor.aspx.cs" Inherits="Manage_Addtutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="js/Manage.js?v=14.5"></script>
    <script src="../CustomJs/GridTables.js"></script>
    <style>
        tr {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="margin-top: -5px; height: 100px;padding-top:0px;">
        <h3>Add Tutor</h3>
        <center>
 
            <table  style="width: 100%;">
                <tr>
                    <td>Tutor Name:</td>
                    <td colspan="2">
                        <input type="text" id="tutNameFirst" tabindex="1" class="txtbox" placeholder="First Name" style="width:49%"/>
 
                        <input type="text" id="tutNameLast" tabindex="1" class="txtbox" placeholder="Last Name" style="width:49.9%"/>

                    </td>
                </tr>
                      <tr>
                    <td>Email/Password:</td>
                    <td colspan="2">
                        <input type="text" id="tutEmail" tabindex="1" class="txtbox" placeholder="Email" style="width:49%" />
                        <span style="width:2%"></span>
                        <input type="text" id="tutPassword" tabindex="1" class="txtbox" placeholder="Password" style="width:50%"  />
                    </td>
                </tr>
                <tr>
                    <td>Primary Phone:</td>
                    <td colspan="2">
                        <input type="text" id="tutPPhone" tabindex="1" class="txtbox" placeholder="Primary phone" style="width:100%" /></td>
                </tr>
                <tr>
                    <td>Secondary Phone:</td>
                    <td colspan="2">
                        <input type="text" id="tutSPhone" tabindex="1" class="txtbox" placeholder="Secondary phone" style="width:100%"/></td>
                </tr>

                 <tr>
                    <td>Subjects:</td>
                    <td colspan="2"><div id="tutSubjects" style="height: 100px;overflow-y: scroll; overflow-x: hidden;border: 1px solid #dbdbdb;" >
                        <table style="width:100%;"><tr><td ><input  style="width: 20% !important;" type="checkbox"   value ="ACT" />ACT</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="ACT English" />ACT English</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="ACT Essay" />ACT Essay</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="ACT Math" />ACT Math</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="ACT Reading" />ACT Reading</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="ACT Science" />ACT Science</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"   value ="Algebra" />Algebra</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Algebra 1" />Algebra 1</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Algebra 2" />Algebra 2</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Beginning Reading" />Beginning Reading</td><td ><input  style="width: 20% !important;" type="checkbox"   value ="Biology" />Biology</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="CPS" />CPS</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Calculus" />Calculus</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Chemistry" />Chemistry</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Chinese" />Chinese</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="College Planning" />College Planning</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Course Prep" />Course Prep</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="ELA" />ELA</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="English" />English</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Essay Writing" />Essay Writing</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Essays" />Essays</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="French" />French</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Geometry" />Geometry</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="German" />German</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="History" />History</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Homework" />Homework</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Homework Help" />Homework Help</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Math 1" />Math 1</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Math 2" />Math 2</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Math 3" />Math 3</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Physics" />Physics</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Precalculus" />Precalculus</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Program" />Program</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Reading" />Reading</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="SAT" />SAT</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="SAT Essay" />SAT Essay</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="SAT Language" />SAT Language</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="SAT Math" />SAT Math</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Science" />Science</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Social Studies" />Social Studies</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Spanish" />Spanish</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Statistics" />Statistics</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Study Skills" />Study Skills</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Test Prep" />Test Prep</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Trigonometry" />Trigonometry</td></tr><tr><td ><input  style="width: 20% !important;" type="checkbox"  value ="Tutor Up" />Tutor Up</td><td ><input  style="width: 20% !important;" type="checkbox"  value ="Writing" />Writing</td></tr></table>

                                    </div>
                   </td>

                </tr>
                <tr>
                    <td>Gender:</td>
                    <td colspan="2">
                        <select id="tutGender" style="margin-top: 4px;">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select></td>
                </tr>
                
                      <tr><td colspan="2">  <h3 style="margin-top: 12px !important;">Tutor Availability</h3></td></tr>   
                
                <tr><td colspan="2">
                                <table style="width: 90%;">
                                <tr>
                    <td><b>Day</b></td>
                    <td><b>Start</b></td>
                    <td><b>End</b></td>

                </tr>
 
                <tr>
                    <td>Monday</td>
                    <td>
                        <input type="text" id="txtMondayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtMondayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Tuesday</td>
                    <td>
                        <input type="text" id="txtTuesdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtTuesdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Wednesday</td>
                    <td>
                        <input type="text" id="txtWednesdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtWednesdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Thursday</td>
                    <td>
                        <input type="text" id="txtThursdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtThursdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Friday</td>
                    <td>
                        <input type="text" id="txtFridayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtFridayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Saturday</td>
                    <td>
                        <input type="text" id="txtSaturdayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtSaturdayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>
 
                <tr>
                    <td>Sunday</td>
                    <td>
                        <input type="text" id="txtSundayOpen" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                    <td>
                        <input type="text" id="txtSundayClose" tabindex="4" class="txtbox" placeholder="Time" style="width: 81%!important;" /></td>
                </tr>

            </table>


                    </td></tr>
                <tr style="display:none;">
                    <td>
                        Availability:
                    </td>
                    <td colspan="2">
                         <textarea id="tutAddrAvailability" tabindex="2" class="txtbox" style="width:100%;    margin-top: 8px;"></textarea>

                    </td>
                </tr>
                
            </table>
  
              

   </center><br />
        <button name="submit" type="submit" id="btnSaveTutor" data-submit="...Sending" style="margin-top: 6px;">Save Tutor</button>
        <button name="submit" type="submit" id="btnUpdateTutor" data-submit="...Sending" style="margin-top: 6px; display: none;">Update</button>
    </div>

    <script>
        function PostDataGenericTutor(MethodName, url, Data, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    window.parent.location.reload();

                }
            });
        }
        $(document).ready(function () {

            $("#btnSaveTutor").click(function () {
                var data = {};
                data.FirstName = $("#tutNameFirst").val();
                data.LastName = $("#tutNameLast").val();
                data.PrimaryPhone = $("#tutPPhone").val();
                data.SecondryPhone = $("#tutSPhone").val();
                data.Email = $("#tutEmail").val();
                data.Password = $("#tutPassword").val();
                data.Gender = $("#tutGender").val();
                data.Availability = $("#tutAddrAvailability").val();
                var Subjects = $("#tutSubjects").find("input:checked");

                var Subjects_txt = "";
                for (var x = 0; x < Subjects.length; x++) {
                    Subjects_txt = Subjects_txt + "," + $(Subjects[x]).val();
                }



                data.Subjects = Subjects_txt;// $("#tutSubjects").val();

                //data.Subjects = $("#tutSubjects").val();


                data.MondayOpen = $("#txtMondayOpen").val();
                data.MondayClose = $("#txtMondayClose").val();
                data.TuesdayOpen = $("#txtTuesdayOpen").val();
                data.TuesdayClose = $("#txtTuesdayClose").val();
                data.WednesdayOpen = $("#txtWednesdayOpen").val();
                data.WednesdayClose = $("#txtWednesdayClose").val();
                data.ThursdayOpen = $("#txtThursdayOpen").val();
                data.ThursdayClose = $("#txtThursdayClose").val();
                data.FridayOpen = $("#txtFridayOpen").val();
                data.FridayClose = $("#txtFridayClose").val();
                data.SaturdayOpen = $("#txtSaturdayOpen").val();
                data.SaturdayClose = $("#txtSaturdayClose").val();
                data.SundayOpen = $("#txtSundayOpen").val();
                data.SundayClose = $("#txtSundayClose").val();


                var StringData = JSON.stringify(data);
                if (Subjects_txt == "") {
                    alert('Subject cannot be blank.');
                    return false;
                }
                PostDataGenericTutor("CreateTutor", "TutorDetail.aspx", StringData, false);
                return false;
            });


            $("#btnUpdateTutor").click(function () {
                var data = {};
                data.FirstName = $("#tutNameFirst").val();
                data.LastName = $("#tutNameLast").val();
                data.PrimaryPhone = $("#tutPPhone").val();
                data.SecondryPhone = $("#tutSPhone").val();
                data.Email = $("#tutEmail").val();
                data.Gender = $("#tutGender").val();
                data.Availability = $("#tutAddrAvailability").val();
                var StringData = JSON.stringify(data);
                PostDataGenericTutor("CreateTutor", "TutorDetail.aspx", StringData, false);
                return false;
            });

        });


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
        $("#banner").hide();
         $("#myTopnav").hide();
    </script>
    <style>

        #tutSubjects tr {
        height:10px !important;
        }
    </style>
</asp:Content>

