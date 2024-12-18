using Dominio;
using GestionDatos;
using System.Data;
namespace Negocio
{
   public class N_Afiliacion
    {

        GD_Afiliacion objAfi;

        public N_Afiliacion() {

            objAfi = new GD_Afiliacion();
        }

        public int RegistrarAfiliacion(Afiliacion afi) 
        {
            return objAfi.registrarAfiliacion(afi);
        }

        public void buscarAfiliacionDni(Afiliacion afi)
        {
            objAfi.buscarafiliaciondni(afi);
        }
        public DataTable listarAfiliaciones(Afiliacion obj)
        {
            return objAfi.ListarAfiliaciones(obj);
        }


    }
}
