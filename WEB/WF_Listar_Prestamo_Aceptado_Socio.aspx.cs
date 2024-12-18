using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using Negocio.Helper;
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

public partial class WF_Listar_Prestamo_Aceptado_Socio : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nso = new N_Socio();

    Cuota cu = new Cuota();
    N_Cuota Ncu = new N_Cuota();

    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();

    Movimiento move = new Movimiento();
    N_Movimiento nMove = new N_Movimiento();
    Helper helper = new Helper();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            txtCodPatrocinador.Text = Session["dni"].ToString();
            

            soci.IS_Dni = Convert.ToInt32(txtCodPatrocinador.Text);
            Nso.BuscarSocioxdni(soci);
            txtCodSocio.Text = "" + soci.PK_IS_Cod;

            Nso.BuscarSocio(soci);
            txtNomSocioprestamoAceptada.Text = soci.VS_Nombre_Completo + ' ' + soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno; ;
            listarprestamoaceptadosocio();
        }
    }



    void listarprestamoaceptadosocio()
    {
        soci.PK_IS_Cod = int.Parse(txtCodSocio.Text);
        gv_Tabla_Prestamo_Aceptado_Socio.DataSource = Nso.listarPrestamoAceptadoxsocio(soci);
        gv_Tabla_Prestamo_Aceptado_Socio.DataBind();
    }
    protected void gv_Tabla_Prestamo_Aceptado_Socio_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gv_Tabla_Prestamo_Aceptado_Socio.PageIndex = e.NewPageIndex;
        listarprestamoaceptadosocio();
    }

 

    protected void gv_Tabla_Prestamo_Aceptado_Socio_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "EstadoDePrestamo").ToString();
            if (estado == "Aceptado" || estado =="Desembolsado")
            {
                e.Row.Cells[8].ForeColor = System.Drawing.Color.Green;
            }
        }

   
    }

    protected void gv_Tabla_Prestamo_Aceptado_Socio_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "GenerarTicket")//VER 

        {

          
            int index = Convert.ToInt32(e.CommandArgument);
            string numPrestamo = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[0].Text;
            string tipoPrestamo = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[1].Text;
            DateTime fecha = Convert.ToDateTime(gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[2].Text);
            string cuotas = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[3].Text;
            string residencia = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[4].Text;
            string importe = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[5].Text;
            string tasamen = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[6].Text;
            string tcea = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[7].Text;
            string estado = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[8].Text;
            DateTime fechaInicio = fecha.AddDays(1);
            DateTime fechaExpiracion = fecha.AddDays(7);
            txtNumPrestamo.Text = numPrestamo;
            txtImportePrestamoAceptado.Text = importe;
            txtNumCuotas.Text = cuotas;
            txtFechaRegistro.Text = fecha.ToString("dd/MM/yyyy");
            txtRangoFecha.Text = fechaInicio.ToString("dd/MM/yyyy") + " " + "hasta" + " " + fechaExpiracion.ToString("dd/MM/yyyy");
            txtfechafin.Text = fechaExpiracion.ToString("dd/MM/yyyy");
            txttcea.Text = tcea;
            txttasamen.Text = tasamen;

            //idPrestamo
            var intNumPrestamo = Convert.ToInt32(numPrestamo);
            //idsocio
            var intCodSocio = Convert.ToInt32(txtCodSocio.Text);
            DataTable dtbl = Npre.listaCronogramaPagoPorSocioPorPrestamo(intNumPrestamo, intCodSocio);
            registrarCuotas(dtbl);
            llenarTablaMovimiento();

            /*actulizar estado*/
            pre.PK_IPre_Cod = int.Parse(txtNumPrestamo.Text);
            pre.FK_IEPre = 4;
            Npre.ActualizarEstadoPrestamo(pre);

            // Llamada a la función para generar el PDF
            tablitapdf();

        
        }

        if (e.CommandName == "GenerarCronograma")
        {
            //consultar cronograma de usuario segun el prestamo
            int index = Convert.ToInt32(e.CommandArgument);
            string numPrestamo = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[0].Text;
            string tipoPrestamo = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[1].Text;
            string importe = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[5].Text;
            string tasamen = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[6].Text;
            string tcea = gv_Tabla_Prestamo_Aceptado_Socio.Rows[index].Cells[7].Text;

            txttcea.Text = tcea;
            txttasamen.Text = tasamen;
            txtImportePrestamoAceptado.Text = importe;
            txtTipoPrestamo.Text = tipoPrestamo;
            //idPrestamo
            var intNumPrestamo = Convert.ToInt32(numPrestamo);
            //idsocio
            var intCodSocio = Convert.ToInt32(txtCodSocio.Text);
        
            DataTable dtbl = Npre.listaCronogramaPagoPorSocioPorPrestamo(intNumPrestamo, intCodSocio);
            double amortizacionMes2 = Convert.ToDouble(dtbl.Rows[1]["AMORTIZACION"]);
            var interesCompensatorio = helper.interesCompoensatorioPorMora(txttcea.Text, amortizacionMes2);
            txtCompensatorio.Text = interesCompensatorio.ToString();
            tablitapdfCronograma(dtbl, "GENERAR CRONOGRAMA PAGO");

        }

       

    }

    void llenarTablaMovimiento()
    {
        move.DMove_Fecha_Registro = Convert.ToDateTime(txtFechaRegistro.Text);
        move.FMove_Importe = double.Parse(txtImportePrestamoAceptado.Text);
        move.VMove_Detalle = "Se registró el movimiento con el tipo desembolso";
        move.FK_IS_Cod = int.Parse(txtCodSocio.Text);
        nMove.RegistrarMovimientoxDesembolso(move);
      
    }



    public void calcular()
    {
        double strMonto = double.Parse(txtImportePrestamoAceptado.Text);
        int meses = int.Parse(txtNumCuotas.Text);
        double InterecAnual = Convert.ToDouble(txttasamen.Text);
        double tasaPorcentual = InterecAnual / 100;
        double potenciaNumero = (1 + tasaPorcentual);
        double potenciaVariable = Math.Pow(potenciaNumero, -meses);
        double Cuotaaa = strMonto * (tasaPorcentual / (1 - potenciaVariable));
        double numCuota = Math.Round(Cuotaaa, 2);

        //txtMontoCuotas.Text = numCuota.ToString();
        double INTERES = 0;
        double TINTERES = 0;
        double CAPITAL = 0;
        double TAMORTIZADO = 0;
        double TCUOTA = 0;
        double SALDOINICIAL = 0;
        double SALDORESTANTE = 0;
        double ACUMULADO = 0;
        double SALDOFINAL = strMonto;
        for (int I = 1; I < meses + 1; I++)
        {

            TableRow row = new TableRow();

            //INTERES APLICADO A LA TASA
            TINTERES += INTERES;
            ACUMULADO += INTERES; //
            SALDOINICIAL = Math.Round(SALDOFINAL, 2);
            CAPITAL = Math.Round(numCuota, 2);
            SALDOFINAL -= CAPITAL;
            SALDORESTANTE = SALDOINICIAL - CAPITAL;
            INTERES = Math.Round(SALDOINICIAL * tasaPorcentual, 2);
            TAMORTIZADO = Math.Round(numCuota - INTERES, 2);

            if (SALDORESTANTE < 0)
            {
                SALDORESTANTE = 0;
            }

            DateTime FFecha = Convert.ToDateTime(txtFechaRegistro.Text);
            FFecha = FFecha.AddMonths(I);
            TableCell cell2 = new TableCell();
            cell2.Text = String.Format("Mes {0}", I);
            row.Cells.Add(cell2);
            cell2 = new TableCell();
            cell2.Text = FFecha.ToString("dd/MM/yyyy");
            row.Cells.Add(cell2);
            cell2 = new TableCell();
            cell2.Text = SALDOINICIAL.ToString();
            row.Cells.Add(cell2);
            cell2 = new TableCell();
            cell2.Text = TAMORTIZADO.ToString();
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = INTERES.ToString();
            row.Cells.Add(cell2);


            cell2 = new TableCell();
            cell2.Text = numCuota.ToString();
            row.Cells.Add(cell2);

            cell2 = new TableCell();
            cell2.Text = SALDORESTANTE.ToString();
            row.Cells.Add(cell2);

            DateTime fechahoy = DateTime.Now.Date;
            DateTime fechafin = FFecha.AddMonths(1);
          
            //cu.IC_NumeroCuota = Convert.ToInt32(I);
            //cu.DC_FechaPago = fechahoy;
            //cu.FC_MontoCuota = Convert.ToDouble(numCuota);
            //cu.DC_FechaInicio = Convert.ToDateTime(FFecha);
            //cu.DC_FechaFin = Convert.ToDateTime(fechafin);
            //cu.FK_IPre_Cod = int.Parse(txtNumPrestamo.Text);
            //Ncu.RegistrarCuota(cu);
        }
    }

    public void registrarCuotas(DataTable dt)
    {
        DateTime fechahoy = DateTime.Now.Date;

        for (int i = 0; i < dt.Rows.Count ; i++)
        {
            cu.IC_NumeroCuota = Convert.ToInt32(i + 1);
            cu.DC_FechaRegistro = fechahoy;
            cu.FC_MontoAPagar = Convert.ToDouble(dt.Rows[i]["AMORTIZACION"].ToString());
            cu.DC_FechaInicio = Convert.ToDateTime(dt.Rows[i]["FECHA_PAGO"].ToString());
            int diasCorridos = Convert.ToInt32(dt.Rows[i]["DIAS_CORRIDOS"].ToString());
            var fechaInicioSet = cu.DC_FechaInicio;
            DateTime fechafin = fechaInicioSet.AddDays(diasCorridos);
            cu.DC_FechaFin = Convert.ToDateTime(fechafin);
            cu.FC_SaldoRestante = Convert.ToDouble(dt.Rows[i]["SALDO"].ToString());
            cu.FC_ValorCuota = Convert.ToDouble(dt.Rows[i]["CUOTA"].ToString());
            cu.FK_IPre_Cod = int.Parse(txtNumPrestamo.Text);
            Ncu.RegistrarCuota(cu);
        }

    }




    DataTable MakeDataTable()
    {
        string fechapago = DateTime.Now.AddDays(5).ToString();
        double strMonto = double.Parse(txtImportePrestamoAceptado.Text);
        int meses = int.Parse(txtNumCuotas.Text);
        double InterecAnual = Convert.ToDouble(txttasamen.Text);
        double tasaPorcentual = InterecAnual / 100;
        double potenciaNumero = (1 + tasaPorcentual);
        double potenciaVariable = Math.Pow(potenciaNumero, -meses);
        double Cuotaaa = strMonto * (tasaPorcentual / (1 - potenciaVariable));
        double numCuota = Math.Round(Cuotaaa, 2);
        double INTERES = 0;
        double TINTERES = 0;
        double CAPITAL = 0;
        double TAMORTIZADO = 0;
        double TCUOTA = 0;
        double SALDOINICIAL = 0;
        double SALDORESTANTE = 0;
        double ACUMULADO = 0;
        double SALDOFINAL = strMonto;
        DataTable data = new DataTable();
        data.Columns.Add("Mes");
        data.Columns.Add("Fecha");
        data.Columns.Add("Saldo Inicial");
        data.Columns.Add("Amortizacion");
        data.Columns.Add("Interes");
        data.Columns.Add("Cuota");
        data.Columns.Add("Saldo Capital");
        for (int I = 1; I < meses + 1; I++)
        {
            //INTERES APLICADO A LA TASA
            TINTERES += INTERES;
            ACUMULADO += INTERES; //
            SALDOINICIAL = SALDOFINAL;
            CAPITAL = Math.Round(numCuota, 2);
            SALDOFINAL -= CAPITAL;
            SALDORESTANTE = SALDOINICIAL - CAPITAL;
            INTERES = Math.Round(SALDOINICIAL * tasaPorcentual, 2);
            TAMORTIZADO = Math.Round(numCuota - INTERES, 2);

            if (SALDORESTANTE < 0)
            {
                SALDORESTANTE = 0;
            }
            DateTime FFecha = Convert.ToDateTime(fechapago);
            FFecha = FFecha.AddMonths(I);



            data.Rows.Add(String.Format("Mes {0}", I), FFecha.ToString("dd/MM/yyyy"), SALDOINICIAL.ToString(), TAMORTIZADO.ToString(), INTERES.ToString(), numCuota.ToString(), SALDORESTANTE.ToString());

        }
        return data;

    }
    public void  tablitapdf()
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
            col3 = new PdfPCell(new Phrase("        TICKET DE", FontB8));
            col3.Border = 0;
            tabla.AddCell(col3);

            tabla.AddCell(CVacio);
            col2 = new PdfPCell(new Phrase("Pasaje Enrique Meiggs 2123", FontB));
            col2.Border = 0;
            tabla.AddCell(col2);

            tabla.AddCell(CVacio);
            col3 = new PdfPCell(new Phrase("       DESEMBOLSO" +
                "", FontB8));
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
            col2 = new PdfPCell(new Phrase(txtNomSocioprestamoAceptada.Text.ToUpper(), FontB));
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
            col5 = new PdfPCell(new Phrase(txtImportePrestamoAceptado.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

            col1 = new PdfPCell(new Phrase("Numero de Cuotas:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase(txtNumCuotas.Text, FontB));
            col2.Border = 0;
            Table2.AddCell(col2);

            col1 = new PdfPCell(new Phrase("Distrito:", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase("LIMA", FontB));
            col2.Border = 0;
            Table2.AddCell(col2);


            col3 = new PdfPCell(new Phrase("Fecha de Registro:", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(txtFechaRegistro.Text, FontB));
            col4.Border = 0;
            Table2.AddCell(col4);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);
            pdfDoc.Add(Table2);

            #endregion

            pdfDoc.Add(p);


            pdfDoc.Add(new Phrase("\n", FontB8));

            pdfDoc.Add(new Paragraph(12, "                                                           SU PRESTAMO HA SIDO ACEPTADO Y ESTÁ SIENDO PROCESADO.", FontB8));
            pdfDoc.Add(new Paragraph(12, "                   SIRVASE A ACERCARSE A PARTIR DE MAÑANA A NUESTRAS OFICINAS PARA PODER FIRMAR EL CONTRATO DE PRÉSTAMOS Y ", FontB8));
            pdfDoc.Add(new Paragraph(12, "                   REALIZAR EL DESEMBOLSO O LLÁMEMOS AL 992 255 552. ", FontB8));
            pdfDoc.Add(new Phrase("\n", FontB8));
            pdfDoc.Add(new Phrase("\n", FontB8));



            #region Tabla3-Cliente
            PdfPTable Table3 = new PdfPTable(2);
            float[] widths3 = { 2.0f, 8.0f };
            Table3.WidthPercentage = 100;
            Table3.SetWidths(widths3);
            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
            col1 = new PdfPCell(new Phrase("Nro. de Prestamo :", FontB8));
            col1.Border = 0;
            Table3.AddCell(col1);
            col2 = new PdfPCell(new Phrase("N° " + txtNumPrestamo.Text, FontB));
            col2.Border = 0;

            pdfDoc.Add(new Phrase("", FontB8));

            Table3.AddCell(col2);
            col5 = new PdfPCell(new Phrase("Nro. de Dni :", FontB8));
            col5.Border = 0;
            Table3.AddCell(col5);
            col5 = new PdfPCell(new Phrase(txtCodPatrocinador.Text, FontB));
            col5.Border = 0;
            Table3.AddCell(col5);


            col1 = new PdfPCell(new Phrase("Agencia de Entrega :", FontB8));
            col1.Border = 0;
            Table3.AddCell(col1);



            col2 = new PdfPCell(new Phrase("Dirección : Pasaje Enrique Meiggs 2123 La Victoria - Lima - Perú", FontB));
            col2.Border = 0;
            Table3.AddCell(col2);
            col2 = new PdfPCell(new Phrase("Horario de Atención : De Lunes a Viernes de 8:30 a 17:00 hrs", FontB));
            col2.Border = 0;
            col2.PaddingLeft = 115;
            col2.Colspan = 2;
            Table3.AddCell(col2);



            col2 = new PdfPCell(new Phrase("Teléfono : 0 63422918", FontB));
            col2.Border = 0;
            col2.PaddingTop = 3;
            col2.PaddingLeft = 115;
            col2.Colspan = 2;


            Table3.AddCell(col2);

            col5 = new PdfPCell(new Phrase("Fecha de Entrega Aproximada :", FontB8));
            col5.Border = 0;
            Table3.AddCell(col5);
            col5 = new PdfPCell(new Phrase(txtRangoFecha.Text, FontB));
            col5.Border = 0;
            col5.PaddingTop = 7;
            col5.Colspan = 3;
            Table3.AddCell(col5);


            col1 = new PdfPCell(new Phrase("Importante :", FontB8));
            col1.Border = 0;
            Table3.AddCell(col1);
            col2 = new PdfPCell(new Phrase("El recojo del préstamo es personal, Ud. debe llevar su DNI y Carnet de Socio. Si no tuviera el Carnet de Socio, se podrá verificar en la agencia mediante un formato de Declaración Jurada indicando que es socio de la Cooperativa.", FontB));
            col2.Border = 0;
            Table3.AddCell(col2);

            col2 = new PdfPCell(new Phrase("Para Cualquier consulta Llámanos a nuestra Línea Telefónica", FontB));
            col2.Border = 0;
            col2.PaddingTop = 10;
            col2.PaddingLeft = 115;
            col2.Colspan = 2;

            Table3.AddCell(col2);


            col2 = new PdfPCell(new Phrase("992-255-522", FontB16));
            col2.Border = 0;
            col2.PaddingTop = 10;
            col2.PaddingLeft = 115;
            col2.Colspan = 2;

            Table3.AddCell(col2);



            col2 = new PdfPCell(new Phrase("Gracias por utilizar nuesto servicio", FontB16));
            col2.Border = 0;
            col2.PaddingTop = 10;
            col2.PaddingLeft = 145;
            col2.Colspan = 2;

            Table3.AddCell(col2);


            col2 = new PdfPCell(new Phrase("Todos los derechos reservados ®️ME ", FontB8));
            col2.Border = 0;
            col2.PaddingTop = 10;
            col2.PaddingLeft = 179;
            col2.Colspan = 2;

            Table3.AddCell(col2);



            col2 = new PdfPCell(new Phrase("https://www.coopacsancosme.com/", FontB8));
            col2.Border = 0;
            col2.PaddingTop = 300;
            col2.PaddingLeft = 10;
            col2.Colspan = 2;

            Table3.AddCell(col2);



            Table3.AddCell(CVacio);
            Table3.AddCell(CVacio);
            pdfDoc.Add(Table3);

            #endregion
       
            for (iFila = 1; iFila < 15; iFila++)
            {
                pdfDoc.Add(new Paragraph(" "));
                if (ILine < 200)
                {
                    ILine = (int)pdfwrite.GetVerticalPosition(true);
                }

            }

            pdfDoc.Close();
            pdfwrite.Close();
            //fs2.Close();

            Response.ContentType = "application/pdf";

            //Set default file Name as current datetime 
            Response.AddHeader("content-disposition", "attachment; filename=TicketPrestamo.pdf");
            System.Web.HttpContext.Current.Response.Write(pdfDoc);

            Response.Flush();
            Response.End();

            // Agrega un script al final del documento PDF para ejecutar en el lado del cliente después de la descarga
            string script = "<script type='text/javascript'>disableButton();</script>";
            Response.Write(script);


        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
   
    }


    public void tablitapdfCronograma(DataTable dtblTable, string strHeader)
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
            col2 = new PdfPCell(new Phrase(txtNomSocioprestamoAceptada.Text.ToUpper(), FontB));
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
            col5 = new PdfPCell(new Phrase(txtImportePrestamoAceptado.Text, FontB));
            col5.Border = 0;
            Table2.AddCell(col5);

            col1 = new PdfPCell(new Phrase("TEM(%):", FontB8));
            col1.Border = 0;
            Table2.AddCell(col1);
            col2 = new PdfPCell(new Phrase(txttasamen.Text, FontB));
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
            col4 = new PdfPCell(new Phrase(txtTipoPrestamo.Text, FontB));
            col4.Border = 0;
            Table2.AddCell(col4);

            col3 = new PdfPCell(new Phrase("TEA(%):", FontB8));
            col3.Border = 0;
            Table2.AddCell(col3);
            col4 = new PdfPCell(new Phrase(txttcea.Text, FontB));
            col4.Border = 0;
            Table2.AddCell(col4);
            Table2.AddCell(CVacio);
            Table2.AddCell(CVacio);


            pdfDoc.Add(Table2);
            #endregion
            pdfDoc.Add(p);
            pdfDoc.Add(new Phrase("\n", FontB8));
            pdfDoc.Add(new Paragraph(12, "                                                       CRONOGRAMA DE PAGOS", FontB12));
            pdfDoc.Add(new Phrase("\n", FontB8));





            #region Tabla4-Detalles
            PdfPTable Table4 = new PdfPTable(dtblTable.Columns.Count);
            float[] widths4 = { 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f };
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

            col2 = new PdfPCell(new Phrase("IMPORTANTE: Se informa que,el interés compensatorio a la tasa anual es " + txttcea.Text + " ; Interés compensatorio por mora es de " + txtCompensatorio.Text + "%" + " por día de retraso transcurrido (Referencial 7 Días)" + ",cualquier consulta al respecto debe realizarla directamente en la cooperativa. ", FontB8));
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