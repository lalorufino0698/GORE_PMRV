using System;
using System.Collections.Generic;
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


public partial class MasterPage : System.Web.UI.MasterPage
{

    
    Usuario usuario =  new Usuario();
    N_Usuario N_usuario = new N_Usuario();
    SqlConnection sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
    private SqlDataAdapter dat;
    private SqlCommand cmd;
    private DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        var codigoUsuario = Session["codigoUsuario"].ToString();
        usuario.VU_codigoUsuario = codigoUsuario;
        N_usuario.BuscarUsuarioPorCodigoUsuario(usuario);
        txtnombre.Text=usuario.VU_NombreCompletos;
        //txtapellidopaterno.Text = soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno;
        actualizarProfile();

    }
    void actualizarProfile()
    {
          profile.ImageUrl = "img/Profile/user.jpg";
          Image1.ImageUrl = "img/Profile/user.jpg";
        //soci.IS_Dni = Convert.ToInt32(txtpatrocinador.Text);
        //Nsoci.BuscarSocioxdni(soci);

        //txtcodsocio.Text = "" + soci.PK_IS_Cod;

        //cue.FK_IS_Cod = int.Parse(txtcodsocio.Text);
        //Ncue.BuscarCuentaSocio(cue);
        //pkcuenta.Text = "" + cue.PK_ICu_Cod;
        //if (cue.IMGCu_FIleImage != null)
        //{
        //    byte[] imagen = cue.IMGCu_FIleImage;
        //    string stbase64 = Convert.ToBase64String(imagen);
        //    profile.ImageUrl = "data:image/png;base64," + stbase64;
        //    Image1.ImageUrl = "data:image/png;base64," + stbase64;

        //}
        //else if(cue.IMGCu_FIleImage == null)
        //{

        //    profile.ImageUrl = "img/images.png";
        //    Image1.ImageUrl = "img/images.png";
        //}
    }



    public static bool KeepActiveSession()
    {
        if (HttpContext.Current.Session["codigoUsuario"] != null)
            return true;
        else
            return false;
    }


    public static void SessionAbandon()
    {
        HttpContext.Current.Session.Remove("codigoUsuario");
    }
}
