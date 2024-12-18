using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using GestionDatos;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.IO;

public partial class WF_Configurar_Movimientos : System.Web.UI.Page
{
    Configuracion Tconf = new Configuracion();
    N_Configuracion Nconf = new N_Configuracion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tipodemovimientos();

        }


    }
    void tipodemovimientos()
    {

        gv_Tabla_ConfigurarMovimientos.DataSource = Nconf.listarTipoMovimientos();
        gv_Tabla_ConfigurarMovimientos.DataBind();
    }
    void registrarMovimientos()
    {
        Tconf.VCon_Tipo_Movimiento = TextBox1.Text.ToString();
        Tconf.ICon_Monto = Convert.ToDouble(TextBox3.Text);
        Nconf.RegistrarConfiguracion(Tconf);
        Response.Redirect("WF_Configurar_Movimientos.aspx");


    }


    protected void btnEditar_Click(object sender, EventArgs e)
    {
        Tconf.PK_ICon_Cod = Convert.ToInt32(txtPK_ICon_Cod.Text);
        Tconf.VCon_Tipo_Movimiento = txtVA_Tipo_Movimiento.Text.ToString();
        Tconf.ICon_Monto = Convert.ToInt32(txtIA_Monto.Text);

        Nconf.Editarmovimientos(Tconf);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ActualizarMovimientos()", true);
        tipodemovimientos();
    }
    protected void gv_Tabla_ConfigurarMovimientos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Contains("EDITAR"))
        {
            //decodificar caracteres extraños
            txtPK_ICon_Cod.Text = "" + gv_Tabla_ConfigurarMovimientos.Rows[index].Cells[0].Text;
            txtVA_Tipo_Movimiento.Text = HttpUtility.HtmlDecode(gv_Tabla_ConfigurarMovimientos.Rows[index].Cells[1].Text);
            txtIA_Monto.Text = gv_Tabla_ConfigurarMovimientos.Rows[index].Cells[2].Text;

            //if (Convert.ToBoolean(gv_Tabla_ConfigurarMovimientos.Rows[index].Cells[4].Text) == true)
            //{
            //    rbnSi.Checked = true;
            //    rbnNo.Checked = false;
            //}
            //else
            //{
            //    rbnNo.Checked = true;
            //    rbnSi.Checked = false;
            //}
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }
    }

    protected void gv_Tabla_ConfigurarMovimientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_ConfigurarMovimientos.PageIndex = e.NewPageIndex;
        tipodemovimientos();
    }



    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal2", "$('#myModal2').modal();", true);

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        registrarMovimientos();
    }

}
