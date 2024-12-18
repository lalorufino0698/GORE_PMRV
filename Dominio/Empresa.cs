using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Empresa
    {
        public int PK_IEmp_Cod { get; set; }
        public string IE_Ruc { get; set; }
        public string VE_Nombre_Empresa { get; set; }
        public byte[] IMGE_Logo { get; set; }
        public string VE_Rubro { get; set; }
        public string VE_Representante { get; set; }
        public int IE_Telefono { get; set; }
        public string VE_Correo { get; set; }
        public string VE_Direccion { get; set; }
        public int FK_IRo_Cod { get; set; }
        public int estado { get; set; }

    }
}
