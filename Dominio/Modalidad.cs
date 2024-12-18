using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Modalidad
    {
        public int PK_IMO_Cod { get; set; }
        public string VMO_NombreModalidad { get; set; }

        public string VMO_NivelEducativo { get; set; }

        public string VMO_GradoEdad { get; set; }

        public string VMO_AreaCurricular { get; set; }



        public string VMO_UsuarioCreacion { get; set; }

        public string VMO_UsuarioModificacion { get; set; }

        public DateTime VMO_FechaHoraCreacion { get; set; }

        public DateTime VMO_FechaHoraModificacion { get; set; }

        public bool BMO_Activo { get; set; }
    }
}
