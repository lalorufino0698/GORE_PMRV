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
   public class GD_Detalle_Solicitud
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Detalle_Solicitud()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }


    }
}
