using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Configuracion
    {
        public int PK_ICon_Cod { get; set; }
        public string VCon_Tipo_Movimiento { get; set; }
        public double ICon_Monto { get; set; }

        public int FK_IRo_Cod { get; set; }
        public int estado { get; set; }
    }
}
