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
   public class GD_Pago
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Pago()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }


        //public int registrarAmortizacion(Pago amor)
        //{

        //    cmd = new SqlCommand("Sp_RegistraAmortizacion", sqlc);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@VAmor_Mes ", amor.VPago_Mes);
        //    cmd.Parameters.AddWithValue("@FAmor_Monto_Cuota", amor.FPago_Monto);
        //    cmd.Parameters.AddWithValue("@DAmor_Fecha_Pago", amor.DPago_Fecha);
        //    cmd.Parameters.AddWithValue("@FK_IPe_Cod", amor.FK_IPe_Cod);
        //    cmd.Parameters.AddWithValue("@FK_IPre_Cod", amor.FK_IPre_Cod);
        //    sqlc.Open();
        //    cmd.ExecuteNonQuery();
        //    sqlc.Close();
        //    return 1;
        //}


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

        
    }
}
