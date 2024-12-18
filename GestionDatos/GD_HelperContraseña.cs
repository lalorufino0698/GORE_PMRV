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
    public class GD_HelperContraseña
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;


        public GD_HelperContraseña()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public int NuevaContraseña(string codUsuario, string encriptado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("sp_actualizarContraseña", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VU_Contraseña", encriptado);
                cmd.Parameters.AddWithValue("@VU_Cod", codUsuario);
                sqlc.Open();
                int filaasAfectadas =cmd.ExecuteNonQuery();
                sqlc.Close();
                return filaasAfectadas;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }
}
