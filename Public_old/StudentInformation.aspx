<%@ Page Title="" Language="C#" MasterPageFile="~/enrollment/Popup.master" AutoEventWireup="true" CodeFile="StudentInformation.aspx.cs" Inherits="Public_StudentInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Manage/CSS/Manage.css?v=14.5" rel="stylesheet" />
    <link href="../Customjs/Common.js?v=14.5" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contact" style="margin-left: 20px;">
        <div class="fullDiv">
            <h3 style="margin-top: 15px !important; width: 100% !important;">Student</h3>
        </div>
        <br />
        <br />
        <br />
        <br />
        <span style="float: right; margin-top: -20px; width: 200px;">Date<input type="text" id="toddayDate" class="txtbox" placeholder="Date" disabled="disabled" /></span>

        <br />
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="width: 10%">Name of Student</td>
                <td style="width: 39.5%" colspan="5">
                    <input type="text" id="StuName" ti="1" class="txtbox" /></td>
                <td style="width: 2%"></td>
                <td style="width: 20%">Father's Name</td>
                <td style="width: 28.5%" colspan="5">
                    <input type="text" id="FatherName" ti="5" class="txtbox" /></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>

            <tr>
                <td style="width: 10%">Grade</td>
                <td style="width: 10%">
                    <input type="text" id="StuGrade" ti="2" class="txtbox" placeholder="Grade" /></td>
                <td style="width: 5%">Age</td>
                <td style="width: 10%">
                    <input type="text" id="StuAge" ti="2.1" class="txtbox" placeholder="Age" /></td>
                <td style="width: 5%">DOB</td>
                <td style="width: 9.5%">
                    <input type="text" id="StuDOB" ti="2.2" class="txtbox" placeholder="Date of birth" /></td>

                <td style="width: 2%"></td>
                <td style="width: 10%">Father's Occupation</td>
                <td style="width: 38.5%" colspan="5">
                    <input type="text" id="FatherOccu" ti="6" class="Phone txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>

            <tr>
                <td style="width: 10%">School</td>
                <td style="width: 39.5%" colspan="5">
                    <input type="text" id="StuSchool" ti="4" class="txtbox" /></td>
                <td style="width: 2%"></td>
                <td style="width: 10%">Employer</td>
                <td style="width: 38.5%" colspan="5">
                    <input type="text" id="FatherEmployeer" ti="7" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td style="width: 10%">Home Address	</td>
                <td style="width: 39.5%" colspan="5">
                    <input type="text" id="StuAddr" ti="4" class="txtbox" /></td>
                <td style="width: 2%"></td>
                <td style="width: 10%">Work Phone</td>
                <td style="width: 38.5%" colspan="5">
                    <input type="text" id="FatherWPhone" ti="4" class="txtbox"></td>
            </tr>


            <tr>
                <td style="width: 10%">City</td>
                <td style="width: 10%">
                    <input type="text" id="StuCity" ti="2" class="txtbox" placeholder="City" /></td>
                <td style="width: 5%">State</td>
                <td style="width: 10%">
                    <input type="text" id="StuState" ti="2.1" class="txtbox" placeholder="State" /></td>
                <td style="width: 5%">Zip</td>
                <td style="width: 9.5%">
                    <input type="text" id="StuZip" ti="2.2" class="txtbox" placeholder="Zip Code" /></td>

                <td style="width: 2%"></td>
                <td style="width: 10%">Cell Phone</td>
                <td style="width: 38.5%" colspan="5">
                    <input type="text" id="FatherCPhone" ti="4" class="txtbox"></td>
            </tr>

            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>

            <tr>
                <td style="width: 10%">Home Phone	</td>
                <td style="width: 39.5%" colspan="5">
                    <input type="text" id="StuHomePhone" ti="4" class="txtbox" placeholder="Phone" /></td>
                <td style="width: 2%"></td>
                <td style="width: 10%">Email</td>
                <td style="width: 38.5%" colspan="5">
                    <input type="text" id="FatherEmail" ti="4" class="txtbox"></td>
            </tr>

            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="3">How many brothers and sisters?	</td>
                <td colspan="3">
                    <input type="text" id="StuSiblings" ti="4" class="txtbox" /></td>
                <td></td>
                <td>Mother's Name</td>
                <td colspan="5">
                    <input type="text" id="MotherName" ti="5" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>

            <tr>
                <td style="width: 10%">Ages	</td>
                <td style="width: 39.5%" colspan="5">
                    <input type="text" id="StuSiblingsAges" ti="4" class="txtbox" /></td>
                <td style="width: 2%"></td>
                <td style="width: 20%">Mother's Occupation</td>
                <td style="width: 28.5%" colspan="5">
                    <input type="text" id="MotherOccu" ti="6" class="Phone txtbox"></td>
            </tr>

            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="6">How did you ﬁrst hear about Tutoring Club?

                </td>
                <td></td>
                <td>Employer</td>
                <td colspan="5">
                    <input type="text" id="MotherEmployeer" ti="7" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <input type="text" id="StuHearTC1" ti="4" class="txtbox" />
                </td>
                <td></td>
                <td>Work Phone</td>
                <td colspan="5">
                    <input type="text" id="MotherWPhone" ti="4" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <input type="text" id="StuHearTC2" ti="4" class="txtbox" />


                </td>

                <td></td>
                <td>Cell Phone</td>
                <td colspan="5">
                    <input type="text" id="MotherCPhone" ti="4" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <input type="text" id="StuHearTC3" ti="4" class="txtbox" />


                </td>

                <td></td>
                <td>Email</td>
                <td colspan="5">
                    <input type="text" id="MotherEmail" ti="4" class="txtbox"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td style="width: 49.5%" colspan="6">
                    <h3 style="background-color: #EA663A;">
                        <center>Parental Objectives</center>
                    </h3>
                </td>
                <td style="width: 1%"></td>
                <td style="width: 49.5%" colspan="6">
                    <h3>
                        <center>Medical History</center>
                    </h3>
                </td>
            </tr>

            <tr>
                <td colspan="13" class="blanlTd"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <table style="width: 95%;">


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">1. Where would you like your student to be academically?</td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="radio" name="rdoQ1" class="rdoQ1" value="1" style="width: 50px !important;" />Average (grade level)
                        <br />
                                <input type="radio" name="rdoQ1" class="rdoQ1" value="2" style="width: 50px !important;" />Above average (1 year above grade level)
                        <br />
                                <input type="radio" name="rdoQ1" class="rdoQ1" value="3" style="width: 50px !important;" />College bound (2+  years above grade level)</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">2. How would you best describe your student’s attitude towards school?</td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table style="margin-left: 0px; width: 100%;">
                                    <tr>
                                        <td style="width: 30%;">
                                            <input type="radio" name="rdoQ2" class="rdoQ2" value="1" style="width: 50px !important;" />Very negative </td>
                                        <td style="width: 50%;">
                                            <input type="radio" name="rdoQ2" class="rdoQ2" value="2" style="width: 50px !important;" />Very positive</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" name="rdoQ2" class="rdoQ2" value="3" style="width: 50px !important;" />Somewhat negative </td>
                                        <td>
                                            <input type="radio" name="rdoQ2" class="rdoQ2" value="4" style="width: 50px !important;" />Somewhat positive </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">3. In which of the following areas do you feel your student needs improvement?</td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table style="margin-left: 0px; width: 100%;">
                                    <tr>
                                        <td style="width: 30%;">
                                            <input type="radio" name="rdoQ3" class="rdoQ3" value="1" style="width: 50px !important;" />Motivation  </td>
                                        <td style="width: 50%;">
                                            <input type="radio" name="rdoQ3" class="rdoQ3" value="2" style="width: 50px !important;" />Organizational skills
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" name="rdoQ3" class="rdoQ3" value="3" style="width: 50px !important;" />Self-image or self -esteem  </td>
                                        <td>
                                            <input type="radio" name="rdoQ3" class="rdoQ3" value="4" style="width: 50px !important;" />Test taking skills  </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" name="rdoQ3" class="rdoQ3" value="5" style="width: 50px !important;" />Study skills
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>

                            </td>
                        </tr>



                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">4. Have any of the following ever been a  concern for your  student? </td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table style="margin-left: 0px; width: 100%;">
                                    <tr>
                                        <td style="width: 30%;">
                                            <input type="radio" name="rdoQ4" class="rdoQ4" value="1" style="width: 50px !important;" />Behavioral problem in school </td>
                                        <td style="width: 50%;">
                                            <input type="radio" name="rdoQ4" class="rdoQ4" value="2" style="width: 50px !important;" />Lack of attention in class
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" name="rdoQ4" class="rdoQ4" value="3" style="width: 50px !important;" />Doesn’t turn in homework </td>
                                        <td>
                                            <input type="radio" name="rdoQ4" class="rdoQ4" value="4" style="width: 50px !important;" />Shy or withdrawn in class </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">5. How would you describe your student’s self - motivation?
                            </td>
                        </tr>


                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table style="margin-left: 0px; width: 100%;">
                                    <tr>
                                        <td style="width: 30%;">
                                            <input type="radio" name="rdoQ5" class="rdoQ5" value="1" style="width: 50px !important;" />High  </td>
                                        <td style="width: 50%;">
                                            <input type="radio" name="rdoQ5" class="rdoQ5" value="2" style="width: 50px !important;" />Below average
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" name="rdoQ5" class="rdoQ5" value="3" style="width: 50px !important;" />Average  </td>
                                        <td>
                                            <input type="radio" name="rdoQ5" class="rdoQ5" value="4" style="width: 50px !important;" />Very low  </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2">6. Additional comments:   </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input type="text" id="AddCom1" ti="4" class="txtbox" />
                                <br />
                                <input type="text" id="AddCom2" ti="4" class="txtbox" />
                                <br />
                                <input type="text" id="AddCom3" ti="4" class="txtbox" />

                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td colspan="6" style="vertical-align: top;">
                    <table style="width: 95%;">


                        <tr>
                            <td colspan="2">
                                <table style="width: 100%; margin-left: 0px;">
                                    <tr>
                                        <td style="width: 40%; border-bottom: 1px solid grey; border-right: 1px solid grey;"></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey; padding-left: 2%;">Y</td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey; padding-left: 2%;">N</td>
                                        <td style="width: 40%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <center>Explanations<br />
 (if “yes” to any question)</center>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">1. Does student wear glasses? </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q1" name="Q1" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q1" name="Q1" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q1Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">2. Any eye defects or vision problems?
                                        </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q2" name="Q2" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q2" name="Q2" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q2Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">3. Any hearing problems or deﬁciencies?  </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q3" name="Q3" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q3" name="Q3" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q3Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">4. Any speech problems?   </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q4" name="Q4" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q4" name="Q4" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q4Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">5. Any early childhood health problems?
                                        </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q5" name="Q5" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q5" name="Q5" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q5Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">6. Any current health problems?  </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q6" name="Q6" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q6" name="Q6" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q6Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-bottom: 1px solid grey; border-right: 1px solid grey;">7. Currently on any medications?  </td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q7" name="Q7" value="Y" /></td>
                                        <td style="width: 5%; border-bottom: 1px solid grey; border-right: 1px solid grey;">
                                            <input type="radio" class="Q7" name="Q7" value="N" /></td>
                                        <td style="width: 50%; border-bottom: 1px solid grey; padding-left: 10px;">
                                            <input type="text" id="Q7Text" ti="4" class="txtbox" /></td>
                                    </tr>

                                    <tr>
                                        <td style="width: 30%; border-right: 1px solid grey;">8. Has student ever had a psychological or neurological evaluation? </td>
                                        <td style="width: 5%; border-right: 1px solid grey;">
                                            <input type="radio" class="Q8" name="Q8" value="Y" /></td>
                                        <td style="width: 5%; border-right: 1px solid grey;">
                                            <input type="radio" class="Q8" name="Q8" value="N" /></td>
                                        <td style="width: 50%; padding-left: 10px;">
                                            <input type="text" id="Q8Text" ti="4" class="txtbox" /></td>
                                    </tr>




                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="blanlTd"></td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="2">Signature of Parent/Guardian   </td>
                        </tr>

                        <tr style="display: none">
                            <td colspan="2">
                                <textarea id="signatureParent"></textarea>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>





        <div class="fullDiv">
            <h3 style="margin-top: 15px !important; width: 99% !important; margin-left: -12px !important;">To ensure Tutoring Club is able to secure the proper medical care in case of an emergency, 
 please complete the form below. 
            </h3>
            <table style="width: 95%;">

                <tr>
                    <td>Student</td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 80%!important">
                                    <input disabled="disabled" type="text" id="StuName1" ti="2" class="txtbox" placeholder="Name" /></td>
                                <td>Age</td>
                                <td style="width: 18%!important">
                                    <input disabled="disabled" type="text" id="StuAge1" ti="2.1" class="txtbox" placeholder="Age" /></td>


                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>


                <tr>
                    <td>School</td>
                    <td>
                        <input disabled="disabled" type="text" id="StuSchool1" ti="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Home Address</td>
                    <td>
                        <input disabled="disabled" type="text" id="StuAddr1" ti="4" class="txtbox" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 32.5%!important;">
                                    <input disabled="disabled" type="text" id="StuCity1" ti="4" class="txtbox" placeholder="City" /></td>
                                <td>State</td>
                                <td style="width: 30.5%!important; margin-left: -6px;">
                                    <input disabled="disabled" type="text" id="StuState1" ti="4" class="txtbox" style="margin-left: 0%;" placeholder="State" /></td>
                                <td>Zip</td>
                                <td style="width: 42.5%!important">
                                    <input disabled="disabled" type="text" id="StuZip1" ti="4" class="txtbox" placeholder="Zip" /></td>
                            </tr>
                        </table>



                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>
                        <input disabled="disabled" type="text" id="StuHomePhone1" ti="4" class="txtbox" placeholder="Phone" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>

                <tr>
                    <td>Doctor</td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 80%!important">
                                    <input type="text" id="DoctorName" ti="2" class="txtbox" placeholder="Doctor Name" /></td>
                                <td>Phone</td>
                                <td style="width: 18%!important">
                                    <input type="text" id="DoctorPhone" ti="2.1" class="txtbox" placeholder="Phone" /></td>


                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="blanlTd"></td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd" style="height: 20px;"></td>
                </tr>
                <tr>
                    <td colspan="2">Emergency Contact:
                        <input type="radio" name="emer1" class="emer1" value="1" />
                        Relative  
                        <input type="radio" name="emer1" class="emer1" value="2" />
                        Neighbor
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd" style="height: 20px;"></td>
                </tr>

                <tr>
                    <td>Name</td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 80%!important">
                                    <input type="text" id="EmerName" ti="2" class="txtbox" placeholder="Name" /></td>
                                <td>Phone</td>
                                <td style="width: 18%!important">
                                    <input type="text" id="EmerPhone" ti="2.1" class="txtbox" placeholder="Phone" /></td>


                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd" style="height: 20px;"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" id="chkAcceptedConditions" value="Accept" />In the event of an emergency where I (or my spouse) cannot be cannot be contacted, I authorize Tutoring Club to secure   whatever medical care is necessary for the safety and well being of my child.I will assume all costs incurred for - emergency care. </td>
                </tr>
                <tr>
                    <td colspan="2" class="blanlTd" style="height: 20px;"></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <button name="submit" disabled="disabled" type="submit" id="SaveUpdates" data-submit="...Sending" style="background: grey; margin-top: 10px;">Save Updates</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <table id="calendar-demo" class="calendar"></table>
    <style>
        .fullDiv {
            width: 100%;
            border: none !important;
        }

            .fullDiv input[type=text] {
                min-width: 100% !important;
            }

        input[type=text] {
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            box-shadow: none !important;
            border-radius: 0px !important;
        }

        textarea {
            min-width: 100% !important;
        }

        #leftDiv, #rightDiv {
            border: 0px solid #ccc;
            height: auto !important;
        }
    </style>

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

            data.Know_tutoringClub = $("#StuHearTC1").val() + "~" + $("#StuHearTC2").val() + "~" + $("#StuHearTC3").val();
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



            data.AdditionalComments = $("#AddCom1").val() + "~" + $("#AddCom2").val() + "~" + $("#AddCom3").val();


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
                    $("#StuHearTC2").val(objStudent[0].Know_tutoringClub.split('~')[1]);
                    $("#StuHearTC3").val(objStudent[0].Know_tutoringClub.split('~')[2]);

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

                    $(".rdoQ1[value=" + objStudent[0].Question1 + "]").click();
                    $(".rdoQ2[value=" + objStudent[0].Question2 + "]").click();
                    $(".rdoQ3[value=" + objStudent[0].Question3 + "]").click();
                    $(".rdoQ4[value=" + objStudent[0].Question4 + "]").click();
                    $(".rdoQ5[value=" + objStudent[0].Question5 + "]").click();


                    $("#AddCom1").val(objStudent[0].AdditionalComments.split('~')[0]);
                    $("#AddCom2").val(objStudent[0].AdditionalComments.split('~')[1]);
                    $("#AddCom3").val(objStudent[0].AdditionalComments.split('~')[2]);

                    $(".Q1[value=" + objStudent[0].MedicalQuestion1.split('~')[0] + "]").click();
                    $(".Q2[value=" + objStudent[0].MedicalQuestion2.split('~')[0] + "]").click();
                    $(".Q3[value=" + objStudent[0].MedicalQuestion3.split('~')[0] + "]").click();
                    $(".Q4[value=" + objStudent[0].MedicalQuestion4.split('~')[0] + "]").click();
                    $(".Q5[value=" + objStudent[0].MedicalQuestion5.split('~')[0] + "]").click();
                    $(".Q6[value=" + objStudent[0].MedicalQuestion6.split('~')[0] + "]").click();
                    $(".Q7[value=" + objStudent[0].MedicalQuestion7.split('~')[0] + "]").click();
                    $(".Q8[value=" + objStudent[0].MedicalQuestion8.split('~')[0] + "]").click();
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


    </script>
    <style>
        input[type=text] {
            width: 100% !important;
        }
    </style>
    <div style="height: 100px; width: 100%;"></div>
</asp:Content>

