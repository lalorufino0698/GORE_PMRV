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
    public class GD_Region
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Region()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public List<Region> ObtenerListaRegion()
        {
            List<Region> listaRegiones = new List<Region>();
            SqlCommand cmd = new SqlCommand("SP_ObtenerRegion", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlc.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Region region = new Region();
                region.VRE_nombreRegion = reader["VRE_nombreRegion"] != DBNull.Value ? (string)reader["VRE_nombreRegion"] : "";
                region.PK_IRE_cod = reader["PK_IRE_cod"] != DBNull.Value ? (int)reader["PK_IRE_cod"] : 0; // Si tienes un ID para la región

                listaRegiones.Add(region);
            }

            sqlc.Close();


            return listaRegiones;

            //cmd = new SqlCommand("SP_ObtenerRegion", sqlc);
            //cmd.CommandType = CommandType.StoredProcedure;

            //sqlc.Close();
            //sqlc.Open();
            //cmd.ExecuteNonQuery();
            //SqlDataReader reader = cmd.ExecuteReader();
            //if (reader.Read())
            //{
            //    if (reader[0] != DBNull.Value)
            //    { re.nombreRegion = (string)reader[0]; }
            //    else
            //    { re.nombreRegion = ""; }
            //    re.estado = 99;
            //}
            //else
            //{
            //    re.estado = 1;
            //}
            //sqlc.Close();


        }

       

    }
}
