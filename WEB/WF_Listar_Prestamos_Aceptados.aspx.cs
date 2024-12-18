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

public partial class WF_Listar_Prestamos_Aceptados : System.Web.UI.Page
{

    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            listarPrestamoAceptada();

        }

    }

    void listarPrestamoAceptada()
    {
        //    txtpkusuario.Text = "" + 2;
        pre.FK_IEPre = 2;
        gv_Tabla_Lista_Prestamo_Aceptados.DataSource = Npre.listarPrestamoAceptada(pre);
        gv_Tabla_Lista_Prestamo_Aceptados.DataBind();

    }

    protected void gv_Tabla_Lista_Prestamo_Aceptados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ver")//VER 

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodPrestamoGrid.Text = gv_Tabla_Lista_Prestamo_Aceptados.Rows[index].Cells[0].Text;
            Session["CodPreGrid"] = "" + txtcodPrestamoGrid.Text;
            Response.Redirect("WF_Detalle_Prestamo.aspx");

        }

        if (e.CommandName == "VerImagenes")//VER IMAGNES

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodPrestamoGrid.Text = gv_Tabla_Lista_Prestamo_Aceptados.Rows[index].Cells[0].Text;
            txtestadoGrid.Text = gv_Tabla_Lista_Prestamo_Aceptados.Rows[index].Cells[10].Text;
            Session["CodEstadoGrid"] = "" + txtestadoGrid.Text;
            Session["CodPreGrid"] = "" + txtcodPrestamoGrid.Text;
            Response.Redirect("WF_Detalle_Prestamo_Imagenes.aspx");

        }

    }

    protected void gv_Tabla_Lista_Prestamo_Aceptados_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Prestamo_Aceptados.PageIndex = e.NewPageIndex;
        listarPrestamoAceptada();
    }

    protected void gv_Tabla_Lista_Prestamo_Aceptados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEPre_Estado_Prestamo").ToString();
            if (estado == "Aceptado")
            {
                e.Row.Cells[10].BackColor = System.Drawing.Color.DarkSeaGreen;
                e.Row.Cells[10].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[10].Height = 4;
                e.Row.Cells[10].Width = 100;


            }
        }
    }
}