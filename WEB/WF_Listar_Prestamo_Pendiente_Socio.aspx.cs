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
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;

public partial class WF_Listar_Prestamo_Pendiente_Socio : System.Web.UI.Page
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
            listarprestamopendientesocio();



        }
    }



    void listarprestamopendientesocio()
    {
        soci.PK_IS_Cod = int.Parse(txtCodSocio.Text);
        gv_Tabla_Prestamo_Pendiente_Socio.DataSource = Nso.listarPrestamoPendientexsocio(soci);
        gv_Tabla_Prestamo_Pendiente_Socio.DataBind();
    }
    protected void gv_Tabla_Prestamo_Pendiente_Socio_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gv_Tabla_Prestamo_Pendiente_Socio.PageIndex = e.NewPageIndex;
        listarprestamopendientesocio();
    }

    protected void gv_Tabla_Prestamo_Pendiente_Socio_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gv_Tabla_Prestamo_Pendiente_Socio_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "EstadoDePrestamo").ToString();
            if (estado == "En Proceso")
            {
                e.Row.Cells[8].ForeColor = System.Drawing.Color.Blue;


            }
        }
    }
}