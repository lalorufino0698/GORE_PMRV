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
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.ClientServices;
using System.Net;
using System.IO;

public partial class WF_Detalle_Prestamo_Imagenes : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CodPreGrid"] == null)
            {
                Response.Redirect("Inicio.aspx");

            }
            else
            {
                txtCodSoliGrid.Text = Session["CodPreGrid"].ToString();
                txtestado.Text = Session["CodEstadoGrid"].ToString();
                RetornarImagenes();
                validarAccion();
            }
        }
    }

    void RetornarImagenes()
    {
        pre.PK_IPre_Cod = int.Parse(txtCodSoliGrid.Text);
        //Npre.BuscarSolicitud(soli);

        SqlConnection connectionSQL = new SqlConnection(GD_ConexionBD.CadenaConexion);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT IMPre_Copia_DNI,IMPre_Libreta_Socio,IMPre_Declaracion_Salud,IMPre_FPP,IMPre_Aportes_Sociales,IMPre_Declaracion_Jurada,IMPre_Boleta_Pago,IMPre_Declaracion_Ingresos,IMPre_Ingresos_Notariales FROM T_Prestamo WHERE PK_IPre_Cod=" + int.Parse(txtCodSoliGrid.Text);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connectionSQL;
        connectionSQL.Open();

        DataTable ima = new DataTable();
        ima.Load(cmd.ExecuteReader());

        Repeater2.DataSource = ima;
        Repeater2.DataBind();
        Repeater1.DataSource = ima;
        Repeater1.DataBind();
        Repeater3.DataSource = ima;
        Repeater3.DataBind();

        Repeater4.DataSource = ima;
        Repeater4.DataBind();

        connectionSQL.Close();

    }

    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Listar_Prestamos.aspx");
    }

    void validarAccion()
    {
        if (txtestado.Text == "En Proceso")
        {
            aceptadas.Visible = true;
            aceptadas.Visible = false;
            denegadas.Visible = false;
            btnatras.Visible = true;
        }
        if (txtestado.Text == "Aceptado")
        {

            aceptadas.Visible = true;
            denegadas.Visible = false;
            btnatras.Visible = false;
        }
        if (txtestado.Text == "Rechazado")
        {

            aceptadas.Visible = false;
            denegadas.Visible = true;
            btnatras.Visible = false;
        }
    }
}