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

public partial class CambiarContraseña : System.Web.UI.Page
{

    Usuario Usuario = new Usuario();
    N_Usuario _usuario = new N_Usuario();

    Socio soc = new Socio();
    N_Socio Nsoci = new N_Socio();

    Solicitud sol = new Solicitud();

    Estado_Socio es = new Estado_Socio();
    HelperEmail helperEmail = new HelperEmail();

    protected void Page_Load(object sender, EventArgs e)
    {

        
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (txtCodUsuario.Text!="")
        {
            //código
            Usuario.VU_codigoUsuario = txtCodUsuario.Text;
            _usuario.BuscarUsuarioPorCodigoUsuario(Usuario);
            var estado = Usuario.estado;
            if (estado!=1)
            {
                Session["codUsuario"] = txtCodUsuario.Text;
                Response.Redirect("ActualizarContraseña.aspx");
               
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertUsuarioNoExiste()", true);
                return;
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoVacio()", true);
            return;

        }


       
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("InicioDocente.aspx");
    }
}