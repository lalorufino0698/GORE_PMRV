using Dominio;
using GestionDatos;
using System.Data;
namespace Negocio
{
    public class N_Empresa
    {
        GD_Empresa objEmpresa;


        public N_Empresa()
        {
            objEmpresa = new GD_Empresa();
        }

        public void ConsultarEmpresas(Empresa Emp)
        {
            objEmpresa.ConsultarEmpresa(Emp);
        }
        public void ActualizarEmpresa(Empresa Emp)
        {
            objEmpresa.actualizarEmpresa(Emp);
        }
        public void buscarLogo(Empresa Emp)
        {
            objEmpresa.buscarLogo(Emp);
        }
    }
}
