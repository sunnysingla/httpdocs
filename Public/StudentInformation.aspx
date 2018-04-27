<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="StudentInformation.aspx.cs" Inherits="Public_StudentInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->



    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="css/components.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- .header-wrapper start -->



    <section id="content">
        <div class="container main-container">

            <div class="row">
                <div class="col-md-12 margin-top-40">
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="portlet box orange">
                        <div class="portlet-title">
                            <div class="caption">
                                STUDENT
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="javascript:;" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-sm-4 right_txt fright">
                                    <div class="form-group row">
                                        <label class="col-sm-4 control-label mar_5tp">Date</label>
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="Date" id="toddayDate" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-sm-6">
                                    <form role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">Name of Student</label>
                                            <div class="col-sm-9">
                                                <input type="text" placeholder="Anabel Sosa" id="StuName" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">Grade</label>
                                            <div class="col-sm-2">
                                                <input type="text" placeholder="9th" id="StuGrade" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Age</label>
                                            <div class="col-sm-2">
                                                <input type="text" placeholder="0" id="StuAge" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">DOB</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="Date of Birth" id="StuDOB" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">School</label>
                                            <div class="col-sm-9">
                                                <input type="text" placeholder="Ariel Secondary" id="StuSchool" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">Home Address</label>
                                            <div class="col-sm-9">
                                                <input type="text" placeholder="Home Address" id="StuAddr" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">City</label>
                                            <div class="col-sm-2">
                                                <input type="text" placeholder="City" id="StuCity" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">State</label>
                                            <div class="col-sm-2">
                                                <input type="text" placeholder="State" id="StuState" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Zip</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="Zip Code" id="StuZip" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">Home Phone</label>
                                            <div class="col-sm-9">
                                                <input type="text" placeholder="Home Phone" id="StuHomePhone" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-5 control-label left_txt">How many brothers and sisters?</label>
                                            <div class="col-sm-7">
                                                <input type="text" placeholder="10000" id="StuSiblings" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label left_txt">Ages</label>
                                            <div class="col-sm-9">
                                                <input type="text" placeholder="1, 41, 50" id="StuSiblingsAges" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-12 control-label left_txt">How did you ﬁrst hear about Tutoring Club?</label>
                                            <div class="col-sm-12">
                                                <textarea class="form-control" rows="7" id="StuHearTC1"></textarea>
                                            </div>
                                        </div>



                                    </form>
                                </div>

                                <div class="col-sm-6">
                                    <form role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Father's Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Father's Name" id="FatherName" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Father's Occupation</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Father's Occupation" id="FatherOccu" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Employer</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Employer" id="FatherEmployeer" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Work Phone</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Work Phone" id="FatherWPhone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Cell Phone</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Work Phone" id="FatherCPhone" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Email</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Email" id="FatherEmail" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Mother's Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Mother's Name" id="MotherName" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Mother's Occupation</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Mother's Occupation" id="MotherOccu" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Employer</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Employer" id="MotherEmployeer" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Work Phone</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Work Phone" id="MotherWPhone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Cell Phone</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Cell Phone" id="MotherCPhone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label left_txt">Email</label>
                                            <div class="col-sm-8">
                                                <input type="text" placeholder="Email" id="MotherEmail" class="form-control">
                                            </div>
                                        </div>



                                    </form>
                                </div>



                            </div>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->
                </div>

            </div>


            <!-- start: PAGE CONTENT -->

            <div class="row">
                <div class="col-sm-6">
                    <div class="portlet box dark">
                        <div class="portlet-title">
                            <div class="caption">
                                PARENTAL OBJECTIVES
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="javascript:;" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="mar_5bt">1. Where would you like your student to be academically?</label>
                                                <div class="mt-radio-list">
                                                    <label class="mt-radio mt-radio-outline fnormal">
                                                        Average (grade level) 
                                                            <input type="radio" value="0" name="rdoQ1">
                                                        <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline fnormal">
                                                        Above average (1 year above grade level) 
                                                            <input type="radio" value="1" name="rdoQ1">
                                                        <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline fnormal">
                                                        College bound (2+ years above grade level)
                                                            <input type="radio" value="2" name="rdoQ1">
                                                        <span></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="mar_5bt">2. How would you best describe your student’s attitude towards school?</label>
                                                <div class="mt-radio-inline pad_0">
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ2" value="1" checked="">
                                                        Very negative
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ2" value="2">
                                                        Very positive
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ2" value="3">
                                                        Somewhat negative
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ2" value="4">
                                                        Somewhat positive
                                                            <span></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="mar_5bt">3. In which of the following areas do you feel your student needs improvement?</label>
                                                <div class="mt-radio-inline pad_0">
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ3" value="1" checked="">
                                                        Motivation
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ3" value="2">
                                                        Organizational skills
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ3" value="3">
                                                        Self-image or self -esteem
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ3" value="4">
                                                        Test taking skills
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ3" value="5">
                                                        Study skills
                                                            <span></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="mar_5bt">4. Have any of the following ever been a concern for your student?</label>
                                                <div class="mt-radio-inline pad_0">
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ4" value="1" checked="">
                                                        Behavioral problem in school
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ4" value="2">
                                                        Lack of attention in class
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ4" value="3">
                                                        Doesn’t turn in homework
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ4" value="4">
                                                        Shy or withdrawn in class
                                                            <span></span>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="mar_5bt">5. How would you describe your student’s self - motivation?</label>
                                                <div class="mt-radio-inline pad_0">
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ5" value="1" checked="">
                                                        High
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ5" value="2">
                                                        Below average
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ5" value="3">
                                                        Average
                                                            <span></span>
                                                    </label>
                                                    <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                        <input type="radio" name="rdoQ5" value="4">
                                                        Very low
                                                            <span></span>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-12 control-label left_txt">6. Additional comments:</label>
                                            <div class="col-sm-12">
                                                <textarea class="form-control" rows="3" id="AddCom1"></textarea>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="portlet box orange">
                        <div class="portlet-title">
                            <div class="caption">
                                MEDICAL HISTORY
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="javascript:;" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body" style="padding-bottom: 48px;">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="table-scrollable">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="col-md-4">&nbsp;</th>
                                                    <th class="col-md-1">Y </th>
                                                    <th class="col-md-1">N </th>
                                                    <th class="col-md-6">Explanations<br />
                                                        (if “yes” to any question)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th><strong>1. Does student wear glasses?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q1" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q1" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q1Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>2. Any eye defects or vision problems?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q2" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q2" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q2Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>3. Any hearing problems or deﬁciencies?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q3" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q3" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q3Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>4. Any speech problems?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q4" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q4" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q4Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>5. Any early childhood health problems?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q5" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q5" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q5Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>6. Any current health problems?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q6" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q6" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q6Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>7. Currently on any medications?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q7" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q7" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q7Text" class="form-control"></td>
                                                </tr>

                                                <tr>
                                                    <th><strong>8. Has student ever had<br />
                                                        a psychological or neurological<br />
                                                        evaluation?</strong></th>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q8" value="Y">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="mt-radio-inline pad_0">
                                                            <label class="mt-radio mt-radio-outline col-md-5 fnormal">
                                                                <input type="radio" name="Q8" value="N">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" value="" id="Q8Text" class="form-control"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <!-- start: FILE UPLOAD PANEL -->
                    <div class="portlet box orange">
                        <div class="portlet-title">
                            <div class="caption">
                                To ensure Tutoring Club is able to secure the proper medical care in case of an emergency, please complete the form below.
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                                <a href="javascript:;" class="remove"></a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Student</label>
                                            <div class="col-sm-6">
                                                <input type="text" placeholder="Anabel Sosa" id="StuName1" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Age	</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="0" id="StuAge1" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">School</label>
                                            <div class="col-sm-10">
                                                <input type="text" placeholder="Ariel Secondary" id="StuSchool1" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Home Address</label>
                                            <div class="col-sm-10">
                                                <input type="text" placeholder="Home Address" id="StuAddr1" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">City</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="City" id="StuCity1" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">State</label>
                                            <div class="col-sm-2">
                                                <input type="text" placeholder="State" id="StuState1" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Zip</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="Zip Code" id="StuZip1" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Phone</label>
                                            <div class="col-sm-10">
                                                <input type="text" placeholder="Phone" id="StuHomePhone1" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Doctor Name</label>
                                            <div class="col-sm-6">
                                                <input type="text" placeholder="Doctor Name" id="DoctorName" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Phone	</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="phone" id="DoctorPhone" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Emergency Contact:</label>
                                            <div class="mt-radio-inline col-sm-8" style="margin-left: 15px;">
                                                <label class="mt-radio mt-radio-outline col-md-2 fnormal">
                                                    <input type="radio" name="emer1" value="1" checked="">
                                                    Relative
                                                            <span></span>
                                                </label>
                                                <label class="mt-radio mt-radio-outline col-md-2 fnormal">
                                                    <input type="radio" name="emer1" value="2">
                                                    Neighbor
                                                            <span></span>
                                                </label>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label left_txt">Name</label>
                                            <div class="col-sm-6">
                                                <input type="text" placeholder="Anabel Sosa" id="EmerName" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label left_txt">Phone	</label>
                                            <div class="col-sm-3">
                                                <input type="text" placeholder="phone" id="EmerPhone" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div class="mt-checkbox-list">
                                                    <label class="mt-checkbox mt-checkbox-outline">
                                                        In the event of an emergency where I (or my spouse) cannot be cannot be contacted, I authorize Tutoring Club to secure whatever medical care is necessary for the safety and well being of my child.I will assume all costs incurred for - emergency care.
                                                            <input type="checkbox" value="Accept" id ="chkAcceptedConditions">
                                                        <span></span>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end:  PANEL -->
                </div>
            </div>


            <div class="row">
                <div class="col-sm-12 text-center" style="margin-bottom: 30px;">
                    <a href="javascript:void(0)" id="SaveUpdates" class="btn btn-lg blue" style="border-radius: 25px; background: grey;" disabled="disabled">
                        <i class="fa fa-file-o"></i>Save Updates </a>
                </div>
            </div>



</div>
          
    </section>

    <!-- .footer-wrapper start -->
    <div class="footer-wrapper">

        <!-- .copyright-container start -->
        <div class="copyright-container">
            <div class="container">
                <div class="row">

                    <section class="col-md-6">
                        © 2018 Tutoring Club - All Rights Reserved
                    </section>
                </div>
                <!-- .row end -->
            </div>
            <!-- .container end -->
        </div>
        <!-- .copyright-container end -->


    </div>
    <!-- footer-wrapper end -->
    <div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Modal Title</h4>
                </div>
                <div class="modal-body">Modal body goes here </div>
                <div class="modal-footer">
                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
                    <button type="button" class="btn green">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <table id="calendar-demo" class="calendar"></table>


    <script>
        $(document).ready(function () {
            $('input[placeholder*=Date]').dcalendarpicker();
            $('#calendar-demo').dcalendar(); //creates the calendar
            $('#calendar-demo').hide();
            $("#chkAcceptedConditions").click(function () {
                if ($(this).is(":checked") == true) {
                    $("#SaveUpdates").removeAttr("disabled");
                    $("#SaveUpdates").css("background", "#43A047");
                }
                else {
                    $("#SaveUpdates").attr("disabled", "disabled");
                    $("#SaveUpdates").css("background", "grey");
                }

            });
            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            LoadStudentDetails(StudentId);
        });
        var data = {};
        $("#StuSchool , #StuName, #StuGrade, #StuGrade, #StuDOB, #StuAge, #StuCity, #StuState , #StuZip, #StuHomePhone , #StuAddr").blur(function () {
            var Id = $(this).attr("id");
            $("#" + Id + "1").val($(this).val());
        });

        $("#SaveUpdates").click(function () {
            var QueryStrings = window.location.href.split('?')[1];
            var StudentId = QueryStrings.split('&')[0].split('=')[1];
            data.ID = StudentId;
            data.SchoolName = $("#StuSchool").val();
            data.FirstName = $("#StuName").val();
            data.Grade = $("#StuGrade").val();
            data.Birthdate = $("#StuDOB").val();
            data.Age = $("#StuAge").val();
            data.HomeAddress = $("#StuAddr").val();
            data.City = $("#StuCity").val();
            data.State = $("#StuState").val();
            data.Zip = $("#StuZip").val();
            data.HomePhone = $("#StuHomePhone").val();




            data.HowManySibLings = $("#StuSiblings").val();
            data.Ages = $("#StuSiblingsAges").val();

            data.Know_tutoringClub = $("#StuHearTC1").val();// + "~" + $("#StuHearTC2").val() + "~" + $("#StuHearTC3").val();
            data.FatherName = $("#FatherName").val();
            data.FatherOccupation = $("#FatherOccu").val();
            data.FatherEmployer = $("#FatherEmployeer").val();
            data.FatherWorkPhone = $("#FatherWPhone").val();
            data.FatherCellPhone = $("#FatherCPhone").val();
            data.FatherEmail = $("#FatherEmail").val();

            data.MotherName = $("#MotherName").val();
            data.MotherOccupation = $("#MotherOccu").val();
            data.MotherEmployer = $("#MotherEmployeer").val();
            data.MotherWorkPhone = $("#MotherWPhone").val();
            data.MotherCellPhone = $("#MotherCPhone").val();
            data.MotherEmail = $("#MotherEmail").val();


            data.Question1 = (($('input[name=rdoQ1]:checked').val() == undefined) ? "0" : $('input[name=rdoQ1]:checked').val());
            data.Question2 = (($('input[name=rdoQ2]:checked').val() == undefined) ? "0" : $('input[name=rdoQ2]:checked').val());
            data.Question3 = (($('input[name=rdoQ3]:checked').val() == undefined) ? "0" : $('input[name=rdoQ3]:checked').val());
            data.Question4 = (($('input[name=rdoQ4]:checked').val() == undefined) ? "0" : $('input[name=rdoQ4]:checked').val());
            data.Question5 = (($('input[name=rdoQ5]:checked').val() == undefined) ? "0" : $('input[name=rdoQ5]:checked').val());



            data.AdditionalComments = $("#AddCom1").val();//+ "~" + $("#AddCom2").val() + "~" + $("#AddCom3").val();


            data.MedicalQuestion1 = (($('input[name=Q1]:checked').val() == undefined) ? "0" : $('input[name=Q1]:checked').val()) + "~" + $("#Q1Text").val();
            data.MedicalQuestion2 = (($('input[name=Q2]:checked').val() == undefined) ? "0" : $('input[name=Q2]:checked').val()) + "~" + $("#Q2Text").val();
            data.MedicalQuestion3 = (($('input[name=Q3]:checked').val() == undefined) ? "0" : $('input[name=Q3]:checked').val()) + "~" + $("#Q3Text").val();
            data.MedicalQuestion4 = (($('input[name=Q4]:checked').val() == undefined) ? "0" : $('input[name=Q4]:checked').val()) + "~" + $("#Q4Text").val();
            data.MedicalQuestion5 = (($('input[name=Q5]:checked').val() == undefined) ? "0" : $('input[name=Q5]:checked').val()) + "~" + $("#Q5Text").val();
            data.MedicalQuestion6 = (($('input[name=Q6]:checked').val() == undefined) ? "0" : $('input[name=Q6]:checked').val()) + "~" + $("#Q6Text").val();
            data.MedicalQuestion7 = (($('input[name=Q7]:checked').val() == undefined) ? "0" : $('input[name=Q7]:checked').val()) + "~" + $("#Q7Text").val();
            data.MedicalQuestion8 = (($('input[name=Q8]:checked').val() == undefined) ? "0" : $('input[name=Q8]:checked').val()) + "~" + $("#Q8Text").val();


            data.DoctorName = $("#DoctorName").val();
            data.DoctorPhone = $("#DoctorPhone").val();



            data.EmergencyContact1Type = (($('input[name=emer1]:checked').val() == undefined) ? "0" : $('input[name=emer1]:checked').val());
            data.EmergencyContact1Type = "0";
            data.EmergencyContact1Name = $("#EmerName").val();
            data.EmergencyContact1Phone = $("#EmerPhone").val();
            var StringData = JSON.stringify(data);
            PostDataGenericStudent("SaveStudentInformation", "StudentInformation.aspx", StringData, false);

            return false;
        });

        function PostDataGenericStudent(MethodName, url, Data, Refresh) {
            $.ajax({
                type: "POST",
                url: url + "/" + MethodName,
                data: Data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objMessage = JSON.parse(response.d[0]);
                    console
                    alert(objMessage[0].SucessMsg, Refresh);
                }
            });
        }
        function LoadStudentDetails(id) {

            $.ajax({
                type: "POST",
                url: "Studentinformation.aspx/StudentDetails",
                data: '{ StudentId:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var objStudent = JSON.parse(response.d[0]);
                    //StudentInformation
                    $("#StuName").val(objStudent[0].FirstName);
                    $("#StuName1").val(objStudent[0].FirstName);

                    $("#StuGrade").val(objStudent[0].Grade);
                    $("#StuGrade1").val(objStudent[0].Grade);

                    $("#StuAge").val(objStudent[0].Age);
                    $("#StuAge1").val(objStudent[0].Age);

                    $("#StuGrade").val(objStudent[0].Grade);
                    $("#StuGrade1").val(objStudent[0].Grade);

                    $("#StuDOB").val(objStudent[0].Birthdate);
                    $("#StuDOB1").val(objStudent[0].Birthdate);
                    $("#StuSchool").val(objStudent[0].SchoolName);
                    $("#StuSchool1").val(objStudent[0].SchoolName);
                    $("#StuAddr").val(objStudent[0].HomeAddress);
                    $("#StuAddr1").val(objStudent[0].HomeAddress);
                    $("#StuCity").val(objStudent[0].City);
                    $("#StuCity1").val(objStudent[0].City);
                    $("#StuState").val(objStudent[0].State);
                    $("#StuState1").val(objStudent[0].State);
                    $("#StuZip").val(objStudent[0].Zip);
                    $("#StuZip1").val(objStudent[0].Zip);
                    $("#StuHomePhone").val(objStudent[0].HomePhone);
                    $("#StuHomePhone1").val(objStudent[0].HomePhone);

                    $("#StuSiblings").val(objStudent[0].HowManySibLings);

                    $("#StuSiblingsAges").val(objStudent[0].Ages);

                    $("#StuHearTC1").val(objStudent[0].Know_tutoringClub.split('~')[0]);
                    //$("#StuHearTC2").val(objStudent[0].Know_tutoringClub.split('~')[1]);
                    //$("#StuHearTC3").val(objStudent[0].Know_tutoringClub.split('~')[2]);

                    $("#FatherName").val(objStudent[0].FatherName);
                    $("#FatherOccu").val(objStudent[0].FatherOccupation);
                    $("#FatherEmployeer").val(objStudent[0].FatherEmployer);
                    $("#FatherWPhone").val(objStudent[0].FatherWorkPhone);
                    $("#FatherCPhone").val(objStudent[0].FatherCellPhone);
                    $("#FatherEmail").val(objStudent[0].FatherEmail);


                    $("#MotherName").val(objStudent[0].MotherName);
                    $("#MotherOccu").val(objStudent[0].MotherOccupation);
                    $("#MotherEmployeer").val(objStudent[0].MotherEmployer);
                    $("#MotherWPhone").val(objStudent[0].MotherWorkPhone);
                    $("#MotherCPhone").val(objStudent[0].MotherCellPhone);
                    $("#MotherEmail").val(objStudent[0].MotherEmail);

                    $("input[name=rdoQ1][value=" + objStudent[0].Question1 + "]").click();
                    $("input[name=rdoQ2][value=" + objStudent[0].Question2 + "]").click();
                    $("input[name=rdoQ3][value=" + objStudent[0].Question3 + "]").click();
                    $("input[name=rdoQ4][value=" + objStudent[0].Question4 + "]").click();
                    $("input[name=rdoQ5][value=" + objStudent[0].Question5 + "]").click();


                    $("#AddCom1").val(objStudent[0].AdditionalComments.split('~')[0]);
                    //$("#AddCom2").val(objStudent[0].AdditionalComments.split('~')[1]);
                    //$("#AddCom3").val(objStudent[0].AdditionalComments.split('~')[2]);

                    $("input[name=Q1][value=" + objStudent[0].MedicalQuestion1.split('~')[0] + "]").click();
                    $("input[name=Q2][value=" + objStudent[0].MedicalQuestion2.split('~')[0] + "]").click();
                    $("input[name=Q3][value=" + objStudent[0].MedicalQuestion3.split('~')[0] + "]").click();
                    $("input[name=Q4][value=" + objStudent[0].MedicalQuestion4.split('~')[0] + "]").click();
                    $("input[name=Q5][value=" + objStudent[0].MedicalQuestion5.split('~')[0] + "]").click();
                    $("input[name=Q6][value=" + objStudent[0].MedicalQuestion6.split('~')[0] + "]").click();
                    $("input[name=Q7][value=" + objStudent[0].MedicalQuestion7.split('~')[0] + "]").click();
                    $("input[name=Q8][value=" + objStudent[0].MedicalQuestion8.split('~')[0] + "]").click();
                    //$(".Q9[value=" + objStudent[0].MedicalQuestion9.split('~')[0] + "]").click();

                    $("#Q1Text").val(objStudent[0].MedicalQuestion1.split('~')[1]);
                    $("#Q2Text").val(objStudent[0].MedicalQuestion2.split('~')[1]);
                    $("#Q3Text").val(objStudent[0].MedicalQuestion3.split('~')[1]);
                    $("#Q4Text").val(objStudent[0].MedicalQuestion4.split('~')[1]);
                    $("#Q5Text").val(objStudent[0].MedicalQuestion5.split('~')[1]);
                    $("#Q6Text").val(objStudent[0].MedicalQuestion6.split('~')[1]);
                    $("#Q7Text").val(objStudent[0].MedicalQuestion7.split('~')[1]);
                    $("#Q8Text").val(objStudent[0].MedicalQuestion8.split('~')[1]);
                    //$("#Q9Text").val(objStudent[0].MedicalQuestion9.split('~')[1]);

                    $("#DoctorName").val(objStudent[0].DoctorName);
                    $("#DoctorPhone").val(objStudent[0].DoctorPhone);

                    $(".emer1[value=" + objStudent[0].EmergencyContact1Type + "]").click();

                    $("#EmerName").val(objStudent[0].EmergencyContact1Name);
                    $("#EmerPhone").val(objStudent[0].EmergencyContact1Phone);

                }
            });
        }

        var phones = [{ "mask": "(###) ###-####" }, { "mask": "(###) ###-####" }];
        $('input[placeholder*=Phone]').inputmask({
            mask: phones,
            greedy: false,
            definitions: { '#': { validator: "[0-9]", cardinality: 1 } }
        });

        $("#contact").attr("id", "contact1");
    </script>
    <style>
        .form-group {
    margin-bottom: 15px;
    height: 30px;
}

    </style>
</asp:Content>

