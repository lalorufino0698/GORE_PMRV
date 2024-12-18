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
    public class N_Region
    {
        GD_Region objRegion;

        public N_Region()
        {
            objRegion = new GD_Region();
        }

        public List<Region> ObtenerRegion()
        {
            return objRegion.ObtenerListaRegion();
        }
    }
}
