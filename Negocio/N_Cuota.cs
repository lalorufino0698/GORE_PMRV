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
    public class N_Cuota
    {
        GD_Cuota objCuota;

        public N_Cuota()
        {

            objCuota = new GD_Cuota();
        }

        public int RegistrarCuota(Cuota cu)
        {
            return objCuota.registrarCuota(cu);
        }


        public DataTable ListarCuotaMoroso(Cuota cu)
        {
            return objCuota.listarCuotaMoroso(cu);
        }

        public void ActualizarEstadoCuota(Cuota cuo)
        {
            objCuota.ActualizarEstadoCuota(cuo);
        }

        public void ActualizarEstadoCuotaPenalizada(Cuota cuo)
        {
            objCuota.ActualizarEstadoCuotaPenalizada(cuo);
        }

        public void ConsultarImporteAPagarxCuota(Cuota cuo)
        {
            objCuota.ConsultarImporteAPagarxCuota(cuo);
        }

        public DataTable ListarCuotasxPrestamo(Cuota cu)
        {
            return objCuota.listarCuotasxPrestamo(cu);
        }

        public List<Cuota> VerificarCuotasxPrestamo(Cuota cuo)
        {
            return objCuota.VerificarCuotasxPrestamo(cuo);
        }

        public int RegistrarMora(double montoMora,int idCuota, int numCuota)
        {
            return objCuota.registrarMora(montoMora, idCuota, numCuota);
        }
    }
}
