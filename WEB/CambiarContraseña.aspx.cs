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
    Socio soc = new Socio();
    N_Socio Nsoci = new N_Socio();

    Solicitud sol = new Solicitud();

    Estado_Socio es = new Estado_Socio();
    HelperEmail helperEmail = new HelperEmail();

    protected void Page_Load(object sender, EventArgs e)
    {

        //ESPERAR EL DNI PARA PODER BUSCAR EL CORREO Y QUE VALIDE
        if (Session["dni"] == null)
        {
            Response.Redirect("Inicio.aspx");
        }
        else
        {
            txtDniSocio.Text = Session["dni"].ToString();
        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {

        if (txtCorreoRegistro.Text!="")
        {
            if (helperEmail.IsValidEmail((string)txtCorreoRegistro.Text) != true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoIncorrecto()", true);
                return;
            }
            else
            {
                //código
                soc.PK_IS_Cod = int.Parse(txtDniSocio.Text);
                Nsoci.consultarSocio(soc, sol, es);
                var emailBD = sol.VSol_Correo;
                if (txtCorreoRegistro.Text != emailBD)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoIncorrectoNoCoinciden()", true);
                    return;
                }
                else
                {
                    Session["email"] = "" + txtCorreoRegistro.Text;
                    Response.Redirect("ActualizarContraseña.aspx");
                }
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
        Response.Redirect("WF_InicioSocio.aspx");
    }
}