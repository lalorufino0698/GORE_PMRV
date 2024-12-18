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
  public class N_Solicitud
    {
        GD_Solicitud objsol;

        public N_Solicitud()
        {
            objsol = new GD_Solicitud();
        }


        public int RegistrarSolicitud(Solicitud soli)
        {
            return objsol.registrarSolicitud(soli);
        }

        public DataTable listarsolicitudPendiente(Solicitud obj)
        {
            return objsol.listaSolicitudPendiente(obj);
        }

        public DataTable listarsolicitudDenegada(Solicitud obj)
        {
            return objsol.listaSolicitudDenegada(obj);
        }

        public DataTable listarsolicitudAceptada(Solicitud obj)
        {
            return objsol.listaSolicitudAceptada(obj);
        }

        public void BuscarSolicitud(Solicitud ojb)
        {
            objsol.buscarSolicitud(ojb);
        }

        public void ActualizarEstadoSolicitud(Solicitud ojb)
        {
            objsol.actualizarEstadoSolicitud(ojb);
        }


        public void consultarSolicitud(Solicitud soli, Estado_Solicitud es,Afiliacion afi)
        {
            objsol.ConsultarSolicitudpk(soli, es,afi);
        }

        public DataTable ListarSolicitudes()
        {
            return objsol.listarSolicitudes();

        }
        public DataTable listarsolicitudesxdni(Solicitud sol)
        {
            return objsol.listarsolicitudesxdni(sol);
        }
        public DataTable ListarSolicitudesxfecha(Solicitud sol)
        {
            return objsol.listarSolicitudesxfecha(sol);

        }
        public DataTable listarSolicitudesxestad(Solicitud sol)
        {
            return objsol.listarSolicitudesxestado(sol);

        }


    }
}
