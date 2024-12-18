using Dominio;
using GestionDatos;
using System.Data;
namespace Negocio
{
   public class N_Provincia
    {
        GD_Provincia objProvincia;

        public N_Provincia()
        {
            objProvincia = new GD_Provincia();
        }

        public DataTable listarProvincia()
        {
            return objProvincia.listar_Provincia();
        }
      

    

     

       
    

     
    }
}
