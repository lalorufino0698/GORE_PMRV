using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Socio
    {
        public int PK_IS_Cod { get; set; }
        public int IS_Dni { get; set; }
        public string VS_Nombre_Completo { get; set; }
        public string VS_Apellido_Paterno { get; set; }
        public string VS_Apellido_Materno { get; set; }
        public DateTime DS_Fecha_Nacimiento { get; set; }

        public DateTime DS_Fecha_Registro { get; set; }

        public string VS_Situacion_Laboral { get; set; }
        public string VS_Rubro { get; set; }
        public string VS_Frecuencia { get; set; }
        public string VS_Tipo_Vivienda { get; set; }
        public string VS_Profesion { get; set; }
        public int IS_Antiguedad_Laboral { get; set; }

        public int FK_ISol_Cod { get; set; }
        public int FK_IESocio_Cod { get; set; }
    


        public int estado { get; set; }
    

    }
}
