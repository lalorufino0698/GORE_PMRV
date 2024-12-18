using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Patrocinador
    {
        public int PK_IPa_Cod { get; set; }
        public int IPa_Dni { get; set; }
        public string VPa_Nombre_Completo { get; set; }
        public string VPa_Apellido_Paterno { get; set; }
        public string VPa_Apellido_Materno { get; set; }
        public int IPa_Vigencia { get; set; }
        public int IPa_Cantidad_Afiliaciones { get; set; }
        public int FK_IS_Cod { get; set; }
        public int estado { get; set; }

    }
}
