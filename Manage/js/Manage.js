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



function LoadTutorDetails(id, objIds) {
    var data = {};
    data.TutorId = id;
    $.ajax({
        type: "POST",
        url: "TutorDetail.aspx/GetTutor",
        data: "{'TutorId':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var objTutor = JSON.parse(response.d[0]);
        
            for (var x = 0; x < objIds.length; x++) {
 
                 $("#" + objIds[x]["key"]).val(objTutor[0][objIds[x]["value"]]);
            }
  
            $("#txtMondayOpen").val(objTutor[0].MondayOpen);
            $("#txtMondayClose").val(objTutor[0].MondayClose);
            $("#txtTuesdayOpen").val(objTutor[0].TuesdayOpen);
            $("#txtTuesdayClose").val(objTutor[0].TuesdayClose);
            $("#txtWednesdayOpen").val(objTutor[0].WednesdayOpen);
            $("#txtWednesdayClose").val(objTutor[0].WednesdayClose);
            $("#txtThursdayOpen").val(objTutor[0].ThursdayOpen);
            $("#txtThursdayClose").val(objTutor[0].ThursdayClose);
            $("#txtFridayOpen").val(objTutor[0].FridayOpen);
            $("#txtFridayClose").val(objTutor[0].FridayClose);
            $("#txtSaturdayOpen").val(objTutor[0].SaturdayOpen);
            $("#txtSaturdayClose").val(objTutor[0].SaturdayClose);
            $("#txtSundayOpen").val(objTutor[0].SundayOpen);
            $("#txtSundayClose").val(objTutor[0].SundayClose);
        }

    });
}
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "../Admin/FranchiseSetting.aspx/GETTimes_All",
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

    $.ajax({
        type: "POST",
        url: "../Admin/FranchiseSetting.aspx/GETTimes",
        data: '{ ID:"" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //console.log(response);
            objTimes_Restricted = JSON.parse(response.d[0]);
            //console.log(objTimes);
            var date = (new Date($("#DtShift").val())).toString().substr(0, 3);

      
            var objTimes_1 = [];
            for (var x = 0; x < objTimes_Restricted.length; x++) {
                if (objTimes_Restricted[x].ShortDay == date) {
                    objTimes_1.push(objTimes_Restricted[x]);
                }
            }
            AutoComplete_Single_StartEnd(objTimes_1, "Time");

        }
    });

});
var objTimes_Restricted;

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

function AutoComplete_Single_StartEnd(src, column) {

    var availableTags = [];
    for (var x = 0; x < src.length; x++) {
        availableTags.push(src[x][column]);
    }
    $('.RestrictedTime').on("keydown", function (event) {
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