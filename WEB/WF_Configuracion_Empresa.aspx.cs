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

public partial class WF_Configuracion_Empresa : System.Web.UI.Page
{
    Empresa Emp = new Empresa();
    N_Empresa Nemp = new N_Empresa();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mostrarempresa();
            RetornarImagenes();
        }
    }


    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }
    void RetornarImagenes()
    {
        Emp.PK_IEmp_Cod = int.Parse(txtEmpresa.Text);
        //Npre.BuscarSolicitud(soli);

        SqlConnection connectionSQL = new SqlConnection(GD_ConexionBD.CadenaConexion);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT IMGE_Logo FROM T_Empresa WHERE PK_IEmp_Cod=" + int.Parse(txtEmpresa.Text);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connectionSQL;
        connectionSQL.Open();

        DataTable ima = new DataTable();
        ima.Load(cmd.ExecuteReader());

        Repeater2.DataSource = ima;
        Repeater2.DataBind();


        connectionSQL.Close();

    }
    void mostrarempresa()
    {
        
        Nemp.ConsultarEmpresas(Emp);


        txtruc.Text = "" + Emp.IE_Ruc;
        txtNombreempresa.Text = "" + Emp.VE_Nombre_Empresa;
        txtrubro.Text = "" + Emp.VE_Rubro;
        
        txtrepresentante.Text = "" + Emp.VE_Representante;
        txttelefono.Text = "" + Emp.IE_Telefono;
        txtcorreo.Text = "" + Emp.VE_Correo;
        txtdireccion.Text = "" + Emp.VE_Direccion;
        txtEmpresa.Text = "" + Emp.PK_IEmp_Cod;
        RetornarImagenes();

    }


    protected void btnBuscarSocio_Click(object sender, EventArgs e)
    {

    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {

    }

    protected void btnActualizarEmpresa_Click(object sender, EventArgs e)
    {
        Emp.PK_IEmp_Cod = Convert.ToInt32(txtEmpresa.Text);
        Emp.IE_Ruc = txtruc.Text;
        Emp.VE_Nombre_Empresa = txtNombreempresa.Text;
        Emp.VE_Representante = txtrepresentante.Text;
        Emp.IE_Telefono = Convert.ToInt32(txttelefono.Text);
        Emp.VE_Correo = txtcorreo.Text;
        if (IsValidEmail((string)txtcorreo.Text) != true)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertCorreoIncorrecto()", true);
            return;
        }
        Emp.VE_Direccion = txtdireccion.Text;
        if (LogoSanCosme != null && LogoSanCosme.HasFile)
        {
            int tamanio = LogoSanCosme.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            LogoSanCosme.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(LogoSanCosme.PostedFile.InputStream);
            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            Emp.IMGE_Logo = ImagenOriginal;
        }
        else
        {
            // Notify the user that a file was not uploaded.
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;
        }
        Nemp.ActualizarEmpresa(Emp);
        Response.Redirect("WF_Configuracion_Empresa.aspx");


        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "ActualizarEmpresa()", true);
    }



    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Listar_Solicitud_Afiliacion.aspx");
    }
}