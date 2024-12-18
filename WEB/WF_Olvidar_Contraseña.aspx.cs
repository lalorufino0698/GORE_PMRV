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

public partial class WF_Olvidar_Contraseña : System.Web.UI.Page
{
    Usuario usu = new Usuario();
    N_Usuario Nusu = new N_Usuario();
    Empresa emp = new Empresa();
    N_Empresa Nemp = new N_Empresa();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            panel2.Visible = false;
            panel3.Visible = false;
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
            if (imagen !=null)
            {
                string stbase64 = Convert.ToBase64String(imagen);
                profile.ImageUrl = "data:image/png;base64," + stbase64;
                Image1.ImageUrl = "data:image/png;base64," + stbase64;
            }
            else
            {
                profile.ImageUrl = "img/gore_img/cafed.png";
                Image1.ImageUrl = "img/gore_img/cafed.png";
            }
           
        }
        else if (int.Parse(Label1.Text) == 0)
        {

            profile.ImageUrl = "img/gore_img/cafed.png";
            Image1.ImageUrl = "img/gore_img/cafed.png";

        }

    }
    void ValidarDNI()
    {
        if (txtCodOlvidar.Text == "")
        { 
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "CodigoVacio()", true);
            return;
        }
        usu.VU_codigoUsuario = txtCodOlvidar.Text;
        Nusu.BuscarUsuarioPorCodigoUsuario(usu);
        txtpkiu1.Text = "" + usu.PK_IU_Cod;
        if (int.Parse(txtpkiu1.Text) != 0)
        {
            txtcodbus1.Text = "" + usu.VU_codigoUsuario;
            txtcontraseñabus1.Text = "" + usu.VU_contraseña;
            
            if (txtCodOlvidar.Text == txtcodbus1.Text)
            {
                changesPanel();
            }
            else if (txtCodOlvidar.Text != txtcodbus1.Text)
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "Codigoincorrepto()", true);
            }
        }
        else if (int.Parse(txtpkiu1.Text) == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "noexisteUsuario()", true);
            txtcodbus1.Text = "";

        }

    }
    void ActualizarContraseña()
    {
        if (txtContraseña.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ContraseñaVacia()", true);
            return;
        }

        if (txtContraseña2.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ContraseñaVacia()", true);
            return;
        }

        if (txtContraseña.Text != txtContraseña2.Text)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "IgualarContraseñas()", true);
            return;
        }

        //txtContraseña.Text = "" + usu.VU_Contraseña;
        //usu.IU_Dni = int.Parse(txtContraseña.Text);
        var encriptado = Encrypt.GetSHA256(txtContraseña.Text.Trim());

        usu.VU_contraseña = encriptado;
        usu.VU_codigoUsuario = txtCodOlvidar.Text;
        Nusu.actualizarContraseña(usu);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ContraseñaActualizada()", true);
        panel2.Visible = false;
        panel3.Visible = true;
        return;
        
        // Response.Redirect("WF_Iniciar_Sesion.aspx");
    }




    protected void Unnamed_Click(object sender, EventArgs e)
    {
        ValidarDNI();
        

    }
    protected void Actualizar(object sender, EventArgs e)
    {
        ActualizarContraseña();


    }

    void changesPanel()
    {
        panel1.Visible = false;
        panel2.Visible = true;

    }

    protected void Retroceder(object sender, EventArgs e)
    {
        Response.Redirect("WF_Iniciar_Sesion.aspx");
    }



    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        Response.Redirect("WF_Iniciar_Sesion.aspx");
    }

  
}
