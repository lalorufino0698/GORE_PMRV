using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Afiliacion
    {
        public int PK_IA_Cod { get; set; }
        public int IA_Dni { get; set; }
        public string VA_Nombre_Completo { get; set; }
        public string VA_Apellido_Paterno { get; set; }
        public string VA_Apellido_Materno { get; set; }
        public string VA_Correo { get; set; }
 
        public int IA_Cod_Patrocinador { get; set; }

        public int estado { get; set; }


    }
}
