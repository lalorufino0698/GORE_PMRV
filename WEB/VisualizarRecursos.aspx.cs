using System;
using System.Collections.Generic;
using System.Configuration;
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

        // Conexión a la base de datos (asegúrate de usar tu cadena de conexión)
        string connectionString = "Data Source =PC-OTICWEB;Initial Catalog=BD_PMRV;Integrated Security=True";
        string query = "SELECT VM_Nombre, VM_Observacion, VM_Ruta, VM_TipoArchivo FROM MaterialEducativo WHERE BM_Activo = 1";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            // Iterar sobre los registros
            while (reader.Read())
            {
                string fileType = reader["VM_TipoArchivo"].ToString().ToLower(); // Obtener el tipo de archivo

                // Comenzamos a construir el card HTML
                html.Append("<div class='card'>");

                // Generar el contenido del card basado en el tipo de archivo
                html.Append(GetCardContent(reader, fileType));

                // Agregar el nombre y observación
                html.Append("<h3>")
                    .Append(reader["VM_Nombre"])
                    .Append("</h3>");
                html.Append("<p>")
                    .Append(reader["VM_Observacion"])
                    .Append("</p>");

                html.Append("</div>"); // Fin del card
            }
        }

        // Insertar el HTML generado en el contenedor de la página
        CardsContainer.InnerHtml = html.ToString();
    }
    private string GetCardContent(SqlDataReader reader, string fileType)
    {
        StringBuilder cardContent = new StringBuilder();

        // Condicionales para mostrar diferentes tipos de contenido basado en el tipo de archivo
        if (fileType == ".mp4") // Video
        {
            cardContent.Append("<video controls style='width:100%; height:auto;'>")
                        .Append("<source src='")
                        .Append("http://172.16.1.29/MetaforaDelArbol.mp4")
                        .Append("' type='video/mp4'>")
                        .Append("Your browser does not support the video tag.")
                        .Append("</video>");
        }
        else if (fileType == ".pdf") // PDF
        {
            cardContent.Append("<iframe title='Vista previa' allowfullscreen='' class='preview__content' ")
                .Append("src='")
                .Append("http://172.16.1.29/quijote.pdf")  // URL del PDF
                .Append("#toolbar=0' width='100%' height='400px'></iframe>");
        }
        else if (fileType == ".jpg" || fileType == ".png" || fileType == ".jpeg") // Imagen
        {
            cardContent.Append("<img src='")
                        .Append(reader["VM_Ruta"])
                        .Append("' alt='")
                        .Append(reader["VM_Nombre"])
                        .Append("' style='width:100%; height:auto;' />");
        }
        else // Otros archivos
        {
            cardContent.Append("<p>Archivo no compatible</p>");
        }

        return cardContent.ToString();
    }



}
