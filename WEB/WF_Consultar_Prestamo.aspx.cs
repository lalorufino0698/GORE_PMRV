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
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;

public partial class WF_Consultar_Prestamo : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    N_Prestamo npre = new N_Prestamo();

    N_Socio nsoci = new N_Socio();
    Socio soci = new Socio();
    DateTime fecha;

    Estado_Prestamo estpre = new Estado_Prestamo ();
    N_Estado_Prestamo nestpre = new N_Estado_Prestamo ();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            listarprestamo();
            listarCamposDdl();
        }
    }

    public void listarCamposDdl()
    {
        ddlPrestamoxEstado.DataSource = nestpre.listarPrestamoxEstado();
        ddlPrestamoxEstado.DataTextField = "VEPre_Estado_Prestamo";
        ddlPrestamoxEstado.DataValueField = "PK_IEPre_Cod";
        ddlPrestamoxEstado.DataBind();
        ddlPrestamoxEstado.Items.Insert(0, "Seleccionar Opcion");
    }

    void listarprestamo()
    {

        gv_Tabla_Consuktar_Prestamo.DataSource = npre.ListarConsultarPrestamo();
        gv_Tabla_Consuktar_Prestamo.DataBind();
    }

    void listarprestamoxFecha()
    {
        string fecha = Convert.ToDateTime(txtfecha.Text).ToString("yyyy/MM/dd");
        pre.DPre_Fecha_Registro = Convert.ToDateTime(fecha);
        gv_Tabla_Consuktar_Prestamo.DataSource = npre.ConsultarPrestamoxFecha(pre);
        gv_Tabla_Consuktar_Prestamo.DataBind();
    }
    void listarxDni()
    {
        soci.IS_Dni = int.Parse(txtsocio.Text);
        gv_Tabla_Consuktar_Prestamo.DataSource = npre.ConsultarPrestamoxDni(soci);
        gv_Tabla_Consuktar_Prestamo.DataBind();
    }

    void listarxEstado()
    {
        int codigo = ddlPrestamoxEstado.SelectedIndex;
        pre.FK_IEPre = Convert.ToInt32(codigo);
        gv_Tabla_Consuktar_Prestamo.DataSource = npre.ConsultaEstadoDePrestamos(pre);
        gv_Tabla_Consuktar_Prestamo.DataBind();

    }
        
  
    protected void gv_Tabla_Consuktar_Prestamo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        

    }

    protected void gv_Tabla_Consuktar_Prestamo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {   


      
            gv_Tabla_Consuktar_Prestamo.PageIndex = e.NewPageIndex;
            listarprestamo();
      
    

  

    }

    protected void gv_Tabla_Consuktar_Prestamo_DataBound(object sender, EventArgs e)
    {
      
    }

    protected void gv_Tabla_Consuktar_Prestamo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Text = Convert.ToDateTime(e.Row.Cells[1].Text).ToString("dd/MM/yyyy");
        }

    
    }

    protected void txtFillter_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnConsultarFecha_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        txtsocio.Text = "";
        txtfecha.Text = "";
        ddlPrestamoxEstado.SelectedValue = "Seleccionar Opcion";
        listarprestamo();
    }

    protected void btnBuscarSocio_Click(object sender, EventArgs e)
    {
        if (txtsocio.Text != "")
        {
            
           
            listarxDni();
        }
        else if(txtfecha.Text != "")

        {

            listarprestamoxFecha();
          
        }

        
        else
        {
            listarprestamo();
        }

   

    }

    protected void ddlPrestamoxEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        listarxEstado();

        if (ddlPrestamoxEstado.SelectedIndex ==0)
        {
            listarprestamo();
        }
    }




    protected void gv_Tabla_Consuktar_Prestamo_Sorting(object sender, GridViewSortEventArgs e)
    {
        var listaPrestamo = npre.ListarConsultarPrestamo();
        var rows = listaPrestamo.AsEnumerable();

        string sortExpression = e.SortExpression;
        // Obtén el estado de orden actual desde la ViewState o una variable de sesión
        string sortDirection = Session["SortDirection"] as string;
        if (string.IsNullOrEmpty(sortDirection))
        {
            sortDirection = "ASC"; // Por defecto, orden ascendente en la primera vez
        }

        // Cambia la dirección de ordenación en cada clic
        sortDirection = (sortDirection == "ASC") ? "DESC" : "ASC";

        // Guarda el estado de orden actual en la ViewState o una variable de sesión
        Session["SortDirection"] = sortDirection;
        if (sortDirection == "ASC")
        {
            rows = rows.OrderBy(row => row.Field<DateTime>("FechaRegistro"));
        }
        else
        {
            rows = rows.OrderByDescending(row => row.Field<DateTime>("FechaRegistro"));
        }
        DataTable dtOrdenado = rows.CopyToDataTable();
        gv_Tabla_Consuktar_Prestamo.DataSource = dtOrdenado;
        gv_Tabla_Consuktar_Prestamo.DataBind();
    }
}