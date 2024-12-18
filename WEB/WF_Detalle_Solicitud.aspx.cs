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

public partial class WF_Detalle_Solicitud : System.Web.UI.Page
{

    Afiliacion afilia = new Afiliacion();
    N_Afiliacion Nafilia = new N_Afiliacion();

    
    Patrocinador patro = new Patrocinador();
    N_Patrocinador Npatro = new N_Patrocinador();
    Solicitud soli = new Solicitud();
    N_Solicitud Nsoli = new N_Solicitud();

    Estado_Solicitud es = new Estado_Solicitud();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CodSoliGrid"] == null)
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                txtCodSoliGrid.Text = Session["CodSoliGrid"].ToString();
               
                mostrarDatosSolicitud();
                buscarPatrocinador();
                RetornarImagenes();
                validarAccion();
            }

        }

    }


    void mostrarDatosSolicitud()
    {
        soli.PK_ISol_Cod = int.Parse(txtCodSoliGrid.Text);
        Nsoli.consultarSolicitud(soli,es, afilia);
        txtDni.Text = "" + soli.ISol_Dni;
        txtNombreCompleto.Text = "" + soli.VSol_Nombre_Completo + " " + soli.VSol_Apellido_Paterno + " " + soli.VSol_Apellido_Materno;
        //txtApaterno.Text = "" + soli.VSol_Apellido_Paterno;
        //txtAmaterno.Text = "" + soli.VSol_Apellido_Materno;

        txtCelular.Text = "" + soli.ISol_Celular;
        txtTfijo.Text = "" + soli.ISol_Telefono_Fijo;
        txtCorreo.Text = "" + soli.VSol_Correo;
        txtDireccion.Text = "" + soli.VSol_Direccion;
        txtfechaNac.Text = "" + soli.DSol_Fecha_Nacimiento;
        string date = DateTime.Parse(txtfechaNac.Text).ToString("dd/MM/yyyy");
        txtfechaNac.Text = date;
        txtFechaRegistro.Text = "" + soli.DSol_Fecha_Registro;
        string regis = DateTime.Parse(txtFechaRegistro.Text).ToString("dd/MM/yyyy");
        txtFechaRegistro.Text = regis;
        txtDepartamento.Text = "" + soli.VSol_Departamento;
        txtProvincia.Text = "" + soli.VSol_Provincia;
        txtEcivil.Text = "" + soli.VSol_Estado_Civil;     
        txtEsolicitud.Text = "" + es.VEsol_Estado_Solicitud;
        txtCodPatrocinador.Text = "" + afilia.IA_Cod_Patrocinador;
        txtAfiliacion.Text = "" + soli.FK_IA_Cod;
        txtOcupacion.Text = "" + soli.VSol_Ocupacion;



        mostrarDatosEnabled();

    }

    void buscarPatrocinador()
    {

        patro.IPa_Dni = int.Parse(txtCodPatrocinador.Text);
        Npatro.buscarPatrocinadorDni(patro);
        txtcodpatrooooci.Text = "" + patro.PK_IPa_Cod;
        if (int.Parse(txtcodpatrooooci.Text) != 0)
        {
            
            txtNomPatrocinador.Text = patro.VPa_Nombre_Completo + " " + patro.VPa_Apellido_Paterno + " " + patro.VPa_Apellido_Materno;

        }
        else if (int.Parse(txtcodpatrooooci.Text) == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "altertPatrocinadorNovalido()", true);
          
        }

    }
    void validarAccion()
    {
        if(txtEsolicitud.Text == "Pendiente")
        {
            aceptadas.Visible = true;
            aceptadas.Visible = false;
            denegadas.Visible = false;
            btnatras.Visible = true;
        }
        if (txtEsolicitud.Text == "Aceptado")
        {
            pendientes.Visible = false;
            aceptadas.Visible = true;
            denegadas.Visible = false;
            btnatras.Visible = false;
        }
        if (txtEsolicitud.Text == "Denegado")
        {
            pendientes.Visible = false;
            aceptadas.Visible = false;
            denegadas.Visible = true;
            btnatras.Visible = false;
        }
    }

    void mostrarDatosEnabled()
    {
        txtNombreCompleto.Enabled = false;
        txtDni.Enabled = false;
        txtCelular.Enabled = false;
        txtTfijo.Enabled = false;
        txtDepartamento.Enabled = false;
        txtProvincia.Enabled = false;
        txtEcivil.Enabled = false;
        txtOcupacion.Enabled = false;
        txtEsolicitud.Enabled = false;
        txtAfiliacion.Enabled = false;
        txtfechaNac.Enabled = false;
        txtFechaRegistro.Enabled = false;
        txtCorreo.Enabled = false;
        txtDireccion.Enabled = false;
        txtCodPatrocinador.Enabled = false;
        txtNomPatrocinador.Enabled = false;
    }
    void RetornarImagenes()
    {
        soli.PK_ISol_Cod = int.Parse(txtCodSoliGrid.Text);
        Nsoli.BuscarSolicitud(soli);

        SqlConnection connectionSQL = new SqlConnection(GD_ConexionBD.CadenaConexion);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT IMSol_Recibo_Luz,IMSol_Recibo_agua, IMSol_Imagen_Vivienda, IMSol_Constancia FROM T_Solicitud WHERE PK_ISol_Cod=" + int.Parse(txtCodSoliGrid.Text);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connectionSQL;
        connectionSQL.Open();

        DataTable ima = new DataTable();
        ima.Load(cmd.ExecuteReader());

        Repeater2.DataSource = ima;
        Repeater2.DataBind();
        connectionSQL.Close();

    }

    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Listar_Solicitud_Afiliacion.aspx");
    }
}