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

    Socio soci = new Socio();
    N_Socio Nsoci = new N_Socio();
    Cuenta cue = new Cuenta();
    N_Cuenta Ncue = new N_Cuenta();
    Solicitud sol = new Solicitud();
    Estado_Socio es = new Estado_Socio();
    SqlConnection sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
    private SqlDataAdapter dat;
    private SqlCommand cmd;
    private DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        //txtpatrocinador.Text = Session["dni"].ToString();
        //soci.IS_Dni = Convert.ToInt32(txtpatrocinador.Text);
        //Nsoci.BuscarSocio(soci);
        //txtnombre.Text=soci.VS_Nombre_Completo;
        //txtapellidopaterno.Text = soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno;
        //actualizarProfile();
        
    }
    void actualizarProfile()
    {

        soci.IS_Dni = Convert.ToInt32(txtpatrocinador.Text);
        Nsoci.BuscarSocioxdni(soci);

        txtcodsocio.Text = "" + soci.PK_IS_Cod;

        cue.FK_IS_Cod = int.Parse(txtcodsocio.Text);
        Ncue.BuscarCuentaSocio(cue);
        pkcuenta.Text = "" + cue.PK_ICu_Cod;
        if (cue.IMGCu_FIleImage != null)
        {
            byte[] imagen = cue.IMGCu_FIleImage;
            string stbase64 = Convert.ToBase64String(imagen);
            profile.ImageUrl = "data:image/png;base64," + stbase64;
            Image1.ImageUrl = "data:image/png;base64," + stbase64;

        }
        else if(cue.IMGCu_FIleImage == null)
        {

            profile.ImageUrl = "img/images.png";
            Image1.ImageUrl = "img/images.png";
        }
    }

  

    public static bool KeepActiveSession()
    {
        if (HttpContext.Current.Session["dni"] != null)
            return true;
        else
            return false;
    }


    public static void SessionAbandon()
    {
        HttpContext.Current.Session.Remove("dni");
    }
}
