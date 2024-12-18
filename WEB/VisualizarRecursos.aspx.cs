using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VisualizarRecursos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCards();
        }
    }
    private void LoadCards()
    {
        StringBuilder html = new StringBuilder();
        N_FichaInformativa n_FichaInformativa = new N_FichaInformativa();
        DataTable dataTable = n_FichaInformativa.ObtenerMaterialesEducativosPorTipo();

        foreach (DataRow row in dataTable.Rows)
        {
            string fileType = row["VM_TipoArchivo"].ToString(); // Obtener el tipo de archivo

            // Comenzamos a construir el card HTML
            html.Append("<div class='card'>");

            // Generar el contenido del card basado en el tipo de archivo
            html.Append(GetCardContent(row, fileType));

            // Agregar el nombre y observación
            html.Append("<h3>")
                .Append(row["VM_Nombre"])
                .Append("</h3>");
            html.Append("<p>")
                .Append(row["VM_Observacion"])
                .Append("</p>");

            html.Append("</div>"); // Fin del card
        }


        // Insertar el HTML generado en el contenedor de la página
        CardsContainer.InnerHtml = html.ToString();
    }
    private string GetCardContent(DataRow row, string fileType)
    {
        StringBuilder cardContent = new StringBuilder();

        string rutaArchivo = row["VM_Ruta"].ToString();

        if (fileType == "imagen" || fileType == "jpg" || fileType == "png" || fileType == "gif")
        {
            cardContent.Append("<img src='")
                .Append(rutaArchivo)
                .Append("' alt='Material Educativo' class='card-image'/>");
        }
        else if (fileType == "video" || fileType == "mp4")
        {
            cardContent.Append("<video controls class='card-video'>")
                .Append("<source src='")
                .Append(rutaArchivo)
                .Append("' type='video/mp4'>")
                .Append("Tu navegador no soporta el elemento de video.")
                .Append("</video>");
        }
        else if (fileType == "pdf")
        {
            cardContent.Append("<a href='")
                .Append(rutaArchivo)
                .Append("' target='_blank' class='card-link'>")
                .Append("Ver documento PDF")
                .Append("</a>");
        }
        else
        {
            cardContent.Append("<a href='")
                .Append(rutaArchivo)
                .Append("' target='_blank' class='card-link'>")
                .Append("Descargar archivo")
                .Append("</a>");
        }

        return cardContent.ToString();
    }


}
