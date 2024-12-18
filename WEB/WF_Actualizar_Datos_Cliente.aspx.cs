using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using GestionDatos;
using Negocio;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.ClientServices;
using System.Net;
using System.IO;
using System.Drawing;
public partial class WF_Actualizar_Datos_Cliente : System.Web.UI.Page
{
    Socio soc = new Socio();
    N_Socio Nsoci = new N_Socio();
    Solicitud sol = new Solicitud();
    Estado_Socio es = new Estado_Socio();
    HelperEmail helperEmail = new HelperEmail();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["dni"] == null)
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                EnabledDatos();
                txtCodSoliGrid.Text = Session["dni"].ToString();
                mostrarDatosSocio();
                if (txtsituacionLaboral.Text == "SIN REGISTRAR" || txtprofesion.Text == "SIN REGISTRAR" || txtvivienda.Text == "SIN REGISTRAR" || txtrubro.Text == "SIN REGISTRAR" || txtFrecuencia.Text=="SIN REGISTRAR")
                {
                    LinkButton1.Visible = false;
                    LinkButton3.Visible = true;
                }
                else
                {
                    LinkButton1.Visible =false;
                }
               
                afiSocio();
                DatosPatrocinador();
            }

        }
    }

  

    void mostrarDatosSocio()
    {
        soc.IS_Dni = int.Parse(txtCodSoliGrid.Text);
        Nsoci.consultarSocio(soc, sol, es);

        txtsolicitud.Text = "" + sol.PK_ISol_Cod;
        txtdni.Text = "" + soc.IS_Dni;
        txtnombre.Text = "" + soc.VS_Nombre_Completo;
        txtapellido.Text = "" + soc.VS_Apellido_Paterno + " " + soc.VS_Apellido_Materno;
        txtcelular.Text = "" + sol.ISol_Celular;
        txtdirreccion.Text = "" + sol.VSol_Direccion;
        txtdepartamento.Text = "" + sol.DepartamentoResidencia;
        txtestadocivil.Text = "" + sol.VSol_Estado_Civil;
        txtdistrito.Text = "" + sol.VSol_Distrito;
        txtfecha.Text = "" + sol.DSol_Fecha_Nacimiento.ToString("dd/MM/yyyy");
        txttelefono.Text = "" + sol.ISol_Telefono_Fijo;
        txtemail.Text = "" + sol.VSol_Correo;
        txtestado.Text = "" + es.VESocio_Estado_Socio;
        txtregistro.Text = "" + sol.DSol_Fecha_Registro.ToString("dd/MM/yyyy");
        txtvivienda.Text = "" + soc.VS_Tipo_Vivienda;
        if (txtvivienda.Text == "")
        {
            ddlTipoVivienda.Visible = false;
            txtvivienda.Visible = true;
            txtvivienda.Text = "SIN REGISTRAR";
            txtvivienda.ForeColor = System.Drawing.Color.Red;
        }
        else 
        { 
            txtvivienda.Visible = true;
            ddlTipoVivienda.Visible = false;
        }

        txtprofesion.Text = "" + soc.VS_Profesion;
        if (txtprofesion.Text == "")
        {
            ddlocupacion.Visible = false;
            txtprofesion.Visible = true;
            txtprofesion.Text = "SIN REGISTRAR";
            txtprofesion.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            txtprofesion.Visible = true;
            ddlocupacion.Visible = false;
        }

        txtsituacionLaboral.Text = "" + soc.VS_Situacion_Laboral;
        if (txtsituacionLaboral.Text == "") 
        {
            ddlSituacionLaboral.Visible = false;
            txtsituacionLaboral.Visible = true;
            txtsituacionLaboral.Text = "SIN REGISTRAR";
            txtsituacionLaboral.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            txtsituacionLaboral.Visible = true;
            ddlSituacionLaboral.Visible = false;
        }

        txtrubro.Text = "" + soc.VS_Rubro;
        if (txtrubro.Text == "")
        {
            ddlRubro.Visible = false;
            txtrubro.Visible = true;
            txtrubro.Text = "SIN REGISTRAR";
            txtrubro.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            txtrubro.Visible = true;
            ddlRubro.Visible = false;
        }

        txtFrecuencia.Text = "" + soc.VS_Frecuencia;
        if (txtFrecuencia.Text == "")
        {
            ddlFrecuenciaSalarial.Visible = false;
            txtFrecuencia.Visible = true;
            txtFrecuencia.Text = "SIN REGISTRAR";
            txtFrecuencia.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            txtFrecuencia.Visible = true;
            ddlFrecuenciaSalarial.Visible = false;
        }

        fsNormal.Visible = true;
        fsEdit.Visible = false;
        rubroNormal.Visible = true;
        rubroEdit.Visible = false;
        slNormal.Visible = true;
        slEdit.Visible = false;
    }


    void afiSocio()
    {
        Afiliacion afi = new Afiliacion();
        soc.IS_Dni = int.Parse(txtdni.Text);
        Nsoci.BuscarSocioAfiPatro(soc,afi);
        txtpkafi.Text = " " + afi.PK_IA_Cod;
        txtcodafi.Text = " " + afi.IA_Cod_Patrocinador;


    }
    void DatosPatrocinador() {

        Patrocinador patro = new Patrocinador();
        patro.IPa_Dni = int.Parse(txtcodafi.Text);
        Nsoci.BuscarSocioDatosPatro(patro);
        txtrepresentante.Text = patro.VPa_Nombre_Completo+ " " + patro.VPa_Apellido_Paterno + " " + patro.VPa_Apellido_Materno;
    }

    void EnabledDatos()
    {
        txtdni.Enabled = false;
        txtnombre.Enabled = false;
        txtapellido.Enabled = false;
        txtdistrito.Enabled = false;
        txtprofesion.Enabled = false;
        txtrubro.Enabled = false;
        txtvivienda.Enabled = false;
        txtsituacionLaboral.Enabled = false;
        txtdepartamento.Enabled = false;
        txtestadocivil.Enabled = false;
        txtregistro.Enabled = false;
        txtestado.Enabled = false;
        txtrepresentante.Enabled = false;
        txtregistro.Enabled = false;
        txtfecha.Enabled = false;
        txtFrecuencia.Enabled = false;
        txtcelular.Enabled = false;
        txttelefono.Enabled = false;
        txtemail.Enabled = false;
        txtdirreccion.Enabled = false;
    }

    protected void btnEnviarCotizacion_Click(object sender, EventArgs e)
    {
       
        sol.PK_ISol_Cod = int.Parse(txtsolicitud.Text);
        soc.PK_IS_Cod = int.Parse(txtdni.Text);
        sol.VSol_Direccion = txtdirreccion.Text;
        sol.VSol_Correo = txtemail.Text;
        if (helperEmail.IsValidEmail((string)txtemail.Text) != true)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoIncorrecto()", true);
            return;
        }
        sol.ISol_Celular = int.Parse(txtcelular.Text);
        sol.ISol_Telefono_Fijo = int.Parse(txttelefono.Text);
        if (ddlSituacionLaboral.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "SituacionLaboralVacio()", true);
            return;
        }

        if (ddlTipoVivienda.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "TipoViviendaVacio()", true);
            return;
        }

        if (ddlocupacion.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ProfesionVacio()", true);
            return;
        }

        if (ddlRubro.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RubroVacio()", true);
            return;
        }
        soc.VS_Situacion_Laboral = ddlSituacionLaboral.Items[ddlSituacionLaboral.SelectedIndex].ToString();
        soc.VS_Rubro = ddlRubro.Items[ddlRubro.SelectedIndex].ToString();
        soc.VS_Frecuencia = ddlFrecuenciaSalarial.Items[ddlFrecuenciaSalarial.SelectedIndex].ToString();
        soc.VS_Tipo_Vivienda = ddlTipoVivienda.Items[ddlTipoVivienda.SelectedIndex].ToString();
        soc.VS_Profesion = ddlocupacion.Items[ddlocupacion.SelectedIndex].ToString();

        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertaagregar()", true);
        Nsoci.RegistrarDatosComplementariosSocio(soc, sol);
        mostrarDatosSocio();
        ddlFrecuenciaSalarial.Visible = false;
        txtFrecuencia.Visible = true;
        ddlTipoVivienda.Visible = false;
        txtvivienda.Visible = true;
        ddlRubro.Visible = false;
        txtrubro.Visible = true;
        ddlSituacionLaboral.Visible = false;
        txtsituacionLaboral.Visible = true;
        txtdirreccion.Enabled = false;
        txtemail.Enabled = false;
        txttelefono.Enabled = false;
        txtcelular.Enabled = false;
        LinkButton1.Visible = false;
        LinkButton3.Visible = true;


    }

    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_InicioSocio.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {

        fsNormal.Visible = false;
        fsEdit.Visible = true;
        rubroNormal.Visible = false;
        rubroEdit.Visible = true;
        slNormal.Visible = false;
        slEdit.Visible = true;

        ddlocupacion.Visible = true;
        txtprofesion.Visible = false;
        ddlFrecuenciaSalarial.Visible = true;
        txtFrecuencia.Visible = false;
        ddlTipoVivienda.Visible = true;
        txtvivienda.Visible = false;
        ddlRubro.Visible = true;
        txtrubro.Visible = false;
        ddlSituacionLaboral.Visible = true;
        txtsituacionLaboral.Visible = false;
        txtdirreccion.Enabled = true;
        txtemail.Enabled = true;
        txttelefono.Enabled = true;
        txtcelular.Enabled = true;
        LinkButton1.Visible = true;
        LinkButton3.Visible = false;
   


        txtcelular.BorderStyle = BorderStyle.Solid;
        txtcelular.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        txtcelular.BorderWidth = Unit.Pixel(2); // Ca
        txttelefono.BorderStyle = BorderStyle.Solid;
        txttelefono.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        txttelefono.BorderWidth = Unit.Pixel(2); // Ca
        txtemail.BorderStyle = BorderStyle.Solid;
        txtemail.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        txtemail.BorderWidth = Unit.Pixel(2); // Ca
        txtdirreccion.BorderStyle = BorderStyle.Solid;
        txtdirreccion.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        txtdirreccion.BorderWidth = Unit.Pixel(2); // Ca
        ddlFrecuenciaSalarial.BorderStyle = BorderStyle.Solid;
        ddlFrecuenciaSalarial.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        ddlFrecuenciaSalarial.BorderWidth = Unit.Pixel(2); // Ca
        ddlTipoVivienda.BorderStyle = BorderStyle.Solid;
        ddlTipoVivienda.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        ddlTipoVivienda.BorderWidth = Unit.Pixel(2); // Ca
        ddlRubro.BorderStyle = BorderStyle.Solid;
        ddlRubro.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        ddlRubro.BorderWidth = Unit.Pixel(2); // Ca
        ddlSituacionLaboral.BorderStyle = BorderStyle.Solid;
        ddlSituacionLaboral.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        ddlSituacionLaboral.BorderWidth = Unit.Pixel(2); // Ca
        ddlocupacion.BorderStyle = BorderStyle.Solid;
        ddlocupacion.BorderColor = ColorTranslator.FromHtml("#00BFE3"); //
        ddlocupacion.BorderWidth = Unit.Pixel(2); // Ca


    }
}
