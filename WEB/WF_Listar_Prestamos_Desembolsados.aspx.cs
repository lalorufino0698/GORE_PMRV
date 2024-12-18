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

public partial class WF_Listar_Prestamos_Desembolsados : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            listarPrestamoDesembolsado();
            
        }
    }
    void listarPrestamoDesembolsado()
    {

        gv_Tabla_Lista_Prestamos_Desembolsados.DataSource = Npre.listarPrestamosDesembolsado(pre);
        gv_Tabla_Lista_Prestamos_Desembolsados.DataBind();

    }
    protected void gv_Tabla_Lista_Prestamos_Desembolsados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "GestionarAmortizacion")//GESTIONAR AMORTIZACION

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodPrestamoGrid.Text = gv_Tabla_Lista_Prestamos_Desembolsados.Rows[index].Cells[0].Text;
            txtFechaRegistro.Text = gv_Tabla_Lista_Prestamos_Desembolsados.Rows[index].Cells[1].Text;
            txtImporte.Text = gv_Tabla_Lista_Prestamos_Desembolsados.Rows[index].Cells[3].Text;
            txtCuota.Text = gv_Tabla_Lista_Prestamos_Desembolsados.Rows[index].Cells[4].Text;
            txtNomSocio.Text = gv_Tabla_Lista_Prestamos_Desembolsados.Rows[index].Cells[9].Text;



            Session["CodPreGrid"] = "" + txtcodPrestamoGrid.Text;
            Session["importe"] = "" + txtImporte.Text;
            Session["cuota"] = "" + txtCuota.Text;
            Session["NomSocio"] = "" + txtNomSocio.Text;

            Session["fechaRegistro"] = "" + txtFechaRegistro.Text;

            Response.Redirect("WF_Gestionar_Amortizaciones.aspx");

        }
    }

    protected void gv_Tabla_Lista_Prestamos_Desembolsados_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Prestamos_Desembolsados.PageIndex = e.NewPageIndex;
        listarPrestamoDesembolsado();
    }

    protected void gv_Tabla_Lista_Prestamos_Desembolsados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEPre_Estado_Prestamo").ToString();
            if (estado == "Desembolsado")
            {
                e.Row.Cells[10].ForeColor = System.Drawing.Color.Brown;


            }
        }
    }
}