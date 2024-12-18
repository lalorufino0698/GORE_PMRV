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
using IronPdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;

public partial class WF_Listar_Socios_Suspendidos : System.Web.UI.Page
{
    Socio soc = new Socio();
    N_Socio Nsoc = new N_Socio();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            listarSociosSuspendidos();
            listarSociosSuspendidosGridviewFalse();
            txtcantidad.Text = Convert.ToString(this.gv_Tabla_Lista_Socios_Suspendidos.Rows.Count);

            if (gv_Tabla_Lista_Socios_Suspendidos.Rows.Count <=0)
            {
                btnGenerarReporte.Visible = false;
            }

        }
    }

    void listarSociosSuspendidos()
    {

        gv_Tabla_Lista_Socios_Suspendidos.DataSource = Nsoc.listarSociosSuspendidos(soc);
        gv_Tabla_Lista_Socios_Suspendidos.DataBind();

    }

    void listarSociosSuspendidosGridviewFalse()
    {

        GridView2.DataSource = Nsoc.listarSociosSuspendidos(soc);
        GridView2.DataBind();

    }
    protected void gv_Tabla_Lista_Socios_Suspendidos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Habilitar")//Habilitar

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodSocioGrid.Text = gv_Tabla_Lista_Socios_Suspendidos.Rows[index].Cells[0].Text;
            soc.PK_IS_Cod = int.Parse(txtcodSocioGrid.Text);
            soc.FK_IESocio_Cod = 1;
            Nsoc.ActualizarEstadoSocio(soc);

            listarSociosSuspendidos();

        }
    }

    protected void gv_Tabla_Lista_Socios_Suspendidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_Tabla_Lista_Socios_Suspendidos.PageIndex = e.NewPageIndex;
        listarSociosSuspendidos();

    }

    protected void gv_Tabla_Lista_Socios_Suspendidos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VESocio_Estado_Socio").ToString();
            if (estado == "Suspendido")
            {
                e.Row.Cells[7].ForeColor = System.Drawing.Color.Red;


            }
        }

    }


    protected void btnGenerarReporte_Click(object sender, EventArgs e)
    {
        tablitapdf("GENERAR COMPROBANTE PRESTAMO");
    }




    public void tablitapdf(string strHeader)
    {
        try
        {

            //FileStream fs2 = new FileStream(strPdfPath, FileMode.Create, FileAccess.Write, FileShare.None);
            Document pdfDoc = new Document(PageSize.A4, 15.0f, 15.0f, 30.0f, 30.0f);

            PdfWriter pdfwrite = PdfWriter.GetInstance(pdfDoc, System.Web.HttpContext.Current.Response.OutputStream);



            #region TIPOS DE FUENTE
            Font FontB = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 8, Font.NORMAL));
            Font FontB8 = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 8, Font.BOLD));
            Font FontB12 = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 12, Font.BOLD));
            Font FontB16 = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 16, Font.BOLD));
            #endregion
            PdfPCell CVacio = new PdfPCell(new Phrase(""));
            CVacio.Border = 0;
            pdfDoc.Open();
            float[] a = { 4.0f, 7.0f, 1.0f, 4.0f };
            PdfPTable tabla = new PdfPTable(4);
            PdfPCell col1 = new PdfPCell();
            PdfPCell col2 = new PdfPCell();
            PdfPCell col3 = new PdfPCell();
            PdfPCell col4 = new PdfPCell();
            PdfPCell col5 = new PdfPCell();
            PdfPCell col6 = new PdfPCell();
            PdfPCell col7 = new PdfPCell();
            int ILine = 0;
            int iFila = 0;
            tabla.WidthPercentage = 95;

            tabla.SetWidths(a);
            #region Tabla1-Encabezado
            string imagenURL = Server.MapPath("/img/SanCosme.png");
            Image imagenBMP = Image.GetInstance(imagenURL);
            imagenBMP.ScaleToFit(100.0f, 100.0f);
            imagenBMP.SpacingBefore = 10.0f;
            imagenBMP.SpacingAfter = 20.0f;
            imagenBMP.SetAbsolutePosition(40, 765);
            pdfDoc.Add(imagenBMP);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("COOPAC SAN COSME LTDA.", FontB8));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("        REPORTE SOCIOS", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("Pasaje Enrique Meiggs 2123", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("            SUSPENDIDOS" +
                "", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("La Victoria - Lima - Perú", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("      RUC:10078799884", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("(993403034)", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("www.coopacsancosme.com", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("       ", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);
            pdfDoc.Add(tabla);
            #endregion

            Paragraph p = new Paragraph(new Chunk(new LineSeparator(0.0F, 100.0F, BaseColor.BLACK, Element.ALIGN_LEFT, 3)));


            pdfDoc.Add(new Paragraph("."));

            #region Tabla2-Cliente
            PdfPTable Table2 = new PdfPTable(4);
            float[] widths2 = { 2.0f, 8.0f, 3.0f, 2.0f };
            Table2.WidthPercentage = 95;
            Table2.SetWidths(widths2);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);
            col1 = new PdfPCell(new Phrase("Autorizacion :", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase("Cajera", FontB));
            col2.Border = 0;
            Table2.AddCell(col2);
            col3 = new PdfPCell(new Phrase("Fecha Emisión:", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(DateTime.Today.ToShortDateString(), FontB));
            col4.Border = 0;
            Table2.AddCell(col4);

            col5 = new PdfPCell(new Phrase("Cantidad Suspendidos:", FontB8));
            col5.Border = 0;
            Table2.AddCell(col5);
            col5 = new PdfPCell(new Phrase(txtcantidad.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

            col1 = new PdfPCell(new Phrase("Estado:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase("Suspendido", FontB));
            col2.Border = 0;
            Table2.AddCell(col2);

            col1 = new PdfPCell(new Phrase("Distrito:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase("LIMA", FontB));
            col2.Border = 0;
            Table2.AddCell(col2);

            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);
            pdfDoc.Add(Table2);

            #endregion
            pdfDoc.Add(p);



            pdfDoc.Add(new Phrase("\n", FontB8));

            pdfDoc.Add(new Paragraph(12, "                                          REPORTE DE DEUDORES", FontB16));
       
            pdfDoc.Add(new Phrase("\n", FontB8));
      

            #region Tabla4-Detalles
            PdfPTable Table4 = new PdfPTable(GridView2.HeaderRow.Cells.Count);
         
            Table4.WidthPercentage = 100;
       
            foreach (TableCell headerCell in GridView2.HeaderRow.Cells)
            {
                
                PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text));
                pdfCell.BackgroundColor = new iTextSharp.text.BaseColor(93,173,226);
                



                Table4.AddCell(pdfCell);
            }

            foreach (GridViewRow gridViewRow in GridView2.Rows)
                
            {

                foreach (TableCell tableCell in gridViewRow.Cells)

                {
                   
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text.ToLower()));
                   
                    Table4.AddCell(pdfCell);
                }
         
          
      
            }

            pdfDoc.Add(Table4);

            #endregion

            pdfDoc.Close();
            pdfwrite.Close();
            //fs2.Close();

            Response.ContentType = "application/pdf";

            //Set default file Name as current datetime 
            Response.AddHeader("content-disposition", "attachment; filename=SociosSuspendidos.pdf");
            System.Web.HttpContext.Current.Response.Write(pdfDoc);

            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Habilitar")//Habilitar

        {
            int index = Convert.ToInt32(e.CommandArgument);
            txtcodSocioGrid.Text = GridView2.Rows[index].Cells[0].Text;
            soc.PK_IS_Cod = int.Parse(txtcodSocioGrid.Text);
            soc.FK_IESocio_Cod = 1;
            Nsoc.ActualizarEstadoSocio(soc);

            listarSociosSuspendidos();

        }
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        listarSociosSuspendidos();
    }
    protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)
    {
        
        var listaSocioSuspendidos = Nsoc.listarSociosSuspendidos(soc);
        var rows = listaSocioSuspendidos.AsEnumerable();

        string sortExpression = e.SortExpression;
        // Obtén el estado de orden actual desde la ViewState o una variable de sesión
        string sortDirection = Session["SortDirection"] as string;
        if (string.IsNullOrEmpty(sortDirection))
        {
            sortDirection = "ASC"; // Por defecto, orden ascendente en la primera vez
        }

        // Cambia la dirección de ordenación en cada clic
        sortDirection = (sortDirection == "ASC") ? "DESC" : "ASC";

        // Guarda el estado de orden actual en la ViewState o una variable de sesión
        Session["SortDirection"] = sortDirection;
        if (sortDirection == "ASC")
        {
            rows = rows.OrderBy(row => row.Field<DateTime>("DS_Fecha_Registro"));
        }
        else
        {
            rows = rows.OrderByDescending(row => row.Field<DateTime>("DS_Fecha_Registro"));
        }
        DataTable dtOrdenado = rows.CopyToDataTable();
        GridView2.DataSource = dtOrdenado;
        GridView2.DataBind();

    }


    protected void gv_Tabla_Lista_Socios_Suspendidos_Sorting(object sender, GridViewSortEventArgs e)
    {

        var listaSocioSuspendidos = Nsoc.listarSociosSuspendidos(soc);
        var rows = listaSocioSuspendidos.AsEnumerable();

        string sortExpression = e.SortExpression;
        // Obtén el estado de orden actual desde la ViewState o una variable de sesión
        string sortDirection = Session["SortDirection"] as string;
        if (string.IsNullOrEmpty(sortDirection))
        {
            sortDirection = "ASC"; // Por defecto, orden ascendente en la primera vez
        }

        // Cambia la dirección de ordenación en cada clic
        sortDirection = (sortDirection == "ASC") ? "DESC" : "ASC";

        // Guarda el estado de orden actual en la ViewState o una variable de sesión
        Session["SortDirection"] = sortDirection;
        if (sortDirection == "ASC")
        {
            rows = rows.OrderBy(row => row.Field<DateTime>("DS_Fecha_Registro"));
        }
        else
        {
            rows = rows.OrderByDescending(row => row.Field<DateTime>("DS_Fecha_Registro"));
        }
        DataTable dtOrdenado = rows.CopyToDataTable();
        gv_Tabla_Lista_Socios_Suspendidos.DataSource = dtOrdenado;
        gv_Tabla_Lista_Socios_Suspendidos.DataBind();

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}