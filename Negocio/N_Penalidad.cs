using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
  public class N_Penalidad
    {
        GD_Penalidad objPenalidad;

        public N_Penalidad()
        {
            objPenalidad = new GD_Penalidad();
        }



        public DataTable listarPenalidad()
        {
            return objPenalidad.listar_Penalidad();
        }

        public DataTable listarMontoPenalidad(Penalidad pe)
        {
            return objPenalidad.listarMontoPenalidad(pe);
        }

        public int registrarPenalidad(Penalidad pe)
        {
            return objPenalidad.registrarPenalidad(pe);
        }
    }
}
