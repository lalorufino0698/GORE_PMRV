using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
   public class N_EstadoCivil
    {

        GD_Estado_Civil objecivil;

        public N_EstadoCivil()
        {
            objecivil = new GD_Estado_Civil();
        }


        public DataTable listarEstadoCivil()
        {
            return objecivil.listar_Estado_Civil();
        }
    }
}
