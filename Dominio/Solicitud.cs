using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
  public class Solicitud
    {
        public int PK_ISol_Cod { get; set; }
        public int ISol_Dni { get; set; }
        public string VSol_Nombre_Completo { get; set; }
        public string VSol_Apellido_Paterno { get; set; }
        public string VSol_Apellido_Materno { get; set; }
        public DateTime DSol_Fecha_Nacimiento { get; set; }

        public DateTime DSol_Fecha_Registro { get; set; }

        public string VSol_Direccion { get; set; }
        public string VSol_Correo { get; set; }

        public int ISol_Celular { get; set; }
        public int ISol_Telefono_Fijo { get; set; }

        public byte[] IMSol_Recibo_Luz { get; set; }
        public byte[] IMSol_Recibo_agua { get; set; }
        public byte[] IMSol_Imagen_Vivienda { get; set; }
        public byte[] IMSol_Constancia { get; set; }


        public string VSol_Departamento { get; set; }

        public string VSol_Provincia { get; set; }

        public string VSol_Estado_Civil { get; set; }

        public string VSol_Ocupacion { get; set; }




        public int FK_IESol_Cod { get; set; }

        public int FK_IA_Cod { get; set; }

        public string DepartamentoResidencia { get; set; }

        public string VSol_Sexo { get; set; }

        public string VSol_Distrito { get; set; }


        public int estado { get; set; }

    }
}
