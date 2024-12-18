using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using GestionDatos;

public partial class Home : System.Web.UI.MasterPage
{

    Patrocinador patro = new Patrocinador();
    N_Patrocinador Npatro = new N_Patrocinador();

    Afiliacion objafi = new Afiliacion();
    GD_Afiliacion objgdAfi = new GD_Afiliacion();
    N_Afiliacion Nafilia = new N_Afiliacion();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //txtCodPat.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event);");
            //txtDni.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event);");
            //txtNomCompleto.Attributes.Add("onkeypress", "javascript:return SoloLetrasYEsp(event);");
            //txtApa.Attributes.Add("onkeypress", "javascript:return SoloLetrasYEsp(event);");
            //txtAma.Attributes.Add("onkeypress", "javascript:return SoloLetrasYEsp(event);");
            //txtCodPat.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event);");
            //txtPatro.Attributes.Add("onkeypress", "javascript:return SoloLetrasYEsp(event);");

            //txtPatro.Visible = false;
            //btnEnviarConsulta.Visible = true;
            //btnatras.Visible = false;
            //btnRegistrar.Visible = false;


        }
    }


    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }
    protected void btnEnviarConsulta_Click(object sender, EventArgs e)
    {

        //if (txtDni.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDniVacio()", true);
        //    return;
        //}

        //if (txtDni.Text.Trim().Length != 8)
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDNICorrecto()", true);
        //    return;
        //}


        //if (txtNomCompleto.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertNombreCompletoVacio()", true);
        //    return;
        //}
        //if (txtApa.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertApellidoPaternoVacio() ", true);
        //    return;
        //}
        //if (txtAma.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertApellidoMaternoVacio()", true);
        //    return;
        //}
        //if (txtCorreo.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoVacio()", true);
        //    return;
        //}
        //if (IsValidEmail((string)txtCorreo.Text) != true)
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoIncorrecto()", true);
        //    return;
        //}
        //if (txtCodPat.Text == "")
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCodPatrocinadorVacio()", true);
        //    return;
        //}
        //if (txtCodPat.Text.Trim().Length != 8)
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "altertPatrocinadorNovalido()", true);
        //    return;
        //}
     

        //buscarPatrocinador();
       

    }

   

    void bloquearCampos() 
    {
        //txtDni.Enabled = false;
        //txtNomCompleto.Enabled = false;
        //txtApa.Enabled = false;
        //txtAma.Enabled = false;
        //txtCorreo.Enabled = false;
        //txtCodPat.Enabled = false;
        //btnEnviarConsulta.Visible = false;
        //btnRegistrar.Visible = true;
        //btnatras.Visible = true;
    }

    void habilitarCampos()
    {
        //txtDni.Enabled = true;
        //txtNomCompleto.Enabled = true;
        //txtApa.Enabled = true;
        //txtAma.Enabled = true;
        //txtCorreo.Enabled = true;
        //txtCodPat.Enabled = true;
        //btnEnviarConsulta.Visible = true;
        //btnRegistrar.Visible = false;
        //btnatras.Visible = false;

    }

    void buscarPatrocinador() 
    {

        //patro.IPa_Dni = int.Parse(txtCodPat.Text);
        //Npatro.buscarPatrocinadorDni(patro);
        //txtpa.Text = "" + patro.PK_IPa_Cod;
        //if (int.Parse(txtpa.Text) != 0)
        //{
        //    txtdnipatrocinador.Text = "" + patro.IPa_Dni;
        //    txtPatro.Text = patro.VPa_Nombre_Completo + " " + patro.VPa_Apellido_Paterno + " " + patro.VPa_Apellido_Materno;
        //    lblcantafiliabus.Text = "" + patro.IPa_Cantidad_Afiliaciones;

        //    if (txtCodPat.Text == txtdnipatrocinador.Text)
        //    {
        //        if (int.Parse(lblcantafiliabus.Text) >= 3)
        //        {
        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "EvitarAfiliacion()", true);
        //        }
        //        else
        //        {
        //            enviarSolicitud();
        //        }
              
               
        //    }

        //}
        //else if (int.Parse(txtpa.Text) == 0)
        //{
        //  Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "altertPatrocinadorNovalido()", true);
        //    habilitarCampos();
        //}

    }
    void enviarSolicitud()
    {
        //objafi.IA_Dni = int.Parse(txtDni.Text);
        //objafi.VA_Nombre_Completo = txtNomCompleto.Text;
        //objafi.VA_Apellido_Paterno = txtApa.Text;
        //objafi.VA_Apellido_Materno = txtAma.Text;
        //objafi.VA_Correo = txtCorreo.Text;
        //objafi.IA_Cod_Patrocinador = int.Parse(txtCodPat.Text);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "enviarConsulta()", true);
        //Nafilia.RegistrarAfiliacion(objafi);

        //bloquearCampos();
        //txtPatro.Enabled = false;
        //txtPatro.Visible = true;


     
    }


   void buscarAfiliacion()
    {
        //objafi.IA_Dni = int.Parse(txtDni.Text);
        //Nafilia.buscarAfiliacionDni(objafi);
        //txtafi.Text = "" + objafi.PK_IA_Cod;
    }

    void limpiarCampos()
    {
        //txtDni.Text = "";
        //txtDni.Text = "";
        //txtNomCompleto.Text = "";
        //txtApa.Text = "";
        //txtAma.Text = "";
        //txtCodPat.Text = "";
        //txtCorreo.Text = "";
        //txtPatro.Text = "";
    }




    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("Inicio.aspx");
        limpiarCampos();
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        //buscarAfiliacion();

        //Session["CodAfilia"] = "" + txtafi.Text;
        //Session["CodPatro"] = "" + txtCodPat.Text;
        //Session["DatosPatro"] = "" + txtPatro.Text;
        //Session["Dni"] = "" + txtDni.Text;
        //Session["Nom"] = "" + txtNomCompleto.Text;
        //Session["Apaterno"] = "" + txtApa.Text;
        //Session["Amaterno"] = "" + txtAma.Text;
        //Session["correo"] = "" + txtCorreo.Text;

        //Response.Redirect("WF_Registrar_Solicitud.aspx");


    }
}
