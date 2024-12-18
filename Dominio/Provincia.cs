using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Provincia
    {
        public int PK_IPro_Cod { get; set; }
        public string VPro_Nombre { get; set; }

        public int FK_Departamento { get; set; }



    }
}
