using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Sexo
    {
        GD_Sexo objSexo;

        public N_Sexo()
        {
            objSexo = new GD_Sexo();
        }


        public DataTable listarSexo()
        {
            return objSexo.listar_Sexo();
        }
    }
}
