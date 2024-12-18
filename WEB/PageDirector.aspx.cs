using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

public partial class PageDirector : System.Web.UI.Page
{
    MaterialEducativo material = new MaterialEducativo();
    FichaInformativa fichaInformativa = new FichaInformativa();
    N_FichaInformativa negocioFicha = new N_FichaInformativa();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //cargar las modalidades para registrar una ficha, por el momento toma el id 1
        }
    }

    private void validarEntradas()
    {
        if (autor.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alerta", "autorVacio()", true);
            return;
        }
        if (resumen.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "resumenVacia()", true);
            return;
        }
        if (tema.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "temaVacia()", true);
            return;
        }
        if (anio.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "anioVacia()", true);
            return;
        }
        if (idiomalenguaje.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "idiomaLenguajeVacia()", true);
            return;
        }
        if (fuente.Text == "")
        {
            
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "fuenteVacia()", true);
            return;
        }
        //if (nombrearchivo.Text == "")
        //{
        //    ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "nombreArchivoVacia()", true);
        //    return;
        //}
        if (!ftpFileUpload.HasFile)
        {

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "archivoVacia()", true);
            return;
        }




    }

    private void RegistrarFichaPorMaterial()
    {
        fichaInformativa.VFI_Autor = autor.Text;
        fichaInformativa.VFI_Resumen = resumen.Text;
        fichaInformativa.VFI_Tema = tema.Text;
        fichaInformativa.VFI_Anio = anio.Text;
        fichaInformativa.VFI_IdiomaLenguaje = idiomalenguaje.Text;
        fichaInformativa.VFI_Fuente = fuente.Text;

        int registro = negocioFicha.RegistrarFicha(fichaInformativa);
        string fileName = string.Empty;
        string extension = string.Empty;
        string nombreArchivo = string.Empty;
        if (registro!=0)
        {
            //si el registro se insertó con éxito, ahora pasaremos a registrar el archivo
            //esto lo haremos tanto en la bd como en el ftp
            if (ftpFileUpload.HasFile)
            {
                try
                {
                    fileName = ftpFileUpload.FileName;
                    nombreArchivo = Path.GetFileNameWithoutExtension(fileName);
                    extension = Path.GetExtension(fileName);
                    string path = "~/Archivos/";
                    Directory.CreateDirectory(Server.MapPath(path));

                    Stream fs = ftpFileUpload.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    string filePath = path + fileName;
                    File.WriteAllBytes(Server.MapPath(filePath), bytes);

                    FtpWebRequest request = (FtpWebRequest)WebRequest.Create("ftp://172.16.1.29//" + fileName);
                    request.Method = WebRequestMethods.Ftp.UploadFile;

                    request.Credentials = new NetworkCredential("administrador", "cafed2024.");

                    byte[] fileContents = File.ReadAllBytes(Server.MapPath(filePath));
                    request.ContentLength = fileContents.Length;

                    using (Stream requestStream = request.GetRequestStream())
                    {
                        requestStream.Write(fileContents, 0, fileContents.Length);
                    }

                    // Opcional: Capturar la respuesta del servidor FTP
                    using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
                    {
                        string mensaje = "Upload File Complete, status "+response.StatusDescription+"";
                    }
                }
                catch (WebException g)
                {
                    string status = ((FtpWebResponse)g.Response).StatusDescription;

                    throw;
                }

            }

            //una vez guardado el archivo, guardamos a la tabla material
            material.VM_Nombre = nombreArchivo;
            material.VM_Observacion = "Se registra el material :" + nombreArchivo;
            material.VM_TipoArchivo = extension;
            material.fk_ficha = registro;
            negocioFicha.RegistrarMaterial(material);

        }



    }
    private void limpiar()
    {
        autor.Text = "";
        resumen.Text = "";
        tema.Text = "";
        anio.Text = "";
        idiomalenguaje.Text = "";
        fuente.Text = "";
        //nombrearchivo.Text = "";
        ftpFileUpload.ID = null;
    }

    protected void Guardar_Click(object sender, EventArgs e)
    {
        //primero valido los campos
        validarEntradas();
        RegistrarFichaPorMaterial();
    }

    protected void Limpiar_Click(object sender, EventArgs e)
    {
        limpiar();
    }
}