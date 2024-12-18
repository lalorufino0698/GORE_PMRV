using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class FichaInformativa
    {
        public int PK_IFI_Cod { get; set; }
        public string VFI_Autor { get; set; }

        public string VFI_Resumen { get; set; }

        public string VFI_Tema { get; set; }

        public string VFI_Anio { get; set; }

        public string VFI_IdiomaLenguaje { get; set; }

        public string VFI_Fuente { get; set; }


        public string VFI_UsuarioCreacion { get; set; }

        public string VFI_UsuarioModificacion { get; set; }

        public DateTime VFI_FechaHoraCreacion { get; set; }

        public DateTime VFI_FechaHoraModificacion { get; set; }

        public bool BFI_Activo { get; set; }

        public int fk_modalidad { get; set; }
    }
}
