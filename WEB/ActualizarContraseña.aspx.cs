using Dominio;
using GestionDatos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActualizarContraseña : System.Web.UI.Page
{
    GD_HelperContraseña GD_HelperContrase = new GD_HelperContraseña();
    protected void Page_Load(object sender, EventArgs e)
    {
        //ESPERAR EL DNI PARA PODER BUSCAR EL CORREO Y QUE VALIDE
        if (Session["codUsuario"] == null)
        {
            Response.Redirect("Inicio.aspx");
        }
        else
        {
            txtCodUsuario.Text = Session["codUsuario"].ToString();
            

        }
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        if (txtContraseña.Text =="" || txtConfirmarContrasena.Text =="")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertVacio()", true);
            return;
        }

        if (txtContraseña.Text!=txtConfirmarContrasena.Text)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertContrasenaNoCoinciden()", true);
            return;
        }


        var encriptado = Encrypt.GetSHA256(txtConfirmarContrasena.Text.Trim());
        var codUsuario = txtCodUsuario.Text;
        var exito = GD_HelperContrase.NuevaContraseña(codUsuario, encriptado);
        if (exito!=0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertaagregar()", true);
            return;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertErrorRegistro()", true);
            return;
        }

    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("InicioDocente.aspx");
    }
}