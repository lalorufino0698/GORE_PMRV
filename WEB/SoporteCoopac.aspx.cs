using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SoporteCoopac : System.Web.UI.Page
{
    Usuario usu = new Usuario();
    N_Usuario Nusu = new N_Usuario();
    Empresa emp = new Empresa();
    N_Empresa Nemp = new N_Empresa();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
                profile.ImageUrl = "data:image/png;base64," + stbase64;
            }
            else
            {
                profile.ImageUrl = "img/gore_img/cafed.png";
                profile.ImageUrl = "img/gore_img/cafed.png";
            }
        }
        else if (int.Parse(Label1.Text) == 0)
        {

            profile.ImageUrl = "img/images.png";
            profile.ImageUrl = "img/images.png";

        }

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Iniciar_Sesion.aspx");
    }
}