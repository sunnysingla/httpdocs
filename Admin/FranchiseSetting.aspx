<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="FranchiseSetting.aspx.cs" Inherits="Admin_FranchiseSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/WeeklySummary.js?v=14.5"></script>
    <link href="../CSS/Schedular.css?v=14.5" rel="stylesheet" />

    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
    <script src="https://pagead2.googlesyndication.com/pagead/osd.js"></script>
    
    <!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact">
        <h3>Franchise Settings</h3>
        <div id="leftDiv" style="width: 50%;">
            <table style="width: 100%;" border="0">

                <tr>

                    <td>Address Information<br />
                        <textarea id="txtAddress" style="height: 150px; width: 80%;"></textarea>

                    </td>
                </tr>
                <tr>

                    <td>
                        <table style="width:80%;">
                            <tr>
                                <td style="width:40%">Phone</td>
                                <td style="width:60%">
                                    <input type="text" id="txtPhone" tabindex="1" class="txtbox" placeholder="phone number"   style="width:100%" /></td>
                            </tr>
                        </table>


                    </td>
                </tr>
                                <tr style="height: 4px;">
                    <td   class="blanlTd"></td>
                </tr>
                <tr>

                    <td>
                        <table style="width:80%;">
                            <tr>
                                <td style="width:40%">Email</td>
                                <td style="width:60%">
                                    <input type="text" id="txtEmail" tabindex="1" class="txtbox" placeholder="Email"   style="width:100%"/></td>
                            </tr>
                        </table>


                    </td>
                </tr>
                                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>

                    <td>Terms and Conditions<br />
                        <div  id="txtTerms" style="height: 300px; width: 80%;" class="myTextEditor"></div>

                    </td>
                </tr>
            </table>
        </div>
        <div id="rightDiv" style="position: absolute; margin-left: 49%; width: 48%;margin-top: 26px;">
            <table style="width: 100%;">
                <tr>
                    <td colspan="2" style="width: 65%">Retail Rate</td>

                    <td style="width: 35%">
                        <input type="text" id="txtRetail" tabindex="1" class="txtbox" placeholder="Retail Rate" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td colspan="2">Low Hour Balance Warning</td>
                    <td>
                        <input type="text" id="LowHrsBalanceWarning" tabindex="2" class="txtbox" placeholder="Low hours balance warning" />
                    </td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td colspan="2">Maximum Tables</td>
                    <td>
                        <input type="text" id="txtTable" tabindex="3" class="txtbox" placeholder="Maximum tables" /></td>
                </tr>
                <tr style="height: 21px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td><b>Operating Hours</b></td>
                    <td><b>Open</b></td>
                    <td><b>Close</b></td>

                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Monday</td>
                    <td>
                        <input type="text" id="txtMondayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtMondayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Tuesday</td>
                    <td>
                        <input type="text" id="txtTuesdayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtTuesdayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Wednesday</td>
                    <td>
                        <input type="text" id="txtWednesdayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtWednesdayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <td>
                        <input type="text" id="txtThursdayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtThursdayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Friday</td>
                    <td>
                        <input type="text" id="txtFridayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtFridayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Saturday</td>
                    <td>
                        <input type="text" id="txtSaturdayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtSaturdayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>
                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <td>
                        <input type="text" id="txtSundayOpen" tabindex="4" class="txtbox" placeholder="Time" /></td>
                    <td>
                        <input type="text" id="txtSundayClose" tabindex="4" class="txtbox" placeholder="Time" /></td>
                </tr>

                <tr style="height: 4px;">
                    <td colspan="3" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Subjects</td>
                    <td colspan="2"> 
                        <div id="tutSubjects" style="height: 160px;overflow-y: scroll; overflow-x: hidden;width: 91%;border: 1px solid #dbdbdb;" >
                            </div>

                    </td>
                </tr>

            </table>
        </div>


        <button name="submit" type="submit" id="btnUpdateSetting" data-submit="...Sending" style="margin-top: 20px;">Update Settings</button>

    </div>
    <style>
        #rightDiv table input {
            width: 80% !important;
        }
    </style>
    <script>
        $("#txtRetail").blur(function () {
            $("#txtRetail").val(parseFloat($("#txtRetail").val()).toFixed(2));
            if ($("#txtRetail").val() == NaN)
                $("#txtRetail").val("0.00");
        });

        $.ajax({
            type: "POST",
            url: "FranchiseSetting.aspx/GETTimes_All",
            data: '{ ID:"" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //console.log(response);
                var objTimes = JSON.parse(response.d[0]);
                //console.log(objTimes);
                AutoComplete_Single('Time', objTimes, "Time");
            }
        });
        $("#btnUpdateSetting").click(function () {
            
            var Data = {};
            Data.Addr = $("#txtAddress").val();
            Data.PrimaryPhone = $("#txtPhone").val();
            Data.FranchiesEmail = $("#txtEmail").val();
 

            Data.Conditions =$('#txtTerms').summernote('code');// tinyMCE.activeEditor.getContent();// $("#txtTerms").val();
            Data.Rate = $("#txtRetail").val();
            Data.LowHrs = $("#LowHrsBalanceWarning").val();
            Data.MaxTables = $("#txtTable").val();
            Data.MondayOpen = $("#txtMondayOpen").val();
            Data.MondayClose = $("#txtMondayClose").val();
            Data.TuesdayOpen = $("#txtTuesdayOpen").val();
            Data.TuesdayClose = $("#txtTuesdayClose").val();
            Data.WednesdayOpen = $("#txtWednesdayOpen").val();
            Data.WednesdayClose = $("#txtWednesdayClose").val();
            Data.ThursdayOpen = $("#txtThursdayOpen").val();
            Data.ThursdayClose = $("#txtThursdayClose").val();
            Data.FridayOpen = $("#txtFridayOpen").val();
            Data.FridayClose = $("#txtFridayClose").val();
            Data.SaturdayOpen = $("#txtSaturdayOpen").val();
            Data.SaturdayClose = $("#txtSaturdayClose").val();
            Data.SundayOpen = $("#txtSundayOpen").val();
            Data.SundayClose = $("#txtSundayClose").val();

            var Subjects = $("#tutSubjects").find("input:checked");

            var Subjects_txt = "";
            for (var x = 0; x < Subjects.length; x++) {
                Subjects_txt = Subjects_txt + "," + $(Subjects[x]).val();
            }



            Data.Subjects = Subjects_txt;// $("#tutSubjects").val();

            var StringData = JSON.stringify(Data);
            PostDataGeneric("UpdateFranchise", "FranchiseSetting.aspx", StringData, false);
            return false;
        });

        function PostDataGeneric(MethodName, url, Data, Refresh) {

            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    alert(objMessage[0].SucessMsg, false);
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

        $("#aSetting").attr("class", "active");
        $("#aSetting").attr("href", "javascript:void(0);");
        
    </script>
    <style>
        #contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact input[type="phone"] {
 
            background-color: #fff !important;
            border: 1px solid #dbdbdb !important;
            border-radius: 3px !important;
            color: #363636 !important;
            height: 32px !important;
            text-align: left !important;
        }

    </style>
 

    <script type="text/javascript">
       $(document).ready(function() {
           //$('#txtTerms').summernote();
           var width = $("#txtAddress").width() + 10;
           $('#txtTerms').summernote({
               height: 260,                 // set editor height
               width:width,
               minHeight: null,             // set minimum height of editor
               maxHeight: null,             // set maximum height of editor
               focus: true                  // set focus to editable area after initializing summernote
           });

             $(".note-codable").hide();
        });

    //         tinyMCE.init({
    //    mode: "specific_textareas",
    //    editor_selector: "myTextEditor",
    //    theme : "advanced",
    //    plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
    //    theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
    //    theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
    //    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
    //    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
    //    theme_advanced_toolbar_location : "top",
    //    theme_advanced_toolbar_align : "left",
    //    theme_advanced_statusbar_location : "bottom",
 
    //});
                $.ajax({
            type: "POST",
            url: "FranchiseSetting.aspx/GetSettings",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                 
                var objFranchise = JSON.parse(response.d[0]);
                $("#txtAddress").val(objFranchise[0].FranchiesAddress);
                $("#txtPhone").val(objFranchise[0].PrimaryPhone);
                $("#txtEmail").val(objFranchise[0].FranchiesEmail);
               // $("#txtTerms").html(objFranchise[0].TermsConditions);
                //alert(objFranchise[0].TermsConditions);
                $('#txtTerms').summernote('code', objFranchise[0].TermsConditions);
                //$('#txtTerms').summernote();
                $("#txtRetail").val(parseFloat(objFranchise[0].RetailRate).toFixed(2));
                $("#LowHrsBalanceWarning").val(objFranchise[0].LowHrs);
                $("#txtTable").val(objFranchise[0].MaxTables);
                $("#txtMondayOpen").val(objFranchise[0].MondayOpen);
                $("#txtMondayClose").val(objFranchise[0].MondayClose);
                $("#txtTuesdayOpen").val(objFranchise[0].TuesdayOpen);
                $("#txtTuesdayClose").val(objFranchise[0].TuesdayClose);
                $("#txtWednesdayOpen").val(objFranchise[0].WednesdayOpen);
                $("#txtWednesdayClose").val(objFranchise[0].WednesdayClose);
                $("#txtThursdayOpen").val(objFranchise[0].ThursdayOpen);
                $("#txtThursdayClose").val(objFranchise[0].ThursdayClose);
                $("#txtFridayOpen").val(objFranchise[0].FridayOpen);
                $("#txtFridayClose").val(objFranchise[0].FridayClose);
                $("#txtSaturdayOpen").val(objFranchise[0].SaturdayOpen);
                $("#txtSaturdayClose").val(objFranchise[0].SaturdayClose);
                $("#txtSundayOpen").val(objFranchise[0].SundayOpen);
                $("#txtSundayClose").val(objFranchise[0].SundayClose);
                $("#tutSubjects").html(objFranchise[0].Subjects);
                //console.log(objFranchise);
                //setTimeout(function () {
  
                //}, 1000);
                

            }
        });
                   
</script>
</asp:Content>

