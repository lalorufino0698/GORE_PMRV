using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;

namespace GestionDatos
{
    public class GD_Distrito
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Distrito()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }


        public DataTable listar_Distrito()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Distritos_ddl", sqlc);
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


    }
}
