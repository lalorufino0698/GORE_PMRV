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
    public class N_Socio
    {
        GD_Socio objso;

        public N_Socio()
        {
            objso = new GD_Socio();
        }


        public int RegistrarSocio(Socio so)
        {
            return objso.registrarSocio(so);
        }

        public int RegistrarDatosComplementariosSocio(Socio so, Solicitud sol)
        {
            return objso.registrarDatosComplementariosSocio(so, sol);
        }

        public void BuscarSocioxdni(Socio so)
        {
            objso.buscarSocio(so);
        }

        public void BuscarSocio(Socio so)
        {
            objso.buscarsociodni(so);
        }

        public void BuscarCodPatrocinador(Socio so, Afiliacion afi)
        {
            objso.buscarcodsociopatrocinador(so, afi);
        }


        public void consultarSocioPrestamoxdni(Socio socio, Solicitud sol)
        {
            objso.buscarSocioPrestamoxDni(socio, sol);
        }


        public void ConsultarPrestamoPorIdSocio(Socio socio, Prestamo pre)
        {
            objso.ConsultarPrestamoPorIdSocio(socio, pre);
        }

        public void ObtenerIdPorDniSocio(Socio socio)
        {
            objso.ObtenerIdPorDniSocio(socio);
        }


        public DataTable listarPrestamoPendientexsocio(Socio soci)
        {
            return objso.listaPrestamoPendienteSocio(soci);
        }

        public DataTable listarPrestamoAceptadoxsocio(Socio soci)
        {
            return objso.listaPrestamoAceptadoSocio(soci);
        }

        public DataTable listarSociosHabilitados(Socio soci)
        {
            return objso.listaSociosHabilitados(soci);
        }

        public DataTable listarSociosSuspendidos(Socio soci)
        {
            return objso.listaSociosSuspendidos(soci);
        }


        public void ActualizarEstadoSocio(Socio soci)
        {
            objso.actualizarEstadoSocio(soci);
        }

        public void consultarSocio(Socio soc, Solicitud sol, Estado_Socio es)
        {
            objso.ConsultarSociopk(soc, sol, es);
        }

        public void BuscarSocioAfiPatro(Socio so, Afiliacion afi)
        {
            objso.buscarSocioAfiPatro(so, afi);
        }

        public void BuscarSocioDatosPatro(Patrocinador patro)
        {
            objso.buscarSocioDatosPatro(patro);
        }
   

       
        public void BuscarSocii(Socio so)
        {
            objso.buscarSocii(so);
        }

    }
}
