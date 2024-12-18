using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Estado_Prestamo
    {
        GD_Estado_Prestamo objestpre;


        public N_Estado_Prestamo()
        {
            objestpre = new GD_Estado_Prestamo();
        }

        public DataTable listarPrestamoxEstado()
        {
            return objestpre.listarPrestamoxEstado();
        }
    }
}
