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
    public class GD_Afiliacion
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Afiliacion()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }




        public int registrarAfiliacion(Afiliacion afi)
        {

            cmd = new SqlCommand("Sp_RegistraAfiliacion", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", afi.IA_Dni);
            cmd.Parameters.AddWithValue("@nombrecompleto", afi.VA_Nombre_Completo);
            cmd.Parameters.AddWithValue("@apellidopaterno", afi.VA_Apellido_Paterno);
            cmd.Parameters.AddWithValue("@apellidomaterno", afi.VA_Apellido_Materno);
            cmd.Parameters.AddWithValue("@correo", afi.VA_Correo);
            cmd.Parameters.AddWithValue("@codPatrocinador", afi.IA_Cod_Patrocinador);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public void buscarafiliaciondni(Afiliacion afilia)
        {

            cmd = new SqlCommand("sp_BuscarAfiliacion", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dniafilia", afilia.IA_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) 
            {
                if (reader[0] != DBNull.Value)
                { afilia.PK_IA_Cod = (int)reader[0]; }
                else
                { afilia.PK_IA_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { afilia.IA_Dni = (int)reader[1]; }
                else
                { afilia.IA_Dni = 0; }

                if (reader[2] != DBNull.Value)
                { afilia.VA_Nombre_Completo = (string)reader[2]; }
                else
                { afilia.VA_Nombre_Completo = ""; }

                if (reader[3] != DBNull.Value)
                { afilia.VA_Apellido_Paterno = (string)reader[3]; }
                else
                { afilia.VA_Apellido_Paterno = ""; }

                if (reader[4] != DBNull.Value)
                { afilia.VA_Apellido_Materno = (string)reader[4]; }
                else
                { afilia.VA_Apellido_Materno = ""; }

                if (reader[5] != DBNull.Value)
                { afilia.VA_Correo = (string)reader[5]; }
                else
                { afilia.VA_Correo = ""; }

                if (reader[6] != DBNull.Value)
                { afilia.IA_Cod_Patrocinador = (int)reader[6]; }
                else
                { afilia.IA_Cod_Patrocinador = 0; }

                afilia.estado = 99;
            }
            else
            {
                afilia.estado = 1;
            }
            sqlc.Close();
        }

        public DataTable ListarAfiliaciones(Afiliacion objafi)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_ListarAfiliaciones", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IA_Cod_Patrocinador", objafi.IA_Cod_Patrocinador);



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