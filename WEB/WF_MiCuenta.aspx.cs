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

public partial class WF_MiCuenta : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nsoci = new N_Socio();
    Cuenta cue = new Cuenta();
    N_Cuenta Ncue = new N_Cuenta();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            txtpatrocinador.Text = Session["dni"].ToString();
            soci.IS_Dni = Convert.ToInt32(txtpatrocinador.Text);
            Nsoci.BuscarSocioxdni(soci);

            txtcodsocio.Text = "" + soci.PK_IS_Cod;

            mostrarCuenta();
        }

    }


    void RetornarImagenes()
    {
       cue.PK_ICu_Cod = int.Parse(txtcuentapk.Text);
        //Npre.BuscarSolicitud(soli);
        SqlConnection connectionSQL = new SqlConnection(GD_ConexionBD.CadenaConexion);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT IMGCu_FIleImage FROM T_Cuenta WHERE PK_ICu_Cod=" + int.Parse(txtcuentapk.Text);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connectionSQL;
        connectionSQL.Open();
        DataTable ima = new DataTable();
        ima.Load(cmd.ExecuteReader());
        Repeater1.DataSource = ima;
        Repeater1.DataBind();
        connectionSQL.Close();

    }

    void mostrarCuenta()
    {
        cue.FK_IS_Cod = int.Parse(txtcodsocio.Text);
        Ncue.BuscarCuenta(cue);

        txtSaldo.Text = "" + cue.FCu_Saldo;
        txtIncripcion.Text = "" + cue.FCu_Incripcion;
        txtCuenta.Text = "" + cue.CHCu_Numero_Cuenta;
        txtTransaccion.Text = "" + cue.FK_Numero_Transaccion;
        NumSocio.Text = "" + cue.FK_IS_Cod;
        txtcuentapk.Text = "" + cue.PK_ICu_Cod;

    
        RetornarImagenes();

    }

    protected void btnpushimage_Click(object sender, EventArgs e)
    {
        cue.FK_IS_Cod = int.Parse(NumSocio.Text);
        if (FileFotoProfile != null  && FileFotoProfile.HasFile)
        {

            int tamanio = FileFotoProfile.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileFotoProfile.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileFotoProfile.PostedFile.InputStream);
            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            cue.IMGCu_FIleImage = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }


        Ncue.RegistrarImagenCuenta(cue);
        Response.Redirect("WF_MiCuenta.aspx");

    }
}