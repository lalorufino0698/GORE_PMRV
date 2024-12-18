using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using GestionDatos;
using Dominio;


namespace Negocio
{
    public class N_Movimiento
    {

        GD_Movimiento objMov;

        public N_Movimiento() 
        {
            objMov = new GD_Movimiento();
        }


        public int RegistrarMovimientoxCuotaPagada(Movimiento mov, Cuota cuo)
        {
            return objMov.registrarMovimientoxCuotaPagada(mov, cuo);
        }

        public int registrarMovimiento(Movimiento mo)
        {
            return objMov.registrarMovimiento(mo);
        }

        public int CreateMove(Movimiento mo)
        {
            return objMov.pushMove(mo);
        }

        public int registrarAhorro(Movimiento mo)
        {
            return objMov.registrarAhorro(mo);
        }

        public DataTable listarMovimientoxSocio(Socio soci)
        {
            return objMov.listarMovimientoxSocio(soci);
        }
        public DataTable listarMovimiento()
        {
            return objMov.listarMovimiento();

        }

        public int RegistrarMovimientoxDesembolso(Movimiento mo)
        {
            return objMov.registrarMovimientoxDesembolso(mo);
        }


    }
}
