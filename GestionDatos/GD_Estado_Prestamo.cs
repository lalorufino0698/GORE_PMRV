using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;

namespace GestionDatos
{
    public class GD_Estado_Prestamo
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;

        public GD_Estado_Prestamo()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public DataTable listarPrestamoxEstado()
        {
            try
            {
                dat = new SqlDataAdapter("Sp_ConsultarPrestamoxEstados", sqlc);
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
