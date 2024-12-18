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
    private static string servidorArchivo = ConfigurationManager.AppSettings["ServidorArchivo"];
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
          
            html.Append("</div>");
                
   

        }


        // Insertar el HTML generado en el contenedor de la página
        CardsContainer.InnerHtml = html.ToString();
    }
    private string GetCardContent(DataRow row, string fileType)
    {
        StringBuilder cardContent = new StringBuilder();

        string rutaArchivo = servidorArchivo + row["VM_Ruta"].ToString();

        if (fileType == ".imagen" || fileType == ".jpg" || fileType == ".png" || fileType == ".gif")
        {
            // Previsualización de imagen con enlace de descarga
            cardContent.Append("<div class='card-image-container'>")
                .Append("<img src='")
                .Append(rutaArchivo)
                .Append("' alt='Material Educativo' class='card-image'/>")
                .Append("<div style='margin-top: 10px;'>")
                .Append("<a href='/DownloadFile.aspx?file=")
                .Append(rutaArchivo)
                .Append("' class='card-link'>")
                .Append("Descargar imagen")
                .Append("</a>")
                .Append("</div>")
                .Append("</div>");
        }
        else if (fileType == ".video" || fileType == ".mp4")
        {
            // Previsualización de video
            cardContent.Append("<video controls class='card-video'>")
                .Append("<source src='")
                .Append(rutaArchivo)
                .Append("' type='video/mp4'>")
                .Append("Tu navegador no soporta el elemento de video.")
                .Append("</video>");
        }
        else if (fileType == ".pdf")
        {
            // Previsualización de PDF con iframe y enlace de descarga
            cardContent.Append("<div class='card-pdf-container'>")
                .Append("<iframe src='")
                .Append(rutaArchivo)
                .Append("' class='card-pdf' style='width: 100%; height: 200px; border: none;'>")
                .Append("Tu navegador no soporta previsualización de PDF.")
                .Append("</iframe>")
                .Append("<div style='margin-top: 10px;'>")
                .Append("<a href='/DownloadFile.aspx?file=")  // Cambiado a DownloadFile.aspx
                .Append(rutaArchivo)
                .Append("' class='card-link'>")
                .Append("Descargar PDF")
                .Append("</a>")
                .Append("</div>")
                .Append("</div>");
        }
       else
        {
            // Descarga de archivo genérico
            cardContent.Append("<a href='/DownloadFile.aspx?file=")  // Cambiado a DownloadFile.aspx
                .Append(rutaArchivo)
                .Append("' class='card-link'>")
                .Append("Descargar archivo")
                .Append("</a>");
        }

        // Añadir un botón para redirigir a otra página
        cardContent.Append("<div style='margin-top: 15px;'>")
         .Append("<button onclick='window.location.href=\"/OtraPagina.aspx?fileName=")
         .Append(row["VM_Nombre"].ToString()) // Aquí pasas el valor que deseas como parámetro
         .Append("\"' class='card-button'>Ver Detalle</button>")
         .Append("</div>");


        return cardContent.ToString();
    }




}
