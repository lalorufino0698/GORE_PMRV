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

public partial class WF_Listar_Solicitud_Denegadas : System.Web.UI.Page
{


    Solicitud sol = new Solicitud();
    N_Solicitud Nsol = new N_Solicitud();

    Socio so = new Socio();
    N_Socio Nso = new N_Socio();

    Usuario usu = new Usuario();
    N_Usuario Nusu = new N_Usuario();
    protected void Page_Load(object sender, EventArgs e)
    {
        listarsolicitudDenegada();
    }

    void listarsolicitudDenegada()
    {
        //    txtpkusuario.Text = "" + 2;
        sol.FK_IESol_Cod = 3;
        gv_Tabla_Lista_Solicitud_Denegada.DataSource = Nsol.listarsolicitudDenegada(sol);
        gv_Tabla_Lista_Solicitud_Denegada.DataBind();

    }

    protected void gv_Tabla_Lista_Solicitud_Denegada_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Ver")//VER 

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodsolDenegada.Text = gv_Tabla_Lista_Solicitud_Denegada.Rows[index].Cells[0].Text;
            Session["CodSoliGrid"] = "" + txtcodsolDenegada.Text;
            Response.Redirect("WF_Detalle_Solicitud.aspx");


        }

    }

    protected void gv_Tabla_Lista_Solicitud_Denegada_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Solicitud_Denegada.PageIndex = e.NewPageIndex;
        listarsolicitudDenegada();
    }

    protected void gv_Tabla_Lista_Solicitud_Denegada_DataBound(object sender, EventArgs e)
    {

    }

    protected void gv_Tabla_Lista_Solicitud_Denegada_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEsol_Estado_Solicitud").ToString();
            if (estado == "Denegado")
            {
                e.Row.Cells[11].BackColor = System.Drawing.Color.LightCoral;
                e.Row.Cells[11].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[11].Width = 100;


            }
        }

    }

    protected void txtFillter_TextChanged(object sender, EventArgs e)
    {

    }
}