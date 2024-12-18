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

public partial class WF_Listar_Patrocinadores : System.Web.UI.Page
{
    Patrocinador patro = new Patrocinador();
    N_Patrocinador Npatro = new N_Patrocinador();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            listarPatrocinados();

            txtcantidad.Text = Convert.ToString(this.gv_Tabla_Lista_Patrocinadores.Rows.Count);

        }

    }

    void listarPatrocinados()
    {

        gv_Tabla_Lista_Patrocinadores.DataSource = Npatro.listarPatrocinadores();
        gv_Tabla_Lista_Patrocinadores.DataBind();

    }
    protected void gv_Tabla_Lista_Patrocinadores_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ver")//Ver

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtdniPatrocinador.Text = gv_Tabla_Lista_Patrocinadores.Rows[index].Cells[1].Text;
            Session["DNIPatroGrid"] = "" + txtdniPatrocinador.Text;
            listarPatrocinados();
            Response.Redirect("WF_Historial_Patrocinador.aspx");

        }
    }

    protected void gv_Tabla_Lista_Patrocinadores_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Patrocinadores.PageIndex = e.NewPageIndex;
        listarPatrocinados();

    }


}