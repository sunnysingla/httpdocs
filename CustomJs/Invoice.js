var _InvoiceStudent = {};
 
$(document).ready(function () {
 

    $("#CreateInvoice").on("click", function () {
 
        _InvoiceStudent = {};
        _InvoiceStudent._ID = 0;
        _InvoiceStudent._InquiryID = InquiryId;
 
        _InvoiceStudent._StudentName = $("#tdvStudents").val();

        _InvoiceStudent._Subjects = $("#tdvSubjects").val();

        _InvoiceStudent._PurchasedHoursPerSubject = $("#tdvHrs").val();

        _InvoiceStudent._PurchasedStudyHallHours = $("#drpdvStudyHrs").val();

        _InvoiceStudent._TypeOfplan = $("#tdvPlan").val();

        _InvoiceStudent._RetailRate = $("#tdvRetail").val();

        var rt = $("#tdvDRate").val();
        if (rt == "")
            rt = $("#tdvRetail").val();

        _InvoiceStudent._HourlyRate = rt;

        _InvoiceStudent._PaymentMethod = $("#tdvPaymentMethod").val();

        _InvoiceStudent._DownPayment = $("#tdvDPayment").val();

        _InvoiceStudent._Discount = $("#tdvDiscount").val().replace("%", "");

        _InvoiceStudent._NetFee = $("#tdvNFee").val();

        _InvoiceStudent._BalanceOutstanding = $("#tdvBalance").val();

        _InvoiceStudent._ContactName = $("#tdvContactName").val();
        _InvoiceStudent._ContactAddress = $("#tdvAddress").val();

        _InvoiceStudent._ContactEmail = $("#tdvEmail").val();

        _InvoiceStudent._SplitHrs = $("#tdvSplitHrs").val();

        var str = JSON.stringify(_InvoiceStudent).replace(/"/g, '\\"');

        $.ajax({
            type: "POST",
            url: "MeetingAction.aspx/CreateInvoice",
            data: '{ obj_Invoice:"' + str + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response_a) {
                 window.open('Invoice.aspx?InquiryId=' + InquiryId);
            }
        });
        return false;
    });
});


function getInvoice()
{
    var InquiryId;
    var QueryStrings = window.location.href.split('?')[1];
    InquiryId = QueryStrings.split('&')[0].split('=')[1];

    $.ajax({
        type: "POST",
        url: "MeetingAction.aspx/GetInvoice",
        data: '{InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            var InvoiceStudent = JSON.parse(response.d[0]);
            var _InvoiceStudent = InvoiceStudent[0];
            //console.log(_InvoiceStudent);

            $("#tdvStudents").val("Student Name: " + _InvoiceStudent.StudentName);

            $("#tdvSubjects").val("Subject: " + _InvoiceStudent.Subjects);

            $("#tdvHrs").val("Total tutoring hours purchased: " + _InvoiceStudent.PurchasedHoursPerSubject);

            $("#drpdvStudyHrs").val("Study hall hours: " + ((_InvoiceStudent.PurchasedStudyHallHours == 1) ? "Yes" : "No"));

            $("#tdvPlan").val("Plan type: "+_InvoiceStudent.TypeOfplan);

            $("#tdvRetail").val("Retail rate: "+_InvoiceStudent.RetailRate);

            $("#tdvDRate").val("Discounted rate: " +_InvoiceStudent.HourlyRate);

            $("#tdvPaymentMethod").val("Payment method: "+_InvoiceStudent.PaymentMethod);

            $("#tdvDPayment").val("Today's payment: "+_InvoiceStudent.DownPayment);

            $("#tdvDiscount").val("Discount: "+_InvoiceStudent.Discount + "%");

            $("#tdvNFee").val("Subtotal: "+_InvoiceStudent.NetFee);

            $("#tdvBalance").val("Balance outstanding: "+_InvoiceStudent.BalanceOutstanding);

            $("#tdvContactName").val("" + _InvoiceStudent.ContactName);
            $("#SignatureName").val("" + _InvoiceStudent.ContactName);

            $("#tdvAddress").val(_InvoiceStudent.ContactAddress);

            $("#tdvEmail").val("Contact email: "+_InvoiceStudent.ContactEmail);

            $("#tdvSplitHrs").val(_InvoiceStudent.SplitHrs);

 
            $("input").attr("disabled", "disabled");
            //$("#termsAndConditions").html($("#ContentPlaceHolder1_txtTermas").text());
            //$(".container1 input").css("border-bottom", "1px solid rgba(128, 128, 128, 0.34)");
 
            $("#signature").jSignature("setData", _InvoiceStudent.Signature);

        }
    });
}




function getInvoiceAutoDownLoad() {
    var InquiryId;
    var QueryStrings = window.location.href.split('?')[1];
    InquiryId = QueryStrings.split('&')[0].split('=')[1];

    $.ajax({
        type: "POST",
        url: "MeetingAction.aspx/GetInvoice",
        data: '{InquiryId:"' + InquiryId + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            var InvoiceStudent = JSON.parse(response.d[0]);
            var _InvoiceStudent = InvoiceStudent[0];
            //console.log(_InvoiceStudent);

            $("#tdvStudents").val("Student Name: " + _InvoiceStudent.StudentName);

            $("#tdvSubjects").val("Subject: " + _InvoiceStudent.Subjects);

            $("#tdvHrs").val("Total tutoring hours purchased: " + _InvoiceStudent.PurchasedHoursPerSubject);

            $("#drpdvStudyHrs").val("Study hall hours: " + ((_InvoiceStudent.PurchasedStudyHallHours == 1) ? "Yes" : "No"));

            $("#tdvPlan").val("Plan type: " + _InvoiceStudent.TypeOfplan);

            $("#tdvRetail").val("Retail rate: " + _InvoiceStudent.RetailRate);

            $("#tdvDRate").val("Discounted rate: " + _InvoiceStudent.HourlyRate);

            $("#tdvPaymentMethod").val("Payment method: " + _InvoiceStudent.PaymentMethod);

            $("#tdvDPayment").val("Today's payment: " + _InvoiceStudent.DownPayment);

            $("#tdvDiscount").val("Discount: " + _InvoiceStudent.Discount + "%");

            $("#tdvNFee").val("Subtotal: " + _InvoiceStudent.NetFee);

            $("#tdvBalance").val("Balance outstanding: " + _InvoiceStudent.BalanceOutstanding);

            $("#tdvContactName").val("" + _InvoiceStudent.ContactName);
            $("#SignatureName").val("" + _InvoiceStudent.ContactName);

            $("#tdvAddress").val(_InvoiceStudent.ContactAddress);

            $("#tdvEmail").val("Contact email: " + _InvoiceStudent.ContactEmail);

            $("#tdvSplitHrs").val(_InvoiceStudent.SplitHrs);
            $("input[id*=CurrentDate]").val(_InvoiceStudent.DateCreated);

            $("input").attr("disabled", "disabled");
            var height = $("#dvCreateInquiry").height();
 
            $("#dvCreateInquiry").parent().before('<img id="prnLogo" src="../images/tclogo.png" style="height:' + height + 'px;margin-top:84px;position:absolute;margin-left: 62%;">');
            $("#signature").jSignature("setData", _InvoiceStudent.Signature);

            setTimeout(function () {
                PrintCommand();
            }, 1000);
            
            //$(".container1 input").css("border-bottom", "1px solid rgba(128, 128, 128, 0.34)");

        }
    });
}

function PrintCommand() {

    $("#ExportPDF").hide();

    $(".container1 input").css("border", "none");
    $("#dvAddress textarea").css("border", "none");
    $("#tdvStudents").css("border", "none");

    var len = $("#tdvStudents").val();


    if (len.toString().length < 100) {
        $("#tdvStudents").css("height", "35px");
        $("#tdvStudents").css("overflow", "hidden");
    }
    $("#dvSplitHrs textarea").css("border", "none");
    $("#dvTermAndConditions textarea").css("border", "none");

    $("#dvCreateInquiry").css("border", "none");
    window.print();
    window.close();

}