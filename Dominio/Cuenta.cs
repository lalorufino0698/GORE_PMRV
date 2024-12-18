using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cuenta
    {

        public int PK_ICu_Cod { get; set; }
        public double FCu_Saldo { get; set; }
        public double FCu_Incripcion { get; set; }
        public string CHCu_Numero_Cuenta{ get; set; }
        public byte[] IMGCu_FIleImage { get; set; }
        public int FK_Numero_Transaccion { get; set; }
        public int FK_IS_Cod { get; set; }
        public int estado { get; set; }

    }
}
