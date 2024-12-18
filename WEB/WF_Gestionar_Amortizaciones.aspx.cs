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


public partial class WF_Gestionar_Amortizaciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["CodPreGrid"] == null && Session["importe"] == null && Session["cuota"] == null && Session["fechaRegistro"] ==null && Session["NomSocio"] == null)
            {
                Response.Redirect("WF_Listar_Prestamos_Desembolsados.aspx");
            }
            else
            {

       
                txtCodPrestamo.Text = Session["CodPreGrid"].ToString();
                txtSocioNombre.Text = Session["NomSocio"].ToString();
                txtImporte.Text = Session["importe"].ToString();
                txtCuuotas.Text = Session["cuota"].ToString();
                txtfechaRegistro.Text = Session["fechaRegistro"].ToString();
                DateTime FFecha = Convert.ToDateTime(txtfechaRegistro.Text);
                FFecha = FFecha.AddDays(5);
                txtFechaPago.Text = FFecha.ToString("dd");
                EnabledDatos();
                ddlPenalidad();
               
            }
     
         
        }
    }


    void ddlPenalidad()
    {
       
        N_Penalidad nPena = new N_Penalidad();
        ddpenalidad.DataSource = nPena.listarPenalidad();
        ddpenalidad.DataTextField = "VPE_Tipo";
        ddpenalidad.DataValueField = "PK_IPe_Cod";
        ddpenalidad.DataBind();
        ddpenalidad.Items.Insert(0, "--seleccionar Tipo Penalidad--");


   
    }

    void EnabledDatos()
    {
        txtImporte.Enabled = false;
        txtCuuotas.Enabled = false;
        txtFechaPago.Enabled = false;
        txtCodPrestamo.Enabled = false;
        txtSocioNombre.Enabled = false;
        txtMontoPenalidad.Enabled = false;

    }

    protected void btnBuscarPrestamo_Click(object sender, EventArgs e)
    {
      

    }

    protected void ddpenalidad_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddpenalidad.SelectedIndex == 1)
        {
            txtMontoPenalidad.Text = "10";
        }
        if (ddpenalidad.SelectedIndex == 2)
        {
            txtMontoPenalidad.Text = "0";
        }
        if (ddpenalidad.SelectedIndex == 0)
        {
            txtMontoPenalidad.Text = "";
        }

    }

    protected void btnGuardarAmortizacion_Click(object sender, EventArgs e)
    {
        registrarAmortizacion();
    }


    void registrarAmortizacion()
    {
        //Amortizacion amor = new Amortizacion();
        //N_Amortizacion Namor = new N_Amortizacion();

        //amor.VAmor_Mes = txtmeses.Text;
        //amor.FAmor_Monto_Cuota = double.Parse(txtMontoCuota.Text);
        //amor.DAmor_Fecha_Pago = Convert.ToDateTime(txtfechaRegistro.Text);
        //amor.FK_IPe_Cod = ddpenalidad.SelectedIndex;
        //amor.FK_IPre_Cod = int.Parse(txtCodPrestamo.Text);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "RegistrarAmortizacion()", true);
        //Namor.RegistrarAmortizacion(amor);

    }
}