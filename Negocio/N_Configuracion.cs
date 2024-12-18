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
    public class N_Configuracion
    {
        GD_Configuracion objCmovi;

        public N_Configuracion()
        {
            objCmovi = new GD_Configuracion();
        }
        public int RegistrarConfiguracion(Configuracion Tcong)
        {
            return objCmovi.registrarConfiguracion(Tcong);
        }
        public DataTable listarTipoMovimientos()
        {
            return objCmovi.Listar_tipo_Movimientos();
        }
        public void Editarmovimientos(Configuracion Tcong)
        {
            objCmovi.ActualizarMovimientos(Tcong);
        }
        public void buscarAporte(Configuracion Tcong)
        {
            objCmovi.buscarAporte(Tcong);
        }
        public void buscarFondoApoyo(Configuracion Tcong)
        {
            objCmovi.buscarFondoApoyo(Tcong);
        }
        public void buscarFondoSepelio(Configuracion Tcong)
        {
            objCmovi.buscarFondoSepelio(Tcong);
        }

    }
}
