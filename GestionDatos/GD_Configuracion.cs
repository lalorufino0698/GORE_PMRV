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
    public class GD_Configuracion
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;

        public GD_Configuracion()
        {

            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }
        public int registrarConfiguracion(Configuracion Tcong)
        {
            cmd = new SqlCommand("SP_Registrar_Configuracion", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@VCon_Tipo_Movimiento", Tcong.VCon_Tipo_Movimiento);
            cmd.Parameters.AddWithValue("@ICon_Monto", Tcong.ICon_Monto);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }
        public DataTable Listar_tipo_Movimientos()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Configuracion", sqlc);
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

        public void ActualizarMovimientos(Configuracion Tcong)
        {
            cmd = new SqlCommand("SP_Actualizar_Configuracion", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PK_ICon_Cod", Tcong.PK_ICon_Cod);
            cmd.Parameters.AddWithValue("@VCon_Tipo_Movimiento", Tcong.VCon_Tipo_Movimiento);
            cmd.Parameters.AddWithValue("@ICon_Monto", Tcong.ICon_Monto);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public DataTable ListarAportes()
        {
            try
            {
                dat = new SqlDataAdapter("SP_ListarAportes", sqlc);
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

        public void buscarAporte(Configuracion Tcong)
        {

            cmd = new SqlCommand("SP_Listar_Aporte", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { Tcong.VCon_Tipo_Movimiento = (string)reader[0]; }
                else
                { Tcong.VCon_Tipo_Movimiento = ""; }

                if (reader[1] != DBNull.Value)
                { Tcong.ICon_Monto = (double)reader[1]; }
                else
                { Tcong.ICon_Monto = 0; }


                Tcong.estado = 99;
            }
            else
            {
                Tcong.estado = 1;
            }
            sqlc.Close();

        }

        public void buscarFondoSepelio(Configuracion Tcong)
        {

            cmd = new SqlCommand("SP_Listar_FondoSepelio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { Tcong.VCon_Tipo_Movimiento = (string)reader[0]; }
                else
                { Tcong.VCon_Tipo_Movimiento = ""; }

                if (reader[1] != DBNull.Value)
                { Tcong.ICon_Monto = (double)reader[1]; }
                else
                { Tcong.ICon_Monto = 0; }


                Tcong.estado = 99;
            }
            else
            {
                Tcong.estado = 1;
            }
            sqlc.Close();

        }
        public void buscarFondoApoyo(Configuracion Tcong)
        {

            cmd = new SqlCommand("SP_Listar_Apoyo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { Tcong.VCon_Tipo_Movimiento = (string)reader[0]; }
                else
                { Tcong.VCon_Tipo_Movimiento = ""; }

                if (reader[1] != DBNull.Value)
                { Tcong.ICon_Monto = (double)reader[1]; }
                else
                { Tcong.ICon_Monto = 0; }


                Tcong.estado = 99;
            }
            else
            {
                Tcong.estado = 1;
            }
            sqlc.Close();

        }

    }

}

