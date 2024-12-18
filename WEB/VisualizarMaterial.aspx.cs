using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

public partial class VisualizarMaterial : System.Web.UI.Page
{
    public class CardModel
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string VideoUrl { get; set; }

    }
    N_FichaInformativa n_FichaInformativa = new N_FichaInformativa();

    protected void Page_Load(object sender, EventArgs e)
    {
     

        if (!IsPostBack)
        {
            
            listarMateriales();


        }
    }


    void listarMateriales()
    {

        GridView1.DataSource = n_FichaInformativa.ObtenerMaterialesEducativos();
        GridView1.DataBind();

    }
}