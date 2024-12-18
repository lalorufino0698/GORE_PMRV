using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
  public  class Prestamo
    {

        public int PK_IPre_Cod { get; set; }
        public DateTime? DPre_Fecha_Registro { get; set; }
        public double FPre_Importe { get; set; }
        public int IPre_Cuotas { get; set; }
        public string VPre_Residencia { get; set; }
        public int IPre_Miembros { get; set; }
        public int IPre_Antiguedad { get; set; }
        public double FPre_Ingresosfijos { get; set; }
        public double FPre_Ingresosvariables { get; set; }
        public double FPre_Egresosfijos { get; set; }
        public double FPre_Egresosvariables { get; set; }
        public string VPre_PrestamoVigente { get; set; }
        public double FPre_MontoPreVigente { get; set; }
        public int IPre_CuotasPreVigente { get; set; }
        public double FPre_MoMensualPreVigente { get; set; }

        public string VPre_DeudaVigente { get; set; }
        public string VPre_TipoDeVigente { get; set; }
        public string VPre_BancoDeVigente { get; set; }
        public string VPre_GastoAlquiler { get; set; }

        public double FPre_MontoDeVigente { get; set; }
        public int IPre_CuotasDeVigente { get; set; }

        public double FPre_MoMensualDeVigente { get; set; }

        public string VPre_TipoPreVigente { get; set; }

        public double FPre_Tcea { get; set; }

        public double FPre_Tasa_Mensual { get; set; }

        public double FPre_Tasa_Diaria { get; set; }


        public byte[] IMPre_Copia_DNI { get; set; }
        public byte[] IMPre_Libreta_Socio { get; set; }
        public byte[] IMPre_Declaracion_Salud { get; set; }
        public byte[] IMPre_FPP { get; set; }
        public byte[] IMPre_Aportes_Sociales { get; set; }
        public byte[] IMPre_Declaracion_Jurada { get; set; }
        public byte[] IMPre_Boleta_Pago { get; set; }
        public byte[] IMPre_Declaracion_Ingresos { get; set; }
        public byte[] IMPre_Ingresos_Notariales { get; set; }

        public int FK_ITPre_Cod { get; set; }


        public int FK_ITVi_Cod { get; set; }

        public int FK_IPro_Cod { get; set; }
        public int FK_IRu_Cod { get; set; }

        public int FK_ISLa_Cod { get; set; }

     

        public int FK_IFre_Cod { get; set; }

        public int Fk_IS_Cod { get; set; }

        public int FK_IEPre { get; set; }



        public int estado { get; set; }
    }
}
