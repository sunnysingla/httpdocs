var NumberAdded = 0;
var NumberAdded_Assessment = 0;
var NumberAdded_Meeting = 0;
var isdisabled_IA = 0;

var objSubjects;
var objSource;
var objGrade;
var SourceStudents = [];
var objTimes;
var objPaymentMethods;
var objPlanType;

$(document).ready(function () {
    //$.jgrid.defaults.width = 780;
    $.jgrid.defaults.responsive = true;
    $.jgrid.defaults.styleUI = 'Bootstrap';

    $(".AddMoreStdName").on("click", function () {
 
        if (isdisabled_IA == 1)
            return false;
        var startTabIndex = 5 * (2 + NumberAdded) + 1;
        var PerAgeWidth = 90 / (3 + NumberAdded);
        $(".AddMoreStdName").before(' <input placeholder="Student Name" type="text" tabindex="' + startTabIndex + '"  class="next" number=' + NumberAdded + '  >');
        $(".AddMoreGrade").before(' <input placeholder="Grade" type="text" tabindex="' + (parseInt(startTabIndex) + 1) + '"   class="next" number=' + NumberAdded + '>');
        $(".AddMoreSubject").before(' <input placeholder="Subject" type="email" tabindex="' + (parseInt(startTabIndex) + 2) + '"   class="next" number=' + NumberAdded + '>');
        $(".AddMoreSchool").before(' <input placeholder="School" type="text" tabindex="' + (parseInt(startTabIndex) + 3) + '"   class="next" number=' + NumberAdded + '>');
        $(".AddMoreNotes").before(' <textarea placeholder="Notes" tabindex="' + (parseInt(startTabIndex) + 4) + '"   class="next" number=' + NumberAdded + '></textarea>');

        $('#container input[type="text"],  #container input[type = "email"], #container input[type = "tel"], #container input[type = "url"], #container textarea').css("width", PerAgeWidth + "%");
        var wid = (PerAgeWidth / 2) - .55;
        $('#container input[placeholder*="Contact"]').css("width", wid + "%");
        //$("#CPhone")
        NumberAdded = NumberAdded + 1;
        $(".RemoveMoreStdName").show();
        AutoComplete('Subject', objSubjects, "SubjectName");
        AutoComplete_Single('Source', objSource, "Source");
        AutoComplete_Single('Grade', objGrade, "Grade");
    });
    $(".RemoveMoreStdName").on("click", function () {
 
        if (isdisabled_IA == 1)
            return false;
        NumberAdded = NumberAdded - 1;
        var PerAgeWidth = 90 / (2 + NumberAdded);
        $(".container input[number=" + NumberAdded + "]").remove();
        $(".container textarea[number=" + NumberAdded + "]").remove();
        if (NumberAdded == 0)
            $(".RemoveMoreStdName").hide();
        $('#container input[type="text"],  #container input[type = "email"], #container input[type = "tel"], #container input[type = "url"], #container textarea').css("width", PerAgeWidth + "%");
        var wid = (PerAgeWidth / 2) - .55;
        $('#container input[placeholder*="Contact"]').css("width", wid + "%");

    });

    function GetInquiriesforAutoComplete()
    {
        _InquiryStudents = [];
        for (var x = 0; x < NumberAdded + 1; x++) {
            _InquiryStudent = {};
 
            _InquiryStudent._StudentName = $($("#StdName").find("input[placeholder*=Student]")[x]).val();
            _InquiryStudent._Grade = $($("#Grade").find("input[placeholder=Grade]")[x]).val();
            _InquiryStudent._Subjects = $($("#Subject").find("input[placeholder=Subject]")[x]).val();
            if (_InquiryStudent._StudentName != "" && _InquiryStudent._Grade != "" && _InquiryStudent._Subjects != "")
                _InquiryStudents.push(_InquiryStudent);
        }
        console.log(_InquiryStudents, "sunny");
        AutoComplete_Assessment("Student", _InquiryStudents, "_StudentName");
    }
    $(".Add_new1").on("click", function () {
 
        var startTabIndex = 5 * (2 + NumberAdded_Assessment) + 101;
        var PerAgeWidth = 85 / (2 + NumberAdded_Assessment);
        $(".Add_new1").before(' <input placeholder="Date" type="text" tabindex="' + startTabIndex + '"  class="next" number=' + NumberAdded_Assessment + '  >');
        $(".Add_new11").before(' <input placeholder="Time" type="text" tabindex="' + (parseInt(startTabIndex) + 1) + '"  class="next" number=' + NumberAdded_Assessment + '  >');

        $(".Add_new2").before(' <input placeholder="Student Name" type="text" tabindex="' + (parseInt(startTabIndex) + 2) + '"   class="next" number=' + NumberAdded_Assessment + '>');
        $(".Add_new3").before(' <input placeholder="Subject" type="email" tabindex="' + (parseInt(startTabIndex) + 4) + '"   class="next" number=' + NumberAdded_Assessment + '>');
        $(".Add_new4").before(' <input placeholder="Grade" type="text" tabindex="' + (parseInt(startTabIndex) + 3) + '"   class="next" number=' + NumberAdded_Assessment + '>');
        $('#fsetAssessment input[type="text"],  #fsetAssessment input[type = "email"], #fsetAssessment input[type = "tel"], #fsetAssessment input[type = "url"], #fsetAssessment textarea').css("width", PerAgeWidth + "%");
        NumberAdded_Assessment = NumberAdded_Assessment + 1;
        $(".Remove_new1").show();
        $('input[placeholder=Date]').dcalendarpicker();

        AutoComplete_Single('Time', objTimes, "Time");
        AutoComplete('Subject', objSubjects, "SubjectName");
        AutoComplete_Single('Source', objSource, "Source");
        AutoComplete_Single('Grade', objGrade, "Grade");

        GetInquiriesforAutoComplete();
    });

    $("#dvSName input[placeholder*=Student]").on("focus", function () {
        GetInquiriesforAutoComplete();
    });
    $("#StdName input[placeholder*=Student]").on("blur", function () {
        GetInquiriesforAutoComplete();
    });
    $("#Grade input[placeholder*=Grade]").on("blur", function () {
        GetInquiriesforAutoComplete();
    });
    $("#Subject input[placeholder*=Subject]").on("blur", function () {
        GetInquiriesforAutoComplete();
    });



 


    function AutoComplete_Assessment(placeholder, src, column) {
        var availableTags = [];
        var obj;
        var obj1;
        for (var x = 0; x < src.length; x++) {
            console.log(src[x][column]);
            availableTags.push(src[x][column]);
        }
        $('#dvSName input[placeholder*=' + placeholder + ']').on("focus", function (event) {
            var tabIndex = $(this).attr('tabindex');
            obj = $("input[tabindex=" + (parseInt(tabIndex) + 1).toString() + "]");
            obj1 = $("input[tabindex=" + (parseInt(tabIndex) + 2).toString() + "]");

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
                var tabIndex = $(this).attr('tabindex');
                obj = $("input[tabindex=" + (parseInt(tabIndex) + 1).toString() + "]");
                obj1 = $("input[tabindex=" + (parseInt(tabIndex) + 2).toString() + "]");

                for (var x = 0; x < src.length; x++) {
 
                    if (src[x]._StudentName == ui.item.value) {
                        $(obj).val(src[x]._Grade);
                        $(obj1).val(src[x]._Subjects);
                    }
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

    function fillOtherValues(object, src) {
 
        var tabIndex = $(object).attr('tabindex');
        obj = $("input[tabindex=" + (parseInt(tabIndex) + 1).toString() + "]");
        obj1 = $("input[tabindex=" + (parseInt(tabIndex) + 2).toString() + "]");
 
        for (var x = 0; x < src.length; x++) {
 
            if (src[x]._StudentName == $(object).val()) {
 
                $(obj).val(src[x]._Grade);
                $(obj1).val(src[x]._Subjects);
            }
        }
    }
    $(".Remove_new1").on("click", function () {
 
        NumberAdded_Assessment = NumberAdded_Assessment - 1;
        var PerAgeWidth = 85 / (2 + NumberAdded_Assessment);
        $(".container1 input[number=" + NumberAdded_Assessment + "]").remove();
        $(".container1 textarea[number=" + NumberAdded_Assessment + "]").remove();
        if (NumberAdded_Assessment == 0)
            $(".Remove_new1").hide();
        $('#fsetAssessment input[type="text"],  #fsetAssessment input[type = "email"], #fsetAssessment input[type = "tel"], #fsetAssessment input[type = "url"], #fsetAssessment textarea').css("width", PerAgeWidth + "%");
    });

    var _Inquiry = {};
    var _InquiryStudent = {};
    var _InquiryStudents = [];
    var _Assessment = {};
    var _Assessments = [];
    var _Meetings = {};
    var _Meetingss = [];

    $("#Inquiry-submit").on("click", function () {

        _Inquiry = {};
        _InquiryStudent = {};
        _InquiryStudents = [];
        _Assessment = {};
        _Assessments = [];
        _Meetings = {};
        _Meetingss = [];

        _Inquiry._ID = 0;
        _Inquiry._Date = $($("#StdName").find("input[placeholder=Date]")[0]).val();
        _Inquiry._ContactName = $($("#Grade").find("input[placeholder*=Contact]")[0]).val();
        _Inquiry._ContactPhone = $("#CPhone").val();
        _Inquiry._Email = $($("#Subject").find("input[placeholder=Email]")[0]).val();
        _Inquiry._Source = $($("#School").find("input[placeholder=Source]")[0]).val();
        _Inquiry._Notes = $($("#Notes").find("textarea[placeholder=Notes]")[0]).val();
        for (var x = 0; x < NumberAdded + 1; x++) {
            _InquiryStudent = {};
            _InquiryStudent._ID = 0;
            _InquiryStudent._InquiryID = 0;
            _InquiryStudent._StudentName = $($("#StdName").find("input[placeholder*=Student]")[x]).val();
            _InquiryStudent._Grade = $($("#Grade").find("input[placeholder=Grade]")[x]).val();
            _InquiryStudent._Subjects = $($("#Subject").find("input[placeholder=Subject]")[x]).val();
            _InquiryStudent._School = $($("#School").find("input[placeholder=School]")[x]).val();
            _InquiryStudent._Notes = $($("#Notes").find("textarea[placeholder=Notes]")[x + 1]).val();
            _InquiryStudents.push(_InquiryStudent);
        }
        for (var x = 0; x < NumberAdded_Assessment + 1; x++) {
            _Assessment = {};
            _Assessment._ID = 0;
            _Assessment._InquiryID = 0;
            _Assessment._Date = $($("#dvDate").find("input[placeholder=Date]")[x]).val();
            _Assessment._ContactName = ""; //$($("#dvSName").find("input[placeholder*=Contact]")[0]).val();
            _Assessment._StudentName = $($("#dvSName").find("input[placeholder*=Student]")[x]).val();
            _Assessment._Subjects = $($("#dvSubject").find("input[placeholder=Subject]")[x]).val();
            _Assessment._Grade = $($("#dvGrade").find("input[placeholder=Grade]")[x]).val();
            _Assessment._Time = $($("#dvTime").find("input[placeholder=Time]")[x]).val();
            _Assessments.push(_Assessment);
        }
        _Inquiry.obj_InquiryStudent = _InquiryStudents;
        _Inquiry.obj_Assessment = _Assessments;
        _Meetings._ID = 0;
        _Meetings._InquiryID = 0;
        _Meetings._Date = $($("#dvDate1").find("input[placeholder=Date]")[0]).val();
        _Meetings._ContactName = $($("#dvCName1").find("input[placeholder*=Contact]")[0]).val();
        _Meetings._ContactNumber = $($("#dvphone1").find("input[placeholder*=phone]")[0]).val();
        _Meetings._Contactemail = $($("#dvemail1").find("input[placeholder*=email]")[0]).val();
        _Meetings._StudentName = $($("#dvSName1").find("input[placeholder*=Student]")[0]).val();
        _Meetings._Time = $($("#dvDate1").find("input[placeholder=Time]")[0]).val();
        _Meetingss.push(_Meetings);

        _Inquiry.obj_Meetings = _Meetingss;

        console.log(_Inquiry);
        var data = {};
        var str = JSON.stringify(_Inquiry).replace(/"/g, '\\"');

        $.ajax({
            type: "POST",
            url: "Inquiry.aspx/CreateInquary",
            data: '{obj_Inquiry:"' + str + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                alert('Inquiry saved.', true);
                //location.reload();
            },
            failure: function (response) {
                alert(response.d, true);
                //location.reload();
            }
        });

        return false;
    });
    $("#aShow").click(function () {
        $("#dvCreateInquiry").show();
        $("#aShow").attr("style", "display:none ! important;");
        $("#aHide").attr("style", "display:block ! important;");
    });
    $("#aHide").click(function () {
        $("#dvCreateInquiry").hide();
        $("#aHide").attr("style", "display:none ! important;");
        $("#aShow").attr("style", "display:block ! important;");
    });



});

function AutoComplete(placeholder, src,column) {
    var availableTags = [];
    for (var x = 0; x < src.length; x++)
    {
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
function AutoComplete_Single(placeholder, src, column) {
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

function AutoComplete_SingleDaySelected1(src, column, id) {

    var availableTags = [];
    for (var x = 0; x < src.length; x++) {
        availableTags.push(src[x][column]);
    }
    $('#' + id).on("keydown", function (event) {
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
function AutoComplete_SingleDaySelected2(src, column) {
    var availableTags = [];
    for (var x = 0; x < src.length; x++) {
        availableTags.push(src[x][column]);
    }
    $('#time2').on("keydown", function (event) {
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



function ClearTime(id) {
 
    var Idmain = $(id).attr("id");
    var tabInd = $(id).attr("tabindex");
    if (parseInt(tabInd) < 99) {
        return false;
    }
    if (Idmain != "date2") {

        var y = $(id).attr("tabindex");
        var y = parseInt(y) + 1;

        $("input[tabindex=" + y.toString() + "]").val("");
        $("input[tabindex=" + y.toString() + "]").attr("id", "time" + y.toString());

        var date = new Date($(id).val());
        var dt = date.getDay();
        var objTimes_1 = [];
        for (var x = 0; x < objTimes.length; x++) {
            if (objTimes[x].D == dt) {
                objTimes_1.push(objTimes[x]);
            }
        }
        AutoComplete_SingleDaySelected1(objTimes_1, "Time", "time" + y.toString());
    }
    else if (Idmain == "date2") {
        $("#time2").val("");
        var date = new Date($("#date2").val());
        var dt = date.getDay();
        var objTimes_2 = [];
        for (var x = 0; x < objTimes.length; x++) {
            if (objTimes[x].D == dt) {
                objTimes_2.push(objTimes[x]);
            }
        }
        AutoComplete_SingleDaySelected2(objTimes_2, "Time");
    }
}


function ClearTime1(id) {

    console.log(id);

    var Idmain = $(id).attr("id");
    var tabInd = $(id).attr("tabindex");
    if (parseInt(tabInd) < 99)
    {
        return false;
    }
    if (Idmain != "date2") {

        var y = $(id).attr("tabindex");
        var y = parseInt(y) + 1;

        //$("input[tabindex=" + y.toString() + "]").val("");
        $("input[tabindex=" + y.toString() + "]").attr("id", "time" + y.toString());

        var date = new Date($(id).val());
        var dt = date.getDay();
        var objTimes_1 = [];
        for (var x = 0; x < objTimes.length; x++) {
            if (objTimes[x].D == dt) {
                objTimes_1.push(objTimes[x]);
            }
        }
        AutoComplete_SingleDaySelected1(objTimes_1, "Time", "time" + y.toString());
    }
    else if (Idmain == "date2") {
        //$("#time2").val("");
        var date = new Date($("#date2").val());
        var dt = date.getDay();
        var objTimes_2 = [];
        for (var x = 0; x < objTimes.length; x++) {
            if (objTimes[x].D == dt) {
                objTimes_2.push(objTimes[x]);
            }
        }
        AutoComplete_SingleDaySelected2(objTimes_2, "Time");
    }
}