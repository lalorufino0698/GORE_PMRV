using Dominio;
using GestionDatos;
using System.Collections.Generic;
using System.Data;

namespace Negocio
{
    public class N_InstitucionEducativa
    {
        GD_Institucion objInsti;

        public N_InstitucionEducativa()
        {

            objInsti = new GD_Institucion();
        }
        public List<InstitucionEducativa> ObtenerInstitucionesPorNombreRegion(string regionNombre)
        {
            return objInsti.ObtenerListaInstitucionesPorNombreRegion(regionNombre);
        }

    }
}
