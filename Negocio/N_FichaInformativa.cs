using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using GestionDatos;
using Dominio;

namespace Negocio
{
    public class N_FichaInformativa
    {
        GD_FichaInformativa objficha;

        public N_FichaInformativa()
        {

            objficha = new GD_FichaInformativa();
        }

        public int RegistrarFicha(FichaInformativa ficha)
        {
            return objficha.registrarFicha(ficha);
        }

        //parte de material
        public int RegistrarMaterial(MaterialEducativo material)
        {
            return objficha.registrarMaterial(material);
        }

     

        public DataTable ObtenerMaterialesEducativos()
        {
            return objficha.ObtenerMaterialesEducativos();

        }
        public DataTable ObtenerMaterialesEducativosPorTipo()
        {
            return objficha.ObtenerMaterialesEducativosPorTipoArchivo();

        }

    }
}
