using Dominio;
using GestionDatos;
using System.Data;
namespace Negocio
{
   public class N_Distrito
    {

        GD_Distrito objDistrito;

        public N_Distrito()
        {
            objDistrito = new GD_Distrito();
        }


        public DataTable listarDistrito()
        {
            return objDistrito.listar_Distrito();
        }


    }
}
