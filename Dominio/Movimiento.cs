using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Movimiento
    {
        public int PK_Numero_Transaccion { get; set; }
        public DateTime DMove_Fecha_Registro { get; set; }
        public double FMove_Importe { get; set; }
        public string VMove_Detalle { get; set; }
        public int FK_TM_Cod { get; set; }
        public int FK_IS_Cod { get; set; }
        public int FK_Rol { get; set; }
    }
}
