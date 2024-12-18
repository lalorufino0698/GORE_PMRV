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
    public class GD_Roles
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Roles()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public List<Roles> ObtenerListadeRoles()
        {
            List<Roles> listaRoles = new List<Roles>();
            SqlCommand cmd = new SqlCommand("SP_ObtenerRol", sqlc);
            sqlc.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Roles roles = new Roles();
                roles.PK_IRo_Cod = reader["PK_IR_cod"] != DBNull.Value ? (int)reader["PK_IR_cod"] : 0;
                roles.VRO_Nombre_Rol = reader["VR_nombreRol"] != DBNull.Value ? (string)reader["VR_nombreRol"] : "";
                listaRoles.Add(roles);
            }

            sqlc.Close();

            return listaRoles;
        }

    }
}
