using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class InstitucionEducativa
    {
        public int PK_IIE_cod { get; set; }
        public string nombreInstitucion { get; set; }

        public string usuarioCreacion { get; set; }

        public string usuarioModificacion { get; set; }

        public DateTime fechaCreacion { get; set; }

        public DateTime fechaModificacion { get; set; }

        public bool activo { get; set; }

        public int estado { get; set; }
    }
}
