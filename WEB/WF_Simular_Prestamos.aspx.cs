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
public partial class WF_Simular_Prestamos : System.Web.UI.Page
{
    Tipo_Prestamo TPres = new Tipo_Prestamo();
    N_Tipo_Prestamo NTPres = new N_Tipo_Prestamo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            listarCamposDdl();  
        }  
    }
    public void listarCamposDdl()
    {
        ddlPrestamo.DataSource = NTPres.listarTipoPrestamo();
        ddlPrestamo.DataTextField = "VTP_Nombre";
        ddlPrestamo.DataValueField = "Tasa";
        ddlPrestamo.DataBind();
        ddlPrestamo.Items.Insert(0, "Seleccione");
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        SeleccionarCampos();
        DateTime nuevafecha = DateTime.Now.Date;
        nuevafecha = nuevafecha.AddDays(30);//se adiciona 30 días de la fecha actual
        lblprestamo.Text = ddlPrestamo.Items[ddlPrestamo.SelectedIndex].ToString();
        txtfecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
        txtfechapago.Text = nuevafecha.ToString("dd/MM/yyyy");
        ValorBien();
    }
    public void SeleccionarCampos()
    {
        if (ddlPrestamo.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertddlprestamoVacio()", true);
            return;
        }
        if (txtmonto.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertMontoVacio()", true);
            return;
        }
        if (txtmeses.Text == "")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertTiempoVacio()", true);
            return;
        }
        prestamo.Visible = true;
        btnContinuar.Visible = false;
        if (checkcuota.Checked == true)
        {
            panelcuotas.Visible = true;

            periodoGracia.Visible = true;
            lblcuotas.Text = "Si";
        }
        else
        {
            panelcuotas.Visible = false;
            periodoGracia.Visible = false;
        }

    }
    protected void btncuota_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page,Page.GetType(), "openModal", "$('#openModal').modal('show');", true);
     
    }

    public void validarSeleccionModal()
    {
        if (checKEnero.Checked == true)
        {
            lblMesesAdicionales.Text = "Enero";

        }
        if (checkFebrero.Checked == true)
        {
            lblMesesAdicionales.Text = "Febrero";
        }
        if (checkMarzo.Checked == true)
        {
            lblMesesAdicionales.Text = "Marzo";
        }
        if (checkAbril.Checked == true)
        {
            lblMesesAdicionales.Text = "Abril";
        }
        if (checkMayo.Checked == true)
        {
            lblMesesAdicionales.Text = "Mayo";
        }
        if (checkJunio.Checked == true)
        {
            lblMesesAdicionales.Text = "Junio";
        }
        if (checkJulio.Checked == true)
        {
            lblMesesAdicionales.Text = "Julio";
        }
        if (checkAgosto.Checked == true)
        {
            lblMesesAdicionales.Text = "Agosto";
        }
        if (checkSeptiembre.Checked == true)
        {
            lblMesesAdicionales.Text = "Septiembre";
        }
        if (checkOctubre.Checked == true)
        {
            lblMesesAdicionales.Text = "Octubre";
        }
        if (checkNoviembre.Checked == true)
        {
            lblMesesAdicionales.Text = "Noviembre";
        }
        if (checkDiciembre.Checked == true)
        {
            lblMesesAdicionales.Text = "Diciembre";
        }
    }


    protected void PrestamoSeleccionado(object sender, EventArgs e)
    {
        DataTable dt = NTPres.listarTipoPrestamo();
        txtmeses.Items.Clear();
        if (ddlPrestamo.SelectedIndex > 0)
        {
            DataRow selectedRow = dt.Rows[ddlPrestamo.SelectedIndex - 1];
            string vtpNombre = selectedRow["VTP_Nombre"].ToString();
            decimal tasa = Convert.ToDecimal(selectedRow["Tasa"]);
            decimal tcea = Convert.ToDecimal(selectedRow["TCEA"]);//TASA EFECTIVA ANUAL (TEA)
            int idObject = Convert.ToInt32(selectedRow["PK_ITP_Cod"]);
            int cantidadMeses =ObtenerMaxMeses(idObject);
            for (int i = 1; i <= cantidadMeses; i++)
            {
                txtmeses.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            txtTEA.Text = tcea.ToString();
           
        }
    }
    private int ObtenerMaxMeses(int idObject)
    {
        int maxMeses = 0;
        if (idObject == 1)
        {
            maxMeses = 18;
        }
        else if (idObject == 2)
        {
            maxMeses = 60;
        }
        else if (idObject == 3)
        {
            maxMeses = 120;
        }

        return maxMeses;
    }
    protected void btnEjecutar_Click1(object sender, EventArgs e)
    {
        validarContenido();
    }


    public void validarContenido()
    {
        if (checkenviovi.Checked == true)
        {
            lblvirtual.Text = "Virtual";

            if ((checkenviovi.Checked == true && checkenviofi.Checked == true))
            {
                lblambos.Text = " y Fisico ";
            }

        }
        else
        {
            lblfisico.Text = "Fisico";

        }

        bool isCaptchaValid = false;
        if (Session["captchaText"] != null && Session["captchaText"].ToString() == txtCaptchaText.Text)
        {
            isCaptchaValid = true;
        }
        if (!isCaptchaValid)
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertCaptcha()", true);
            return;
        }

        Session["Prestamo"] = "" + lblprestamo.Text;
        Session["monto"] = "" + txtmonto.Text;
        Session["meses"] = "" + txtmeses.Text;
        Session["TEA"] = "" + txtTEA.Text;
        Session["fecha"] = "" + txtfecha.Text;
        Session["virtual"] = "" + lblvirtual.Text;
        Session["fisico"] = "" + lblfisico.Text;
        Session["ambos"] = "" + lblambos.Text;
        Session["periodo"] = "" + txtperiodogracia.Text;
        Session["valor"] = "" + txtvalorbien.Text;
        Session["cuotas"] = "" + lblcuotas.Text;
        Session["mesesAdicionales"] = "" + lblMesesAdicionales.Text;
        Session["fechapago"] = "" + txtfechapago.Text;

        Response.Redirect("WF_Simulacion_Pagos.aspx");
    }
    public void ValorBien()
    {
        if (ddlPrestamo.SelectedIndex == 3)
        {
            valorBien.Visible = true;
        }
        else
        {
            valorBien.Visible = false;
        }
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        validarSeleccionModal();
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        ddlPrestamo.SelectedIndex = 0;
        txtmonto.Text = "";
        checkcuota.Checked = false;

        txtmeses.Items.Clear();
        txtTEA.Text = "";
    }
}