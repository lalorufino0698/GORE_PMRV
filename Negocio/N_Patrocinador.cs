using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Patrocinador
    {
        GD_Patrocinador objpatro;

        public N_Patrocinador()
        {
            objpatro = new GD_Patrocinador();
        }
        public void buscarPatrocinadorDni(Patrocinador patro)
        {
            objpatro.buscarpatrocinadordni(patro);
        }

        public void BuscarPatrocinadorXdni(Patrocinador patro)
        {
            objpatro.buscarpatrocinadorxdni(patro);
        }

        public void ActualizarAfiliacionPatrocinador(Patrocinador patro)
        {
            objpatro.actualizarafiliacionpatrocinador(patro);
        }

        public DataTable listarPatrocinadores()
        {
            return objpatro.listar_Patrocinadores();
        }

    }
}
