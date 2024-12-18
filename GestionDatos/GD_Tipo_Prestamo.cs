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
    public class GD_Tipo_Prestamo
    {

        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        public GD_Tipo_Prestamo()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);

        }

        public int registrarTipoPrestamo(Tipo_Prestamo TPres)
        {
            cmd = new SqlCommand("SP_AgregarTipoPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@VTP_Nombre", TPres.VTP_Nombre);
            cmd.Parameters.AddWithValue("@Tasa", TPres.Tasa);
            cmd.Parameters.AddWithValue("@TCEA", TPres.TCEA);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }
        public DataTable listar_Tipo_Prestamo()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Tipo_Prestamo", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable listar_Tipo_Prestamo_Deshabilitado()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Tipo_Prestamo_Deshabilitado", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public void actualizarTipoPrestamo(Tipo_Prestamo TPres)
        {
            cmd = new SqlCommand("SP_ActualizarTipoPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_ITP_Cod", TPres.PK_ITP_Cod);
            cmd.Parameters.AddWithValue("@Tasa", TPres.Tasa);
            cmd.Parameters.AddWithValue("@TCEA", TPres.TCEA);
            

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void DeshabilitarTipoPrestamo(Tipo_Prestamo TPres)
        {
            cmd = new SqlCommand("SP_DeshabilitarTipoPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_ITP_Cod", TPres.PK_ITP_Cod);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void HabilitarTipoPrestamo(Tipo_Prestamo TPres)
        {
            cmd = new SqlCommand("SP_HabilitarTipoPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_ITP_Cod", TPres.PK_ITP_Cod);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

    }
}
