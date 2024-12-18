using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using GestionDatos;
using Dominio;
using System.Data;

public partial class WF_Consultar_Solicitudes : System.Web.UI.Page
{
    Solicitud sol = new Solicitud();
    Socio soci = new Socio();
    N_Solicitud Nsol = new N_Solicitud();
    N_Estado_Solicitud nestsol = new N_Estado_Solicitud();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            listarsolicitudes();
            listarCamposDdl();
        }
    }
    void listarsolicitudes()
    {
        gv_Tabla_Lista_Solicitudes.DataSource = Nsol.ListarSolicitudes();
        gv_Tabla_Lista_Solicitudes.DataBind();
    }
    void listarsolicitudesxfecha()
    {
        sol.DSol_Fecha_Registro = Convert.ToDateTime(txtfecha.Text);
        gv_Tabla_Lista_Solicitudes.DataSource = Nsol.ListarSolicitudesxfecha(sol);
        gv_Tabla_Lista_Solicitudes.DataBind();
    }
    void listarsolicitudxestado()
    {
        int codigo = DropDownList1.SelectedIndex;
        sol.FK_IESol_Cod = Convert.ToInt32(codigo);
        gv_Tabla_Lista_Solicitudes.DataSource = Nsol.listarSolicitudesxestad(sol);
      gv_Tabla_Lista_Solicitudes.DataBind();
    }

    protected void gv_Tabla_Lista_Solicitudes_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gv_Tabla_Lista_Solicitudes_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gv_Tabla_Lista_Solicitudes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void btnBuscarSocio_Click(object sender, EventArgs e)
    {
        if (txtsocio.Text != "")
        {


            listarxDni();
        }
        else if (txtfecha.Text != "")

        {

            listarsolicitudesxfecha();

        }


        else
        {
            listarsolicitudes();
        }
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        txtsocio.Text = "";
        txtfecha.Text = "";
        DropDownList1.SelectedValue = "--seleccionar--";
        listarsolicitudes();

    }
    void listarxDni()
    {
        sol.ISol_Dni = int.Parse(txtsocio.Text);
        gv_Tabla_Lista_Solicitudes.DataSource = Nsol.listarsolicitudesxdni(sol);
        gv_Tabla_Lista_Solicitudes.DataBind();

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        listarsolicitudxestado();
        if (DropDownList1.SelectedIndex == 0)
        {
            listarsolicitudes();
        }
    }
    public void listarCamposDdl()
    {
        DropDownList1.DataSource = nestsol.EstadoSolicitud();
        DropDownList1.DataTextField = "VEsol_Estado_Solicitud";
        DropDownList1.DataValueField = "PK_IESol_Cod";
        DropDownList1.DataBind();
       DropDownList1.Items.Insert(0, "--seleccionar--");
    }

    protected void gv_Tabla_Lista_Solicitudes_Sorting(object sender, GridViewSortEventArgs e)
    {
        
        var listaSolicitudes = Nsol.ListarSolicitudes();
        var rows = listaSolicitudes.AsEnumerable();

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
            rows = rows.OrderBy(row => row.Field<DateTime>("DSol_Fecha_Registro"));
        }
        else
        {
            rows = rows.OrderByDescending(row => row.Field<DateTime>("DSol_Fecha_Registro"));
        }
        DataTable dtOrdenado = rows.CopyToDataTable();
        gv_Tabla_Lista_Solicitudes.DataSource = dtOrdenado;
        gv_Tabla_Lista_Solicitudes.DataBind();

    }
}
