using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Usuario
    {
        public int PK_IU_Cod { get; set; }
        public string VU_codigoUsuario { get; set; }
        public string VU_contraseña { get; set; }
        public string passDesencriptada { get; set; }

        public string VU_NombreCompletos { get; set; }
        public string IU_dni {  get; set; }
        public string VU_correo {  get; set; }

        public string VU_usuarioCreacion { get; set; }

        public string usuarioModificacion { get; set; }
        public DateTime fechaCreacion { get; set; }

        public DateTime fechaModificacion { get; set; }

        public bool activo { get; set; }

        public int fk_iro { get; set; }
        public int fk_iie { get; set; }

        public int estado { get; set; }

     
    }
}
