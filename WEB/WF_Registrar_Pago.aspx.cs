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
using Negocio.Helper;

public partial class WF_Gestionar_Prestamos : System.Web.UI.Page
{
    Prestamo pre = new Prestamo();
    Socio soc = new Socio();
    Solicitud sol = new Solicitud();
    N_Prestamo Npre = new N_Prestamo();
    Cuota cuo = new Cuota();
    N_Cuota Ncuo = new N_Cuota();
    Pago pag = new Pago();
    N_Pagos Npag = new N_Pagos();
    Movimiento mov = new Movimiento();
    N_Movimiento Nmov = new N_Movimiento();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gv_ListarPrestamos.PageIndex = 0;
            txtDNISocio.Attributes.Add("onkeypress", "javascript:return SoloNumeros(event);");
            txtNombreCompleto.Attributes.Add("onkeypress", "javascript:return SoloLetrasYEsp(event);");
            Limpiar();
        }
    }
    public void Limpiar()
    {
        txtNombreCompleto.Text = "";
        txtDNISocio.Text = "";
        txtNombreCompleto.Focus();
        gv_ListarPrestamos.Visible = false;
    }
    void listarPrestamosxNomApeSocios()
    {
        soc.VS_Nombre_Completo = txtNombreCompleto.Text;
        gv_ListarPrestamos.DataSource = Npre.ConsultarPrestamosxNomApeSocio(soc);
        gv_ListarPrestamos.DataBind();
    }
    void listarPrestamosxDNISocios()
    {
        soc.IS_Dni = Convert.ToInt32(txtDNISocio.Text);
        gv_ListarPrestamos.DataSource = Npre.ConsultarPrestamosxDNISocio(soc);
        gv_ListarPrestamos.DataBind();
    }
    void listarCuotasxPrestamo()
    {
        cuo.FK_IPre_Cod = pre.PK_IPre_Cod;
        gv_ListarCuotas.DataSource = Ncuo.ListarCuotasxPrestamo(cuo);
        gv_ListarCuotas.DataBind();


      
    }
    
    protected void btnBuscar_Click(object sender, EventArgs e)
    {                
        if (txtNombreCompleto.Text != "" && txtDNISocio.Text == "")
        {           
            listarPrestamosxNomApeSocios();
        }
        else if (txtDNISocio.Text != "" && txtNombreCompleto.Text == "")
        {
            listarPrestamosxDNISocios();
        }
        else 
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "IngreseDatos()", true);
        }
        gv_ListarPrestamos.Visible = true;
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }

    protected void gv_ListarPrestamos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (!IsPostBack == false)
        {
            gv_ListarPrestamos.PageIndex = e.NewPageIndex;
            listarPrestamosxNomApeSocios();
        }
    }
    private int IndexOfColumn(string columnName)
    {
        for (int i = 0; i < gv_ListarPrestamos.Columns.Count; i++)
        {
            if (gv_ListarPrestamos.Columns[i] is BoundField)
            {
                BoundField field = (BoundField)gv_ListarPrestamos.Columns[i];
                if (field.DataField == columnName)
                {
                    return i;
                }
            }
        }
        return -1; // Columna no encontrada
    }
    protected void gv_ListarPrestamos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gv_ListarPrestamos.Rows[index];

        Label PK_IS_Cod = (Label)row.FindControl("PK_IS_Cod");
        Label PK_IPre_Cod = (Label)row.FindControl("PK_IPre_Cod");
        Label FK_IEPre = (Label)row.FindControl("FK_IEPre");

        // Obtener el valor de FPre_Tasa_Mensual
        string tem = row.Cells[IndexOfColumn("FPre_Tasa_Mensual")].Text;

        // Obtener el valor de FPre_Tasa_Diaria
        string ted = row.Cells[IndexOfColumn("FPre_Tasa_Diaria")].Text;

        // Obtener el valor de FPre_Tcea
        string tea = row.Cells[IndexOfColumn("FPre_Tcea")].Text;

        if (e.CommandName.Contains("Ver"))
        {            
            pre.PK_IPre_Cod = Convert.ToInt32(PK_IPre_Cod.Text);
            txtPrestamoSet.Text = pre.PK_IPre_Cod.ToString();

            txtCodPrestamo.Text = pre.PK_IPre_Cod.ToString();
            pre.IPre_Cuotas = Convert.ToInt32(gv_ListarPrestamos.Rows[index].Cells[6].Text);
            soc.PK_IS_Cod = Convert.ToInt32(PK_IS_Cod.Text);            
            soc.IS_Dni = Convert.ToInt32(gv_ListarPrestamos.Rows[index].Cells[3].Text);
            txtSocio.Text = soc.PK_IS_Cod.ToString();
            txtTotCuotas.Text = gv_ListarPrestamos.Rows[index].Cells[9].Text;

            cuo.FK_IPre_Cod = pre.PK_IPre_Cod;
            DataTable dt = Ncuo.ListarCuotasxPrestamo(cuo);
            DateTime fechahoy = DateTime.Now.Date;
            Dictionary<int, int> cuotasYMontos = new Dictionary<int, int>();
            Helper helper = new Helper();
            int cantidadCuotas = 0;
            int transcurridos = 0;
            double montoDeCuota = Convert.ToDouble(dt.Rows[0]["FC_ValorCuota"]);
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                var fechaFin = Convert.ToDateTime(dt.Rows[i]["DC_FechaFin"].ToString());
                if (fechahoy > fechaFin)
                {
                    TimeSpan diferencia = fechahoy - fechaFin;
                    transcurridos = diferencia.Days;
                    int numeroCuota = i + 1;
                    int idCuota = Convert.ToInt32(dt.Rows[i]["PK_IC_Cod"]);

                    cuotasYMontos.Add(numeroCuota, idCuota);
                    cantidadCuotas++;
                }

            }
            foreach (var par in cuotasYMontos)
            {
                int numeroCuota = par.Key;
                int idCuota = par.Value;
                double totalCuotasAtrasada = montoDeCuota * cantidadCuotas;  
                var pagoDiferido = helper.interesCompoensatorioPorCuotaVencida(transcurridos, Convert.ToString(ted), totalCuotasAtrasada);
                var roundPago = Math.Ceiling(pagoDiferido);
                var finalyPagoDiferido = roundPago / 100;
                var compenPorMora = helper.interesCompoensatorioPorMora(tea, montoDeCuota);
                var cuotaVencidaTotalAPagar = finalyPagoDiferido + compenPorMora;
                var registrarMora = Ncuo.RegistrarMora(cuotaVencidaTotalAPagar, idCuota, numeroCuota);

            }

            listarCuotasxPrestamo();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }        
    }
    protected void gv_ListarPrestamos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEPre_Estado_Prestamo").ToString();
            if (estado == "Desembolsado")
            {
                e.Row.Cells[13].BackColor = System.Drawing.Color.LightBlue;
                e.Row.Cells[13].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[13].Height = 4;
                e.Row.Cells[13].Width = 80;
                e.Row.FindControl("btnVerCuotas").Visible = true;
                e.Row.Cells[13].Enabled = true;
            }
            else if (estado == "Finalizado")
            {
                e.Row.Cells[13].BackColor = System.Drawing.Color.LightGreen;
                e.Row.Cells[13].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[13].Height = 4;
                e.Row.Cells[13].Width = 80;
                e.Row.Cells[13].Enabled = true;
            }

        }
    }
    protected void gv_ListarCuotas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
        gv_ListarCuotas.PageIndex = e.NewPageIndex;

        cuo.FK_IPre_Cod = Convert.ToInt32(txtPrestamoSet.Text);
        gv_ListarCuotas.DataSource = Ncuo.ListarCuotasxPrestamo(cuo);
        gv_ListarCuotas.DataBind();
        // Evitar que el UpdatePanel haga un segundo postback
        ScriptManager.RegisterStartupScript(this, GetType(), "scroll", "scrollToTop();", true);

    }
    protected void gv_ListarCuotas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gv_ListarCuotas.Rows[index];

        Label PK_IC_Cod = (Label)row.FindControl("PK_IC_Cod");
        Label FK_IECU_Cod = (Label)row.FindControl("FK_IECU_Cod");

        if (e.CommandName.Contains("Registrar")) 
        {           
            pag.VPago_Mes = gv_ListarCuotas.Rows[index].Cells[0].Text;
            pag.FPago_Monto = Convert.ToDouble(gv_ListarCuotas.Rows[index].Cells[8].Text);
            pag.FK_IC_Cod = Convert.ToInt32(PK_IC_Cod.Text);
            cuo.PK_IC_Cod = Convert.ToInt32(PK_IC_Cod.Text);
            mov.FMove_Importe = Convert.ToDouble(gv_ListarCuotas.Rows[index].Cells[8].Text);
            mov.FK_IS_Cod = Convert.ToInt32(txtSocio.Text);
            cuo.FK_IECU_Cod = Convert.ToInt32(FK_IECU_Cod.Text);

            Npag.RegistrarPagoxCuota(pag, cuo);            
            Nmov.RegistrarMovimientoxCuotaPagada(mov, cuo);
            int estado = 2;
            Npag.ActualizarEstadoCuotaPagada(cuo, estado);


            //List<Cuota> obj_CuotaList = new List<Cuota>();
            //cuo.FK_IPre_Cod = Convert.ToInt32(txtCodPrestamo.Text);
            //txtTot.Text = "" + gv_ListarCuotas.Rows.Count;
            //pre.PK_IPre_Cod = Convert.ToInt32(txtCodPrestamo.Text);

            //obj_CuotaList = new N_Cuota().VerificarCuotasxPrestamo(cuo);
            //for (int i = 0; i < gv_ListarCuotas.Rows.Count; i++)
            //{
            //    foreach (var item in obj_CuotaList)
            //    {
            //        if (obj_CuotaList.Count == Int32.Parse(txtTotCuotas.Text))
            //        {
            //            pre.PK_IPre_Cod = Convert.ToInt32(txtCodPrestamo.Text);
            //            pre.FK_IEPre = 5;
            //            Npre.ActualizarEstadoPrestamo(pre);
            //        }
            //    }
            //}

            //if (pre.IPre_Cuotas == Convert.ToInt32(gv_ListarCuotas.Rows[index].Cells[1].Text))
            //{
            //    pre.PK_IPre_Cod = Convert.ToInt32(txtCodPrestamo.Text);
            //    pre.FK_IEPre = 5;
            //    Npre.ActualizarEstadoPrestamo(pre);
            //}

            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarPago()", true);
         
            return;            
        }
        
    }    
    protected void gv_ListarCuotas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string estado = DataBinder.Eval(e.Row.DataItem, "VEcu_Estado_Cuota").ToString();
            DateTime FechaInicio = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "DC_FechaInicio"));
            if (FechaInicio > DateTime.Today)
            {
                e.Row.Cells[12].Enabled = false;
            }
            else 
            {
                e.Row.Cells[12].Enabled = true;
            }
            if (estado == "Moroso")
            {
                e.Row.Cells[11].BackColor = System.Drawing.Color.LightCoral;
                e.Row.Cells[11].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[11].Height = 4;
                e.Row.Cells[11].Width = 80;
                e.Row.FindControl("btnRegistrarPago").Visible = true;
        
            }
            else if (estado == "En Curso")
            {
                e.Row.Cells[11].BackColor = System.Drawing.Color.LightBlue;
                e.Row.Cells[11].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[11].Height = 4;
                e.Row.Cells[11].Width = 80;
                e.Row.FindControl("btnRegistrarPago").Visible = true;
    
            }
            else if (estado == "Pagado")
            {
                e.Row.Cells[11].BackColor = System.Drawing.Color.LightGreen;
                e.Row.Cells[11].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[11].Height = 4;
                e.Row.Cells[11].Width = 80;
                e.Row.Cells[12].Enabled = false;
                

            }
          
        }
    }
}