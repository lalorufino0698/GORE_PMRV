using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Penalidad
    {
        public int PK_IPe_Cod { get; set; }        
        public double FPe_Monto { get; set; }
        public string VPE_Observacion { get; set; }
        public int FK_IC_Cod { get; set; }
        public int FK_IEPen_Cod { get; set; }
        public int estado { get; set; }
    }

}