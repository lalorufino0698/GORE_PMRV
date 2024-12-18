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

public partial class WF_Listar_Afiliaciones : System.Web.UI.Page
{
    Afiliacion afilia = new Afiliacion();
    N_Afiliacion Nafilia = new N_Afiliacion();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int total = 3;
            txtCodPatrocinador.Text = Session["dni"].ToString();
            listarAfiliaciones();
            txtcantidad.Text = Convert.ToString(total - this.gv_Tabla_Lista_Afiliaciones.Rows.Count);
        }
    }

    void listarAfiliaciones()
    {

        afilia.IA_Cod_Patrocinador = Convert.ToInt32(txtCodPatrocinador.Text);
        gv_Tabla_Lista_Afiliaciones.DataSource = Nafilia.listarAfiliaciones(afilia);
        gv_Tabla_Lista_Afiliaciones.DataBind();

    }
}