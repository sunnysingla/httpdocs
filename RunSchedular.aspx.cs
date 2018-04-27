using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RunSchedular : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenralFunction gf = new GenralFunction();
        DataSet dsResult = new DataSet();
        gf.Filldatasetvalue(null, "sp_testing", dsResult, null);
    }
}