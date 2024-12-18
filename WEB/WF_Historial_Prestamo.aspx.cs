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
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;


public partial class WF_Historial_Prestamo : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nso = new N_Socio();

    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtCodPatrocinador.Text = Session["dni"].ToString();

            soci.IS_Dni = Convert.ToInt32(txtCodPatrocinador.Text);
            Nso.BuscarSocioxdni(soci);
            txtCodSocio.Text = "" + soci.PK_IS_Cod;
            listarhistorialprestamos();



        }

    }

    void listarhistorialprestamos()
    {
        soci.PK_IS_Cod = int.Parse(txtCodSocio.Text);
        gv_Tabla_Historial_Prestamo_Socio.DataSource = Npre.listarhistorialprestamos(soci);
        gv_Tabla_Historial_Prestamo_Socio.DataBind();
    }

    protected void gv_Tabla_Historial_Prestamo_Socio_RowCommand(object sender, GridViewCommandEventArgs e)
    {

      
    }

    protected void gv_Tabla_Historial_Prestamo_Socio_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Historial_Prestamo_Socio.PageIndex = e.NewPageIndex;
        listarhistorialprestamos();
    }

    protected void gv_Tabla_Historial_Prestamo_Socio_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}