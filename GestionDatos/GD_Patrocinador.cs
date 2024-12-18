using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;

namespace GestionDatos
{
   public class GD_Patrocinador
    {

        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Patrocinador()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }



        public void buscarpatrocinadordni(Patrocinador patro)
        {

            cmd = new SqlCommand("sp_BuscarPatrocinadordni", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", patro.IPa_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { patro.PK_IPa_Cod = (int)reader[0]; }
                else
                { patro.PK_IPa_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { patro.IPa_Dni = (int)reader[1]; }
                else
                { patro.IPa_Dni = 0; }

                if (reader[2] != DBNull.Value)
                { patro.VPa_Nombre_Completo = (string)reader[2]; }
                else
                { patro.VPa_Nombre_Completo = ""; }

                if (reader[3] != DBNull.Value)
                { patro.VPa_Apellido_Paterno= (string)reader[3]; }
                else
                { patro.VPa_Apellido_Paterno = ""; }

                if (reader[4] != DBNull.Value)
                { patro.VPa_Apellido_Materno = (string)reader[4]; }
                else
                { patro.VPa_Apellido_Materno = ""; }

                if (reader[5] != DBNull.Value)
                { patro.IPa_Vigencia = (int)reader[5]; }
                else
                { patro.IPa_Vigencia = 0; }

                if (reader[6] != DBNull.Value)
                { patro.IPa_Cantidad_Afiliaciones = (int)reader[6]; }
                else
                { patro.IPa_Cantidad_Afiliaciones = 0; }

                patro.estado = 99;
            }
            else
            {
               patro.estado = 1;
            }
            sqlc.Close();
        }



        public void buscarpatrocinadorxdni(Patrocinador patro)
        {

            cmd = new SqlCommand("sp_BuscarPatrocinadorxDni", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", patro.IPa_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {


                if (reader[0] != DBNull.Value)
                { patro.PK_IPa_Cod = (int)reader[0]; }
                else
                { patro.PK_IPa_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { patro.IPa_Dni = (int)reader[1]; }
                else
                { patro.IPa_Dni = 0; }

                if (reader[2] != DBNull.Value)
                { patro.IPa_Cantidad_Afiliaciones = (int)reader[2]; }
                else
                { patro.IPa_Cantidad_Afiliaciones = 0; }

                patro.estado = 99;
            }
            else
            {
                patro.estado = 1;
            }
            sqlc.Close();
        }


        public DataTable listar_Patrocinadores()
        {
            try
            {
                dat = new SqlDataAdapter("SP_ListarPatrocinadores", sqlc);
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





        public void actualizarafiliacionpatrocinador(Patrocinador patrocinador)
        {
            cmd = new SqlCommand("sp_ActualizaraAfiliaciones", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@IPa_Dni", patrocinador.IPa_Dni);
            cmd.Parameters.AddWithValue("@IPa_Cantidad_Afiliaciones", patrocinador.IPa_Cantidad_Afiliaciones);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }
    }


}
