using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronPdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using Image = iTextSharp.text.Image;
using Dominio;
using Negocio;
using Negocio.Helper;
using iTextSharp.tool.xml.html.table;
using Org.BouncyCastle.Asn1.Cms;
using System.Text.RegularExpressions;
using System.Activities.Expressions;
using System.Security.Cryptography;

public partial class WF_Simulacion_Pagos : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nsocio = new N_Socio();
    Solicitud sol = new Solicitud();
    Estado_Socio es = new Estado_Socio();
    Helper helper = new Helper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtcodsocio.Text = Session["dni"].ToString();
            lbltipoprestamo.Text = Session["Prestamo"].ToString();
            lblimporte.Text = Session["monto"].ToString();
            lblfecha.Text = Session["fecha"].ToString();
            lbltcea.Text = Session["TEA"].ToString()+"%";
            lblmeses.Text = Session["meses"].ToString();
            lblconstancias.Text = Session["virtual"].ToString();
            lblconstancias1.Text = Session["fisico"].ToString();
            lblconstancias2.Text = Session["ambos"].ToString();
            lblcuotas.Text = Session["cuotas"].ToString();
            lblperiodo.Text = Session["periodo"].ToString();
            lblvalor.Text = Session["valor"].ToString();
            lblbcuotasmeses.Text = Session["mesesAdicionales"].ToString();
            lbldiapago.Text = Session["fechapago"].ToString();
         
            validaciones();
            cuota();
            subProducto();
            calcular();
        }
    }

    void buscarSocioSimulacion ()
    {
        soci.IS_Dni = int.Parse(txtcodsocio.Text);
        Nsocio.BuscarSocio(soci);
        txtnomsocio.Text = "" + soci.VS_Nombre_Completo + " " + soci.VS_Apellido_Paterno + " " + soci.VS_Apellido_Materno;
    }

    public static bool KeepActiveSession()
    {
        if (HttpContext.Current.Session["datos"] != null)
            return true;
        else
            return false;
    }

 
    public static void SessionAbandon()
    {
        HttpContext.Current.Session.Remove("datos");
    }

    void validaciones()
    {
        //cuotas
        if (lblcuotas.Text == "")
        {
            lblcuotas.Text = "No";
        }
        if (lblbcuotasmeses.Text == "")
        {
            lblbcuotasmeses.Text = "No";
        }

        //valor bien
        if (lblvalor.Text == "")
        {
            lblvalor.Text = "-";
        }

        //periodo
        if (lblperiodo.Text == "")
        {
            lblperiodo.Text = "-";
        }

        //comision

        if (lblconstancias1.Text == "" && lblconstancias2.Text == "")
        {
            lblcomision.Text = "-";
        }
        else
        {
            lblcomision.Text = "7 soles";
        }
    }

    public void subProducto()
    {
       //ya lo estoy trayendo de simular prestamos


        if (lbltipoprestamo.Text == "CRÉDITO A SOLA FIRMA")
        {
            lblsubproducto.Text = "CSF001 - A Sola Firma";
            //lbltcea.Text = "12.68%";
            
        }
        if (lbltipoprestamo.Text == "CRÉDITO ORDINARIOS Y SOBREPRESTAMOS")
        {
            lblsubproducto.Text = "COS002 - Ordinario";
            //lbltcea.Text = "42.57%";

        }
        if (lbltipoprestamo.Text == "CRÉDITO HIPOTECARIO Y GARANTIA HIPOTECARIA")
        {
            lblsubproducto.Text = "CHGH003 - Hipotecario";
            //lbltcea.Text = "19.56%";
            btnSolicitar.Visible = false;
        }
    }

    public string teacDividido(string tcea)
    {
        string porcentajeStr = tcea.TrimEnd('%');
        float resultado = (float.Parse(porcentajeStr) / 2 )/ 100;
        string resultadoPorcentaje = resultado+"%";
        return resultadoPorcentaje;
    }
 
    public void cuota()
    {
        //-----------------DETERMINAR CUOTA SEGÚN COOPERATIV-----------
        double importe = double.Parse(lblimporte.Text);//MONTO A FINANCIAR
        //primero calcular TEM,TED,TOTAL
        string tea = lbltcea.Text.TrimEnd('%');
        var porcentaje = Convert.ToDouble(tea) / 100 ;
        double tem =(Math.Pow(1 + porcentaje, 30.0 / 360) - 1) * 100;
        double temPorcentaje = tem / 100 ;
        double ted = Math.Round(((Math.Pow(1 + temPorcentaje, 1.0 / 30) - 1) * 100),2);
        double tedsinround = (Math.Pow(1 + temPorcentaje, 1.0 / 30) - 1) * 100;

        //mora


        //seguro degravamen
        var seguro = 0.048;
        var totalTasaMensual =(tem + seguro);
        //segundo calcular cuota
        //replace de "x meses"
        string numeroMesesStr = lblmeses.Text.Replace(" meses", "");
        int meses = int.Parse(numeroMesesStr);//CUOTAS(NUMEROS DE MESES)
        var totalTasaMensualPorcentaje = totalTasaMensual / 100;
        double cuota = importe * (totalTasaMensualPorcentaje / (1 - Math.Pow(1 + totalTasaMensualPorcentaje, -meses)));
        var cuotaRound = Math.Round(cuota, 2);

        lblcuota.Text = cuotaRound.ToString() + " " + "soles";
        lblcuotamos.Text = cuotaRound.ToString();
        lblimporte.Text = importe+ " " + "soles";
        lblimportemos.Text = importe.ToString();
        lblmeses.Text = meses + " " + "meses";
        lblmesesmos.Text = meses.ToString();
        var temFormated = Math.Round(tem, 2).ToString("N2") + "%";
        lbltasa.Text = temFormated;
        lbltasamos.Text = Math.Round(tem, 2).ToString();
        lblted.Text = tedsinround.ToString();
        lbltedRound.Text = ted.ToString() + "%";
    }

    protected void btnSolicitar_Click(object sender, EventArgs e)
    {
     
        //VALIDAR SI EL SOCIO TIENE LOS DATOS COMPLEMENTARIOS EECTUADOS
        soci.IS_Dni = int.Parse(txtcodsocio.Text);
        Nsocio.consultarSocio(soci, sol, es);
        var tipoVivienda = soci.VS_Tipo_Vivienda;
        var profesion = soci.VS_Profesion;
        var situacionLaboral = soci.VS_Situacion_Laboral;
        var rubroLaboral = soci.VS_Rubro;
        Session["Prestamo"] = "" + lbltipoprestamo.Text;
        Session["meses"] = "" + lblmeses.Text;
        Session["importeSolicitado"] = "" + lblimporte.Text;
        Session["TEM"] = "" + lbltasa.Text;
        Session["TED"] = "" + lbltedRound.Text;
        Session["TCEA"] = "" + lbltcea.Text;
        Session["tipoVivienda"] = tipoVivienda;
        Session["profesion"] = profesion;
        Session["situacionLaboral"] = situacionLaboral;
        Session["rubroLaboral"] = rubroLaboral;
        Session["cuota"] = lblcuotamos.Text;
        DataTable dtbl = calcular();
        Session["data"] = dtbl;

        Response.Redirect("WF_Solicitar_Prestamo.aspx");
    }

    protected void btnRegresar_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Simular_Prestamos.aspx");
    }

    public double calcularSeguroDegravamen(double importe , double temSEGDES)
    {
        var seguroTable = importe * (Math.Pow(1 + Convert.ToDouble(temSEGDES), 30) - 1);
        var precisionSeguro = seguroTable / 100;
        var seguroRound = Math.Round(precisionSeguro, 2);
        return seguroRound;
    }

    public string calcularInteres(double importe)
    {
        var extraerTed = Convert.ToDouble(lblted.Text) / 100;
        var interes = Math.Round(importe * (Math.Pow(1 + extraerTed, 30) - 1), 2);
        var interesFormated = interes.ToString("0.00");
        return interesFormated;
    }

    public double calcularAmortizacion(double seguro, string interes)
    {
        var amortizacion = Convert.ToDouble(lblcuotamos.Text) - Convert.ToDouble(interes) - seguro ;
        
        var amortizacionFormated = amortizacion.ToString("F2");
        // Verifica si el segundo decimal es cero y ajusta el formato si es necesario
        if (amortizacionFormated.EndsWith(",00"))
        {
            amortizacionFormated = (amortizacion + 0.01).ToString();
        }
        return Convert.ToDouble(amortizacionFormated);
    }

    public DataTable calcular()
    {
        double saldoK=0.0;
        double strMonto = double.Parse(lblimportemos.Text);
        int meses = int.Parse(lblmesesmos.Text);
        double InterecAnual = Convert.ToDouble(lbltasamos.Text);
        //seguro
        //calculos de seguro
        //=+(1+R21)^(1/30)-1
        var seguro = 0.048;
        var temSEGD = (Math.Pow(1 + seguro, 1.0 / 30) - 1);
        var resultadoFormateado = temSEGD.ToString("0.00");
        var temSEGDES = Math.Round(Convert.ToDouble(lblted.Text) + Convert.ToDouble(resultadoFormateado), 2);
        var firstSeguro = calcularSeguroDegravamen(strMonto, temSEGD);
        var interesFormated = calcularInteres(strMonto);
        var amortizacion = calcularAmortizacion(firstSeguro, interesFormated);
        var cuota = lblcuotamos.Text;
        DateTime fechaPago = Convert.ToDateTime(lbldiapago.Text);
        DateTime fechaAcumulada = fechaPago;
        //saldo 
        var saldoAcumulado = strMonto;
        var saldo = saldoAcumulado - amortizacion;

        DataTable data = new DataTable();
        data.Columns.Add("N° CUOTA");
        data.Columns.Add("FECHA DE PAGO");
        data.Columns.Add("DÍAS CORRIDOS");
        data.Columns.Add("AMORTIZACIÓN");
        data.Columns.Add("INTERÉS");
        data.Columns.Add("SEGURO");
        data.Columns.Add("CUOTA");
        data.Columns.Add("SALDO");

        for (int I = 1; I < meses + 1; I++)
        {
            System.Web.UI.WebControls.TableRow row = new System.Web.UI.WebControls.TableRow();
            var fechaSolicitud = Convert.ToDateTime(lblfecha.Text);
            var calcularDiasCorridos = Math.Round((fechaPago - fechaSolicitud).TotalDays, 2);
            DateTime FFecha = fechaAcumulada;

            if (I > 1)  // Añadir días solo después del primer recorrido
            {
                FFecha = FFecha.AddDays(calcularDiasCorridos);
                calcularDiasCorridos = Math.Round((FFecha - fechaAcumulada).TotalDays,2);
                fechaAcumulada = FFecha;
                saldoAcumulado = saldo;
                firstSeguro = calcularSeguroDegravamen(saldoAcumulado, temSEGD);
                interesFormated = calcularInteres(saldoAcumulado);
                amortizacion = calcularAmortizacion(firstSeguro, interesFormated);
                if(I == 2)
                { 
                    saldoK = amortizacion;
                    lblCompensatorioMora.Text = helper.interesCompoensatorioPorMora(lbltcea.Text, saldoK).ToString();
                }
                saldo = saldoAcumulado - amortizacion; 
                if(I == meses - 1)
                {
                    saldo =saldo + 0.01;
                }
            }
          
            TableCell cell2 = new TableCell();
            cell2.Text = String.Format("Mes {0}", I);
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = FFecha.ToString("dd/MM/yyyy");
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = calcularDiasCorridos.ToString();
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            var amortizacionRound = Math.Floor(amortizacion * 10) / 10;
            cell2.Text = amortizacionRound.ToString();
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = interesFormated;
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = firstSeguro.ToString();
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = cuota;
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            var saldoRound = Math.Floor(saldo * 10) / 10;
            if (saldoRound < 0)
            {
                saldoRound = 0;
            }
            cell2.Text = saldoRound.ToString();
            row.Cells.Add(cell2);

            myTable.Rows.Add(row);

            
            data.Rows.Add(String.Format("Mes {0}", I), FFecha.ToString("dd/MM/yyyy"), calcularDiasCorridos.ToString(),
            amortizacionRound.ToString(), interesFormated.ToString(), firstSeguro.ToString(), cuota.ToString(), saldoRound.ToString());

        }
     
        return data;
    }
 
    //public double interesCompoensatorioPorMora(double saldoContable)
    //{
    //    var tea = lbltcea.Text.TrimEnd('%');
    //    var topeBCR = 0.15;
    //    var tedNominal = Math.Round(Convert.ToDouble(tea) / 360 ,3);
    //    var saldo = 1282.6 ;
    //    var tedNominalMoratorio = Math.Round(topeBCR * tedNominal , 3);
    //    var interesCompensatorioPorMora = (tedNominalMoratorio/100) * saldo * 7;
    //    var interesC= Math.Round(interesCompensatorioPorMora,2);
    //    return interesC;
    //}


    protected void btnPDF_Click(object sender, EventArgs e)
    {

        try
        {
            DataTable dtbl = calcular();
            tablitapdf(dtbl, "COOPAC SAN COSME LTDA"); 
        }
        catch (Exception ex)
        {
            var mensaje = "error "+ex.Message;
        }
     
    }

    public void tablitapdf(DataTable dtblTable, string strHeader)
    {
        try
        {
            buscarSocioSimulacion();
            //FileStream fs2 = new FileStream(strPdfPath, FileMode.Create, FileAccess.Write, FileShare.None);
            Document pdfDoc = new Document(PageSize.A4, 15.0f, 15.0f, 30.0f, 30.0f);
            PdfWriter pdfwrite = PdfWriter.GetInstance(pdfDoc, System.Web.HttpContext.Current.Response.OutputStream);
            #region TIPOS DE FUENTE
            Font FontB = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 8, Font.NORMAL));
            Font FontB8 = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 8, Font.BOLD));
            Font FontB12 = new Font(FontFactory.GetFont(FontFactory.HELVETICA, 12, Font.BOLD));
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

            col3 = new PdfPCell(new Phrase("CRONOGRAMA DE", FontB8));

            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("Pasaje Enrique Meiggs 2123", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("        PAGOS", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("La Victoria - Lima - Perú", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("RUC:10078799884", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("(992255522)", FontB));
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
            col1 = new PdfPCell(new Phrase("Socio :", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase(txtnomsocio.Text.ToUpper(), FontB));
            col2.Border = 0;
            Table2.AddCell(col2);
            col3 = new PdfPCell(new Phrase("Fecha Emisión:", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(DateTime.Today.ToShortDateString(), FontB));
            col4.Border = 0;
            Table2.AddCell(col4);

            col5 = new PdfPCell(new Phrase("Importe:", FontB8));
            col5.Border = 0;
            Table2.AddCell(col5);
            col5 = new PdfPCell(new Phrase(lblimporte.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

            col1 = new PdfPCell(new Phrase("TEM(%):", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase(lbltasa.Text, FontB));
            col2.Border = 0;
            Table2.AddCell(col2);
            
            col1 = new PdfPCell(new Phrase("Distrito:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase("LIMA", FontB));
            col2.Border = 0;
            Table2.AddCell(col2);
            
            col3 = new PdfPCell(new Phrase("Sub-Producto:", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(lblsubproducto.Text, FontB));
            col4.Border = 0;
            Table2.AddCell(col4);
            
            col3 = new PdfPCell(new Phrase("TEA(%):", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(lbltcea.Text, FontB));
            col4.Border = 0;
            Table2.AddCell(col4);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);


            pdfDoc.Add(Table2);
            #endregion
            pdfDoc.Add(p);
            pdfDoc.Add(new Phrase("\n", FontB8));
            pdfDoc.Add(new Paragraph(12, "                                            CRONOGRAMA DE SIMULACIÓN DE PAGOS", FontB12));
            pdfDoc.Add(new Phrase("\n", FontB8));


           


            #region Tabla4-Detalles
            PdfPTable Table4 = new PdfPTable(dtblTable.Columns.Count);
            float[] widths4 = { 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f , 1.0f };
            Table4.WidthPercentage = 95;
            Table4.SetWidths(widths4);



            BaseFont btnColumnHeader = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            for (int j = 0; j < dtblTable.Columns.Count; j++)
            {
                PdfPCell cell = new PdfPCell();
                cell.BackgroundColor = BaseColor.GRAY;
                cell.AddElement(new Chunk(dtblTable.Columns[j].ColumnName.ToUpper(), FontB8));
                Table4.AddCell(cell);

            }
            //table data
            for (int i = 0; i < dtblTable.Rows.Count; i++)
            {
                for (int j = 0; j < dtblTable.Columns.Count; j++)
                {
                    PdfPCell prueba = new PdfPCell(new Phrase(dtblTable.Rows[i][j].ToString(), FontB8));
                    Table4.AddCell(dtblTable.Rows[i][j].ToString());
                }
            }

            pdfDoc.Add(Table4);

            #endregion

            for (iFila = 1; iFila < 15; iFila++)
            {
                pdfDoc.Add(new Paragraph(" "));
                if (ILine < 200)
                {
                    ILine = (int)pdfwrite.GetVerticalPosition(true);
                }

            }

            #region Tabla3-Cliente
            PdfPTable Table3 = new PdfPTable(2);
            float[] widths3 = { 2.0f, 8.0f };
            Table3.WidthPercentage = 100;
            Table3.SetWidths(widths3);
            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
         
            col2 = new PdfPCell(new Phrase("IMPORTANTE: Se informa que,el interés compensatorio a la tasa anual es " + lbltcea.Text + " ; Interés compensatorio por  mora es de " + lblCompensatorioMora.Text + "%" + " por día de retraso transcurrido (Referencial 7 Días)" + ",cualquier consulta al respecto debe realizarla directamente en la cooperativa. ", FontB8));
            col2.Border = 0;
            col2.PaddingTop = -10;
            col2.PaddingLeft = 10;
            col2.Colspan = 2;
            Table3.AddCell(col2);
            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
            pdfDoc.Add(Table3);

            #endregion
            pdfDoc.Close();
            pdfwrite.Close();
            //fs2.Close();
            Response.ContentType = "application/pdf";
            //Set default file Name as current datetime 
            Response.AddHeader("content-disposition", "attachment; filename=CronogramaPagos.pdf");
            System.Web.HttpContext.Current.Response.Write(pdfDoc);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }


}
