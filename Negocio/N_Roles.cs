using Dominio;
using GestionDatos;
using System.Collections.Generic;
using System.Data;

namespace Negocio
{
    public class N_Roles
    {
        GD_Roles objRoles;

        public N_Roles()
        {
            objRoles = new GD_Roles();
        }

        public List<Roles> ObtenerRoles()
        {
            return objRoles.ObtenerListadeRoles();
        }
    }
}
