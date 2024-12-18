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

public partial class WF_Gestionar_Prestamos : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    Socio soc = new Socio();
    Solicitud sol = new Solicitud();
    N_Prestamo Npre = new N_Prestamo();
    Cuota cuo = new Cuota();
    N_Cuota Ncuo = new N_Cuota();
    Pago pag = new Pago();
    N_Pagos Npag = new N_Pagos();
    Movimiento mov = new Movimiento();
    N_Movimiento Nmov = new N_Movimiento();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gv_ListarPrestamos.PageIndex = 0;
            
            txtDNISocio.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event);");
            ddlPrestamo.Visible = false;
            Limpiar();
        }
    }
    public void Limpiar()
    {
        txtDNISocio.Text = "";
        ddlPrestamo.Visible = false;
        gv_ListarPrestamos.Visible = false;
    }

    public void listarPrestamoDdl()
    {
        soc.IS_Dni = Convert.ToInt32(txtDNISocio.Text);
        ddlPrestamo.DataSource = Npre.listarPrestamosxDniSocio(soc);
        ddlPrestamo.DataTextField = "N_PRESTAMO";
        ddlPrestamo.DataBind();
        ddlPrestamo.Items.Insert(0, "Seleccione un Préstamo");
    }


    void listarPrestamosxDNISocios()
    {
        soc.IS_Dni = Convert.ToInt32(txtDNISocio.Text);
        gv_ListarPrestamos.DataSource = Npre.ConsultarPrestamosxDNISocio(soc);
        gv_ListarPrestamos.DataBind();
    }
    
    protected void btnBuscar_Click(object sender, EventArgs e)
    {                
        if (txtDNISocio.Text != "")
        {
            ddlPrestamo.Visible = true;
            listarPrestamoDdl();
        }
        else 
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "IngreseDatos()", true);
        }
       
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }

    protected void gv_ListarPrestamos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_ListarPrestamos.PageIndex = e.NewPageIndex;
        int selectedValue = Convert.ToInt32(ddlPrestamo.SelectedValue);
        ActualizarGridView(selectedValue);

        // Obtener el número total de páginas después de cambiar la página
        int pageCount = gv_ListarPrestamos.PageCount;

    }
    protected void gv_ListarPrestamos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    protected void gv_ListarPrestamos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }
    protected void gv_ListarCuotas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
        

    }
    protected void gv_ListarCuotas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      
    }    
    protected void gv_ListarCuotas_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void ddlPrestamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedValue = Convert.ToInt32(ddlPrestamo.SelectedValue);
        ActualizarGridView(selectedValue);
  
    }
    private void ActualizarGridView(int selectedValue)
    {
       
        pre.PK_IPre_Cod = selectedValue;
        DataTable dt = Npre.listarCronogramaPrestamosxDniSocio(pre);
        gv_ListarPrestamos.DataSource = dt;
        gv_ListarPrestamos.DataBind();
        gv_ListarPrestamos.Visible = true;
    }

   

}