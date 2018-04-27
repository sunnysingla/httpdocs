<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/MasterTC.master" AutoEventWireup="true" CodeFile="SalesReport.aspx.cs" Inherits="Reports_SalesReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <%--   <link href="../Mobileformat/HandleTable.css?v=14.5" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="contact">
        <div style="margin-left: 20px; width: 100%;">
            <button class="GetData" name="submit" type="submit" id="Minus" data-submit="...Sending" style="margin-left: 0%!important;    width: 37px !important;    border-radius: 20px;padding-top: 2px;height: 20px;"><span><<</span></button>
            <span id="YearSelection" style="margin-left: 10px;"></span>
            <button class="GetData" name="submit" type="submit" id="Plus" data-submit="...Sending" style="margin-left: 1%!important;    width: 37px !important;    border-radius: 20px;padding-top: 2px;height: 20px;"><span>>></span></button>
 
            <br />
            <br />
            <table id="SaleData" class="ui-jqgrid-btable ui-common-table table table-bordered" style="width:95%;"></table>
        </div>
    </div>

        <script>

                $("#aReport").attr("class", "active");
                $("#aReport").attr("href", "javascript:void(0);");
 
    </script>
    <script src="../CustomJs/SaleReport.js?v=14.5"></script>

        <style>
        #SaleData td, #SaleData th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
 
        }
        td[color="0"] {
            background: grey;
         color: white;
        }
    </style>
</asp:Content>
