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

public partial class WF_Lista_Registrar_Penalidad : System.Web.UI.Page
{

    Penalidad pena = new Penalidad();
    N_Penalidad Npena = new N_Penalidad();
    Cuota cuo = new Cuota();
    N_Cuota Ncuota = new N_Cuota();
    protected void Page_Load(object sender, EventArgs e)
    {
        listarCuota();
    }

    protected void txtFillter_TextChanged(object sender, EventArgs e)
    {
      
    }

    void listarCuota()
    {

        
        cuo.FK_IECU_Cod = 3;
        gv_Tabla_Lista_Registrar_Penalidad.DataSource = Ncuota.ListarCuotaMoroso(cuo);
        gv_Tabla_Lista_Registrar_Penalidad.DataBind();

    }

    protected void gv_Tabla_Lista_Registrar_Penalidad_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Registrar")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtpkcuota.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[0].Text;
            txtnumPrestamo.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[1].Text;
           txtdatossocio.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[2].Text;
            txtdnisocio.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[3].Text;
            txtfechafin.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[4].Text;
            txtnumcuota.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[5].Text;
            txtmontocuota.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[6].Text;
            txtdiaretraso.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[7].Text;
            txtestadocuota.Text = gv_Tabla_Lista_Registrar_Penalidad.Rows[index].Cells[8].Text;

            if (txtestadocuota.Text == "Moroso")
            {
                Session["pkcuo"] = "" + txtpkcuota.Text;
                Session["pre"] = "" + txtnumPrestamo.Text;
                Session["cuo"] = "" + txtnumcuota.Text;
                Session["dni"] = "" + txtdnisocio.Text;
                Session["fechafin"] = "" + txtfechafin.Text;
                Session["estacuota"] = "" + txtestadocuota.Text;
                Session["retra"] = "" + txtdiaretraso.Text;
                Session["importe"] = "" + txtmontocuota.Text;

                Response.Redirect("WF_Registrar_Penalidad.aspx");
            }
            
        }
    }

    protected void gv_Tabla_Lista_Registrar_Penalidad_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Registrar_Penalidad.PageIndex = e.NewPageIndex;
        listarCuota();
    }

    protected void gv_Tabla_Lista_Registrar_Penalidad_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEcu_Estado_Cuota").ToString();
            if (estado == "Moroso")
            {

                e.Row.Cells[8].BackColor = System.Drawing.Color.LightCoral;
                e.Row.Cells[8].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[8].Height = 4;
                e.Row.Cells[8].Width = 100;


            }
        }

    }
}