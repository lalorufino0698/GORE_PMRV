using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace GestionDatos
{
   public class GD_ConexionBD
    {
        public static string CadenaConexion
        {
            get
            {
                //return "Data Source =PC-OTICWEB;Initial Catalog=BD_PMRV;Integrated Security=True";
                return "Data Source =EDUARDO;Initial Catalog=BD_PMRV;Integrated Security=True";


            }


        }
    }
}
