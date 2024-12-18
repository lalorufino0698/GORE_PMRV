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

using System.Windows;
using System.Data.SqlClient;
using System.Net;
using System.ComponentModel.DataAnnotations;
using System.Configuration;


public partial class WF_Registrar_Plataforma : System.Web.UI.Page
{

    Usuario usu = new Usuario();
    N_Usuario Nusu = new N_Usuario();
    Empresa emp = new Empresa();
    N_Empresa Nemp = new N_Empresa();
    string password = ConfigurationManager.AppSettings["PasswordTemp"];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            actualizarProfile();
            CargarRegiones();
            CargarRoles();
        }
    }
    private void actualizarProfile()
    {
        Nemp.buscarLogo(emp);
        Label1.Text = "" + emp.PK_IEmp_Cod;
        if (int.Parse(Label1.Text) != 0)
        {
            byte[] imagen = emp.IMGE_Logo;
            if (imagen != null)
            {
                string stbase64 = Convert.ToBase64String(imagen);
                profile.ImageUrl = "data:image/png;base64," + stbase64;
            }
            else
            {
                profile.ImageUrl = "img/gore_img/cafed.png";
            }

        }
        else if (int.Parse(Label1.Text) == 0)
        {
            profile.ImageUrl = "img/gore_img/cafed.png";
        }

    }

    private void CargarRegiones()
    {
        N_Region negocioRegion = new N_Region(); // Instancia de la capa de negocio
        List<Region> listaRegiones = negocioRegion.ObtenerRegion();

        ddlRegion.DataSource = listaRegiones;          // Asigna la lista de regiones
        ddlRegion.DataTextField = "VRE_nombreRegion";      // Propiedad que se mostrará en el dropdown
        ddlRegion.DataValueField = "PK_IRE_cod";         // Propiedad que representará el valor de cada opción
        ddlRegion.DataBind();

        ddlRegion.Items.Insert(0, new ListItem("Seleccione una Región", "0"));
        ddlRegion.Items[0].Attributes["disabled"] = "disabled"; // Opción inicial
    }
    private void CargarInstituciones(string regionNombre)
    {
        N_InstitucionEducativa negocioInstitucion = new N_InstitucionEducativa(); // Instancia de la capa de negocio
        List<InstitucionEducativa> listaInstituciones = negocioInstitucion.ObtenerInstitucionesPorNombreRegion(regionNombre);

        ddlInstitucion.DataSource = listaInstituciones;       // Asigna la lista de instituciones
        ddlInstitucion.DataTextField = "nombreInstitucion";   // Propiedad que se mostrará en el dropdown
        ddlInstitucion.DataValueField = "PK_IIE_cod";      // Propiedad que representará el valor de cada opción
        ddlInstitucion.DataBind();

        ddlInstitucion.Items.Insert(0, new ListItem("Seleccione una Institución", "0"));
        ddlInstitucion.Items[0].Attributes["disabled"] = "disabled"; // Opción inicial
        ddlInstitucion.Items[0].Selected = true;
    }

    private void CargarRoles()
    {
        N_Roles negocioRoles = new N_Roles(); // Instancia de la capa de negocio
        List<Roles> listaRoles = negocioRoles.ObtenerRoles();

        ddlCargo.DataSource = listaRoles;       // Asigna la lista de instituciones
        ddlCargo.DataTextField = "VRO_Nombre_Rol";   // Propiedad que se mostrará en el dropdown
        ddlCargo.DataValueField = "PK_IRo_Cod";      // Propiedad que representará el valor de cada opción
        ddlCargo.DataBind();

        ddlCargo.Items.Insert(0, new ListItem("Seleccione un Rol", "0"));
        ddlCargo.Items[0].Attributes["disabled"] = "disabled"; // Opción inicial
        ddlCargo.Items[0].Selected = true; 
    }
    private void LimpiarInputs()
    {
        txtNombres.Text = "";
        txtApellidos.Text = "";
        txtcorreo.Text = "";
        txtDni.Text = "";
        ddlRegion.SelectedIndex = 0;
        ddlInstitucion.SelectedIndex = 0;
        ddlCargo.SelectedIndex = 0;
    }


    void ValidarRegistroPlataforma()
    {
        if (txtNombres.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "nombreVacio()", true);
            return;
        }
        if (txtApellidos.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "apellidoVacio()", true);
            return;
        }
        if (txtcorreo.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "correoVacio()", true);
            return;
        }
        if (txtDni.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "dniVacio()", true);
            return;
        }
        if (ddlRegion.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ddlRegion()", true);
            return;
        }
        if (ddlInstitucion.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ddlInstitucion()", true);
            return;
        }
        if (ddlCargo.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ddlCargo()", true);
            return;
        }

        string correo = txtcorreo.Text.Trim();
        if (string.IsNullOrEmpty(correo))
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "correoVacio()", true);
            return;
        }

        // Expresión regular para validar el correo electrónico
        string patron = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$";
        if (!System.Text.RegularExpressions.Regex.IsMatch(correo, patron))
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "formatoCorreoNoValido()", true);
            return;
        }



        string nombres = txtNombres.Text.Trim();
        string apellidos = txtApellidos.Text.Trim();
        string inicialNombre = "";
        string apellido = "";
        string codigoUsuario = "";
        // Obtener la inicial del primer nombre
        string[] partesNombre = nombres.Split(' ');
        if (partesNombre.Length > 0)
        {
            inicialNombre = partesNombre[0].Substring(0, 1);
        }

        // Obtener el primer apellido
        string[] partesApellido = apellidos.Split(' ');
        if (partesApellido.Length > 0)
        {
            apellido = partesApellido[0];
        }

        // Generar el código de usuario
        codigoUsuario = inicialNombre.ToLower() + apellido.ToLower();

        var datosCompletos = string.Format("{0} {1}",txtNombres.Text, txtApellidos.Text);
        var encriptado = Encrypt.GetSHA256(password);
        int pki = 0;
        int pkr = 0;
        var pkInst = int.TryParse(ddlInstitucion.SelectedValue, out pki);
        var pkRol = int.TryParse(ddlCargo.SelectedValue, out pkr);

        usu.VU_codigoUsuario = codigoUsuario;
        usu.VU_contraseña = encriptado;
        usu.VU_NombreCompletos = datosCompletos;
        usu.IU_dni = txtDni.Text;
        usu.VU_correo = txtcorreo.Text;
        usu.fk_iie = pki;
        usu.fk_iro = pkr;

        //validar si existe el usuario por su codigo
         bool existeCodigo = Nusu.ExisteCodigoUsuario(usu);
         bool existeDNI =Nusu.ExisteDniUsuario(usu);
        if (existeCodigo)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "existeUsuario()", true);
            return;
        }
        if (existeDNI)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "existeDni()", true);
            return;
        }


        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "registroExitoso()", true);

        int exito =  Nusu.RegistrarUsuario(usu);
        if (exito != 0) 
        {
            usu.passDesencriptada = password;
            Nusu.EnviarCredenciales(usu);
            LimpiarInputs();
        }


    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        ValidarRegistroPlataforma();


    }


    protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        string regionNombre = ddlRegion.SelectedItem.Text;

        if (!string.IsNullOrEmpty(regionNombre) && regionNombre != "Seleccione una región")
        {
            CargarInstituciones(regionNombre); // Pasar el texto seleccionado
        }
        else
        {
            // Si no se seleccionó una región válida, limpiar el DropDownList de instituciones
            ddlInstitucion.Items.Clear();
            ddlInstitucion.Items.Insert(0, new ListItem("Seleccione una institución", "0"));
        }
    }
}
