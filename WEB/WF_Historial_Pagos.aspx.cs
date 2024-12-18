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
using IronPdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;

public partial class WF_Historial_Pagos : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    N_Pagos Npa = new N_Pagos();

    Socio soci = new Socio();
    Pago pa = new Pago();
    N_Socio Nso = new N_Socio();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtCodPatrocinador.Text = Session["dni"].ToString();

            soci.IS_Dni = Convert.ToInt32(txtCodPatrocinador.Text);
            Nso.BuscarSocioxdni(soci);
            txtcodSocio.Text = "" + soci.PK_IS_Cod;
            ListarPago();



        }
    }
    void ListarPago()
    {
        pre.Fk_IS_Cod = int.Parse(txtcodSocio.Text);
        gv_Tabla_Historial_Pago.DataSource = Npa.ListarPagos(pre);
        gv_Tabla_Historial_Pago.DataBind();
    }

  
    protected void gv_Tabla_Historial_Pago_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Historial_Pago.PageIndex = e.NewPageIndex;
        ListarPago();
    }

    protected void gv_Tabla_Historial_Pago_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gv_Tabla_Historial_Pago_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
