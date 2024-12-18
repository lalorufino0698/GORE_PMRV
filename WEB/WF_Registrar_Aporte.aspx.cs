using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

public partial class WF_Registrar_Aporte : System.Web.UI.Page
{
    Socio soci = new Socio();
    N_Socio Nsoc = new N_Socio();
    Movimiento movi = new Movimiento();
    N_Movimiento Nmovi = new N_Movimiento();
    Configuracion con = new Configuracion();
    N_Configuracion Ncon = new N_Configuracion();


    Afiliacion afi = new Afiliacion();


   

    protected void Page_Load(object sender, EventArgs e)
    {
       


        if (!IsPostBack)
        {
         

            txtfecha.Text = DateTime.Now.ToShortDateString();
            
            txtobservacion.Text = "APORTE / APOYO / SEPELIO";
            mostrarAporte();
            mostrarFondoApoyo();
            mostrarFondoSepelio();
            double total;
            double total1;
            double total2;
            double total3;

            total1 = Convert.ToInt32(Label3.Text);
            total2 = Convert.ToInt32(Label8.Text);
            total3 = Convert.ToInt32(Label11.Text);

            total = total1 + total2 + total3;


            Label14.Text = Convert.ToString(total);
            txtmonto.Text = "s/" + Convert.ToString(total);

        }

    }



    void buscarDniSocio()
    {
        soci.IS_Dni = int.Parse(txtsocio.Text);
        Nsoc.BuscarSocii(soci);
        txtsociocod.Text = Convert.ToString(soci.PK_IS_Cod);
        txtnombres.Text = "" + soci.VS_Nombre_Completo;
        txtapellido.Text = "" + soci.VS_Apellido_Paterno + " " + soci.VS_Apellido_Materno;

    }

    void registrarAporte()
    {

        double total;
        double total1;
        double total2;
        double total3;

        total1 = Convert.ToInt32(Label3.Text);
        total2 = Convert.ToInt32(Label8.Text);
        total3 = Convert.ToInt32(Label11.Text);

        total = total1 + total2 + total3;

        movi.DMove_Fecha_Registro = Convert.ToDateTime(txtfecha.Text);
        movi.FMove_Importe = total;
        movi.VMove_Detalle = txtobservacion.Text;
        movi.FK_IS_Cod = int.Parse(txtsociocod.Text);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarAporte()", true);
        Nmovi.registrarMovimiento(movi);
        Console.WriteLine(txtobservacion.Text);
    }

    void mostrarAporte()
    {
        Ncon.buscarAporte(con);
        
        Label2.Text = "" + con.VCon_Tipo_Movimiento;
        Label3.Text = "" + con.ICon_Monto;
    }

    void mostrarFondoApoyo()
    {
        Ncon.buscarFondoApoyo(con);

        Label6.Text = "" + con.VCon_Tipo_Movimiento;
        Label8.Text = "" + con.ICon_Monto;
    }
    void mostrarFondoSepelio()
    {
        Ncon.buscarFondoSepelio(con);

        Label10.Text = "" + con.VCon_Tipo_Movimiento;
        Label11.Text = "" + con.ICon_Monto;
    }
    protected void btnBuscarSocio_Click(object sender, EventArgs e)
    {
        buscarDniSocio();
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        txtsocio.Text = "";
        txtnombres.Text = "";
        txtapellido.Text = "";
      

    }

    protected void btnAporte_Click(object sender, EventArgs e)
    {
        registrarAporte();
    }
}