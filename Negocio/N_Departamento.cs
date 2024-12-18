using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
  public  class N_Departamento
    {
        GD_Departamento objDep;
        public N_Departamento()
        {
            objDep = new GD_Departamento();
        }


        public DataTable listarDepartamento()
        {
            return objDep.listar_Departamento();
        }
    }
}
