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
    public class GD_Cuota
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Cuota()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public int registrarCuota(Cuota cu)
        {

            cmd = new SqlCommand("sp_Registrar_Cuota", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IC_NumeroCuota ", cu.IC_NumeroCuota);
            cmd.Parameters.AddWithValue("@DC_FechaRegistro", cu.DC_FechaRegistro);
            cmd.Parameters.AddWithValue("@FC_MontoAPagar", cu.FC_MontoAPagar);
            cmd.Parameters.AddWithValue("@DC_FechaInicio", cu.DC_FechaInicio);
            cmd.Parameters.AddWithValue("@DC_FechaFin", cu.DC_FechaFin);
            cmd.Parameters.AddWithValue("@FK_IPre_Cod", cu.FK_IPre_Cod);
            cmd.Parameters.AddWithValue("@FC_SaldoRestante", cu.FC_SaldoRestante);
            cmd.Parameters.AddWithValue("@FC_ValorCuota", cu.FC_ValorCuota);
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }


        public DataTable listarCuotaMoroso(Cuota objcuota)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_CuotasMorosa", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IECU_Cod", objcuota.FK_IECU_Cod);



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

        public void ActualizarEstadoCuota(Cuota cuo)
        {
            cmd = new SqlCommand("Sp_ActualizarEstadoCuota", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", cuo.PK_IC_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void ActualizarEstadoCuotaPenalizada(Cuota cuo)
        {
            cmd = new SqlCommand("Sp_ActualizarEstadoCuotaPenalizada", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", cuo.PK_IC_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void ConsultarImporteAPagarxCuota(Cuota cuo)
        {
            cmd = new SqlCommand("Sp_ConsultarImporteAPagarxCuota", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FK_IPre_Cod", cuo.FK_IPre_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { cuo.IC_NumeroCuota = (int)reader[0]; }
                else
                { cuo.IC_NumeroCuota = 0; }

                if (reader[1] != DBNull.Value)
                { cuo.DC_FechaInicio = (DateTime)reader[1]; }
                else
                { cuo.DC_FechaInicio = DateTime.Parse("01/01/2000"); }

                if (reader[2] != DBNull.Value)
                { cuo.DC_FechaFin = (DateTime)reader[2]; }
                else
                { cuo.DC_FechaFin = DateTime.Parse("01/01/2000"); }

                if (reader[3] != DBNull.Value)
                { cuo.FC_MontoAPagar = (double)reader[3]; }
                else
                { cuo.FC_MontoAPagar = 0; }

                if (reader[4] != DBNull.Value)
                { cuo.PK_IC_Cod = (int)reader[4]; }
                else
                { cuo.PK_IC_Cod = 0; }

                if (reader[5] != DBNull.Value)
                { cuo.FK_IECU_Cod = (int)reader[5]; }
                else
                { cuo.FK_IECU_Cod = 0; }
            }
        }

        public DataTable listarCuotasxPrestamo(Cuota objcuota)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("Sp_ListarCuotasxPrestamos", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IPre_Cod", objcuota.FK_IPre_Cod);


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
        public List<Cuota> VerificarCuotasxPrestamo(Cuota objCuo)
        {
            List<Cuota> listarCuotas = new List<Cuota>();

            try
            {
                cmd = new SqlCommand("Sp_VerificarCuotasxPrestamo", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FK_IPre_Cod", objCuo.FK_IPre_Cod);
                sqlc.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Crear objetos de tipo Cuota
                    Cuota cuo = new Cuota();
                    //objDocumento.Descripcion = dr["schName"].ToString();
                    if (reader[0] != DBNull.Value)
                    { cuo.FK_IPre_Cod = (int)reader[0]; }
                    else
                    { cuo.FK_IPre_Cod = 0; }


                    // añadir a la lista de objetos
                    listarCuotas.Add(cuo);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlc.Close();
            }

            return listarCuotas;
        }


        public int registrarMora(double montoMora, int idCuota, int numCuota)
        {

            cmd = new SqlCommand("sp_registrarCuotaVencida", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FPe_Monto", montoMora);
            cmd.Parameters.AddWithValue("@num_Cuota", numCuota);
            cmd.Parameters.AddWithValue("@PK_IC_Cod", idCuota);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }
    }
}
