using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using IronPdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;
using System.Security.Cryptography;
using System.Web.UI.WebControls.WebParts;


public partial class WF_Registrar_Ahorros : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nsoc = new N_Socio();
    Movimiento movi = new Movimiento();
    N_Movimiento Nmovi = new N_Movimiento();
    double montocuota = 0;

    double total = 0;
    double monto = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelHistorial.Visible = false;
  

        }
    }
    void buscarDniSocio()
    {
        soci.IS_Dni = int.Parse(txtsocio.Text);
        Nsoc.BuscarSocii(soci);
        txtsociocod.Text = Convert.ToString(soci.PK_IS_Cod);
        txtnombres.Text = "" + soci.VS_Nombre_Completo;
        txtapellido.Text = "" + soci.VS_Apellido_Paterno + " " + soci.VS_Apellido_Materno;
        txtdatos.Text = txtnombres.Text + " " + txtapellido.Text;

    }

    void registrarAhorro()
    {
       
        
        movi.DMove_Fecha_Registro = Convert.ToDateTime(txtfechstransaccion.Text);
        movi.FMove_Importe = Convert.ToDouble(txtmonto.Text);
        movi.VMove_Detalle = txtobservacion.Text;
        movi.FK_IS_Cod = int.Parse(txtsociocod.Text);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarAhorro()", true);
        Nmovi.registrarAhorro(movi);

       
    }
    void listarMovimientos()
    {
      
        soci.PK_IS_Cod = Convert.ToInt32(txtsociocod.Text);
        gv_Tabla_Lista_Movimientos.DataSource = Nmovi.listarMovimientoxSocio(soci);
        gv_Tabla_Lista_Movimientos.DataBind();

       
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
            col3 = new PdfPCell(new Phrase("        REPORTE DE", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("Pasaje Enrique Meiggs 2123", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("            ABONO" +
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

            col5 = new PdfPCell(new Phrase("Ultimo Movimiento:", FontB8));
            col5.Border = 0;
            Table2.AddCell(col5);
            col5 = new PdfPCell(new Phrase(txtmovimiento.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

            col1 = new PdfPCell(new Phrase("Socio:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase(txtdatos.Text, FontB));
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

            pdfDoc.Add(new Paragraph(12, "                                          REPORTE DE ABONO", FontB16));

            pdfDoc.Add(new Phrase("\n", FontB8));


            #region Tabla4-Detalles
            PdfPTable Table4 = new PdfPTable(gv_Tabla_Lista_Movimientos.HeaderRow.Cells.Count);

            Table4.WidthPercentage = 144;
            Table4.HorizontalAlignment=150;

            foreach (TableCell headerCell in gv_Tabla_Lista_Movimientos.HeaderRow.Cells)
            {

                PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text));
                pdfCell.BackgroundColor = new iTextSharp.text.BaseColor(93, 173, 226);


                Table4.AddCell(pdfCell);
            }

            foreach (GridViewRow gridViewRow in gv_Tabla_Lista_Movimientos.Rows)

            {

                foreach (TableCell tableCell in gridViewRow.Cells)

                {

                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text.ToUpper()));

                    Table4.AddCell(pdfCell);
                }



            }

            pdfDoc.Add(Table4);

            #endregion

            pdfDoc.Close();
            pdfwrite.Close();
            //fs2.Close();
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
            Response.ContentType = "application/pdf";


            //Set default file Name as current datetime 
            Response.AddHeader("content-disposition", "attachment; filename=ReporteAbono.pdf") ;
            System.Web.HttpContext.Current.Response.Write(pdfDoc);
            System.Web.HttpContext.Current.Server.HtmlEncode("UTF-8");

            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    protected void btnBuscarSocio_Click(object sender, EventArgs e)
    {
        if (txtsocio.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertSociovacio()", true);
           
        }
        else
        {
            buscarDniSocio();
            listarMovimientos();
            PanelHistorial.Visible = true;

        }
      
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        txtsocio.Text = "";
        txtnombres.Text = "";
        txtapellido.Text = "";
        txtmovimiento.Text =""+ 0;
        PanelHistorial.Visible = false;
    }

    protected void btnGrabar_Click(object sender, EventArgs e)
    {
       
        if (txtfechstransaccion.Text == "")
        {
            lblErrorFecha.Visible = true;
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertaVacio()", true);
        }
        if (txtmonto.Text == "")
        {
            lblMonto.Visible = true;
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertaVacio()", true);
        }
       
        if (!string.IsNullOrEmpty(txtfechstransaccion.Text) && !string.IsNullOrEmpty(txtmonto.Text))
        {
            lblErrorFecha.Visible = false;
            lblMonto.Visible = false;
            registrarAhorro();
            listarMovimientos();
            txtfechstransaccion.Text = "";
            txtmonto.Text = "";
            txtobservacion.Text = "";
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
    }

    protected void btnGenerar_Click(object sender, EventArgs e)
    {
        tablitapdf("GENERAR REPORTE ABONO");
    }

    protected void gv_Tabla_Lista_Movimientos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
        
            total = total + Convert.ToDouble(e.Row.Cells[4].Text);
            string tipo = e.Row.Cells[2].Text;
       
            if (tipo == "AMORTIZACION DE CUOTA" ) //&& tipo =="DESEMBOLSO"
            {
                 monto +=Convert.ToDouble(e.Row.Cells[4].Text);
              
            }

            if (tipo == "APORTE/APOYO/SEPELIO")
            {
                montocuota += Convert.ToDouble(e.Row.Cells[4].Text);
                
            }

            txtsaldodisponible.Text = Convert.ToString(total - (monto + montocuota));
            txtsaldoactual.Text = Convert.ToString(total - monto);

            int valor = Convert.ToInt32(this.gv_Tabla_Lista_Movimientos.Rows.Count) + 1;
            txtmovimiento.Text = valor.ToString();

        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[4].Text = total.ToString();
        }
    
    }

    protected void gv_Tabla_Lista_Movimientos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      

    

    }

}
