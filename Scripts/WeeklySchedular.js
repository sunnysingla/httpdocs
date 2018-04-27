var TableUrl = 'tutoringclubtablepng.png';

var data_toPost = {};
var SceneId = 'scene_1443';
var timeViewId = "view_3393";

var TutorViewId = "view_3390";
var studentViewId = "view_3392";
var scheduleViewId = "view_3391";

var CreateTableViewId = "view_3397";
var CreateSessionViewId = "view_3395";

var Time = [];

var Tutors = "";
var Students = "";

var Subjects = [];

function LoadSubjects() {

    $.ajax({
        type: "POST",
        url: "WeeklySchedule.aspx/GetSubject",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objSubject = JSON.parse(response.d[0]);
            Subjects = objSubject

        }

    });
}
function CreateTable() {
    //var tableNumber = maxTableNumber + 1;
    var value = window.prompt("Please enter new table number:", (parseInt(maxTableNumber) + 1).toString());
    if (value == "" || value == undefined || value == "null" || value == null)
        return false;
    var StudentId1 = "";
    var StudentName1 = "";
    var studentSubject1 = "";

    var StudentId2 = "";
    var StudentName2 = "";
    var studentSubject2 = "";

    var StudentId3 = "";
    var StudentName3 = "";
    var studentSubject3 = "";
    var i = 0;

    var TutorId = value;
    var TutorName = "";
    var RecordId = value;
    var tablenumber = value;

    var ObjTables = $(".CompleteTables");
    for (var x = 0; x < ObjTables.length; x++) {

        if (value == $(ObjTables[x]).attr("TableId")) {
            alert('A table already exists with that number.', false);
            $(this).val('');
            $(this).focus();
            return false;
        }
    }

    var obj = {};
    obj.SId1 = "";
    obj.SId2 = "";
    obj.SId3 = "";
    obj.Name1 = "";
    obj.Name2 = "";
    obj.Name3 = "";

    obj.SubjectName1 = "";
    obj.SubjectName2 = "";
    obj.SubjectName3 = "";


    obj.MSID1Color = "";
    obj.MSID2Color = "";
    obj.MSID3Color = "";


    obj.TutorId = value;
    obj.TutorName = "";
    obj.TableNumber = value;

    obj.AutoStudentId1 = 0;
    obj.AutoStudentId2 = 0;
    obj.AutoStudentId3 = 0;

    obj.Flag1 = "";
    obj.Flag2 = "";
    obj.Flag3 = "";
    obj.FlagT = "";

    _GlobaobjTables.push(obj);
    FillTable(_GlobaobjTables);
 
    LoadEvents();
}
var maxTableNumber = 0;
var Length = 0;
var MaxColumn = 3;
var _GlobaobjTables;
function FillTable(objTables) {

    _GlobaobjTables = objTables;
    MaxColumn = parseInt(window.innerWidth / 450);

 
    Length = objTables + 1;
    var StudentId1 = "";
    var StudentName1 = "";
    var studentSubject1 = "";

    var StudentId2 = "";
    var StudentName2 = "";
    var studentSubject2 = "";

    var StudentId3 = "";
    var StudentName3 = "";
    var studentSubject3 = "";
    var i = 0;
    var leftHTML = "<table><tr class='mainRow'>";
    var TutorId = "";
    var TutorName = "";
    var RecordId = 0;
    var tablenumber = 0;
    maxTableNumber = 0;

 

    for (var x = 0; x < objTables.length; x++) {
        StudentId1 = objTables[x].SId1;
        StudentId2 = objTables[x].SId2;
        StudentId3 = objTables[x].SId3;
        StudentName1 = objTables[x].Name1;
        StudentName2 = objTables[x].Name2;
        StudentName3 = objTables[x].Name3;

        studentSubject1 = objTables[x].SubjectName1;
        studentSubject2 = objTables[x].SubjectName2;
        studentSubject3 = objTables[x].SubjectName3;
        TutorId = objTables[x].TutorId;
        TutorName = objTables[x].TutorName;
        tablenumber = objTables[x].TableNumber;
        RecordId = tablenumber;
        maxTableNumber = RecordId;



        var flag1 = objTables[x].Flag1;
        var flag2 = objTables[x].Flag2;
        var flag3 = objTables[x].Flag3;
        var flagT = objTables[x].FlagT;

        var FlagImage1 = "";
        var FlagImage2 = "";
        var FlagImage3 = "";
        var FlagImageT = "";
        if (flag1 != "")
            FlagImage1 = '<img src="../images/warning_icon.png" class="Warning" title="' + flag1 + '" />';
        if (flag2 != "")
            FlagImage2 = '<img src="../images/warning_icon.png" class="Warning" title="' + flag2 + '" />';
        if (flag3 != "")
            FlagImage3 = '<img src="../images/warning_icon.png" class="Warning" title="' + flag3 + '" />';
        if (flagT != "")
            FlagImageT = '<img src="../images/warning_icon.png" class="Warning" title="' + flagT + '" />';

        var Std1Style = "width:45%;height:16px;";
        var Std2Style = "width:90%;height:16px;";
        var Std3Style = "width:90%;height:16px;";

        if (objTables[x].MSID1Color != "White")
            Std1Style = Std1Style + "background-color:" + objTables[x].MSID1Color + ";color:white;";
        else
            Std1Style = Std1Style + "background-color:" + objTables[x].MSID1Color + ";";
        if (objTables[x].MSID2Color != "White")
            Std2Style = Std2Style + "background-color:" + objTables[x].MSID2Color + ";color:white;";
        else
            Std2Style = Std2Style + "background-color:" + objTables[x].MSID2Color + ";";

        if (objTables[x].MSID3Color != "White")
            Std3Style = Std3Style + "background-color:" + objTables[x].MSID3Color + ";color:white;";
        else
            Std3Style = Std3Style + "background-color:" + objTables[x].MSID3Color + ";";


        var AutoStudentId1 = objTables[x].AutoStudentId1;;
        var AutoStudentId2 = objTables[x].AutoStudentId2;;
        var AutoStudentId3 = objTables[x].AutoStudentId3;;

        leftHTML = leftHTML + "<td class='GetAllStudentIds' AllStudentsIds='" + AutoStudentId1 + "_" + AutoStudentId2 + "_" + AutoStudentId3+"' ind='tbl" + (x + 1).toString() + "'><table class='CompleteTables' index='" + x + "'   TableId='" + tablenumber + "'  ";
        leftHTML = leftHTML + "RecordId = '" + RecordId + "'  TutorId = '" + TutorId + "'    StudentId1 = '" + StudentId1 + "' StudentId2 = '" + StudentId2 + "' StudentId3 = '" + StudentId3 + "' >";
        leftHTML = leftHTML + " <tr><td colspan='2' class='txtClass' ><img class='Selected' src='../images/select.png'  /><input RecordId='" + RecordId + "' type='text' value='" + tablenumber + "' disabled class='TableIndex' id='TableIndex_" + tablenumber + "' />";
        leftHTML = leftHTML + "<input type='text' style=" + Std1Style +" index='1' value='" + StudentName1 + "' class='droptarget1' forstudent='1' ondrop=\"drop(event,this)\" ";
        leftHTML = leftHTML + "ondragover =\"allowDrop(event,this)\"  draggable='true' TutorId ='" + TutorId + "'  ondragstart='dragStart(event, this)' MSID ='" + StudentId1 + "' />";
        leftHTML = leftHTML + FlagImage1+"<button class='close-icon' type='reset' index='1' style='margin-left: -16px;margin-top: 2px;' MSID='" + StudentId1 + "' >x</button> <br /> "
        leftHTML = leftHTML + "<div class='adjustSpace' > <input type='text' style='width: 35%;' placeholder=[Subject] MSID ='" + StudentId1 + "' class='subject1' value='" + studentSubject1 + "' /></div ></td ></tr > "
        leftHTML = leftHTML + "<tr> <td class='txtClass'><img class='Selected' src='../images/select.png'  /><input draggable='true' type='text' style=" + Std2Style +" index='2' value='" + StudentName2 + "' class='droptarget1' forstudent='1' ondrop=\"drop(event,this)\" ";
        leftHTML = leftHTML + "ondragover =\"allowDrop(event,this)\" TutorId ='" + TutorId + "'  ondragstart='dragStart(event, this)' MSID ='" + StudentId2 + "'/>"
        leftHTML = leftHTML + FlagImage2+ " <button class='close-icon' type='reset' index='2' style='margin-left: -16px;margin-top: 2px;' MSID='" + StudentId2 + "'>x</button><div class='adjustSpace'>";
        leftHTML = leftHTML + "<input type='text' MSID ='" + StudentId2 + "' style='width: 70%;' placeholder=[Subject] class='subject2' value='" + studentSubject2 + "' /></div></td> <td class='txtClass'>";
        leftHTML = leftHTML + "<img class='Selected' src='../images/select.png'  /><input draggable='true' type='text' style=" + Std3Style +" index='3' value='" + StudentName3 + "' class='droptarget1' forstudent='1' ondrop=\"drop(event,this)\" ";
        leftHTML = leftHTML + "ondragover=\"allowDrop(event,this)\"  TutorId ='" + TutorId + "'   ondragstart='dragStart(event, this)' draggable='true' MSID='" + StudentId3 + "'/>" + FlagImage3 + "<button class='close-icon' type='reset' index='3' ";
        leftHTML = leftHTML + "style='margin-left: -13px;margin-top: 2px;' MSID='" + StudentId3 + "'>x</button> <div class='adjustSpace'><input type='text' MSID ='" + StudentId3 + "' style='width: 70%; ' placeholder=[Subject] class='subject3' ";
        leftHTML = leftHTML + "value='" + studentSubject3 + "' /></div></td></tr > <tr><td colspan='2' class='txtClass'><input type='text' style='width:45%;height: 16px;' class='droptarget1' MSID1 ='" + StudentId1 + "' MSID2 ='" + StudentId2 + "' MSID3 ='" + StudentId3 + "' forstudent='0' ";
        leftHTML = leftHTML + "ondrop=\"drop(event,this)\" ondragover=\"allowDrop(event,this)\" draggable='true' ondragstart='dragStart(event, this)'  index='0'  value='" + TutorName + "'  TutorId ='" + TutorId + "'  />";
        leftHTML = leftHTML + FlagImageT+ "<button class='close-icon' type='reset' index='0' style='margin-left: -13px;margin-top: 2px;' >x</button><a class='buttonDeleteTable' RecordId='" + RecordId + "' ";
        leftHTML = leftHTML + "style='color: white ! important;' src='#' MSID1 ='" + StudentId1 + "' MSID2 ='" + StudentId2 + "' MSID3 ='" + StudentId3 + "'>Delete Table</a><br /><br /></td></tr></table > <img src='" + TableUrl + "' class='TableClass' /></td > ";

        if ((x + 1) % MaxColumn == 0) {
            leftHTML = leftHTML + "</tr><tr  class='mainRow'>";
        }
        else if (x + 1 == objTables.length) {
            for (y = MaxColumn; y > (x + 1) % MaxColumn; y--) {
                leftHTML = leftHTML + "<td ind='tbl" + (x + 1 + 4 - y).toString() + "'></td>";
            }
            leftHTML = leftHTML + "</tr>";
        }
    }
    leftHTML = leftHTML + "</table>";
    $("#leftDiv").html(leftHTML);

    AutoComplete_Single('Subject', Subjects, "SubjectName");
    AutoComplete_Tutor('Tutor', dvTutor, "TutorName");
    AutoComplete_Student('Student', dvStudent, "StudentName");
    SelectedforMove();
}


function dragStart(event, obj) {


    event.dataTransfer.setData("msid1", event.target.getAttribute('msid1'));
    event.dataTransfer.setData("msid2", event.target.getAttribute('msid2'));
    event.dataTransfer.setData("msid3", event.target.getAttribute('msid3'));

    event.dataTransfer.setData("ID", event.target.id);
    event.dataTransfer.setData("Value", event.target.innerHTML);
    event.dataTransfer.setData("fortutor", event.target.getAttribute('fortutor'));
    event.dataTransfer.setData("forstudent", event.target.getAttribute('forstudent'));
    event.dataTransfer.setData("subjectid", event.target.getAttribute('subjectid'));
    event.dataTransfer.setData("Subject", event.target.getAttribute('primarysubject'));


    event.dataTransfer.setData("msid", event.target.getAttribute('msid'));
    event.dataTransfer.setData("index", event.target.getAttribute('index'));
    event.dataTransfer.setData("msid", event.target.getAttribute('msid'));
    event.dataTransfer.setData("class", event.target.getAttribute('style'));
}
var M_Obj = {};

function allowDrop(event, obj) {
    event.preventDefault();
}

function drop(event, obj) {

    var msid1 = event.dataTransfer.getData('msid');
    var msid2 = obj.getAttribute("msid");

    var msid_1 = event.dataTransfer.getData('msid1');
    var msid_11 = obj.getAttribute("msid1");
    var msid_2 = event.dataTransfer.getData('msid2');
    var msid_22 = obj.getAttribute("msid2");
    var msid_3 = event.dataTransfer.getData('msid3');
    var msid_33 = obj.getAttribute("msid3");

    var forstudent_source = event.dataTransfer.getData('forstudent');
    var forstudent_target = obj.getAttribute("forstudent");

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
            PostDataGeneric("Swipe_Tutor", "WeeklySchedule.aspx", StringData, true);
            return false;
        }
    }

    if (index != null && index != "null") {
        if (msid1 != null && msid1 != "null" && msid2 != null && msid2 != "null") {
            var data = {};
            data.ID1 = msid1;
            data.ID2 = msid2;
            var StringData = JSON.stringify(data);
            PostDataGeneric("Swipe_Student", "WeeklySchedule.aspx", StringData, true);
            return false;
        }
        else {
            var data = {};
            data.ID1 = msid1;
            data.Tablenumber = $($(obj).parent().parent().parent().parent()).attr('tableid');
            if (data.Tablenumber == null || data.Tablenumber.toString() == "undefined") {
                data.Tablenumber = $(obj).attr('tableid');
            }
            var isAbsent = event.dataTransfer.getData('class').toString().indexOf('#E74C3C;');
 
            
            if (data.Tablenumber == "-1" && isAbsent<=0)
            {
                alert('Students can only be marked as absent through attendance updates.', false);
                return false;
            }
            var StringData = JSON.stringify(data);
            PostDataGeneric("Swipe_Student_BlankMSID", "WeeklySchedule.aspx", StringData, true);
            //alert('That action is not possible', false);
            return false;
        }
    }

    //console.log(event.target.getAttribute('fortutor'), obj.getAttribute('fortutor'), event.target.getAttribute('forstudent') , obj.getAttribute('forstudent'));
    var TutorId = $($(obj).parent().parent().parent().parent()).attr('TutorRwId');

    if (event.dataTransfer.getData("forstudent") == obj.getAttribute('forstudent')) {
        if (obj.getAttribute('forstudent') == 1) {
            var ObjStudentPresent = $(".GetAllStudentIds");
            var exist = 0;
            for (var x = 0; x < ObjStudentPresent.length; x++) {
                var yLength = $(ObjStudentPresent[x]).attr("AllStudentsIds").split('_');
                for (var y = 0; y < yLength.length; y++) {
                    if (yLength[y] == ID) {
                        exist = 1;
                        break;
                    }
                }
            }
            if (exist == 1) {
                alert('This student is already scheduled.', false);
                return false;
            }
            var data = {};
            data.TutorID = obj.getAttribute("tutorid");
            data.StudentID = ID;
            data.SubjectID = SubjectId;
            data.ID = obj.getAttribute("msid");
            data.Tablenumber = $($(obj).parent().parent().parent().parent()).attr('tableid');
            if (data.Tablenumber == null || data.Tablenumber.toString() == "undefined") {
                data.Tablenumber = $(obj).attr('tableid');
            }

            if (data.Tablenumber == "-1") {
                alert('Students can only be marked as absent through attendance updates.', false);
                return false;
            }
            var StringData = JSON.stringify(data);
            PostDataGeneric("MasterSchedule_ADD_Update", "WeeklySchedule.aspx", StringData, true);
        }
        else {
            var data = {};
            data.TutorID = ID;
            data.ID1 = $($(obj).parent().parent().parent().parent()).attr('studentid1');
            data.ID2 = $($(obj).parent().parent().parent().parent()).attr('studentid2');
            data.ID3 = $($(obj).parent().parent().parent().parent()).attr('studentid3');
            data.Tablenumber = $($(obj).parent().parent().parent().parent()).attr('tableid');
            var StringData = JSON.stringify(data);
            PostDataGeneric("MasterSchedule_ADD_Update_Tutor", "WeeklySchedule.aspx", StringData, true);
        }
    }
    else if (event.dataTransfer.getData("forstudent") == 1) {
        alert('You cannot place a student in a tutor seat.', false);
    }
    else if (event.dataTransfer.getData("forstudent") == 0) {
        alert('You cannot place a tutor in a student seat.', false);
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
            
            if (Refresh) {
                MasterScheduling();
            }
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

            if (Refresh) {
                MasterScheduling();
            }
        }

    });
}
var dvTutor;
var dvStudent;
var dvStudent_SH;
var dvStudent_AB;
function MasterScheduling() {
    var Days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    var Days_Complete = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var date = $("input[placeholder=Date]").val().toString();
    var dateDay = date.split(',')[0];

    var DbDay = "";
    if (dateDay == "")
        return false;
    else {
        for (var x = 0; x < Days.length; x++) {
            if ($.trim(dateDay) == Days[x])
                DbDay = Days_Complete[x];
        }
    }
    if ($("#selectTime").val() == "-1")
        return false;
    var DBTime = $("#selectTime option:selected").html();

    $.ajax({
        type: "POST",
        url: "WeeklySchedule.aspx/MasterScheduling",
        data: '{ Time:"' + DBTime + '",Day:"' + DbDay + '" ,Date:"' + date + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            Selectedrecords = [];
            var objTables = JSON.parse(response.d[0]);
            dvTutor = JSON.parse(response.d[1]);
            dvStudent = JSON.parse(response.d[2]);
            dvStudent_SH = JSON.parse(response.d[3]);
            dvStudent_AB = JSON.parse(response.d[4]);

            FillTable(objTables);
 
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

            var dvStudent_SH_Html = "";
            for (var x = 0; x < dvStudent_SH.length; x++) {
                dvStudent_SH_Html = dvStudent_SH_Html + '<li class="GetAllStudentIds" AllStudentsIds="' + dvStudent_SH[x].StudentId1 + '" studentId="' + dvStudent_SH[x].StudentId1 + '"  MSID="' + dvStudent_SH[x].MSID + '"  id="' + dvStudent_SH[x].ID + '"  >' + dvStudent_SH[x].StudentName + '<span style="float: right;"><img title="Remove Student" studentId="' + dvStudent_SH[x].StudentId1 + '"  MSID="' + dvStudent_SH[x].MSID + '"  src="../images/Delete_Icon.jpg" style="cursor: pointer;width: 15px; height: 15px; float: right;" class="Delete_SH"></span></li >';
            }

            $("#dvStudent_SH").html(dvStudent_SH_Html);

            var dvStudent_AB_Html = "";
            for (var x = 0; x < dvStudent_AB.length; x++) {
                dvStudent_AB_Html = dvStudent_AB_Html + '<li class="GetAllStudentIds" AllStudentsIds="' + dvStudent_AB[x].StudentId1 + '" studentId="' + dvStudent_AB[x].StudentId1 + '"  MSID="' + dvStudent_AB[x].MSID + '"  id="' + dvStudent_AB[x].ID + '"  >' + dvStudent_AB[x].StudentName + '<span style="float: right;"><img title="Remove Student" studentId="' + dvStudent_AB[x].StudentId1 + '"  MSID="' + dvStudent_AB[x].MSID + '"  src="../images/Delete_Icon.jpg" style="cursor: pointer;width: 15px; height: 15px; float: right;" class="Delete_AB"></span></li >';
            }

            $("#dvStudent_AB").html(dvStudent_AB_Html);
            LoadEvents();
        }
    });

}

$(document).ready(function () {
 
    $("#selectTime").change(function () {
        MasterScheduling();
    });
 
    $("#btnRefreshSchedule").click(function () {
        MasterScheduling();
    });
});


function DeleteGeneric(MethodName, url, Id, Refresh) {
    $.ajax({
        type: "POST",
        url: url + "/" + MethodName,
        data: '{ ID:"' + Id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objMessage = JSON.parse(response.d[0]);
            alert(objMessage[0].SucessMsg, false);
            if (Refresh) {
                MasterScheduling();
            }
        }

    });
}


function DeleteGeneric_NoMessage(MethodName, url, Id, Refresh) {
    $.ajax({
        type: "POST",
        url: url + "/" + MethodName,
        data: '{ ID:"' + Id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objMessage = JSON.parse(response.d[0]);
            //alert(objMessage[0].SucessMsg, false);
            if (Refresh) {
                MasterScheduling();
            }
        }

    });
}

function SelectedforMove()
{ 
    if (getCookie("Rcd") != "") {
        var x = "msid=" + getCookie("Rcd") + "";
 
        var txtbox = $("input[msid=" + getCookie("Rcd") + "][forstudent=1]");
 
        $(txtbox).css("background-color", "#336699");
        $(txtbox).css("color", "white");
        $($(txtbox).parent().find("img.Selected")[0]).toggle();
 
    }
}
function createCookie(name, value, days) {
    var expires;
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    }
    else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = document.cookie.length;
            }
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}
var Selectedrecords = [];
function LoadEvents() {
    $(".txtClass input[type=text]").on("click", function () {
 
        if ($(this).attr("forstudent") != undefined) {
            if ($.trim($(this).val()) != "") {
                $($(this).parent().find("img.Selected")[0]).toggle();
                if ($($(this).parent().find("img.Selected")[0]).is(":visible")) {
                    Selectedrecords.push($(this).attr("msid"));
                }
                else {
                    var msId = $(this).attr("msid");

                    if (getCookie("Rcd") == msId) {
                        var rcdValue = getCookie("Rcd");
                        var txtbox = $("input[msid=" + rcdValue + "][forstudent=1]");

                        $(txtbox).css("background-color", "white");
                        $(txtbox).css("color", "black");
                        createCookie("Rcd", rcdValue, -1);
                    }

                    Selectedrecords = jQuery.grep(Selectedrecords, function (value) {
                        return value != msId;
                    });
                }
            }
            else
            {
                if (getCookie("Rcd") != "")
                {
                    
                    var rcdValue = getCookie("Rcd");
          
                    data_toPost.ID1 = rcdValue;
                    data_toPost.Tablenumber = $($(this).parent().parent().parent().parent()).attr('tableid');
                    data_toPost.SchedulleDate_Day = $("#txtDate").val();
                    data_toPost.TimeId = $("#selectTime").val();

                    $("#dialog_Move").dialog();
                }
            }
            console.log(Selectedrecords);
        }
    });

    $(".buttonDeleteTable").on("click", function () {
        if (confirm('Please confirm you wish to delete this table.')) {
            var SId1 = $(this).parent().parent().parent().parent().attr('studentid1');
            var SId2 = $(this).parent().parent().parent().parent().attr('studentid2');
            var SId3 = $(this).parent().parent().parent().parent().attr('studentid3');
            var Ids = 0;
            if (SId1 != undefined)
                Ids = SId1;
            if (SId2 != undefined)
                Ids = Ids + ',' + SId2;
            if (SId3 != undefined)
                Ids = Ids + ',' + SId3;
            DeleteGeneric('DeleteTble', 'WeeklySchedule.aspx', Ids, true);
        }
    });

    $("input[id*=TableIndex_]").blur(function () {

        var text = $(this).val();
        if (text == '') {
            alert("Table number can't be blank!!", false);

            return false;
        }
        var IndexSelected = $(this).parent().parent().parent().parent().attr('index');

        var ObjTables = $(".CompleteTables");

        for (var x = 0; x < ObjTables.length; x++) {
            if (IndexSelected != $(ObjTables[x]).attr('index') && text == $(ObjTables[x]).attr("TableId")) {
                alert('A table already exists with that number.', false);
                $(this).val('');

                return false;
            }
        }
        var Id = $(this).attr('RecordId');
        var schedule_Rows = $("#" + scheduleViewId + " table tbody").find("tr.kn-group-level-2");
        var schedule_Rows_All = $("#" + scheduleViewId + " table tbody").find("tr");
        for (var x = 0; x < schedule_Rows.length; x++) {
            var index = $(schedule_Rows[x]).index();
            var RecordId = $(schedule_Rows_All[index + 1]).attr("id");
            var tablenumber = $(schedule_Rows[x]).find("td").html();
            if ($.trim(tablenumber) == $.trim(text) && RecordId != Id) {
                alert('A table already exists with that number.', false);
                $(this).val('');
                $(this).focus();
                return false;
            }
        }
        if ($($(this).parent().parent().parent().parent()).attr('tableid') != $(this).val()) {
            var data = {};

            data.MSID1 = $($(this).parent().parent().parent().parent()).attr('studentid1');
            data.MSID2 = $($(this).parent().parent().parent().parent()).attr('studentid2');
            data.MSID3 = $($(this).parent().parent().parent().parent()).attr('studentid3');
            data.Tablenumber = $(this).val();
            var StringData = JSON.stringify(data);
            PostDataGeneric("UpdateTableNumber", "WeeklySchedule.aspx", StringData, false);
            $($(this).parent().parent().parent().parent()).attr('tableid', $(this).val());
        }
    });

    $("#leftDiv td input[type=text]").on("click", function () {
        $('.close-icon').hide();
        $('.buttonDeleteTable').hide();
        $(this).parent().find('.close-icon').show();
        //if ($(this).attr('index') == '0')
          //  $(this).parent().find('.buttonDeleteTable').show();
    });

    $(".close-icon, .Delete_SH, .Delete_AB").on("click", function () {

        var confirmationMsg = "Please confirm you wish to remove this individual from the session.";
        if ($(this).attr("class").indexOf("Delete_SH") >= 0) {
            confirmationMsg = "Please confirm you wish to remove this student from the Study Hall.";
        }
        else if ($(this).attr("class").indexOf("Delete_AB") >= 0) {
            confirmationMsg = "Please confirm you wish to remove this student from the Absent List.";
        }

        if (confirm(confirmationMsg)) {
 
            var Id = $(this).attr("MSID");
            if (Id != undefined) {
                if ($(this).attr("class").indexOf("Delete_SH") >= 0 || $(this).attr("class").indexOf("Delete_AB") >= 0)
                    DeleteGeneric_NoMessage("DeleteStudent", "WeeklySchedule.aspx", Id, true);
                else
                    DeleteGeneric("DeleteStudent", "WeeklySchedule.aspx", Id, true);
            }
            else {
                var MSID1 = $($($(this).parent()).find('.buttonDeleteTable')[0]).attr('msid1');
                var MSID2 = $($($(this).parent()).find('.buttonDeleteTable')[0]).attr('msid2');
                var MSID3 = $($($(this).parent()).find('.buttonDeleteTable')[0]).attr('msid3');
                var data = {};
                data.ID1 = ((MSID1 == "null") ? "0" : MSID1);
                data.ID2 = ((MSID2 == "null") ? "0" : MSID2);
                data.ID3 = ((MSID3 == "null") ? "0" : MSID3);
                var StringData = JSON.stringify(data);
                PostDataGeneric("DeleteTutor", "WeeklySchedule.aspx", StringData, true);
            }
        }
        return false;
        
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
    AutoComplete_Single('Subject', Subjects, "SubjectName");
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
            this.value = ui.item.value;// terms.join(", ");
            var data = {};
            data.Subject = ui.item.value;
            data.MasterScheduleId = $(this).attr('MSID');
            var StringData = JSON.stringify(data);
            if (data.MasterScheduleId != "null" && data.MasterScheduleId != null)

                PostDataGeneric_NoMessage("UpdateSubject", "WeeklySchedule.aspx", StringData, false);
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
            console.log(request.term);
            response($.ui.autocomplete.filter(
                availableTags, extractLast(request.term)));
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

            var data = {};
            data.TutorID = ui.item.data;//.split('-')[0].replace('[', '').replace(']', '');
            data.ID1 = $($(this).parent().parent().parent().parent()).attr('studentid1');
            data.ID2 = $($(this).parent().parent().parent().parent()).attr('studentid2');
            data.ID3 = $($(this).parent().parent().parent().parent()).attr('studentid3');
            data.Tablenumber = $($(this).parent().parent().parent().parent()).attr('tableid');
            var StringData = JSON.stringify(data);
            console.log(StringData);

            PostDataGeneric("MasterSchedule_ADD_Update_Tutor", "WeeklySchedule.aspx", StringData, true);

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
            console.log(request.term);
            response($.ui.autocomplete.filter(
                availableTags, extractLast(request.term)));
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
            var ID = ui.item.data;//.split('-')[0].replace('[', '').replace(']', '');

            var data = {};
            var ObjStudentPresent = $(".GetAllStudentIds");
            var exist = 0;
            for (var x = 0; x < ObjStudentPresent.length; x++) {
                var yLength = $(ObjStudentPresent[x]).attr("AllStudentsIds").split('_');
                for (var y = 0; y < yLength.length; y++) {
                    if (yLength[y] == ID) {
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
            data.TutorID = this.getAttribute("tutorid");
            data.StudentID = ID;
            data.SubjectID = SubjectId;
            data.ID = this.getAttribute("msid");
            data.Tablenumber = $($(this).parent().parent().parent().parent()).attr('tableid');
            var StringData = JSON.stringify(data);
            PostDataGeneric("MasterSchedule_ADD_Update", "WeeklySchedule.aspx", StringData, true);

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



 