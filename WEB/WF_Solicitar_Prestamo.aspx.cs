using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using GestionDatos;
using Negocio;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.ClientServices;
using System.Net;
using System.IO;
using System.Drawing;

public partial class WF_Solicitar_Prestamo : System.Web.UI.Page
{

    Socio soci = new Socio();
    N_Socio Nsoci = new N_Socio();
    Tipo_Prestamo TPres = new Tipo_Prestamo();
    N_Tipo_Prestamo NTPres = new N_Tipo_Prestamo();
    Prestamo pre = new Prestamo();
    N_Prestamo Nprestamo = new N_Prestamo();
    Solicitud sol = new Solicitud();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //quitar meses y soles
            if (Session["meses"] != null && Session["importeSolicitado"] != null)
            {
                string originalText = Session["meses"].ToString();
                string modifiedText = originalText.Replace(" meses", "");
                txtcuotass.Text = modifiedText;
                string originalText2 = Session["importeSolicitado"].ToString();
                string modifiedText2 = originalText2.Replace(" soles", "");
                txtimporte.Text = modifiedText2;
            }
            
            cuota.Text = Session["cuota"] != null ? Session["cuota"].ToString() : string.Empty;
            txttasamensual.Text = Session["TEM"] != null ? Session["TEM"].ToString() : string.Empty;
            ted.Text = Session["TED"] != null ? Session["TED"].ToString() : string.Empty;
            txttasaanual.Text = Session["TCEA"] != null ? Session["TCEA"].ToString() : string.Empty;
            txtcodpatrocinador.Text = Session["dni"].ToString();     
            soci.IS_Dni = Convert.ToInt32(txtcodpatrocinador.Text);
            //cuando se ingresa a la prestaña solicitar prestamo, se tendría que validar si tiene un prestamo en vigencia
            var verificarTime = validarTiempoPrestamo(soci);
            if (verificarTime == "NO_TIENE_PRESTAMO" || verificarTime == "TIENE_3_MESES")
            {
                Nsoci.consultarSocioPrestamoxdni(soci, sol);
                txtcodSocio.Text = "" + soci.PK_IS_Cod;
                lbldatos.Text = soci.VS_Nombre_Completo + ' ' + soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno;
                Label2.Text = soci.VS_Nombre_Completo + ' ' + soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno;
                Label4.Text = soci.VS_Nombre_Completo + ' ' + soci.VS_Apellido_Paterno + ' ' + soci.VS_Apellido_Materno;
                txtSexo.Text = "" + sol.VSol_Sexo;
                txtEstadoCivil.Text = "" + sol.VSol_Estado_Civil;
                txtDistrito.Text = "" + sol.VSol_Distrito;
                txtTrabajo.Text = "" + sol.VSol_Ocupacion;
                txtdepartamento.Text = "Lima";
                txtprofesion.Text = "" + soci.VS_Profesion;
                txtrubro.Text = "" + soci.VS_Rubro;
                txtsituacionlaboral.Text = "" + soci.VS_Situacion_Laboral;
                txtvivienda.Text = "" + soci.VS_Tipo_Vivienda;
                txtingreso.Text = "" + soci.VS_Frecuencia;
                listarCamposDdl();
                PanelPaso2.Visible = false;
                txtfecharegistro.Text = DateTime.Now.ToString("dd/MM/yyyy");

                //validar si los datos complementarios están vacíos
                if (string.IsNullOrWhiteSpace(txtprofesion.Text)|| string.IsNullOrWhiteSpace(txtrubro.Text)|| string.IsNullOrWhiteSpace(txtsituacionlaboral.Text)|| string.IsNullOrWhiteSpace(txtvivienda.Text))
                {
                    Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "dataComplementariaVacio()", true);
                }

                if (txtvivienda.Text == "Alquilada ")
                {
                    lblAlquiler.Visible = true;
                    txtalquiler.Visible = true;
                }
                else
                {
                    lblAlquiler.Visible = false;
                    txtalquiler.Visible = false;
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertTimeMeses(); setTimeout(function() { window.location.href = 'WF_InicioSocio.aspx'; }, 4000);", true);
                btnSolicitar.Enabled = false;

            }
            CheckBox1.Enabled = !CheckBox3.Checked;
            CheckBox3.Enabled = !CheckBox1.Checked;

            CheckBox4.Enabled = !CheckBox5.Checked;
            CheckBox5.Enabled = !CheckBox4.Checked;
        }
      

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
    public void listarCamposDdl()
    {
        ddltipoprestamo.DataSource = NTPres.listarTipoPrestamo();
        ddltipoprestamo.DataTextField = "VTP_Nombre";
        ddltipoprestamo.DataValueField = "PK_ITP_Cod";
        ddltipoprestamo.DataBind();
        ddltipoprestamo.Items.Insert(0, "Seleccione");

        var prestamo = Session["Prestamo"] != null ? Session["Prestamo"].ToString() : string.Empty;
        if (prestamo != "")
        {
            foreach (ListItem item in ddltipoprestamo.Items)
            {
                if (item.Text == prestamo)
                {
                    ddltipoprestamo.ClearSelection();
                    item.Selected = true;
                    break;
                }
            }
        }
       
        ddlprestamovigente.DataSource = NTPres.listarTipoPrestamo();
        ddlprestamovigente.DataTextField = "VTP_Nombre";
        ddlprestamovigente.DataValueField = "PK_ITP_Cod";
        ddlprestamovigente.DataBind();
        ddlprestamovigente.Items.Insert(0, "Seleccione");  
    }

    public string validarTiempoPrestamo(Socio soci)
    {
        DateTime fechaActual = DateTime.Now;
        var mensaje = string.Empty;

        Nsoci.ObtenerIdPorDniSocio(soci);
        soci.PK_IS_Cod = soci.PK_IS_Cod;
        Nsoci.ConsultarPrestamoPorIdSocio(soci, pre);
        var fechaPrestamo = pre.DPre_Fecha_Registro;
        if (fechaPrestamo== null)
        {
           return mensaje = "NO_TIENE_PRESTAMO";
        }
        else
        {
            DateTime fechaMinima = fechaPrestamo.Value.AddMonths(3);
            if (fechaMinima <= fechaActual)
            {
               return mensaje = "TIENE_3_MESES";
            }
            else
            {
               return mensaje = "NO_TIENE_3MESES";
            }
        } 

    }

    protected void ddltipoprestamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddltipoprestamo.SelectedIndex == 1)
        {
            double tasamensual = 1.03;
            double tasaanual = 12.68;
            txttasamensual.Text = tasamensual.ToString();
            txttasaanual.Text = tasaanual.ToString();

        }
        if (ddltipoprestamo.SelectedIndex == 2)
        {

            double tasamensual = 3.00;
            double tasaanual = 42.57;
            txttasamensual.Text = tasamensual.ToString();
            txttasaanual.Text = tasaanual.ToString();
        }
        if (ddltipoprestamo.SelectedIndex == 3)

        {

            double tasamensual = 1.50;
            double tasaanual = 19.56;
            txttasamensual.Text = tasamensual.ToString();
            txttasaanual.Text = tasaanual.ToString();
        }

        if (ddltipoprestamo.SelectedIndex == 0)

        {

            txttasamensual.Text = null;
            txttasaanual.Text = null;
        }

    }



    protected void btnSolicitar_Click(object sender, EventArgs e)
    {
        if (ddltipoprestamo.SelectedIndex ==0) 
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertTipoPrestamoVacio()", true);
            return;
        }
        if (txtcuotass.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertCuotaVacio()", true);
            return;
        }
        if (txtimporte.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertImporteVacio()", true);
            return;
        }
        if (txtmienbros.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMiembrosVacio()", true);
            return;
        }
        if (txtvivienda.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertTipoViviendaVacio()", true);
            return;
        }

        if (txtvivienda.Text == "Alquilada")
        {
            if (txtalquiler.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertGastoAlquilerVacio()", true);
                return;
            }
        }
        if (txtprofesion.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertProfesionVacio()", true);
            return;
        }

        if (txtrubro.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertRubroVacio()", true);
            return;
        }

        if (txtsituacionlaboral.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertSituacionLabVacio()", true);
            return;
        }

        if (txtantiguedad.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertAntiguedadLabVacio()", true);
            return;
        }

        if (checkInformacion.Checked != true)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertCheckSinMarcar()", true);
            return;

        }

        PanelPaso2.Visible = true;
        PanelPaso1.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (txtingresos.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertFrecuenciaIngresosVacio()", true);
            return;
        }

        if (txtingresos.Text =="")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertIngresosFijosMensualesVacio()", true);
            return;
        }


        if (txtingresosvariables.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertIngresosVariablesMensualesVacio()", true);
            return;
        }


        if (TextBox1.Text =="")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertEgresosFijosMensualesVacio()", true);
            return;
        }


        if (TextBox2.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertEgresosVariablesMensualesVacio()", true);
            return;
        }

        if (CheckBox1.Checked)
        {
            if (ddlprestamovigente.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertTipoPrestamoVigenteVacio()", true);
                return;
            }


            if (txtMontoPreVigente.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMontoPrestamoVigenteVacio()", true);
                return;
            }


            if (TextBox8.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertNumeroCuotasVacio()", true);
                return;
            }


            if (TextBox9.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMontoMensualVacio()", true);
                return;
            }

            CheckBox3.Enabled = false;
        }

  
        if (CheckBox4.Checked) 
        {
            if (ddlprestamodeuda.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertPrestamoOdeudalVacio()", true);
                return;
            }


            if (TextBox5.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertBancoVacio()", true);
                return;
            }

            if (TextBox3.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMontoTotalVacio()", true);
                return;
            }

            if (TextBox6.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertNumeroCuotaPanel3Vacio()", true);
                return;
            }


            if (TextBox7.Text == "")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMontoMensualPanel3Vacio()", true);
                return;
            }
        }
        


        if (CheckBox1.Checked != true && CheckBox3.Checked != true)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertCheckSinMarcar1()", true);
            return;
        }
      

        if (CheckBox4.Checked != true && CheckBox5.Checked != true)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertCheckSinMarcar2()", true);
            return;
        }

        validarEstadoCrediticio();

    }

    public void validarEstadoCrediticio()
    {
        var ingresosFijos = double.Parse(txtingresos.Text);
        var egresosFijos = double.Parse(TextBox1.Text);
        double montoMensual;

        if (CheckBox1.Checked)
        {
            montoMensual = double.Parse(TextBox9.Text);
            egresosFijos = egresosFijos + montoMensual;
        }
        else if (CheckBox4.Checked)
        {
            montoMensual = double.Parse(TextBox7.Text);
            egresosFijos = egresosFijos + montoMensual;
        }
        else  if (CheckBox1.Checked && CheckBox4.Checked) 
        {
            montoMensual = double.Parse(TextBox9.Text) + double.Parse(TextBox7.Text);
            egresosFijos = egresosFijos + montoMensual;
        } 
        var resultado = ingresosFijos - egresosFijos;

        if (Convert.ToDouble(cuota.Text) > resultado)
        {
            string parametro1 = txtimporte.Text;
            string parametro2 = txtcuotass.Text;

            string script = string.Format("crediticioNoAceptable('{0}', '{1}');", parametro1, parametro2);
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", script, true);
            
            PanelPaso2.Visible = false;
            PanelPaso1.Visible = false;
            PanelPaso3.Visible = false;
            return;
        }
        else
        {
            PanelPaso2.Visible = false;
            PanelPaso1.Visible = false;
            PanelPaso3.Visible = true;
        }
    }

    protected void btnAtras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Simular_Prestamos.aspx");
    }
    
    protected void ddlvivienda_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked == true)
        {
            PanelDeudas.Visible = true;
        }
        else
        {
            PanelDeudas.Visible = false;
        }
    }

    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox5.Checked == true)
        {
            PanelDeudas.Visible = false;
        }
        
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            Panelprestamo.Visible = true;
        }
        else
        {
            Panelprestamo.Visible =false;
        }
    }

    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == true)
        {
            Panelprestamo.Visible = false;
        }
    }


    public void registrarPrestamo()
    {
        var txttasaanualV= txttasaanual.Text.TrimEnd('%');
        var txttasamensualV = txttasamensual.Text.TrimEnd('%');
        var txttasadiariaV = ted.Text.TrimEnd('%');

        pre.DPre_Fecha_Registro =Convert.ToDateTime(txtfecharegistro.Text);
        pre.FPre_Importe = double.Parse(txtimporte.Text);
        pre.IPre_Cuotas = int.Parse(txtcuotass.Text);
        pre.FPre_Tcea = double.Parse(txttasaanualV);
        pre.FPre_Tasa_Mensual = double.Parse(txttasamensualV);
        pre.FPre_Tasa_Diaria = double.Parse(txttasadiariaV);
        pre.VPre_Residencia = txtdepartamento.Text;
        pre.IPre_Miembros = int.Parse(txtmienbros.Text);
        pre.IPre_Antiguedad = int.Parse(txtantiguedad.Text);

        pre.FPre_Ingresosfijos = double.Parse(txtingresos.Text);

        pre.FPre_Ingresosvariables = double.Parse(txtingresosvariables.Text);

        pre.FPre_Egresosfijos = double.Parse(TextBox1.Text);
        pre.FPre_Egresosvariables = double.Parse(TextBox2.Text);
        if (CheckBox4.Checked == true)
        {
            txtprestamosi.Text = "Si";
            pre.VPre_PrestamoVigente = txtprestamosi.Text;
            pre.FPre_MontoPreVigente = double.Parse(txtMontoPreVigente.Text);
            pre.IPre_CuotasPreVigente = int.Parse(TextBox8.Text);
            pre.FPre_MoMensualPreVigente = double.Parse(TextBox9.Text);
            pre.VPre_TipoPreVigente = ddlprestamovigente.SelectedValue;
        }
        if (CheckBox4.Checked != true)
        {
            txtprestamosi.Text = "No";
            pre.VPre_PrestamoVigente = txtprestamosi.Text;
            pre.FPre_MontoPreVigente = 0;
            pre.IPre_CuotasPreVigente = 0;
            pre.FPre_MoMensualPreVigente =0;
            pre.VPre_TipoPreVigente = "";
        }
  
        if (CheckBox1.Checked == true)
        {
            txtdeudasi.Text = "Si";

            pre.VPre_DeudaVigente = txtdeudasi.Text;
            pre.VPre_TipoDeVigente = ddlprestamodeuda.SelectedValue;
            pre.VPre_BancoDeVigente = TextBox5.Text;
            pre.VPre_GastoAlquiler = txtalquiler.Text;
            pre.FPre_MontoDeVigente = double.Parse(TextBox3.Text);
            pre.IPre_CuotasDeVigente = int.Parse(TextBox6.Text);
            pre.FPre_MoMensualDeVigente = double.Parse(TextBox7.Text);

        }
        else if (CheckBox1.Checked != true)
        {
            txtdeudasi.Text = "No";

            pre.VPre_DeudaVigente = txtdeudasi.Text;
            pre.VPre_TipoDeVigente = "";
            pre.VPre_BancoDeVigente = "";
            pre.VPre_GastoAlquiler = "";
            pre.FPre_MontoDeVigente = 0;
            pre.IPre_CuotasDeVigente = 0;
            pre.FPre_MoMensualDeVigente = 0;
        }



        if (FileUpCopiaDNI != null && FileUpCopiaDNI.HasFile)

        {

            int tamanio = FileUpCopiaDNI.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpCopiaDNI.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpCopiaDNI.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Copia_DNI = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }
        if (FileUpload1 != null && FileUpload1.HasFile)
        {

            int tamanio = FileUpload1.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload1.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Libreta_Socio  = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }
        if (FileUpload2 != null && FileUpload2.HasFile)
        {

            int tamanio = FileUpload2.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload2.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload2.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Declaracion_Salud= ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }

        if (FileUpload3 != null && FileUpload3.HasFile)
        {

            int tamanio = FileUpload3.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload3.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload3.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_FPP = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }

        if (FileUpload4 != null && FileUpload4.HasFile)
        {

            int tamanio = FileUpload4.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload4.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload4.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Aportes_Sociales= ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }

        if (FileUpload5 != null && FileUpload5.HasFile)
        {

            int tamanio = FileUpload5.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload5.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload5.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Declaracion_Jurada = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }


        if (FileUpload7 != null && FileUpload7.HasFile)
        {

            int tamanio = FileUpload7.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload7.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload7.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);
            pre.IMPre_Boleta_Pago  = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }

        if (FileUpload6 != null && FileUpload6.HasFile)
        {

            int tamanio = FileUpload6.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload6.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload6.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);

            pre.IMPre_Declaracion_Ingresos = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }


        if (FileUpload8 != null && FileUpload8.HasFile)
        {

            int tamanio = FileUpload8.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];
            FileUpload8.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(FileUpload8.PostedFile.InputStream);


            string ImagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(ImagenOriginal);

            pre.IMPre_Ingresos_Notariales = ImagenOriginal;

        }
        else
        {
            // Notify the user that a file was not uploaded.

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertErrorImagen()", true);
            return;

        }




        pre.FK_ITPre_Cod = ddltipoprestamo.SelectedIndex;
        pre.Fk_IS_Cod = int.Parse(txtcodSocio.Text);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", " RegistrarPrestamo()", true);
        Nprestamo.RegistrarPrestamo(pre);
        btnEnviar.Enabled = false;
        DataTable dt = new DataTable();
        dt = Session["data"] as DataTable;
        //recuperando el id prestamos para poder setearlo en el cronograma
        var idPrestamo = Nprestamo.BuscarIdPrestamoPorFkSocio(pre);
        Nprestamo.GuardarCronogramaPago(dt, pre.Fk_IS_Cod,idPrestamo,0);
        //tratar de recuperar el id del prestamo y el estado del prestamo
        //guardar el dt de arribar en la base de datos en base al iscod del socio
        //con esto ya se estaría guardando el cronograma, segun el id del socio
        // setear por defecto que el cronograma sea 0 u 1, es decir 1 cuando es borrador, y 0 cuando ya el admin acepte el prestamo ,este cronograma debe cambiar de estado
        //quizas cuando ya se registre el prestmo, pueda buscar el id, con el cod del socio, y asi pasarlo al cronograma


    }

   

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        registrarPrestamo();
      
    }
}