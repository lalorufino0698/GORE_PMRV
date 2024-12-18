using Dominio;
using GestionDatos;
using System.Data;

namespace Negocio
{
    public class N_Usuario
    {
        GD_Usuario objusu;

        public N_Usuario()
        {
            objusu = new GD_Usuario();
        }
        public void IniciarSesion(Usuario ojb)
        {
            objusu.IniciarSesion(ojb);
        }


        public int RegistrarUsuario(Usuario usu)
        {
            return objusu.registrarUsuario(usu);
        }
        public void EnviarCredenciales(Usuario ojb)
        {
            objusu.enviarCredenciales(ojb);
        }
        public bool ExisteDniUsuario(Usuario ojb)
        {
            return objusu.ExisteDniUsuario(ojb);
        }
        public bool ExisteCodigoUsuario(Usuario ojb)
        {
           return  objusu.ExisteCodigoUsuario(ojb);
        }

        public void BuscarUsuarioPorCodigoUsuario(Usuario ojb)
        {
            objusu.buscarUsuarioPorCodigoUsuario(ojb);
        }



        public void actualizarContraseña(Usuario ojb)
        {
            objusu.actualizarContraseña(ojb);
        }
    }
}
