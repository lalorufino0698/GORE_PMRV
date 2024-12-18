using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Tipo_Prestamo
    {
        public int PK_ITP_Cod { get; set; }
        public string VTP_Nombre { get; set; }
        public double Tasa { get; set; }
        public double TCEA { get; set; }
        public bool Activo { get; set; }

    }
}
