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

public partial class WF_Historial_Patrocinador : System.Web.UI.Page
{

    Afiliacion afilia = new Afiliacion();
    N_Afiliacion Nafilia = new N_Afiliacion();

    Patrocinador patro = new Patrocinador();
    N_Patrocinador Npatro = new N_Patrocinador();
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["CodPatroGrid"] == null)
        //{
        //    Response.Redirect("Inicio.aspx");
        //}
        //else
        //{
        txtdniPatro.Text = Session["DNIPatroGrid"].ToString();
        mostrarDatosPatrocinador();
        listarAfiliaciones();
           
          
        //}
    }
  
    void mostrarDatosPatrocinador()
    {

        patro.IPa_Dni = int.Parse(txtdniPatro.Text);
        Npatro.buscarPatrocinadorDni(patro);
        txtCodPatroGrid.Text = "" + patro.PK_IPa_Cod;
        if (int.Parse(txtCodPatroGrid.Text) != 0)
        {
            txtDni.Text = Convert.ToString(patro.IPa_Dni);
            txtNombreCompleto.Text = patro.VPa_Nombre_Completo + " " + patro.VPa_Apellido_Paterno + " " + patro.VPa_Apellido_Materno;
            txtapellidopaterno.Text = patro.VPa_Apellido_Paterno;
            txtapellidomaterno.Text = patro.VPa_Apellido_Materno;
            txtVigencia.Text = Convert.ToString(patro.IPa_Vigencia);
            txtafiliaciones.Text = Convert.ToString(patro.IPa_Cantidad_Afiliaciones);

        }
        else if (int.Parse(txtCodPatroGrid.Text) == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "altertPatrocinadorNovalido()", true);

        }

    

    }

    void mostrarDatosEnabled()
    {
        txtNombreCompleto.Enabled = false;
        txtDni.Enabled = false;
        txtNombreCompleto.Enabled = false;
        txtapellidopaterno.Enabled = false;
        txtapellidomaterno.Enabled = false;
        txtVigencia.Enabled = false;
        txtafiliaciones.Enabled = false;
  
    }

    void listarAfiliaciones()
    {

        afilia.IA_Cod_Patrocinador = Convert.ToInt32(txtdniPatro.Text);
        gv_Tabla_Lista_Afiliaciones.DataSource = Nafilia.listarAfiliaciones(afilia);
        gv_Tabla_Lista_Afiliaciones.DataBind();

    }
}