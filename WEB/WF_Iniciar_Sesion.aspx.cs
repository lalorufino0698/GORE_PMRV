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
using System.Windows;
using System.Data.SqlClient;
using System.Net;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;
using System.Configuration;

public partial class WF_Iniciar_Sesion : System.Web.UI.Page
{

    Usuario usu = new Usuario();
    N_Usuario Nusu = new N_Usuario();
    Empresa emp = new Empresa();
    N_Empresa Nemp = new N_Empresa();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            // Obtén el valor del SiteKey desde el Web.config
            string siteKey = ConfigurationManager.AppSettings["GoogleSiteKey"];

            // Asigna el valor al atributo de reCAPTCHA en la página
            recaptcha.Attributes["data-sitekey"] = siteKey;
            actualizarProfile();
        }
    }
    void actualizarProfile()
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


    void ValidarIniciarSesion()
    {
        if (txtUsuario.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "usuarioVacio()", true);
            return;
        }
        if (txtContraseña.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ContraseñaVacia()", true);
            return;
        }

        usu.VU_codigoUsuario = txtUsuario.Text;
        Nusu.BuscarUsuarioPorCodigoUsuario(usu);
        txtpkiu.Text = "" + usu.PK_IU_Cod;

        if (int.Parse(txtpkiu.Text) != 0)
        {
            txtcodigobus.Text = "" + usu.VU_codigoUsuario;
            txtcontraseñabus.Text = usu.VU_contraseña;
            var encriptado = Encrypt.GetSHA256(txtContraseña.Text.Trim());
            
            if (txtcodigobus.Text == txtUsuario.Text && txtcontraseñabus.Text == encriptado)
            {
                txtfkrol.Text = "" + usu.fk_iro;
                if(int.Parse(txtfkrol.Text) == 1)
                {
                    //Director
                    txtusu.Text = "" + usu.PK_IU_Cod;
                    txtcodigobus.Text = "" + usu.VU_codigoUsuario;
                    txtcontraseñabus.Text = "" + usu.VU_contraseña;
                    txtcorreobus.Text = "" + usu.VU_correo;
                    txtfkrol.Text = "" + usu.fk_iro;
                    Session["codigoUsuario"] = "" + txtcodigobus.Text;
                    ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "Director()", true);
                    Response.Redirect("InicioDirector.aspx");
                }
                else if(int.Parse(txtfkrol.Text) == 2)
                {
                    //Docente
                    txtusu.Text = "" + usu.PK_IU_Cod;
                    txtcodigobus.Text = "" + usu.VU_codigoUsuario;
                    txtcontraseñabus.Text = "" + usu.VU_contraseña;
                    txtcorreobus.Text = "" + usu.VU_correo;
                    txtfkrol.Text = "" + usu.fk_iro;
                    Session["codigoUsuario"] = "" + txtcodigobus.Text;
                    ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "Docente()", true);
                    Response.Redirect("InicioDocente.aspx");
                }
                else if(int.Parse(txtfkrol.Text) == 3)
                {
                    //Auxiliar
                    txtusu.Text = "" + usu.PK_IU_Cod;
                    txtcodigobus.Text = "" + usu.VU_codigoUsuario;
                    txtcontraseñabus.Text = "" + usu.VU_contraseña;
                    txtcorreobus.Text = "" + usu.VU_correo;
                    txtfkrol.Text = "" + usu.fk_iro;
                    Session["codigoUsuario"] = "" + txtcodigobus.Text;
                    ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "Auxiliar()", true);
                    Response.Redirect("WF_InicioSocio.aspx");
                }
            }

            else if (txtContraseña.Text != txtcontraseñabus.Text)
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "contraseñaincorrecta()", true);
            }
        }
        else if (int.Parse(txtpkiu.Text) == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "noexisteUsuario()", true);
            txtUsuario.Text = "";

        }

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        ValidarIniciarSesion();
     
    }

}
