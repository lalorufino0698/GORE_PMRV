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
            //// Lista de datos dinámicos
            //var cards = new List<CardModel>
            //{
            //    new CardModel { Title = "Card 1", Description = "This is the first card.", VideoUrl = "http://172.16.1.29/MetaforaDelArbol.mp4" },

            //};

            //// Asigna la lista al Repeater
            //CardRepeater.DataSource = cards;
            //CardRepeater.DataBind();

            // Vincular los datos al GridView
            listarMateriales();


        }
    }


    void listarMateriales()
    {

        GridView1.DataSource = n_FichaInformativa.ObtenerMaterialesEducativos();
        GridView1.DataBind();

    }
}