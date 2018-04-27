$(function () {

    $('.tags input').on('focusout', function () {
        var txt = this.value.replace(/[^a-zA-Z0-9\+\-\.\#]/g, ''); // allowed characters list
        if (txt) $(this).after('<span class="tag">' + txt + '</span>');
        this.value = "";
        this.focus();
    }).on('keyup', function (e) {
        // comma|enter (add more keyCodes delimited with | pipe)
        if (/(188|13)/.test(e.which)) $(this).focusout();
    });

    $('.tags').on('click', '.tag', function () {
        if (confirm("Really delete this tag?")) $(this).remove();
    });

});

function Complete_Inquiry_Assessment_Meeting(DeleteId, InquiryId) {
    $.ajax({
        type: "POST",
        url: "Inquiry.aspx/Complete_Inquiry_Assessment_Meeting",
        data: '{ DeleteId:"' + DeleteId + '",InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var Text = JSON.parse(response.d[0]);
            //if (DeleteId != 4)
            //    alert(Text[0].Message, false);
            //else if (DeleteId == 4)
            //    alert('Save sucessfully', false);
            closeAndRefresh();
        },
        failure: function (response) {
            alert(response.d, false);
        }
    });
    return false;
}

function Complete_Inquiry_Assessment_Meeting_RedirectToEnrolement(DeleteId, InquiryId) {
    $.ajax({
        type: "POST",
        url: "Inquiry.aspx/Complete_Inquiry_Assessment_Meeting",
        data: '{ DeleteId:"' + DeleteId + '",InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var Text = JSON.parse(response.d[0]);
            //if (DeleteId != 4)
            //    alert(Text[0].Message, false);
            //else if (DeleteId == 4)
            //    alert('Save sucessfully', false);
            location.href = '../enrollment/enrollment.aspx';
        },
        failure: function (response) {
            alert(response.d, false);
        }
    });
    return false;
}

function DELETE_Inquiry_Assessment_Meeting(DeleteId, InquiryId)
{
    $.ajax({
        type: "POST",
        url: "Inquiry.aspx/DELETE_Inquiry_Assessment_Meeting",
        data: '{ DeleteId:"' + DeleteId + '",InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var Text = JSON.parse(response.d[0]);
            //if (DeleteId != 4)
            //    alert(Text[0].Message, false);
            //else if (DeleteId == 4)
            //    alert('Save sucessfully', false);
           closeAndRefresh();
        },
        failure: function (response) {
            alert(response.d, false);
        }
    });
    return false;
}

function DELETE_Inquiry_Assessment_Meeting_RedirectToEnrolement(DeleteId, InquiryId) {
    $.ajax({
        type: "POST",
        url: "Inquiry.aspx/DELETE_Inquiry_Assessment_Meeting",
        data: '{ DeleteId:"' + DeleteId + '",InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var Text = JSON.parse(response.d[0]);
            //if (DeleteId != 4)
            //    alert(Text[0].Message, false);
            //else if (DeleteId == 4)
            //    alert('Save sucessfully', false);
            location.href = '../enrollment/enrollment.aspx';
        },
        failure: function (response) {
            alert(response.d, false);
        }
    });
    return false;
}
function closeAndRefresh() {
    console.log($('.ui-dialog-titlebar-close', window.parent.document).html());
    console.log($(".ui-dialog-titlebar-close"));

    var obj = $('.ui-dialog-titlebar-close', window.parent.document);
    $(obj).trigger("click");
    //$(".ui-dialog-titlebar-close").trigger("click");
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
