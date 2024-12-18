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
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;

public partial class WF_Registrar_Penalidad : System.Web.UI.Page
{

    Cuota cuo = new Cuota();
    N_Cuota Ncuota = new N_Cuota();


    Penalidad pe = new Penalidad();
    N_Penalidad Npena = new N_Penalidad();

    Estado_Cuota ecu = new Estado_Cuota();

    Socio soci = new Socio();
    N_Socio Nsoc = new N_Socio();
    Afiliacion afi = new Afiliacion();
    Patrocinador patro = new Patrocinador();
    N_Patrocinador Npatro = new N_Patrocinador();

   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["pre"] == null && Session["cuo"] == null && Session["dni"] == null && Session["fechafin"] == null && Session["estacuota"] == null && Session["retra"] == null && Session["importe"] == null)
            {
                Response.Redirect("WF_Lista_Registrar_Penalidad.aspx");
            }
            else
            {
                txtpkcuota.Text = Session["pkcuo"].ToString();
                //txtnumprestamo.Text = Session["pre"].ToString();
                txtnumcuota.Text = Session["cuo"].ToString();
                txtdni.Text = Session["dni"].ToString();
                txtfechafin.Text = Session["fechafin"].ToString();
                txtestadocuota.Text = Session["estacuota"].ToString();
                txtdiaretraso.Text = Session["retra"].ToString();
                txtmonto.Text = Session["importe"].ToString();
                txttipopenalidad.Text = "Días moroso";
               
                buscarDniSocio();
                aplicarMontoPenalidad();
               
            }
        }

    }


    void buscarDniSocio()
    {
        soci.IS_Dni = int.Parse(txtdni.Text);
        Nsoc.BuscarSocio(soci);
        txtnombres.Text = "" + soci.VS_Nombre_Completo;
        txtapellido.Text = "" + soci.VS_Apellido_Paterno + " " + soci.VS_Apellido_Materno;
        buscarcodPatrocinador();
    }

    void buscarcodPatrocinador()
    {
        soci.IS_Dni = int.Parse(txtdni.Text);
        Nsoc.BuscarCodPatrocinador(soci, afi);
        txtcodPatrocinador.Text = "" + afi.IA_Cod_Patrocinador;
        datosPatrociandor();
    }
    void datosPatrociandor()
    {
        patro.IPa_Dni = int.Parse(txtcodPatrocinador.Text);
        Npatro.buscarPatrocinadorDni(patro);
        txtpatrocinador.Text = "" + patro.VPa_Nombre_Completo + " " + patro.VPa_Apellido_Paterno + " " + patro.VPa_Apellido_Materno;
    }

    void aplicarMontoPenalidad()
    {
        if ((int.Parse(txtdiaretraso.Text) >= 1) && (int.Parse(txtdiaretraso.Text) <= 5))
        {
            txtmontopenalidad.Text = "" + 5;
            txtmontovisible.Text = "S/5 Nuevos Soles";
            txtobservacion.Text = "Estimado Socio con nombre " + txtnombres.Text + " " + txtapellido.Text + " usted se encuentra con una cuota en " +
         "estado " + txtestadocuota.Text + " por lo cual el ultimo dia que tuvo para pagar fue  " + txtfechafin.Text + " en consecuencia le corresponde" +
         " una penalidad de " + txtmontovisible.Text;




        }
        else if ((int.Parse(txtdiaretraso.Text) > 5) && (int.Parse(txtdiaretraso.Text) <= 10))
        {
            txtmontopenalidad.Text = "" + 20;
            txtmontovisible.Text = "S/20 Nuevos Soles";
            txtobservacion.Text = "Estimado Socio con nombre " + txtnombres.Text + " " + txtapellido.Text + " usted se encuentra con una cuota en " +
           "estado " + txtestadocuota.Text + " por lo cual el ultimo dia que tuvo para pagar fue  " + txtfechafin.Text + " en consecuencia le corresponde" +
           " una penalidad de " + txtmontovisible.Text;
         
        }
        else if ((int.Parse(txtdiaretraso.Text) > 10) && (int.Parse(txtdiaretraso.Text) <= 20))
        {
            txtmontopenalidad.Text = "" + 50;
            txtmontovisible.Text = "S/50 Nuevos Soles";
            txtobservacion.Text = "Estimado Socio con nombre " + txtnombres.Text + " " + txtapellido.Text + " usted se encuentra con una cuota en " +
           "estado " + txtestadocuota.Text + " por lo cual el ultimo dia que tuvo para pagar fue  " + txtfechafin.Text + " en consecuencia le corresponde" +
           " una penalidad de " + txtmontovisible.Text;
      
        }
        else if ((int.Parse(txtdiaretraso.Text) > 20) && (int.Parse(txtdiaretraso.Text) <= 30))
        {
            txtmontopenalidad.Text = "" + 100;
            txtmontovisible.Text = "S/100 Nuevos Soles";
            txtobservacion.Text = "Estimado Socio con nombre " + txtnombres.Text + " " + txtapellido.Text + " usted se encuentra con una cuota en " +
           "estado " + txtestadocuota.Text + " por lo cual el ultimo dia que tuvo para pagar fue  " + txtfechafin.Text + " en consecuencia le corresponde" +
           " una penalidad de " + txtmontovisible.Text;
        
        }
        else if ((int.Parse(txtdiaretraso.Text) > 30))
        {
            txtmontopenalidad.Text = "" + 300;
            txtmontovisible.Text = "S/300 Nuevos Soles";
            txtobservacion.Text = "Estimado Socio con nombre " + txtnombres.Text + " " + txtapellido.Text + " usted se encuentra con una cuota en " +
           "estado " + txtestadocuota.Text + " por lo cual el ultimo dia que tuvo para pagar fue  " + txtfechafin.Text + " en consecuencia le corresponde" +
           " una penalidad de " + txtmontovisible.Text;
          
        }


    

    }


    void registrarPenalidad()
    {
        pe.VPE_Observacion = txtobservacion.Text;
        pe.FPe_Monto = double.Parse(txtmontopenalidad.Text);
        pe.FK_IC_Cod = int.Parse(txtpkcuota.Text);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarPenalidad()", true);
        Npena.registrarPenalidad(pe);
        
    }

    void updateEstadoCuota()
    {
        ///*actulizar estado cuota a penalizado*/
        ///
        cuo.PK_IC_Cod= int.Parse(txtnumcuota.Text);
        Ncuota.ActualizarEstadoCuotaPenalizada(cuo);
    }

    protected void btnPenalidad_Click(object sender, EventArgs e)
    {
        registrarPenalidad();
       


    }

    protected void btnatras_Click(object sender, EventArgs e)
    {
        Response.Redirect("WF_Lista_Registrar_Penalidad.aspx");
    }
}