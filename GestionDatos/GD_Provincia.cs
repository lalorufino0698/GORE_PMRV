using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;


namespace GestionDatos
{
    public class GD_Provincia
    {


        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Provincia()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }


        public DataTable listar_Provincia()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Provincia_ddl", sqlc);
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
