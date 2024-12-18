using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using iTextSharp.text.pdf.draw;
using iTextSharp.text.pdf;
using iTextSharp.text;
using Negocio;
using IronPdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;
public partial class WF_Listar_Movimientos : System.Web.UI.Page
{
    Movimiento movi = new Movimiento();
    N_Movimiento Nmovi = new N_Movimiento();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            listarMovimientos();

            txtcantidad.Text = Convert.ToString(this.gv_Tabla_Lista_Movimientos.Rows.Count);

        }

    }
    void listarMovimientos()
    {

        gv_Tabla_Lista_Movimientos.DataSource = Nmovi.listarMovimiento();
        gv_Tabla_Lista_Movimientos.DataBind();

    }
    protected void gv_Tabla_Lista_Movimientos_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gv_Tabla_Lista_Movimientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

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
            col3 = new PdfPCell(new Phrase("        HISTORIAL REPORTE", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("Pasaje Enrique Meiggs 2123", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("            MOVIMIENTOS" +
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

            col5 = new PdfPCell(new Phrase("Cantidad Movimientos:", FontB8));
            col5.Border = 0;
            Table2.AddCell(col5);
            col5 = new PdfPCell(new Phrase(txtcantidad.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

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

            pdfDoc.Add(new Paragraph(12, "                                          REPORTE DE MOVIMIENTOS", FontB16));

            pdfDoc.Add(new Phrase("\n", FontB8));


            #region Tabla4-Detalles
            PdfPTable Table4 = new PdfPTable(gv_Tabla_Lista_Movimientos.HeaderRow.Cells.Count);

            Table4.WidthPercentage = 100;

            foreach (DataControlField headerCell in gv_Tabla_Lista_Movimientos.Columns)
            {

                PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.HeaderText));
                pdfCell.BackgroundColor = new iTextSharp.text.BaseColor(93, 173, 226);
                Table4.AddCell(pdfCell);
            }

            foreach (GridViewRow gridViewRow in gv_Tabla_Lista_Movimientos.Rows)
            {
                foreach (TableCell tableCell in gridViewRow.Cells)
                {
                    string cellText = tableCell.Text.ToLower();
                    if (string.IsNullOrEmpty(cellText) || cellText == "&nbsp;")
                    {
                        cellText = "sin registro";
                    }

                    PdfPCell pdfCell = new PdfPCell(new Phrase(cellText));
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
            Response.AddHeader("content-disposition", "attachment; filename=HistorialMovimientos.pdf");
            System.Web.HttpContext.Current.Response.Write(pdfDoc);

            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    protected void gv_Tabla_Lista_Movimientos_Sorting(object sender, GridViewSortEventArgs e)
    {
        var listaMovimientos = Nmovi.listarMovimiento(); 
        var rows = listaMovimientos.AsEnumerable();

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


        if (sortExpression == "DMove_Fecha_Registro")
        {
            if (sortDirection == "ASC")
            {
                rows = rows.OrderBy(row => row.Field<DateTime>("DMove_Fecha_Registro"));
            }
            else
            {
                rows = rows.OrderByDescending(row => row.Field<DateTime>("DMove_Fecha_Registro"));
            }
        }
        else if (sortExpression == "PK_Numero_Transaccion")
        {
            if (sortDirection == "ASC")
            {
                rows = rows.OrderBy(row => row.Field<int>("PK_Numero_Transaccion"));
            }
            else
            {
                rows = rows.OrderByDescending(row => row.Field<int>("PK_Numero_Transaccion"));
            }
        }
        DataTable dtOrdenado = rows.CopyToDataTable();
        gv_Tabla_Lista_Movimientos.DataSource = dtOrdenado;
        gv_Tabla_Lista_Movimientos.DataBind();
    }
}