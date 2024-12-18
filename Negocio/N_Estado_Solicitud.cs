using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Estado_Solicitud
    {

        GD_Estado_Solicitud objEstadoSoli;

        public N_Estado_Solicitud()
        {
            objEstadoSoli = new GD_Estado_Solicitud();
        }
        public DataTable EstadoSolicitud()
        {
            return objEstadoSoli.EstadoSolicitud();
        }

    }
}
