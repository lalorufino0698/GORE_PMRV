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

public partial class WF_Configurar_Tipo_Prestamo : System.Web.UI.Page
{
    Tipo_Prestamo Tpre = new Tipo_Prestamo();
    N_Tipo_Prestamo NTpre = new N_Tipo_Prestamo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tipodeprestamo();
            tipodeprestamoDeshabilitado();
            cargarDatos();
        }

    }
    void cargarDatos()
    {
        ListItem i;
        i = new ListItem("Habilitados", "1");
        DropDownList1.Items.Add(i);
        i = new ListItem("Deshabilitados", "2");
        DropDownList1.Items.Add(i);

    }
    void tipodeprestamo()
    {

        gv_Tabla_Lista_TipoPrestamos.DataSource = NTpre.listarTipoPrestamo();
        gv_Tabla_Lista_TipoPrestamos.DataBind();

    }

    void tipodeprestamoDeshabilitado()
    {

        GridView1.DataSource = NTpre.listarTipoPrestamoDeshabilitado();
        GridView1.DataBind();

    }
    void registrarTipoPrestamo()
    {
        Tpre.VTP_Nombre = TextBox1.Text.ToString();
        Tpre.Tasa = Convert.ToDouble(TextBox3.Text);
        Tpre.TCEA = Convert.ToDouble(TextBox4.Text);
        NTpre.RegistrarTipoPrestamo(Tpre);
        Response.Redirect("WF_Configurar_Prestamo.aspx");


    }

    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        Tpre.PK_ITP_Cod = Convert.ToInt32(txtPK_ITP_Cod.Text);
      
        Tpre.Tasa = Convert.ToDouble(txtTasa.Text);
        Tpre.TCEA = Convert.ToDouble(txtTCEA.Text);
     
        NTpre.ActualizarTipoPrestamo(Tpre);        
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ActualizarTipoPrestamo()", true);
        tipodeprestamo();
    }
    protected void gv_Tabla_Lista_TipoPrestamos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Contains("Actualizar"))
        {
            //decodificar caracteres extraños
            txtPK_ITP_Cod.Text = "" + gv_Tabla_Lista_TipoPrestamos.Rows[index].Cells[0].Text;
            txtVTP_Nombre.Text = HttpUtility.HtmlDecode(gv_Tabla_Lista_TipoPrestamos.Rows[index].Cells[1].Text);            
            txtTasa.Text = gv_Tabla_Lista_TipoPrestamos.Rows[index].Cells[2].Text;
            txtTCEA.Text = gv_Tabla_Lista_TipoPrestamos.Rows[index].Cells[3].Text;
           
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }

        if (e.CommandName.Contains("Deshabilitar"))
        {
            //decodificar caracteres extraños
            txtPK_ITP_Cod.Text = "" + gv_Tabla_Lista_TipoPrestamos.Rows[index].Cells[0].Text;
            Tpre.PK_ITP_Cod = Convert.ToInt32(txtPK_ITP_Cod.Text);
            NTpre.DeshabilitarTipoPrestamo(Tpre);
            Response.Redirect("WF_Configurar_Prestamo.aspx");
        }
    }

    protected void gv_Tabla_Lista_TipoPrestamos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_TipoPrestamos.PageIndex = e.NewPageIndex;
        tipodeprestamo();
    }



    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal2", "$('#myModal2').modal();", true);
        
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        registrarTipoPrestamo();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 1)
        {
            Panel1.Visible = true;
            Habilitar.Visible = false;
        }

        else if(DropDownList1.SelectedIndex == 2)
        {
            Habilitar.Visible = true;
            Panel1.Visible = false;
        }

        else
        {
            Panel1.Visible = true;
            Habilitar.Visible = false;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName.Contains("Habilitar"))
        {
            //decodificar caracteres extraños
            txtPK_ITP_Cod.Text = "" + GridView1.Rows[index].Cells[0].Text;
            Tpre.PK_ITP_Cod = Convert.ToInt32(txtPK_ITP_Cod.Text);
            NTpre.HabilitarTipoPrestamo(Tpre);
            Response.Redirect("WF_Configurar_Prestamo.aspx");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        tipodeprestamoDeshabilitado();
    }
}