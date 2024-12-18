using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pago
    {
        public int PK_IPago_Cod { get; set; }
        public string VPago_Mes { get; set; }
        public double FPago_Monto { get; set; }
        public DateTime DPago_Fecha { get; set; }
        public int FK_IPe_Cod { get; set; }
        public int FK_IC_Cod { get; set; }


    }
}
