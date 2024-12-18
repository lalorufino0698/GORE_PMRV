using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data;
using System.Data.SqlClient;
namespace GestionDatos
{
    public class GD_Socio
    {

        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Socio()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }




        public int registrarSocio(Socio objso)
        {
            cmd = new SqlCommand("sp_Registrar_Socio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IS_Dni", objso.IS_Dni);
            cmd.Parameters.AddWithValue("@VS_Nombre_Completo", objso.VS_Nombre_Completo);
            cmd.Parameters.AddWithValue("@VS_Apellido_Paterno", objso.VS_Apellido_Paterno);
            cmd.Parameters.AddWithValue("@VS_Apellido_Materno ", objso.VS_Apellido_Materno);
            cmd.Parameters.AddWithValue("@DS_Fecha_Nacimiento", objso.DS_Fecha_Nacimiento);
            cmd.Parameters.AddWithValue("@DS_Fecha_Registro", objso.DS_Fecha_Registro);
            cmd.Parameters.AddWithValue("@FK_ISol_Cod", objso.FK_ISol_Cod);
         

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public int registrarDatosComplementariosSocio(Socio objso, Solicitud sol)
        {
            cmd = new SqlCommand("SP_RegistrarDatosComplementarios", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PK_ISol_Cod", sol.PK_ISol_Cod);
            cmd.Parameters.AddWithValue("@VSol_Direccion", sol.VSol_Direccion);
            cmd.Parameters.AddWithValue("@VSol_Correo", sol.VSol_Correo);
            cmd.Parameters.AddWithValue("@ISol_Celular", sol.ISol_Celular);
            cmd.Parameters.AddWithValue("@ISol_Telefono_Fijo", sol.ISol_Telefono_Fijo);
            cmd.Parameters.AddWithValue("@VS_Situacion_Laboral", objso.VS_Situacion_Laboral);
            cmd.Parameters.AddWithValue("@VS_Rubro", objso.VS_Rubro);
            cmd.Parameters.AddWithValue("@VS_Frecuencia", objso.VS_Frecuencia);
            cmd.Parameters.AddWithValue("@VS_Tipo_Vivienda ", objso.VS_Tipo_Vivienda);
            cmd.Parameters.AddWithValue("@VS_Profesion", objso.VS_Profesion);
            cmd.Parameters.AddWithValue("@PK_IS_Cod ", objso.PK_IS_Cod);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public void buscarSocio(Socio so)
        {

            cmd = new SqlCommand("sp_BuscarSocioxdni", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Dni ", so.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { so.PK_IS_Cod = (int)reader[0]; }
                else
                { so.PK_IS_Cod = 0; }
                so.estado = 99;
            }
            else
            {
                so.estado = 1;
            }
            sqlc.Close();

        }


        public void buscarsociodni(Socio soc)
        {

            cmd = new SqlCommand("sp_BuscarSociodni", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", soc.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                if (reader[0] != DBNull.Value)
                { soc.VS_Nombre_Completo = (string)reader[0]; }
                else
                { soc.VS_Nombre_Completo = ""; }

                if (reader[1] != DBNull.Value)
                { soc.VS_Apellido_Paterno = (string)reader[1]; }
                else
                { soc.VS_Apellido_Paterno = ""; }

                if (reader[2] != DBNull.Value)
                { soc.VS_Apellido_Materno = (string)reader[2]; }
                else
                { soc.VS_Apellido_Materno = ""; }
                soc.estado = 99;
            }

            else
            {
                soc.estado = 1;
            }
            sqlc.Close();
        }

        public void buscarcodsociopatrocinador(Socio soc,Afiliacion afi)
        {

            cmd = new SqlCommand("sp_BuscarSocioPatrocinadorpenalidad", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", soc.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                if (reader[0] != DBNull.Value)
                { afi.IA_Cod_Patrocinador = (int)reader[0]; }
                else
                { afi.IA_Cod_Patrocinador = 0; }

            
                soc.estado = 99;
            }

            else
            {
                soc.estado = 1;
            }
            sqlc.Close();
        }




        public void buscarSocioPrestamoxDni(Socio socio,Solicitud sol)
        {

            cmd = new SqlCommand("Sp_BuscarSocioxPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@dni", socio.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { socio.PK_IS_Cod = (int)reader[0]; }
                else
                { socio.PK_IS_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { socio.VS_Nombre_Completo = (string)reader[1]; }
                else
                { socio.VS_Nombre_Completo = ""; }

                if (reader[2] != DBNull.Value)
                { socio.VS_Apellido_Paterno = (string)reader[2]; }
                else
                { socio.VS_Apellido_Paterno = ""; }

                if (reader[3] != DBNull.Value)
                { socio.VS_Apellido_Materno = (string)reader[3]; }
                else
                { socio.VS_Apellido_Materno = ""; }

                if (reader[4] != DBNull.Value)
                { sol.VSol_Sexo= (string)reader[4]; }
                else
                { sol.VSol_Sexo = ""; }

                if (reader[5] != DBNull.Value)
                { sol.VSol_Estado_Civil = (string)reader[5]; }
                else
                { sol.VSol_Estado_Civil = ""; }

                if (reader[6] != DBNull.Value)
                { sol.VSol_Distrito = (string)reader[6]; }
                else
                { sol.VSol_Distrito = ""; }

                if (reader[7] != DBNull.Value)
                { sol.VSol_Ocupacion = (string)reader[7]; }
                else
                { sol.VSol_Ocupacion = ""; }

                if (reader[8] != DBNull.Value)
                { socio.VS_Profesion = (string)reader[8]; }
                else
                { socio.VS_Profesion = ""; }

                if (reader[9] != DBNull.Value)
                { socio.VS_Rubro = (string)reader[9]; }
                else
                { socio.VS_Rubro = ""; }

                if (reader[10] != DBNull.Value)
                { socio.VS_Situacion_Laboral = (string)reader[10]; }
                else
                { socio.VS_Situacion_Laboral = ""; }

                if (reader[11] != DBNull.Value)
                { socio.VS_Tipo_Vivienda = (string)reader[11]; }
                else
                { socio.VS_Tipo_Vivienda = ""; }

                if (reader[12] != DBNull.Value)
                { socio.VS_Frecuencia = (string)reader[12]; }
                else
                { socio.VS_Frecuencia = ""; }

                socio.estado = 99;
            }
            else
            {
                socio.estado = 1;
            }
            sqlc.Close();

        }


        public DataTable listaPrestamoPendienteSocio(Socio objso)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("Sp_PrestamoPendienteSocio", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pk", objso.PK_IS_Cod);



                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public DataTable listaPrestamoAceptadoSocio(Socio objso)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("Sp_PrestamoAceptadoSocio", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pk", objso.PK_IS_Cod);



                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }



        public DataTable listaSociosHabilitados(Socio objso)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarSociosHabilitados", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public DataTable listaSociosSuspendidos(Socio objso)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarSociosSuspendidos", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public void actualizarEstadoSocio(Socio soc)
        {
            cmd = new SqlCommand("sp_actualizarEstadoSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IS_Cod", soc.PK_IS_Cod);
            cmd.Parameters.AddWithValue("@FK_IESocio_Cod", soc.FK_IESocio_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }



        public void ConsultarSociopk(Socio soc, Solicitud sol, Estado_Socio es)
        {

            cmd = new SqlCommand("Sp_ConsultarSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IS_Cod", soc.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { soc.PK_IS_Cod = (int)reader[0]; }
                else
                { soc.PK_IS_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { soc.IS_Dni = (int)reader[1]; }
                else
                { soc.IS_Dni = 0; }

                if (reader[2] != DBNull.Value)
                { soc.VS_Nombre_Completo = (string)reader[2]; }
                else
                { soc.VS_Nombre_Completo = ""; }

                if (reader[3] != DBNull.Value)
                { soc.VS_Apellido_Paterno = (string)reader[3]; }
                else
                { soc.VS_Apellido_Paterno = ""; }

                if (reader[4] != DBNull.Value)
                { soc.VS_Apellido_Materno = (string)reader[4]; }
                else
                { soc.VS_Apellido_Materno = ""; }

                if (reader[5] != DBNull.Value)
                { sol.PK_ISol_Cod = (int)reader[5]; }
                else
                { sol.PK_ISol_Cod = 0; }

                if (reader[6] != DBNull.Value)
                { sol.ISol_Celular = (int)reader[6]; }
                else
                { sol.ISol_Celular = 0; }

                if (reader[7] != DBNull.Value)
                { sol.VSol_Direccion = (string)reader[7]; }
                else
                { sol.VSol_Direccion = ""; }

                if (reader[8] != DBNull.Value)
                { sol.VSol_Ocupacion = (string)reader[8]; }
                else
                { sol.VSol_Ocupacion = ""; }

                if (reader[9] != DBNull.Value)
                { sol.DepartamentoResidencia = (string)reader[9]; }
                else
                { sol.DepartamentoResidencia = ""; }

                if (reader[10] != DBNull.Value)
                { sol.VSol_Estado_Civil = (string)reader[10]; }
                else
                { sol.VSol_Estado_Civil = ""; }

                if (reader[11] != DBNull.Value)
                { sol.VSol_Distrito = (string)reader[11]; }
                else
                { sol.VSol_Distrito = ""; }

                if (reader[12] != DBNull.Value)
                { sol.VSol_Provincia = (string)reader[12]; }
                else
                { sol.VSol_Provincia = ""; }

                if (reader[13] != DBNull.Value)
                { sol.DSol_Fecha_Nacimiento = (DateTime)reader[13]; }


                if (reader[14] != DBNull.Value)
                { sol.ISol_Telefono_Fijo = (int)reader[14]; }
                else
                { sol.ISol_Telefono_Fijo = 0; }

                if (reader[15] != DBNull.Value)
                { sol.VSol_Correo = (string)reader[15]; }
                else
                { sol.VSol_Correo = ""; }

                if (reader[16] != DBNull.Value)
                { es.VESocio_Estado_Socio = (string)reader[16]; }
                else
                { es.VESocio_Estado_Socio = ""; }

                if (reader[17] != DBNull.Value)
                { sol.DSol_Fecha_Registro = (DateTime)reader[17]; }
               

                if (reader[18] != DBNull.Value)
                { soc.VS_Situacion_Laboral = (string)reader[18]; }
                else
                { soc.VS_Situacion_Laboral = ""; }

                if (reader[19] != DBNull.Value)
                { soc.VS_Rubro = (string)reader[19]; }
                else
                { soc.VS_Rubro = ""; }

                if (reader[20] != DBNull.Value)
                { soc.VS_Frecuencia = (string)reader[20]; }
                else
                { soc.VS_Frecuencia = ""; }

                if (reader[21] != DBNull.Value)
                { soc.VS_Tipo_Vivienda= (string)reader[21]; }
                else
                { soc.VS_Tipo_Vivienda = ""; }

                if (reader[22] != DBNull.Value)
                { soc.VS_Profesion = (string)reader[22]; }
                else
                { soc.VS_Profesion = ""; }

                soc.estado = 99;
            }
            else
            {
                soc.estado = 1;
            }
            sqlc.Close();

        }

       


        public void buscarSocioAfiPatro(Socio so, Afiliacion afi)
        {

            cmd = new SqlCommand("Sp_ConsultarnCodPatroSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Dni", so.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { afi.PK_IA_Cod = (int)reader[0]; }
                else
                { afi.PK_IA_Cod = 0; }
                if (reader[1] != DBNull.Value)
                { afi.IA_Cod_Patrocinador = (int)reader[1]; }
                else
                { afi.IA_Cod_Patrocinador = 0; }

                so.estado = 99;
            }
            else
            {
                so.estado = 1;
            }
            sqlc.Close();

        }


        

        public void buscarSocioDatosPatro(Patrocinador patro)
        {

            cmd = new SqlCommand("Sp_ConsultarPatrocinadorDatosSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@codpatro ", patro.IPa_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { patro.VPa_Nombre_Completo = (string)reader[0]; }
                else
                { patro.VPa_Nombre_Completo = ""; }
                if (reader[1] != DBNull.Value)
                { patro.VPa_Apellido_Paterno = (string)reader[1]; }
                else
                { patro.VPa_Apellido_Paterno = ""; }

                if (reader[2] != DBNull.Value)
                { patro.VPa_Apellido_Materno = (string)reader[2]; }
                else
                { patro.VPa_Apellido_Materno = ""; }

                patro.estado = 99;
            }
            else
            {
                patro.estado = 1;
            }
            sqlc.Close();

        }


        public void buscarSocii(Socio soc)
        {

            cmd = new SqlCommand("sp_BuscarSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", soc.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { soc.PK_IS_Cod = (int)reader[0]; }
                else
                { soc.PK_IS_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { soc.VS_Nombre_Completo = (string)reader[1]; }
                else
                { soc.VS_Nombre_Completo = ""; }

                if (reader[2] != DBNull.Value)
                { soc.VS_Apellido_Paterno = (string)reader[2]; }
                else
                { soc.VS_Apellido_Paterno = ""; }

                if (reader[3] != DBNull.Value)
                { soc.VS_Apellido_Materno = (string)reader[3]; }
                else
                { soc.VS_Apellido_Materno = ""; }
                soc.estado = 99;
            }

            else
            {
                soc.estado = 1;
            }
            sqlc.Close();
        }


        public void ConsultarPrestamoPorIdSocio(Socio soc, Prestamo pre)
        {

            cmd = new SqlCommand("Sp_ConsultarPrestamoPorIdSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PK_IS_Cod", soc.PK_IS_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { pre.PK_IPre_Cod = (int)reader[0]; }
                else
                { pre.PK_IPre_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { pre.DPre_Fecha_Registro = (DateTime)reader[1]; }
                else
                { pre.DPre_Fecha_Registro = null; }

                if (reader[2] != DBNull.Value)
                { soc.VS_Nombre_Completo = (string)reader[2]; }
                else
                { soc.VS_Nombre_Completo = ""; }
                soc.estado = 99;
            }

            else
            {
                soc.estado = 1;
            }
            sqlc.Close();
        }
        public void ObtenerIdPorDniSocio(Socio soc)
        {

            cmd = new SqlCommand("obtenerIdPorDniSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", soc.IS_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { soc.PK_IS_Cod = (int)reader[0]; }
                else
                { soc.PK_IS_Cod = 0; }
                soc.estado = 99;
            }

            else
            {
                soc.estado = 1;
            }
            sqlc.Close();
        }










    }
}
