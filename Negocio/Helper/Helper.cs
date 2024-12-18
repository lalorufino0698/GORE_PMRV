using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Helper
{
    public class Helper
    {
        public double interesCompoensatorioPorMora(string tcea,double saldoContable)
        {
            string porcentajeConComa = tcea.Replace('.', ',');
            var tea = porcentajeConComa.TrimEnd('%');
            var topeBCR = 0.15;
            var tedNominal = Math.Round(Convert.ToDouble(tea) / 360, 3);
            var saldo = saldoContable;
            var tedNominalMoratorio = Math.Round(topeBCR * tedNominal, 3);
            var interesCompensatorioPorMora = (tedNominalMoratorio / 100) * saldo * 7;
            var interesC = Math.Round(interesCompensatorioPorMora, 2);
            return interesC;
        }

        public double interesCompoensatorioPorCuotaVencida(int cantidadTranscurridos, string ted, double totalCuotasAtrasadas)
        {
            
            var tedFree = ted.TrimEnd('%');
            //=+((1+S42)^(X40)-1)*X43
            var montoCuotaVencida = (Math.Pow((1+ Convert.ToDouble(tedFree)), cantidadTranscurridos) - 1) * totalCuotasAtrasadas;
            return montoCuotaVencida;
        }
    }
}
