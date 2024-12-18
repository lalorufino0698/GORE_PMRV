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
    public class GD_Institucion
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Institucion()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

    

        public List<InstitucionEducativa> ObtenerListaInstitucionesPorNombreRegion(string regionNombre)
        {
            List<InstitucionEducativa> listaInstituciones = new List<InstitucionEducativa>();
            SqlCommand cmd = new SqlCommand("SP_ObtenerInstitucionPorCodigo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CODIGO", regionNombre);

            sqlc.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                InstitucionEducativa institucion = new InstitucionEducativa();
                institucion.PK_IIE_cod = reader["PK_IIE_cod"] != DBNull.Value ? (int)reader["PK_IIE_cod"] : 0;
                institucion.nombreInstitucion = reader["VIE_nombreInstitucion"] != DBNull.Value ? (string)reader["VIE_nombreInstitucion"] : "";
                listaInstituciones.Add(institucion);
            }

            sqlc.Close();

            return listaInstituciones;
        }



    }
}
