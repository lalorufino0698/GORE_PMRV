using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Region
    {
        public int PK_IRE_cod { get; set; }
        public string VRE_nombreRegion { get; set; }

        public string usuarioCreacion { get; set; }

        public string usuarioModificacion { get; set; }

        public DateTime fechaCreacion { get; set; }

        public DateTime fechaModificacion { get; set; }

        public bool activo { get; set; }
        public int estado {  get; set; }
    }
}
