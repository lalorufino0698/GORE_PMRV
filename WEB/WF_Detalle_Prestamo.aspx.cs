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
public partial class WF_Detalle_Prestamo : System.Web.UI.Page
{
    Socio soc = new Socio();
    N_Socio Nsoci = new N_Socio();

    Tipo_Prestamo TPres = new Tipo_Prestamo();
    N_Tipo_Prestamo NTPres = new N_Tipo_Prestamo();

   
    Prestamo pre = new Prestamo();
    N_Prestamo Npre = new N_Prestamo();

    Tipo_Prestamo tpre = new Tipo_Prestamo();
 
    Solicitud sol = new Solicitud();
    Estado_Prestamo epre = new Estado_Prestamo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CodPreGrid"] == null)
            {
                Response.Redirect("Inicio.aspx");

            }
            else
            {
                EnabledDatos();
                txtCodSoliGrid.Text = Session["CodPreGrid"].ToString();
                
                mostrarDatosPrestamo();
                btnDetalleDeuda.Visible = false;
                btnDetallePrestamoDeutda.Visible = false;

                validadCampo();
                validarAccion();
              

            }

        }

    }
    void mostrarDatosPrestamo()
    {
        pre.PK_IPre_Cod = int.Parse(txtCodSoliGrid.Text);
        Npre.consultarPrestamo(pre, tpre, soc, sol, epre);
        txtfecharegistro.Text = "" + pre.DPre_Fecha_Registro.Value.ToString("dd/MM/yyyy");
        txttipoprestamo.Text = "" + tpre.VTP_Nombre;
        txtcuotas.Text = "" + pre.IPre_Cuotas;
        txtimporte.Text = "" + pre.FPre_Importe;
        txttasamensual.Text = "" + pre.FPre_Tasa_Mensual;
        txttcea.Text = "" + pre.FPre_Tcea;
        txtnombre.Text = "" + soc.VS_Nombre_Completo;
        txtapellidos.Text = "" + soc.VS_Apellido_Paterno;
        txtmiembros.Text = "" + pre.IPre_Miembros;
        txtvivienda.Text = "" + soc.VS_Tipo_Vivienda;
        txtprofesion.Text = "" + soc.VS_Profesion;
        txtrubro.Text = "" + soc.VS_Rubro;
        txtsituacion.Text = "" + soc.VS_Situacion_Laboral;
        txtantiguedad.Text = "" + pre.IPre_Antiguedad;
        txtfrecuencia.Text = "" + soc.VS_Frecuencia;
        txtingresosfijos.Text = "" + pre.FPre_Ingresosfijos;
        txtingresosvariables.Text = "" + pre.FPre_Ingresosvariables;
        txtegresosfijos.Text = "" + pre.FPre_Egresosfijos;
        txtegresosvariables.Text = "" + pre.FPre_Egresosvariables;
        txtprestamovigente.Text = "" + pre.VPre_PrestamoVigente;
        txttipoprevigente.Text = "" + pre.VPre_TipoPreVigente;
        txtmontoprevigente.Text = "" + pre.FPre_MontoPreVigente;
        txtprecuotasvigente.Text = "" + pre.IPre_CuotasPreVigente;
        txtmoprevigente.Text = "" + pre.FPre_MoMensualPreVigente;
        txtdeudavigente.Text = "" + pre.VPre_DeudaVigente;
        txttipodeuda.Text = "" + pre.VPre_TipoDeVigente;
        txtbanco.Text = "" + pre.VPre_BancoDeVigente;
        txtmodeuda.Text = "" + pre.FPre_MontoDeVigente;
        txtdecuotas.Text = "" + pre.IPre_CuotasDeVigente;
        txtmomensualdeuda.Text = "" + pre.FPre_MoMensualDeVigente;
        txtsexo.Text = "" + sol.VSol_Sexo;
        txtestadocivil.Text = "" + sol.VSol_Estado_Civil;
        txtdepartamento.Text = "" + pre.VPre_Residencia;
        txttrabajo.Text = "" + sol.VSol_Ocupacion;
        txtdistrito.Text = "" + sol.VSol_Distrito;
        txtestado.Text = "" + epre.VEPre_Estado_Prestamo;





    }

    void EnabledDatos()
    {
       
        txtfecharegistro.Enabled=false;
        txttipoprestamo.Enabled = false;
        txtcuotas.Enabled = false;
        txtimporte.Enabled = false;
        txttasamensual.Enabled = false;
        txttcea.Enabled = false;
        txtnombre.Enabled = false;
        txtapellidos.Enabled = false;
        txtmiembros.Enabled = false;
        txtvivienda.Enabled = false;
        txtprofesion.Enabled = false;
        txtrubro.Enabled = false;
        txtsituacion.Enabled = false;
        txtantiguedad.Enabled = false;
        txtfrecuencia.Enabled = false;
        txtingresosfijos.Enabled = false;
        txtingresosvariables.Enabled = false;
        txtegresosfijos.Enabled = false;
        txtegresosvariables.Enabled = false;
        txtprestamovigente.Enabled = false;
        txttipoprevigente.Enabled = false;
        txtmontoprevigente.Enabled = false;
        txtprecuotasvigente.Enabled = false;
        txtmoprevigente.Enabled = false;
        txtdeudavigente.Enabled = false;
        txttipodeuda.Enabled = false;
        txtbanco.Enabled = false;
        txtmodeuda.Enabled = false;
        txtdecuotas.Enabled = false;
        txtmomensualdeuda.Enabled = false;
        txtsexo.Enabled = false;
        txtestadocivil.Enabled = false;
        txtdepartamento.Enabled = false;
        txttrabajo.Enabled = false;
        txtdistrito.Enabled = false;
        txtestado.Enabled = false;
     


    }

    void validadCampo()
    {
        if (txtprestamovigente.Text == "Si")
        {

            btnDetalleDeuda.Visible = true;

        }
        else
        {
            btnDetalleDeuda.Visible = false;
        }

        if (txtdeudavigente.Text == "Si")
        {
            btnDetallePrestamoDeutda.Visible = true;
        }
        else
            btnDetallePrestamoDeutda.Visible = false;
    }

    protected void btnDetalleDeuda_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModalPrestamoVigente", "$('#exampleModalCenter').modal('show');", true);
    }

    protected void btnDetallePrestamoDeutda_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModalPrestamooDeuda", "$('#exampleModalPrestamooDeuda').modal('show');", true);

    }

   

    void validarAccion()
    {
        if (txtestado.Text == "En Proceso")
        {
            aceptadas.Visible = true;
            aceptadas.Visible = false;
            denegadas.Visible = false;
            Pendiente.Visible = true;
        }
        if (txtestado.Text == "Aceptado")
        {
           
            aceptadas.Visible = true;
            denegadas.Visible = false;
            Pendiente.Visible = false;
        }
        if (txtestado.Text == "Rechazado")
        {
           
            aceptadas.Visible = false;
            denegadas.Visible = true;
            Pendiente.Visible = false;
        }
    }
}