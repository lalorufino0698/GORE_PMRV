using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class MaterialEducativo
    {
        public int PK_IM_Cod { get; set; }
        public string VM_Nombre { get; set; }

        public string VM_Observacion { get; set; }

        public string VM_Ruta { get; set; }

        public string VM_Archivo { get; set; }
        public string VM_TipoArchivo { get; set; }

        public string VM_UsuarioCreacion { get; set; }

        public string VM_UsuarioModificacion { get; set; }

        public DateTime VM_FechaHoraCreacion { get; set; }

        public DateTime VM_FechaHoraModificacion { get; set; }

        public bool BM_Activo { get; set; }

        public int fk_ficha { get; set; }

    }
}
