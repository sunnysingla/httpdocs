var Days = [];
var Times = [];

var Subjects = [];

function LoadSubjects() {

    $.ajax({
        type: "POST",
        url: "MasterSchedule.aspx/GetSubject",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objSubject = JSON.parse(response.d[0]);
            Subjects = objSubject
            AutoComplete_Single('Subject', Subjects, "SubjectName");
        }

    });
}

function AutoComplete_Single(placeholder, src, column) {

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
                availableTags, extractLast($.trim(request.term))));
        },
        focus: function () {
            // prevent value inserted on focus
            //this.value = "";
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
            var data = {};
            data.Subject = ui.item.value;
            data.MasterScheduleId = $(this).attr('class').split(" ")[0];
            var StringData = JSON.stringify(data);
            if (data.MasterScheduleId != "null" && data.MasterScheduleId != null && data.MasterScheduleId != "0")

                PostDataGeneric_NoMessage("UpdateSubject", "MasterSchedule.aspx", StringData, false);
            else {
                alert('Please Select student first', false);
                this.value = "";
            }
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
function ScheduleSummary() {
    $.ajax({
        type: "POST",
        url: "ScheduleSummary.aspx/ScheduleSummary",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objSummary = JSON.parse(response.d[0]);
            var objDays = JSON.parse(response.d[1]);
            //Days 

            var objTimes = JSON.parse(response.d[2]);
            //Times = objTimes;

            var html_CheckBoxes = "";
            for (var x = 0; x < objDays.length; x++) {
                Days.push(objDays[x].DayName);
                html_CheckBoxes = html_CheckBoxes + '<div style="margin-left: ' + (x * 100).toString() + 'px;width: 100px;position: absolute;"><input checked="checked" type="checkbox" class="DaySelected" id="' + objDays[x].DayName + '" value="' + objDays[x].DayName + '" />&nbsp;&nbsp;' + objDays[x].DayName + '</div>';
            }
            html_CheckBoxes = html_CheckBoxes + "<br/>";
            for (var x = 0; x < objTimes.length; x++) {
                Times.push(objTimes[x].time.replace(":", "_"));
                html_CheckBoxes = html_CheckBoxes + '<div style="margin-left: ' + (x * 100).toString() + 'px;width: 100px;position: absolute;"><input checked="checked" type="checkbox" class="TimeSelected" id="' + objTimes[x].time.replace(":", "_") + '" value="' + objTimes[x].time.replace(":", "_") + '" />&nbsp;&nbsp;' + objTimes[x].time + '</div>';
            }
            html_CheckBoxes = html_CheckBoxes + "<br/>";
            html_CheckBoxes = html_CheckBoxes + "<br/>";
            $("#DayTimeCheckBox").html(html_CheckBoxes);


            var Html = "<table>";
            Html = Html + "<thead><tr>";
            var firStDay = "";
            var colspan = 0;
            for (var x = 0; x < objDays.length; x++) {
                if (x == 0) {
                    Html = Html + "<th></th><th colspan=3 class='" + objDays[x].DayName + "'>" + objDays[x].DayName + "</th>";
                    colspan = colspan + 4;
                }
                else {
                    Html = Html + "<th colspan=3 class='" + objDays[x].DayName + "'>" + objDays[x].DayName + "</th>";
                    colspan = colspan + 3;
                }
            }
            Html = Html + "</tr></thead>";

            var blankRow = '<tr style="height: 9px;border: 1px solid white !important;"><td colspan="' + colspan + '" style="border: 1px solid white !important;"></td></tr>';


            var runningTime = "";
            var runningIndex = 0;
            var Runningtime = "";
            var RunningtimeId = 0;
            var Running
            var Color = "#e7e7e7";
            var ColorRw = "#e7e7e7";
            for (var y = 0; y < objSummary.length; y++) {
                if (runningTime == "" || runningIndex == 0 || runningTime != objSummary[y].Time) {
                    Color = "#ffffff";//((Color == "#ffffff") ? '#e7e7e7' : "#ffffff");
                    if (y != 0)
                        Html = Html + blankRow;

                    Html = Html + "<tr class='TopRow' style='background-color:" + Color + "'>";
                }
                else if ((y + 1) % 3 == 1) {
                    Color = ((Color == "#ffffff") ? '#e7e7e7' : "#ffffff");
                    Html = Html + "<tr class='tutorComplete' style='background-color:" + Color + "'>";
                }
                else
                    Html = Html + "<tr style='background-color:" + Color + "' >";

                if (Runningtime != "") {
                    Html = Html + Runningtime;
                    Runningtime = "";
                }
                if (runningTime == "" || runningIndex == 0 || runningTime != objSummary[y].Time) {
                    runningIndex = runningIndex + 1;
                    runningTime = objSummary[y].Time;
                    Html = Html + "<td class='" + objSummary[y].Time.replace(":", "_") + "' style='padding-left: 2px;padding-right: 2px;width:40px;'>" + objSummary[y].Time + "</td>";
                    Runningtime = "<td class='" + objSummary[y].Time.replace(":", "_") + "' rowSpan=" + (objTimes[runningIndex - 1].RowSpan - 1) + " ></td>";
                }

                var index = objSummary[y]["Rw_number"];
                for (var x = 0; x < objDays.length; x++) {
                    var DayName = objDays[x].DayName;

                    var MSID = objSummary[y][objDays[x].DayName + "MSID"];
                    var Student = objSummary[y][objDays[x].DayName + "Student"];
                    var Subject = objSummary[y][objDays[x].DayName + "Subject"];
                    var Tutor = objSummary[y][objDays[x].DayName + "Tutor"];

                    var tableNumber = objSummary[y][objDays[x].DayName + "Table"];

                    var StudentID = objSummary[y][objDays[x].DayName + "StudentId"];
                    var SubjectID = objSummary[y][objDays[x].DayName + "SubjectId"];
                    var TutorID = objSummary[y][objDays[x].DayName + "TutorId"];
                    var MSIDs = objSummary[y][objDays[x].DayName + "MSIDs"];

                    MSIDs = ((MSIDs == "null" || MSIDs == "" || MSIDs == null) ? "0" : MSIDs);

                    MSID = ((MSID == "null" || MSID == "" || MSID == null) ? "0" : MSID);
                    Student = ((Student == "null" || Student == "" || Student == null) ? "&nbsp;" : Student);
                    Subject = ((Subject == "null" || Subject == "" || Subject == null) ? "&nbsp;" : Subject);
                    Tutor = ((Tutor == "null" || Tutor == "" || Tutor == null) ? "&nbsp;" : Tutor);

                    tableNumber = ((tableNumber == "null" || tableNumber == "" || tableNumber == null) ? "" : tableNumber);

                    StudentID = ((StudentID == "null" || StudentID == "" || StudentID == null) ? "0" : StudentID);
                    SubjectID = ((SubjectID == "null" || SubjectID == "" || SubjectID == null) ? "0" : SubjectID);
                    TutorID = ((TutorID == "null" || TutorID == "" || TutorID == null) ? "0" : TutorID);


                    Html = Html + "<td class='" + objSummary[y].Time.replace(":", "_") + "_" + DayName + "' tableNumber='" + tableNumber + "' TutorID='" + TutorID + "'  time='" + objSummary[y].Time + "'  DayName='" + DayName + "' studentid='" + StudentID + "' subjectid='" + SubjectID + "' forstudent='1' msid='" + MSID + "' ondrop='drop(event,this)' ondragover ='allowDrop(event,this)'  draggable='true'  ondragstart='dragStart(event, this)'><input forstudent='1' type='text' style='height: 90%;display: inline;width: 95%;border: none;'   class='" + MSID + "' value='" + Student + "' id='spn_" + MSID + "_" + StudentID + "' value='" + Student + "' /><input style='display:none;width: 100px;height: 20px;' type='text' class='" + MSID + "' value='" + Student + "' id='" + MSID + "_" + StudentID + "' ></td>";
                    Html = Html + "<td  class='" + objSummary[y].Time.replace(":", "_") + "_" + DayName + "' tableNumber='" + tableNumber + "' TutorID='" + TutorID + "'  time='" + objSummary[y].Time + "'  DayName='" + DayName + "' class='" + MSID + "' ><span   style='min-height:20px;padding-left: 5px;display:none;'  class='" + MSID + "' value='" + Subject + "' id='spn_" + MSID + "_" + SubjectID + "' >" + Subject + "</span><input placeholder='[Subject]'  style='height: 90%;display: inline;width: 95%;border: none;' type='text' class='" + MSID + "' value='" + Subject + "' id='" + MSID + "_" + SubjectID + "' ></td>";
                    if ((y + 1) % 3 == 1)
                        Html = Html + "<td class='" + objSummary[y].Time.replace(":", "_") + "_" + DayName + "' style='vertical-align: top;'  tableNumber='" + tableNumber + "' time='" + objSummary[y].Time + "' TutorID='" + TutorID + "'  DayName='" + DayName + "' MSIDs='" + MSIDs + "' rowSpan=3 forstudent='0' ondrop='drop(event,this)' ondragover ='allowDrop(event,this)'  draggable='true'  ondragstart='dragStart(event, this)'>&nbsp;<span >Table:</span>&nbsp;<input  index='" + index + "'  type='text' MSIDs='" + MSIDs + "' disabled class='TableIndex' id='TableIndex_" + tableNumber + "' value='" + tableNumber + "' style='' /><br/><input forstudent='0' type='text' style='height: 58%;display: inline;width: 95%;border: none;'  class='" + MSID + "' value='" + Tutor + "' id='spn_" + MSID + "_" + TutorID + "' value='" + Tutor + "' /><input  style='display:none;width: 100px;height: 20px;' type='text' class='" + MSID + "' value='" + Tutor + "' id='" + MSID + "_" + TutorID + "' ></td>";
                }

                Html = Html + "</tr>";
            }
            Html = Html + "</table>";
            $("#MasterEntry").html(Html);

            GetTutorStudent();
        }
    });
}


$(document).ready(function () {
    ScheduleSummary();
    //GetTutorStudent();
});
var dvTutor;
var dvStudent;
function LoadEvents() {
    LoadSubjects();

    AutoComplete_Tutor('Tutor', dvTutor, "TutorName");
    AutoComplete_Student('Student', dvStudent, "StudentName");
    //alert('hhelo');
    //for (var x = 0; x < Days.length; x++)
    //{
    //    $("." + Days[x]).hide();
    //    //for (var x = 0; x < Days.length; x++) {
    //        for (var y = 0; y < Times.length; y++) {
    //            if ($("#" + Days[x]).is(":checked") && $("#" + Times[y]).is(":checked"))
    //                $("." + Times[y] + "_" + Days[x]).show();
    //            else
    //                $("." + Times[y] + "_" + Days[x]).hide();
    //        }
    //    //}
    //}
    for (var x = 0; x < Times.length; x++) {
        //$("." + Times[x]).hide();
    }

    $(".DaySelected , .TimeSelected").click(function () {
        for (var x = 0; x < Times.length; x++) {
            if ($("#" + Times[x]).is(":checked"))
                $("." + Times[x]).show();
            else
                $("." + Times[x]).hide();
        }
        for (var x = 0; x < Days.length; x++) {
            if ($("#" + Days[x]).is(":checked"))
                $("." + Days[x]).show();
            else
                $("." + Days[x]).hide();

        }
        for (var x = 0; x < Days.length; x++) {
            for (var y = 0; y < Times.length; y++) {
                if ($("#" + Days[x]).is(":checked") && $("#" + Times[y]).is(":checked"))
                    $("." + Times[y] + "_" + Days[x]).show();
                else
                    $("." + Times[y] + "_" + Days[x]).hide();
            }
        }

    });

    //$("span[id*=spn_]").click(function () {
    //    var id = $(this).attr("id").replace("spn_", "");
    //    $(this).hide();
    //    $("#" + id).show();
    //});
    $("input[id*=TableIndex_]").blur(function () {

        var text = $(this).val();
        var IndexSelected = $(this).attr("index");

        var DayName = $(this).closest("td").attr('DayName');

        var ObjTables = $('#MasterEntry table').find("tr td[DayName=" + DayName + "] .TableIndex");

        for (var x = 0; x < ObjTables.length; x++) {
            console.log(text, $(ObjTables[x]).val());
            if (IndexSelected != $(ObjTables[x]).attr('index') && text == $(ObjTables[x]).val() && $(this).closest("td").attr("time") == $(ObjTables[x]).closest("td").attr("time")) {
                alert('A table already exists with that number.', false);
                $(this).val('');
                return false;
            }
        }


        if ($(this).val() != "") {
            var data = {};
            var msids = $(this).attr('msids');
            if (msids.trim() != "0") {
                data.MSID1 = msids.split('_')[0];
                if (msids.split('_').length >= 2)
                    data.MSID2 = msids.split('_')[1];
                else
                    data.MSID2 = "0";
                if (msids.split('_').length >= 3)
                    data.MSID3 = msids.split('_')[2];
                else
                    data.MSID3 = "0";

                data.Tablenumber = $(this).val();
                var StringData = JSON.stringify(data);
                PostDataGeneric("UpdateTableNumber", "MasterSchedule.aspx", StringData, false);
            }

            //$($(this).parent().parent().parent().parent()).attr('tableid', $(this).val());
        }
    });

    $("#txtTutor").keyup(function () {

        var objectTutor = $("#dvTutor li");
        for (var x = 0; x < objectTutor.length; x++) {
            $(objectTutor[x]).hide();
            if ($("#txtTutor").val() == "" || $(objectTutor[x]).html().toLowerCase().indexOf($("#txtTutor").val().toLowerCase()) >= 0)
                $(objectTutor[x]).show();
        }
    });

    $("#txtStudent").keyup(function () {
        var objectStudent = $("#dvStudent li");
        for (var x = 0; x < objectStudent.length; x++) {
            $(objectStudent[x]).hide();
            if ($("#txtStudent").val() == "" || $(objectStudent[x]).html().toLowerCase().indexOf($("#txtStudent").val().toLowerCase()) >= 0)
                $(objectStudent[x]).show();
        }
    });
}
function GetTutorStudent() {
    $.ajax({
        type: "POST",
        url: "WeeklySchedule.aspx/MasterScheduling",
        data: '{ Time:"1:00",Day:"Monday" ,Date:"Tue, Nov 22, 2017" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            Selectedrecords = [];
            var objTables = JSON.parse(response.d[0]);
            dvTutor = JSON.parse(response.d[1]);
            dvStudent = JSON.parse(response.d[2]);

            var dvTutorHtml = "";
            for (var x = 0; x < dvTutor.length; x++) {
                dvTutorHtml = dvTutorHtml + '<li ondragstart="dragStart(event,this)" draggable="true" id="' + dvTutor[x].ID + '" forstudent="0">' + dvTutor[x].TutorName + '</li >';
            }
            $("#dvTutor").html(dvTutorHtml);
            var dvStudentHtml = "";
            for (var x = 0; x < dvStudent.length; x++) {
                dvStudentHtml = dvStudentHtml + '<li SubjectId="' + dvStudent[x].SubjectId + '" ondragstart="dragStart(event,this)" draggable="true" id="' + dvStudent[x].ID + '" forstudent="1" StudyHall_Hrs="' + dvStudent[x].StudyHall_Hrs + '" Subject_Hrs="' + dvStudent[x].Subject_Hrs + '" primarySubject="' + dvStudent[x].primarySubject + '">' + dvStudent[x].StudentName + '</li >';
            }
            $("#dvStudent").html(dvStudentHtml);
            LoadEvents();
        }
    });
}
function dragStart(event, obj) {
    $("td").each(function () {
        $(this).attr("class", "");
    });
    var Tds = event.target.getAttribute('forstudent');
    $("td[forstudent=" + Tds + "]").each(function () {
        $(this).attr("class", "SummaryTableTD");
    });
    var CellIndex = $(obj).index();

    var tr = $(obj).closest("tr");
    event.dataTransfer.setData("forstudent", Tds);

    var rowIndex = $('#MasterEntry table tr').index(tr);
    if (Tds == 1) {
        event.dataTransfer.setData("msid", event.target.getAttribute('msid'));
        event.dataTransfer.setData("studentid", event.target.getAttribute('studentid'));
        event.dataTransfer.setData("subjectid", event.target.getAttribute('subjectid'));

    }
    else {
        event.dataTransfer.setData("msids", event.target.getAttribute('msids'));
    }
}
function dragStart_Old(event, obj) {
    //******* Drag from right side(All available tutor and student **//
    //alert($(obj).index());

    $("td").each(function () {
        $(this).attr("class", "");
    });

    var Tds = event.target.getAttribute('forstudent');
    $("td[forstudent=" + Tds + "]").each(function () {
        $(this).attr("class", "SummaryTableTD");
    });

    var CellIndex = $(obj).index();

    var tr = $(obj).closest("tr");

    var rowIndex = $('#MasterEntry table tr').index(tr);

    var trsAll = $('#MasterEntry table').find("tr");
    var msid1 = $($(trsAll[rowIndex]).find("td")[CellIndex - 2]).attr("msid");
    var msid2 = $($(trsAll[rowIndex + 1]).find("td")[CellIndex - 2]).attr("msid");
    var msid3 = $($(trsAll[rowIndex + 2]).find("td")[CellIndex - 2]).attr("msid");
    var studentid1 = $($(trsAll[rowIndex]).find("td")[CellIndex - 2]).attr("studentid");
    var studentid2 = $($(trsAll[rowIndex + 1]).find("td")[CellIndex - 2]).attr("studentid");
    var studentid3 = $($(trsAll[rowIndex + 2]).find("td")[CellIndex - 2]).attr("studentid");
    //

    event.dataTransfer.setData("msid1", msid1);
    event.dataTransfer.setData("msid2", msid2);
    event.dataTransfer.setData("msid3", msid3);

    event.dataTransfer.setData("ID", event.target.id);
    event.dataTransfer.setData("Value", event.target.innerHTML);
    event.dataTransfer.setData("fortutor", ((event.target.getAttribute('forstudent') == '1') ? '0' : '1'));
    event.dataTransfer.setData("forstudent", event.target.getAttribute('forstudent'));
    event.dataTransfer.setData("subjectid", event.target.getAttribute('subjectid'));
    event.dataTransfer.setData("Subject", event.target.getAttribute('primarysubject'));


    event.dataTransfer.setData("msid", $($(trsAll[rowIndex]).find("td")[CellIndex]).attr("msid"));
    event.dataTransfer.setData("index", event.target.getAttribute('index'));

}
var M_Obj = {};

function allowDrop(event, obj) {
    event.preventDefault();

}


function drop(event, obj) {
    $("td").each(function () {
        $(this).attr("class", "");
    });

    var forstudent_source = event.dataTransfer.getData('forstudent');
    var forstudent_target = obj.getAttribute("forstudent");

    if (forstudent_source == 1 && forstudent_target != 1) {
        alert("You cannot place a student in a tutor seat.", false);
        return false;
    }
    else if (forstudent_source == 0 && forstudent_target != 0) {
        alert("You cannot place a tutor in a student seat.", false);
        return false;
    }
    if (parseInt(obj.getAttribute("tablenumber")).toString().trim() == "NaN" || parseInt(obj.getAttribute("tablenumber")) == NaN) {
        alert('Please enter table number first.', false);
        return false;
    }
    else if (forstudent_source == 1) {
        var IndexSelected = $(obj).index();
        var DayName = $(obj).attr('DayName');
        var ObjTables = $('#MasterEntry table').find("tr td[DayName=" + DayName + "][forstudent=1]");
        var rwIndex = ($(obj).closest("tr").index());


        var data = {};
        data.MSID = event.dataTransfer.getData('msid');
        data.MSID1 = obj.getAttribute('msid');

        data.StudentId = event.dataTransfer.getData('studentid');
        data.StudentId1 = obj.getAttribute('studentid');

        data.Time = obj.getAttribute('time');
        data.Day = DayName;
        data.TutorID = obj.getAttribute('tutorid');
        data.subjectid = event.dataTransfer.getData('subjectid');

        for (var x = 0; x < ObjTables.length; x++) {
            if (rwIndex != x && data.StudentId == $(ObjTables[x]).attr("studentid") && $(obj).attr("time") == $(ObjTables[x]).attr("time")) {
                alert('This student is already scheduled.', false);
                return false;
            }
        }
        var data1 = {};
        data1.MasterScheduleID1 = data.MSID;
        data1.MasterScheduleID2 = data.MSID1;
        data1.TableNumber = obj.getAttribute("tablenumber");
        data1.Day = data.Day;
        data1.Time = data.Time;

        var StringData = JSON.stringify(data1);

        PostDataGeneric("Swipe_Student_BlankMSID_Summary", "MasterSchedule.aspx", StringData, true);

        return false;

    }
    else if (forstudent_source == 0) {
        var msids = event.dataTransfer.getData('msids');
        var msids1 = obj.getAttribute('msids');

        if (msids == undefined)
            msids = "0_0_0";

        if (msids1 == undefined)
            msids1 = "0_0_0";

        var _msid1 = msids.split('_')[0];
        var _msid2 = msids.split('_')[1];
        var _msid3 = msids.split('_')[2];

        var _msid1_1 = msids1.split('_')[0];
        var _msid2_1 = msids1.split('_')[1];
        var _msid3_1 = msids1.split('_')[2];

        var data = {};
        data.SID1 = ((_msid1 == "" || _msid1 == "undefined" || _msid1 == undefined) ? "0" : _msid1);
        data.SID2 = ((_msid2 == "" || _msid2 == "undefined" || _msid2 == undefined) ? "0" : _msid2);
        data.SID3 = ((_msid3 == "" || _msid3 == "undefined" || _msid3 == undefined) ? "0" : _msid3);

        data.TID1 = ((_msid1_1 == "" || _msid1_1 == "undefined" || _msid1_1 == undefined) ? "0" : _msid1_1);
        data.TID2 = ((_msid2_1 == "" || _msid2_1 == "undefined" || _msid2_1 == undefined) ? "0" : _msid2_1);
        data.TID3 = ((_msid3_1 == "" || _msid3_1 == "undefined" || _msid3_1 == undefined) ? "0" : _msid3_1);
        //console.log(data);
        var StringData = JSON.stringify(data);

        PostDataGeneric("Swipe_Tutor", "MasterSchedule.aspx", StringData, true);
        return false;

    }
    return false;
    var CellIndex = $(obj).index();
    var msids = $(obj).attr('msids');

    var tr = $(obj).closest("tr");

    var rowIndex = $('#MasterEntry table tr').index(tr);

    var trsAll = $('#MasterEntry table').find("tr");

    if (msids == undefined)
        msids = "0_0_0";

    var _msid1 = msids.split('_')[0];
    var _msid2 = msids.split('_')[1];
    var _msid3 = msids.split('_')[2];
    //console.log(msid1, msid2, msid3);

    //var studentid1 = $($(trsAll[rowIndex]).find("td")[CellIndex - 2]).attr("studentid");
    //var studentid2 = $($(trsAll[rowIndex + 1]).find("td")[CellIndex - 2]).attr("studentid");
    //var studentid3 = $($(trsAll[rowIndex + 2]).find("td")[CellIndex - 2]).attr("studentid");


    var msid1 = event.dataTransfer.getData('msid');
    var msid2 = obj.getAttribute("class");

    var msid_1 = event.dataTransfer.getData('msid1');
    var msid_11 = $($(trsAll[rowIndex]).find("td")[CellIndex - 2]).attr("msid");
    var msid_2 = event.dataTransfer.getData('msid2');
    var msid_22 = $($(trsAll[rowIndex + 1]).find("td")[CellIndex - 2]).attr("msid");
    var msid_3 = event.dataTransfer.getData('msid3');
    var msid_33 = $($(trsAll[rowIndex + 2]).find("td")[CellIndex - 2]).attr("msid");



    var index = event.dataTransfer.getData('index');

    var Subject = event.dataTransfer.getData('Subject');
    var SubjectId = event.dataTransfer.getData('subjectid');
    var Value = event.dataTransfer.getData('Value');
    var ID = event.dataTransfer.getData('ID');

    if (index != null && index != "null") {
        if (forstudent_source == 0 && forstudent_target == 1 || forstudent_source == 1 && forstudent_target == 0) {
            if (forstudent_source == 0)
                alert("You cannot place a tutor in a student seat.", false);

            else
                alert("You cannot place a student in a tutor seat.", false);
            return false;
        }
        if (forstudent_source == 0) {

            var data = {};
            data.SID1 = msid_1;
            data.SID2 = msid_2;
            data.SID3 = msid_3;
            data.TID1 = msid_11;
            data.TID2 = msid_22;
            data.TID3 = msid_33;
            console.log(data);
            var StringData = JSON.stringify(data);

            console.log(StringData);
            //PostDataGeneric("Swipe_Tutor", "MasterSchedule.aspx", StringData, true);
            return false;
        }
    }

    if (index != null && index != "null") {
        if (msid1 != null && msid1 != "null" && msid2 != null && msid2 != "null") {
            var data = {};
            data.ID1 = msid1;
            data.ID2 = msid2;
            var StringData = JSON.stringify(data);
            console.log(StringData);
            //PostDataGeneric("Swipe_Student", "MasterSchedule.aspx", StringData, true);
            return false;
        }
        else {
            alert('That action was not possible.', false);
            return false;
        }
    }

    //console.log(event.target.getAttribute('fortutor'), obj.getAttribute('fortutor'), event.target.getAttribute('forstudent') , obj.getAttribute('forstudent'));
    var TutorId = $($(obj).parent().parent().parent().parent()).attr('TutorRwId');

    if (event.dataTransfer.getData("forstudent") == obj.getAttribute('forstudent')) {
        if (obj.getAttribute('forstudent') == 1) {
            //            console.log($($(obj).parent().parent().parent().parent()));

            var data = {};
            data.TutorID = obj.getAttribute("tutorid");
            data.StudentID = ID;
            data.SubjectID = SubjectId;
            data.ID = obj.getAttribute("msid");


            //console.log($(obj).next().next());

            var text = ID;

            var IndexSelected = $(obj).index();

            var DayName = $(obj).attr('DayName');

            var ObjTables = $('#MasterEntry table').find("tr td[DayName=" + DayName + "][forstudent=1]");

            var rwIndex = ($(obj).closest("tr").index());

            data.Tablenumber = $(ObjTables[rwIndex - rwIndex % 3]).next().next().find(".TableIndex").val();
            data.TimeID = $(obj).attr("time");
            data.Day = $(obj).attr("DayName");
            var StringData = JSON.stringify(data);

            //console.log(data.Tablenumber);
            //alert(parseInt(data.Tablenumber));
            if (parseInt(data.Tablenumber).toString().trim() == "NaN" || parseInt(data.Tablenumber) == NaN) {
                alert('Please enter table number first.', false);
                return false;
            }
            console.log(ObjTables);
            for (var x = 0; x < ObjTables.length; x++) {

                if (rwIndex != x && text == $(ObjTables[x]).attr("studentid") && $(obj).attr("time") == $(ObjTables[x]).attr("time")) {
                    alert('This student is already scheduled.', false);
                    return false;
                }
            }
            console.log(StringData);
            PostDataGeneric("MasterSchedule_ADD_Update_All", "MasterSchedule.aspx", StringData, true);
        }
        else {
            var data = {};
            data.TutorID = ID;
            data.ID1 = ((_msid1 == "" || _msid1 == "undefined" || _msid1 == undefined) ? "0" : _msid1);
            data.ID2 = ((_msid2 == "" || _msid2 == "undefined" || _msid2 == undefined) ? "0" : _msid2);
            data.ID3 = ((_msid3 == "" || _msid3 == "undefined" || _msid3 == undefined) ? "0" : _msid3);

            data.Tablenumber = $(obj).closest("td").find(".TableIndex").val();
            data.TimeID = $(obj).attr("time");
            data.Day = $(obj).attr("DayName");

            if (data.Tablenumber == "" || data.Tablenumber == "0") {
                alert('Please enter table number first.', false);
            }
            else {
                var StringData = JSON.stringify(data);
                console.log(StringData);
            }

            PostDataGeneric("MasterSchedule_ADD_Update_Tutor_All", "MasterSchedule.aspx", StringData, true);
        }
    }
    else if (event.dataTransfer.getData("forstudent") == 0) {
        alert('You cannot place a tutor in a student seat.', false);
    }
    else if (event.dataTransfer.getData("forstudent") == 1) {
        alert('You cannot place a student in a tutor seat.', false);
    }
}
function PostDataGeneric(MethodName, url, Data, Refresh) {

    $.ajax({
        type: "POST",
        url: url + "/" + MethodName,
        data: Data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            var objMessage = JSON.parse(response.d[0]);
            ScheduleSummary();
        }

    });
}
function PostDataGeneric_NoMessage(MethodName, url, Data, Refresh) {
    $.ajax({
        type: "POST",
        url: url + "/" + MethodName,
        data: Data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objMessage = JSON.parse(response.d[0]);

        }

    });
}



function AutoComplete_Tutor(placeholder, src, column) {

    var availableTags = [];
    for (var x = 0; x < src.length; x++) {
        var tags = {};
        tags.value = src[x][column];
        tags.data = src[x]["ID"];
        availableTags.push(tags);
    }
    $('input[forstudent=0]').on("keydown", function (event) {
        if (event.keyCode === $.ui.keyCode.TAB &&
            $(this).autocomplete("instance").menu.active) {
            event.preventDefault();
        }
    }).autocomplete({
        minLength: 0,
        maxLength: 5,
        source: function (request, response) {
            // delegate back to autocomplete, but extract the last term
            // console.log(request.term);
            response($.ui.autocomplete.filter(
                availableTags, extractLast($.trim(request.term))));
        },
        focus: function () {
            // prevent value inserted on focus
            //this.value = "";
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
            this.value = ui.item.value;//.split('-')[1];// terms.join(", ");
            var Time = $(this).parent().attr("Time");
            var dayname = $(this).parent().attr("dayname");
            var Msids = $(this).parent().attr('msids').split('_');
            Msids.push(0);
            Msids.push(0);
            Msids.push(0);

            var data = {};
            data.Day = dayname;
            data.Time = Time;
            data.TutorID = ui.item.data;//.split('-')[0].replace('[', '').replace(']', '');
            data.ID1 = Msids[0];
            data.ID2 = Msids[1];
            data.ID3 = Msids[2];
            data.Tablenumber = $(this).parent().attr('tablenumber');

            var StringData = JSON.stringify(data);

            PostDataGeneric("MasterSchedule_ADD_Update_TutorDayTime", "MasterSchedule.aspx", StringData, true);

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


function AutoComplete_Student(placeholder, src, column) {
 
    var availableTags = [];
    for (var x = 0; x < src.length; x++) {
        var tags = {};
        tags.value = src[x][column];
        tags.data = src[x]["ID"];
        availableTags.push(tags);
    }
    $('input[forstudent=1]').on("keydown", function (event) {
        if (event.keyCode === $.ui.keyCode.TAB &&
            $(this).autocomplete("instance").menu.active) {
            event.preventDefault();
        }
    }).autocomplete({
        minLength: 0,
        maxLength: 5,
        source: function (request, response) {
            // delegate back to autocomplete, but extract the last term
            console.log(
                availableTags, extractLast(request.term));
            response($.ui.autocomplete.filter(
                availableTags, extractLast($.trim(request.term))));
        },
        focus: function () {
            // prevent value inserted on focus
            //this.value = "";
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
            this.value = ui.item.value// terms.join(", ");
            var ID = ui.item.data;

            //var Obj = ui.item;
            var Time = $(this).parent().attr("Time");
            var dayname = $(this).parent().attr("dayname");


            var data = {};
            var ObjStudentPresent = $("input[forstudent=1]");//.find(";
            //console.log(ObjStudentPresent);
            var exist = 0;
            for (var x = 0; x < ObjStudentPresent.length; x++) {
                //console.log($(ObjStudentPresent[x]).parent().attr("time"), Time, dayname, $(ObjStudentPresent[x]).parent().attr("dayname"))
                if ($(ObjStudentPresent[x]).parent().attr("time") == Time && dayname == $(ObjStudentPresent[x]).parent().attr("dayname")) {
                    var yLength = $(ObjStudentPresent[x]).parent().attr("studentid");
                    //console.log(yLength, ID);
                    if (yLength == ID) {
                        exist = 1;
                        break;
                    }
                }
            }
            if (exist == 1) {
                alert('This student is already scheduled.', false);
                this.value = "";
                return false;
            }
            var SubjectId = "";
            for (var x = 0; x < src.length; x++) {
                if (src[x]["ID"] == ID) {
                    console.log(src[x]);
                    SubjectId = src[x]["SubjectId"];
                }
            }

            var data = {};
            data.Day = dayname;
            data.Time = Time;
            data.TutorID = $(this).parent().attr("tutorid");
            data.StudentID = ID;
            data.SubjectID = SubjectId;
            data.ID = $(this).parent().attr("msid");
            data.Tablenumber = $(this).parent().attr("tablenumber");

            var StringData = JSON.stringify(data);
            if (data.TutorID != "0")
                PostDataGeneric("MasterSchedule_ADD_UpdateDayTime", "MasterSchedule.aspx", StringData, true);
            else {
                alert('Please select tutor first.', false);
                this.value = "";
                return false;
            }

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