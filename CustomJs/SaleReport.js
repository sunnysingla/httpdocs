function Getdata(Data) {
    $.ajax({
        type: "POST",
        url: "SalesReport.aspx/SalesReport",
        data: Data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var Objresults = JSON.parse(response.d[0]);
 
            $("#SaleData").html(Objresults[0].FinalOutPut);

        }
    });
}

var dt = new Date();
var n_CurrentYear = dt.getFullYear();

n_CurrentYear = n_CurrentYear;
$("#YearSelection").html("Year: " + n_CurrentYear.toString());

var data = {};
data.Year = n_CurrentYear;
var StringData = JSON.stringify(data);
Getdata(StringData);

$("#Minus").click(function () {

    n_CurrentYear = n_CurrentYear - 1;
    $("#YearSelection").html("Year: " + n_CurrentYear.toString());

    var data = {};
    data.Year = n_CurrentYear;
    var StringData = JSON.stringify(data);
    Getdata(StringData);
 
    return false;
});

$("#Plus").click(function () {

    n_CurrentYear = n_CurrentYear + 1;
    $("#YearSelection").html("Year: " + n_CurrentYear.toString());

    var data = {};
    data.Year = n_CurrentYear;
    var StringData = JSON.stringify(data);
    Getdata(StringData);

    return false;
});