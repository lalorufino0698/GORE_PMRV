using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Cuenta
    {

        GD_Cuenta objCuenta;

        public N_Cuenta()
        {
            objCuenta = new GD_Cuenta();
        }


        public int RegistrarCuenta(Cuenta cue)
        {
            return objCuenta.registrarCuenta(cue);
        }

        public int RegistrarImagenCuenta(Cuenta cue)
        {
            return objCuenta.registrarImageCuenta(cue);
        }

        public void BuscarCuenta(Cuenta cue)
        {
            objCuenta.ConsultarCuenta(cue);
        }

        public void BuscarCuentaSocio(Cuenta cue)
        {
            objCuenta.buscarCuentaxSocio(cue);
        }


    }
}
