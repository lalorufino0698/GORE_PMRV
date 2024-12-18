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
   public class N_Prestamo
    {
        GD_Prestamo objpre;

          public N_Prestamo()
            {
                objpre = new GD_Prestamo();
            }


        public int RegistrarPrestamo(Prestamo pre)
            {
                return objpre.registrarPrestamo(pre);
            }

        public DataTable listarPrestamoPendiente(Prestamo pre)
        {
            return objpre.listaPrestamodPendiente(pre);
        }

        public DataTable listarPrestamoDenegada(Prestamo pre)
        {
            return objpre.listaPrestamoRechazado(pre);
        }

        public DataTable listarPrestamoAceptada(Prestamo pre)
        {
            return objpre.listaPrestamoAceptada(pre);
        }
        public DataTable listaCronogramaPagoPorSocioPorPrestamo(int idPrestamo, int idCodSocio)
        {
            return objpre.listaCronogramaPagoPorSocioPorPrestamo(idPrestamo, idCodSocio);
        }

        

        public void ActualizarEstadoPrestamo(Prestamo pre)
        {
            objpre.actualizarEstadoPrestamo(pre);
        }

        public void actualizarEstadoCronogramaPorPrestamo(Prestamo pre)
        {
            objpre.actualizarEstadoCronogramaPorPrestamo(pre);
        }
        

        public void consultarPrestamo(Prestamo pre, Tipo_Prestamo tpre, Socio soc,Solicitud sol, Estado_Prestamo epre)
        {
            objpre.ConsultarPrestamopk(pre, tpre, soc,sol,epre);
        }

        public void consultarPrestamoSocio(Prestamo pre,Socio soc)
        {
            objpre.ConsultarPrestamoSocio(pre , soc);
        }

        public DataTable listarPrestamos(Prestamo pre)
        {
            return objpre.listaPrestamos(pre);
        }

        public DataTable listarPrestamosDesembolsado(Prestamo pre)
        {
            return objpre.listaPrestamosDesembolsado(pre);
        }

        public DataTable listarhistorialprestamos(Socio socio)
        {
            return objpre.ListarHistorialdPrestamosxSocio(socio);
        }
        public DataTable ListarConsultarPrestamo()
        {
            return objpre.listarConsultarPrestamo();
        }

        public void ConsultarPrestamoxCodPres(Prestamo pre, Socio soc,Solicitud sol)
        {
            objpre.ConsultarPrestamoxCodPres(pre, soc,sol);
        }

        public int BuscarIdPrestamoPorFkSocio(Prestamo pre)
        {
           return objpre.BuscarIdPrestamoPorFkSocio(pre);
        }

        public void GuardarCronogramaPago(DataTable data, int codSocio, int idPrestamo, int esBorrador)
        {
            objpre.GuardarCronogramaPago(data, codSocio, idPrestamo, esBorrador);
        }



        public List<Prestamo> ListarPrestamosCod()
        {
            return objpre.ListarPrestamos();
        }
        public DataTable ConsultarPrestamoxFecha(Prestamo pre)
        {
            return objpre.ConsultarPrestamoxFecha(pre);
        }

        public DataTable ConsultarPrestamoxDni(Socio socio)
        {
            return objpre.ConsultarPrestamoxDni(socio);
        }

        public DataTable ConsultaEstadoDePrestamos(Prestamo pre)
        {
            return objpre.ConsultaEstadoDePrestamos(pre);
        }


        public DataTable ConsultarPrestamosxNomApeSocio(Socio soc)
        {
            return objpre.ConsultarPrestamosxNomApeSocio(soc);
        }
        public DataTable ConsultarPrestamosxDNISocio(Socio soc)
        {
            return objpre.ConsultarPrestamosxDNISocio(soc);
        }

        public DataTable listarPrestamosxDniSocio(Socio soc)
        {
            return objpre.listarPrestamosxDniSocio(soc);
        }
        public DataTable listarCronogramaPrestamosxDniSocio(Prestamo pre)
        {
            return objpre.listarCronogramaPrestamosxDniSocio(pre);
        }
    }

}
