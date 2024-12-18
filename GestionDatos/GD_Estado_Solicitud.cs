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
    public class GD_Estado_Solicitud
    {

        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;


        public GD_Estado_Solicitud()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);


        }
        public DataTable EstadoSolicitud()
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_EstadoSolicitud", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

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