using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace GestionDatos
{
     public class GD_Pagos
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Pagos()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }
        public DataTable ListarPagos(Prestamo objprestamo)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPagos", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PK_IS_Cod", objprestamo.Fk_IS_Cod);



                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public int registrarPagoxCuota(Pago objpag, Cuota objCuo)
        {
            cmd = new SqlCommand("Sp_RegistrarPagoxCuota", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@VPago_Mes", objpag.VPago_Mes);
            cmd.Parameters.AddWithValue("@FPago_Monto", objpag.FPago_Monto);
            cmd.Parameters.AddWithValue("@FK_IC_Cod", objpag.FK_IC_Cod);
            cmd.Parameters.AddWithValue("@FK_IECU_Cod", objCuo.FK_IECU_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }


        public void actualizarEstadoCuotaPagada(Cuota objCuo, int estado)
        {
            cmd = new SqlCommand("ActualizarEstadoCuotasPagada", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", objCuo.PK_IC_Cod);
            cmd.Parameters.AddWithValue("@FK_IECU_Cod", estado);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }


    }
}
