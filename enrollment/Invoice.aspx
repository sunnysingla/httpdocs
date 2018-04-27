﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Enrollment/MasterOriginalFont.master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Enrollment_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../CustomJs/Invoice.js?v=14.5"></script>
      <script type="text/javascript" src="flashcanvas.js?v=14.5"></script>
    <style>
        #dvCreateInquiry input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact input[type="phone"], #contact textarea {
 
            padding: 10px;
 
        }

        fieldset, #fsetAssessment div, #fsetAssessment_x div, #fsetCallLog div, #fSetScheduling div, #fsetMeeting div, #fsetMeeting_x div, #fSetCalLogs div {
            border: medium none !important;
            margin: 0 0 3px !important;
            min-width: 100%;
            padding: 0;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <h3>Invoice</h3>
    <div id="dvCreateInquiry" style="border: 1px solid rgba(128, 128, 128, 0.18); width:60%; ">
        <div  style="margin-left: 5px;">
            <table style="width: 600px;">
                <tr>
                    <td>
                        <p style="padding: 3px;    margin-bottom: -2px;">
                            <span><%=Session["FranchiseName"] %></span>

                        </p>
                    </td>
                    <td rowspan="5" style="width: 400px;    vertical-align: top;">
                        <p style="padding: 3px;    margin-bottom: -2px;">
                            <span><%=Session["FranchiesAddress"] %></span>

                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p id="Grade" style="padding: 3px;    margin-bottom: -2px;">
                            <span><%=Session["FranchisePhone"] %></span>
                        </p>
                    </td>
 
                </tr>
                <tr>
                    <td>
                        <p style="padding: 3px;    margin-bottom: -2px;">
                            <span><%=Session["FranchiseEmail"] %></span>
                        </p>
                    </td>
 
                </tr>
                <tr>
                    <td>
                        <p style="padding: 3px;    margin-bottom: -2px;">
                            <span></span>
                        </p>
                    </td>
 
                </tr>
                <tr>

                    <td></td>
 
                </tr>
            </table>

 

        </div>
    </div>
    <br />
    <div class="container1">
        <table style="width: 100%;">
 
            <tr>
                        <td style="width:52%" id="container2">

                            <div id="dvContactName">
                                <input id="tdvContactName" placeholder="Contact name" type="text" tabindex="100"  autofocus class="field" style="width: 98%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvAddress">
                                <textarea id="tdvAddress" placeholder="Contact address" tabindex="101"  style="width: 98%;height: 100px;padding: 0px 0px 0px 6px;" ></textarea>
                            </div>
                            <div id="dvEmail">
                                <input id="tdvEmail" placeholder="Contact email" type="email" tabindex="102"  class="field" style="width: 98%;    margin-bottom: 2px;  margin-top:-4px;" >
                            </div>
                            <div id="dvStudents">
                                <textarea cols="2"  id="tdvStudents" placeholder="Student(s)" tabindex="103"  class="field" style="width: 98%; height:70px;    margin-bottom: 2px;"></textarea>
                                
                            </div>
                            <div id="dvSubjects">
                                <input id="tdvSubjects" placeholder="Subject(s)" type="text" tabindex="104"  class="field" style="width: 98%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvHrs">
                                <input id="tdvHrs" placeholder="Total tutoring hours purchased" type="text" tabindex="105"  class="field" style="width: 98%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvStudyHrs">
                               <input id="drpdvStudyHrs" placeholder="Type of plan" type="text" tabindex="200"  autofocus class="field" style="width: 98%;    margin-bottom: 2px;">
   
                            </div>
                                                       <div id="dvPlan">
                                <input id="tdvPlan" placeholder="Type of plan" type="text" tabindex="200"  autofocus class="field" style="width: 98%;    margin-bottom: 2px;">
                            </div>
                        </td>
                        
                        <td style="width: 47.7%" id="LeftDivContainer">

                            <div id="dvRetail">
                                <input id='tdvRetail' placeholder="Retail Rate" type="text" tabindex="200"  autofocus class="field" style="width: 80%;    margin-bottom: 2px;">
                            </div>
                            <div id="dvHRate">
                                <input id="tdvDRate"  placeholder="Discounted Rate" type="text" tabindex="201"  class="field" style="width: 80%;    margin-bottom: 2px;">
                            </div>
                            <div id="dvPaymentMethod">
                                <input id="tdvPaymentMethod"  placeholder="Payment method" type="text" tabindex="202"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvNFee">
                                <input id="tdvNFee" placeholder="Subtotal" type="text" tabindex="203"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvDPayment">
                                <input id= "tdvDPayment" placeholder="Today's payment" type="text" tabindex="204"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>
                            <div id="dvDiscount">
                                <input id="tdvDiscount" disabled placeholder="Discount" type="text" tabindex="205"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>

                            <div id="dvBalance">
                                <input id="tdvBalance" placeholder="Balance outstanding" type="text" tabindex="206"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>
                             <div id="dvSplitHrs">
                                <textarea id="tdvSplitHrs" placeholder="Hrs Details" tabindex="207"  style="width: 80%;    margin-bottom: 2px;height: 100px;"></textarea>
                            </div>
                            <div id="dvBalance1" style="visibility:hidden">
                                <input id="tdvBalance1" placeholder="Balance outstanding" type="text" tabindex="206"  class="field" style="width: 80%;    margin-bottom: 2px;" >
                            </div>
                        </td>
            </tr>
        </table>
    </div>
    <br />
    <fieldset id="fsetTermas" style="display:none;">
        <legend>Terms and Conditions</legend>
        <div id="dvTermAndConditions">
            <asp:TextBox ID="txtTermas" placeholder="Terma and Conditions" runat="server" class="field" TextMode="MultiLine" Rows="5" Style="width: 90%;"></asp:TextBox>

        </div>
    </fieldset>
 
    <fieldset id="fsetSignature">
        <legend>Customer Signature</legend>
        <div id="dvSignature">
            <input placeholder="Signature" type="text" tabindex="204"  class="field" style="width: 40%;" id="SignatureName">
        </div>
    </fieldset>

    <fieldset id="fsetSignatureBox">
        <div id="dvSignatureBox">
            <%--<textarea tabindex="101"  ></textarea>--%>
            <div  style="width: 40%;border: 1px solid #aaa;" id="signature"></div>

        </div>
       
    </fieldset>
     <input type="button" value="Clear" id="btnClear"   />
    <fieldset id="fSetCurrentdate">
        <div id="dvCurrentdate">
            <asp:TextBox ID="CurrentDate" runat="server" Style="width: 40%;    margin-top:4px;" class="field"></asp:TextBox>

        </div>
    </fieldset>

    <br />

    <button name="ExpoerPDF" type="submit" id="ExportPDF" data-submit="...Sending">Print and Save</button>
    <script>
        
        var height = $("#dvCreateInquiry").height();
        $(".aspNetHidden").before('<img id="prnLogo" src="../images/tclogo.png" style="height:' + height +'px;margin-top:84px;position:absolute;margin-left: 62%;">');
        $("#ExportPDF").on("click", function () {
            $("#ExportPDF").hide();
            $("#btnClear").hide();
            
            $(".container1 input").css("border", "none");
            $("#dvAddress textarea").css("border", "none");
            $("#tdvStudents").css("border", "none");
            var len = $("#tdvStudents").val();
 
         
            if (len.toString().length < 100)
            {
                $("#tdvStudents").css("height", "35px");
                $("#tdvStudents").css("overflow", "hidden");
            }
            $("#dvSplitHrs textarea").css("border", "none");
            $("#dvTermAndConditions textarea").css("border", "none");

            $("#dvCreateInquiry").css("border", "none");

             var InquiryId;
             var QueryStrings = window.location.href.split('?')[1];
            InquiryId = QueryStrings.split('&')[0].split('=')[1];

            var datapair = $sigdiv.jSignature("getData", "base30") 
 
            var Src = "data:" + datapair.join(",");

            var Object = {};
            Object.InqiryId = InquiryId;
            Object.Sinature = Src;
                    
            var StringData = JSON.stringify(Object);
            PostDataGeneric("SaveSignature", "Inquiry.aspx", StringData, false, false);

            //$("#tdvStudents").css("height", "70px")
            //$("#dvCreateInquiry").css("border", "1px solid rgba(128, 128, 128, 0.18)");
            //$(".container1 input").css("border", "groove");
            //$("#tdvStudents").css("border", "groove");
            //$("#dvAddress textarea").css("border", "groove");
            //$("#dvSplitHrs textarea").css("border", "groove");
            //$("#dvTermAndConditions textarea").css("border", "groove");

            //$("#ExportPDF").show();
           

            return false;
           // $("#prnLogo").remove();
        });
        function PostDataGeneric(MethodName, url, Data, Refresh, closeWindow) {

            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                     window.print();
                     window.close();

                }

            });

        }
    </script>

    <style>
        @media print {
            body {
                -webkit-print-color-adjust: exact;
            }
            #container2 {
            width:70% !important;
            }
            #LeftDivContainer input, #LeftDivContainer textarea {
             width:98% !important;
            }
            #dvContactName {
               margin-top:-9%;
            }
            #dvRetail {
              margin-top:-9%;
            }
            textarea {
              padding:10px !important;
            }
            #dvTermAndConditions {
              margin-top: -2%;
            }

            #dvCreateInquiry {
            width:69% !important;
            }
            #ContentPlaceHolder1_txtTermas {
            width:99% !important;
            }
            #LeftDivContainer {
            width:30% !important;
            }
            #prnLogo {
            margin-left:70% !important;
            }
            #contact h3 {
                display: block;
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
                color: white;
                padding-left: 10px;
                background-color: #2065ac;
                line-height: 2.1;
            }
        }
        @page {
            size: A4 portrait;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 10px;
            margin-bottom: 0px;
            margin: 0;
            -webkit-print-color-adjust: exact;
        }
    </style>
    <script>
        $(document).ready(function () {
            //alert('<%=Session["FranchiesAddress"] %>')
            //console.log('<%=Session["FranchiesAddress"] %>');
            setTimeout(function () {
                $("#dvTermAndConditions textarea").removeAttr("disabled");
                $("#dvSignature input").removeAttr("disabled");
                $("#fSetCurrentdate input").removeAttr("disabled");
                $("#btnClear").removeAttr("disabled");
            }, 1000);
        });



    </script>

        <script src="jSignature/jSignature.min.js"></script>
<script>
 var $sigdiv = $("#signature");
    $(document).ready(function () {
        $sigdiv.jSignature();
        $("#btnClear").click(function () {
            $sigdiv.jSignature("reset");
        });
        getInvoice();
    });
   
</script>
    <style>

        @media all {
            .page-break, #ContentPlaceHolder1_termsAndConditions {
                display: none;
            }
        }

        @media print {
            .page-break {
                display: block;
                page-break-before: always;
            }

            #ContentPlaceHolder1_termsAndConditions {
                display: block;
            }
        }
    </style>
    <div class="page-break"></div>
    <br /><br />
    <div id="termsAndConditions" runat="server" ></div>
</asp:Content>

