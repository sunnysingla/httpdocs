<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../CustomJs/CreateInquiry.js?v=14.5"></script>
    <script>
        var objStundent_All;
        var objTutor_All;

        $(document).ready(function () {
            $("#StudentList").bind("jqGridAfterGridComplete", function () {
 
                var Object = $('td[aria-describedby="StudentList_Hour Balance"]');
                var ObjectNext = $('td[aria-describedby="StudentList_Token Balance"]');
                var ObjectNext_hall = $('td[aria-describedby="StudentList_Hall Hour Balance"]');

                var ObjectId = $('td[aria-describedby="StudentList_Details"]');
                for (var x = 0; x < Object.length; x++) {
                    var html = $(Object[x]).text().trim();
                    var html1 = $(ObjectNext[x]).text().trim();
                    var html2 = $(ObjectNext_hall[x]).text().trim();
                    var id = $(ObjectId[x]).find("a").attr("rel");

                    $(Object[x]).html('<input class="InputHrs" type="text" id="' + id + '_1" value="' + html + '" /> ');
                    $(ObjectNext[x]).html('<input class="InputToken" type="text" id="' + id + '_2" value="' + html1 + '" /> ');
                    $(ObjectNext_hall[x]).html('<input class="InputHall" type="text" id="' + id + '_3" value="' + html2 + '" /> ');
                }
            });

            $("#btnCreateTutor").click(function () {
                height = (window.innerHeight - 100)/2;
                width = (window.innerWidth - 100)/2;
                height1 = 820;
                width1 = 800;
                //if (window.innerHeight < 820)
                {
                    height1 = window.innerHeight;
                }
               
                //alert(document.getElementById('html').style.zoom);
                $("#frameEdit").attr('src', 'AddTutor.aspx');
                $("#dialog").dialog({
                    width: width1,
                    height: height1,
                    modal: true,
                    close: function (event, ui) {
                        location.href = location.href;
                    }
                });
                return false;
            })
            $.jgrid.defaults.responsive = true;
            $.jgrid.defaults.styleUI = 'Bootstrap';

            LoadStudentTutor();

            $("#txtStudentSearch").blur(function () {

                var objStundents = [];
                for (var x = 0; x < objStundent_All.length; x++) {
                    console.log(objStundent_All[x]["Student Name"]);
                    if (objStundent_All[x]["Student Name"].toString().toLowerCase().indexOf($("#txtStudentSearch").val().toLowerCase()) >= 0) {
                        objStundents.push(objStundent_All[x]);
                    }
                }
                $("#Student").html('<table id="StudentList"></table><div id= "StudentPager" ></div>');
                LoadGridStudent(objStundents);

            });
            $("#txtTutorSearch").blur(function () {

                var objTutors = [];
                for (var x = 0; x < objTutor_All.length; x++) {

                    if (objTutor_All[x]["Tutor Name"].toString().toLowerCase().indexOf($("#txtTutorSearch").val().toLowerCase()) >= 0) {
                        objTutors.push(objTutor_All[x]);
                    }
                }
                $("#TutorMain").html('<table id="TutorList"></table><div id= "TutorPager" ></div>');
                LoadGridTutor(objTutors);

            });

            $("#txtTutorSearch").keydown(function (evt) {
                var code = (evt.keyCode ? evt.keyCode : evt.which);
                if (code == 13) { //Enter keycode
                    var objTutors = [];
                    for (var x = 0; x < objTutor_All.length; x++) {

                        if (objTutor_All[x]["Tutor Name"].toString().toLowerCase().indexOf($("#txtTutorSearch").val().toLowerCase()) >= 0) {
                            objTutors.push(objTutor_All[x]);
                        }
                    }
                    $("#TutorMain").html('<table id="TutorList"></table><div id= "TutorPager" ></div>');
                    LoadGridTutor(objTutors);
                    return false;
                }
            });


            $("#txtStudentSearch").keydown(function (evt) {
                var code = (evt.keyCode ? evt.keyCode : evt.which);
                if (code == 13) { //Enter keycode
                    var objStundents = [];
                    for (var x = 0; x < objStundent_All.length; x++) {
                        console.log(objStundent_All[x]["Student Name"]);
                        if (objStundent_All[x]["Student Name"].toString().toLowerCase().indexOf($("#txtStudentSearch").val().toLowerCase()) >= 0) {
                            objStundents.push(objStundent_All[x]);
                        }
                    }
                    $("#Student").html('<table id="StudentList"></table><div id= "StudentPager" ></div>');
                    LoadGridStudent(objStundents);
                    return false;
                }
            });
        });

        function LoadGridStudent(objStundent) {
            $gridStudent = $("#StudentList");

            //  $("#StudentList").jqGrid('GridUnload');
            var colModelStudent = [{ name: "Student Name", width: 120 },
            { name: "Hour Balance", autowidth: true },
            { name: "Token Balance", autowidth: true },
            { name: "Hall Hour Balance", autowidth: true },
            { name: "Contact Name", autowidth: true },
            { name: "Contact Phone Number", autowidth: true },
            {
                width: 50,
                name: 'Details',
                formatter: imageLinkFormatter_Student,
                formatoptions: {
                    icon: 'ui-icon-folder-open',
                    link_class: 'edit-link-class',
                    action: 'Edit'
                }
            }, {
                width: 50,
                name: 'Delete',
                formatter: imageLinkFormatter_Student_Delete,
                formatoptions: {
                    icon: 'ui-icon-trash',
                    link_class: 'edit-link-class',
                    action: 'Edit'
                }
            }];
            LoadGridWheight(colModelStudent, objStundent, 'StudentList', 'StudentPager', $gridStudent, 400);

            $(".InputHrs").blur(function () {
                var id = $(this).attr("id").split('_')[0];

                var objStudent = {};
                objStudent.BalanceHours = $(this).val();
                objStudent.TokenBalance = $("#" + id + "_2").val();
                objStudent.StudyHall_Hrs = $("#" + id + "_3").val();
                objStudent.StudentId = id;

                var StringData = JSON.stringify(objStudent);

                PostDataGenericStudent("UpdateStudentInline", "StudentDetails.aspx", StringData, false);
                return false;
            });

            $(".InputToken").blur(function () {
                var id = $(this).attr("id").split('_')[0];

                var objStudent = {};
                objStudent.BalanceHours = $("#" + id + "_1").val();
                objStudent.TokenBalance = $(this).val();
                objStudent.StudyHall_Hrs = $("#" + id + "_3").val();
                objStudent.StudentId = id;
   
                var StringData = JSON.stringify(objStudent);

                PostDataGenericStudent("UpdateStudentInline", "StudentDetails.aspx", StringData, false);
                return false;
            });
            $(".InputHall").blur(function () {
                var id = $(this).attr("id").split('_')[0];

                var objStudent = {};
                objStudent.BalanceHours = $("#" + id + "_1").val();
                objStudent.TokenBalance = $("#" + id + "_2").val();
                objStudent.StudyHall_Hrs = $(this).val();
                objStudent.StudentId = id;
               
                var StringData = JSON.stringify(objStudent);

                PostDataGenericStudent("UpdateStudentInline", "StudentDetails.aspx", StringData, false);
                return false;
            });
        }

        function PostDataGenericStudent(MethodName, url, Data, Refresh) {
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
        function LoadGridTutor(objTutor) {

            $gridTutor = $("#TutorList");
            // $("#TutorList").jqGrid('GridUnload');
            var colModelTutor = [{ name: "Tutor Name", width: 120 },
            { name: "Gender", autowidth: true },
            { name: "Primary Phone", autowidth: true },
            { name: "Secondry Phone", autowidth: true },
            { name: "Email", autowidth: true },
            {
                width: 50,
                name: 'Details',
                formatter: imageLinkFormatter_Tutor,
                formatoptions: {
                    icon: 'ui-icon-folder-open',
                    link_class: 'edit-link-class',
                    action: 'Edit'
                }
            },
            {
                width: 50,
                name: 'Delete',
                formatter: imageLinkFormatter_Tutor_Delete,
                formatoptions: {
                    icon: 'ui-icon-trash',
                    link_class: 'edit-link-class',
                    action: 'Edit'
                }
            }];

            LoadGridWheight(colModelTutor, objTutor, 'TutorList', 'TutorPager', $gridTutor, 400);
        }

        var height = window.innerHeight - 100;
        var width = window.innerWidth - 100;
        var height1 = window.innerHeight - 10;
        var width1 = window.innerWidth - 10;
        function CheckId(obj) {
            height = window.innerHeight - 100;
            width = window.innerWidth - 100;
            height1 = window.innerHeight - 10;
            width1 = window.innerWidth - 10;

            //alert($(obj).attr('rel'));
            var Lavel = $(obj).attr('lavel');

            $("body").attr("style", "overflow: hidden;");
            if (Lavel == 1)
                location.href = 'StudentDetails.aspx?StudentId=' + $(obj).attr('rel');
            else if (Lavel == 2) {
                if (confirm('Are you sure you want to delete this student?')) {
                    DeleteGeneric('ArchiveStudent', 'StudentDetails.aspx', $(obj).attr('rel'), true);
 
                }
                return false;
            }
            else if (Lavel == 3)
                location.href = 'TutorDetail.aspx?TutorId=' + $(obj).attr('rel');
            else if (Lavel == 4) {
                if (confirm('Are you sure you want to delete this tutor?')) {
                    DeleteGeneric('ArchiveTutor', 'StudentDetails.aspx', $(obj).attr('rel'), true);
 
                }
                return false;
            }

            //$("#dialog").dialog({
            //    width: width1,
            //    height: height1,
            //    modal: true,
            //    close: function (event, ui) {
            //        $("body").attr("style", "");
            //    }
            //});
        }

        function DeleteGeneric(MethodName, url, Id, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: '{ ID:"' + Id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    alert(objMessage[0].SucessMsg, Refresh);
 
                }

            });
        }
        function LoadStudentTutor() {
            $.ajax({
                type: "POST",
                url: "Manage.aspx/ManageStudent_Tutor",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    objStundent_All = JSON.parse(response.d[0]);
                    objTutor_All = JSON.parse(response.d[1]);
                    LoadGridStudent(objStundent_All);
                    LoadGridTutor(objTutor_All);
                }
            });
        }
        $(document).ready(function () {
            $("#btnStudentSch").click(function () {
    
                location.href= 'ManageStudentSchedule.aspx'; return false;
            });
            $("#btnTutorSch").click(function () {
         
                location.href = 'ManageTutorSchedule.aspx'; return false;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact">
        <div style="margin-left: 20px; width: 100%;">
            <button name="submit" type="submit" id="btnStudentSch" data-submit="...Sending" style="margin-left:0%!important;">Student Schedule</button>
            <button name="submit" type="submit" id="btnTutorSch" data-submit="...Sending" style="margin-left:0%!important;">Tutor Schedule</button>
        
            <table id="Students">
                <tr>
                    <td style="width: 120px;">Student Name</td>
                    <td>
                        <asp:TextBox ID="txtStudentSearch" runat="server" Width="200px" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 10px;"></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <div id="Student">
                            <table id="StudentList"></table>
                            <div id="StudentPager"></div>
                        </div>
                    </td>
                </tr>

            </table>


            <div id="Tutor" style="margin-top: 10px;">
                <table>
                    <tr>
                        <td style="width: 120px;">Tutor Name </td>
                        <td>
                            <asp:TextBox ID="txtTutorSearch" runat="server" Width="200px" ClientIDMode="Static"></asp:TextBox></td>
                        <td>
                            <button name="submit" type="submit" id="btnCreateTutor" data-submit="...Sending" style="float: right; margin-top: 3px;">+ Add Tutor</button></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="TutorMain" >
                            <table id="TutorList"></table>
                            <div id="TutorPager"></div>
                                </div>
                        </td>
                    </tr>
                </table>



            </div>
        </div>
    </div>
    <div id="dialog" style="display: none;" title=" ">
        <iframe frameborder="0" style="overflow: hidden; height: 100%; width: 100%" height="100%" width="100%" id="frameEdit"></iframe>
    </div>
    <style>
 
 </style>

    <script>

        var IsStudent = location.href.split('=')[1];
        if (IsStudent == 1) {
            $("#Tutor , #btnTutorSch").hide();
                        $("#aManage").attr("class", "active");
            $("#aManage").attr("href", "javascript:void(0);");
                
        }
        else {
            $("#Students , #btnStudentSch").hide();
                        $("#aManage1").attr("class", "active");
            $("#aManage1").attr("href", "javascript:void(0);");
        }


    </script>
</asp:Content>

