using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace GestionDatos
{
    public class GD_Prestamo
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Prestamo()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }



        public int registrarPrestamo(Prestamo objpre)
        {
            cmd = new SqlCommand("SP_Registrar_Prestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@DPre_Fecha_Registro", objpre.DPre_Fecha_Registro);
            cmd.Parameters.AddWithValue("@FPre_Importe", objpre.FPre_Importe);
            cmd.Parameters.AddWithValue("@IPre_Cuotas", objpre.IPre_Cuotas);
            cmd.Parameters.AddWithValue("@VPre_Residencia", objpre.VPre_Residencia);
            cmd.Parameters.AddWithValue("@IPre_Miembros", objpre.IPre_Miembros);
            cmd.Parameters.AddWithValue("@IPre_Antiguedad", objpre.IPre_Antiguedad);
            cmd.Parameters.AddWithValue("@FPre_Ingresosfijos", objpre.FPre_Ingresosfijos);
            cmd.Parameters.AddWithValue("@FPre_Ingresosvariables", objpre.FPre_Ingresosvariables);
            cmd.Parameters.AddWithValue("@FPre_Egresosfijos", objpre.FPre_Egresosfijos);
            cmd.Parameters.AddWithValue("@FPre_Egresosvariables", objpre.FPre_Egresosvariables);
            cmd.Parameters.AddWithValue("@VPre_PrestamoVigente", objpre.VPre_PrestamoVigente);
            cmd.Parameters.AddWithValue("@FPre_MontoPreVigente", objpre.FPre_MontoDeVigente);
            cmd.Parameters.AddWithValue("@IPre_CuotasPreVigente", objpre.IPre_CuotasPreVigente);
            cmd.Parameters.AddWithValue("@FPre_MoMensualPreVigente", objpre.FPre_MoMensualPreVigente);
            cmd.Parameters.AddWithValue("@VPre_DeudaVigente", objpre.VPre_DeudaVigente);
            cmd.Parameters.AddWithValue("@VPre_TipoDeVigente", objpre.VPre_TipoDeVigente);
            cmd.Parameters.AddWithValue("@VPre_BancoDeVigente", objpre.VPre_BancoDeVigente);
            cmd.Parameters.AddWithValue("@VPre_GastoAlquiler", objpre.VPre_GastoAlquiler);
            cmd.Parameters.AddWithValue("@FPre_MontoDeVigente", objpre.FPre_MontoDeVigente);
            cmd.Parameters.AddWithValue("@IPre_CuotasDeVigente", objpre.IPre_CuotasDeVigente);
            cmd.Parameters.AddWithValue("@FPre_MoMensualDeVigente", objpre.FPre_MoMensualDeVigente);
            cmd.Parameters.AddWithValue("@TipoPreVigente", objpre.VPre_TipoPreVigente);
            cmd.Parameters.AddWithValue("@tcea", objpre.FPre_Tcea);
            cmd.Parameters.AddWithValue("@tasa_mensual", objpre.FPre_Tasa_Mensual);
            cmd.Parameters.AddWithValue("@FPre_Tasa_Diaria", objpre.FPre_Tasa_Diaria);
            cmd.Parameters.AddWithValue("@IMPre_Copia_DNI", objpre.IMPre_Copia_DNI);
            cmd.Parameters.AddWithValue("@IMPre_Libreta_Socio", objpre.IMPre_Libreta_Socio);
            cmd.Parameters.AddWithValue("@IMPre_Declaracion_Salud", objpre.IMPre_Declaracion_Salud);
            cmd.Parameters.AddWithValue("@IMPre_FPP", objpre.IMPre_FPP);
            cmd.Parameters.AddWithValue("@IMPre_Aportes_Sociales", objpre.IMPre_Aportes_Sociales);
            cmd.Parameters.AddWithValue("@IMPre_Declaracion_Jurada", objpre.IMPre_Declaracion_Jurada);
            cmd.Parameters.AddWithValue("@IMPre_Boleta_Pago", objpre.IMPre_Boleta_Pago);
            cmd.Parameters.AddWithValue("@IMPre_Declaracion_Ingresos", objpre.IMPre_Declaracion_Ingresos);
            cmd.Parameters.AddWithValue("@IMPre_Ingresos_Notariales", objpre.IMPre_Ingresos_Notariales);
            cmd.Parameters.AddWithValue("@FK_ITPre_Cod", objpre.FK_ITPre_Cod);
            cmd.Parameters.AddWithValue("@FK_IS_Cod", objpre.Fk_IS_Cod);
            

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }


        public DataTable listaPrestamodPendiente(Prestamo objpre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_mostrarPrestamoPendiente", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IEPre", objpre.FK_IEPre);



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


        public DataTable listaPrestamoRechazado(Prestamo objpre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_mostrarPrestamoRechazado", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IEPre", objpre.FK_IFre_Cod);



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

        public DataTable listaPrestamoAceptada(Prestamo objpre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_mostrarPrestamoAceptada", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IEPre", objpre.FK_IFre_Cod);



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

        public DataTable listaCronogramaPagoPorSocioPorPrestamo(int idPrestamo, int idCodSocio)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("sp_ConsultarCronogramaPorSocioYPrestamo", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PK_IPre_Cod ", idPrestamo);
                cmd.Parameters.AddWithValue("@PK_Cod_Socio", idCodSocio);
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


        public void actualizarEstadoPrestamo(Prestamo pre)
        {
            cmd = new SqlCommand("sp_actualizarEstadoPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IPre_Cod", pre.PK_IPre_Cod);
            cmd.Parameters.AddWithValue("@FK_IEPre", pre.FK_IEPre);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void actualizarEstadoCronogramaPorPrestamo(Prestamo pre)
        {
            cmd = new SqlCommand("sp_actualizarEstadoCronogramaPorPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PK_IPre_Cod", pre.PK_IPre_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }


        public void ConsultarPrestamopk(Prestamo pre, Tipo_Prestamo tpre, Socio soc,Solicitud sol, Estado_Prestamo epre)
        {

            cmd = new SqlCommand("Sp_ConsultarPrestamo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IPre_Cod ", pre.PK_IPre_Cod);
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
                { pre.DPre_Fecha_Registro = DateTime.Parse("01/01/2000"); }

                if (reader[2] != DBNull.Value)
                { tpre.VTP_Nombre = (string)reader[2]; }
                else
                { tpre.VTP_Nombre = ""; }

                if (reader[3] != DBNull.Value)
                { pre.IPre_Cuotas = (int)reader[3]; }
                else
                { pre.IPre_Cuotas = 0; }

                if (reader[4] != DBNull.Value)
                { pre.FPre_Importe = (double)reader[4]; }
                else
                { pre.FPre_Importe = 0; }

                if (reader[5] != DBNull.Value)
                { pre.FPre_Tasa_Mensual = (double)reader[5]; }
                else
                { pre.FPre_Tasa_Mensual = 0; }

                if (reader[6] != DBNull.Value)
                { pre.FPre_Tcea = (double)reader[6]; }
                else
                { pre.FPre_Tcea = 0; }

                if (reader[7] != DBNull.Value)
                { soc.VS_Nombre_Completo = (string)reader[7]; }
                else
                { soc.VS_Nombre_Completo = ""; }

                if (reader[8] != DBNull.Value)
                { soc.VS_Apellido_Paterno = (string)reader[8]; }
                else
                { soc.VS_Apellido_Paterno = ""; }

                if (reader[9] != DBNull.Value)
                { soc.VS_Apellido_Materno = (string)reader[9]; }
                else
                { soc.VS_Apellido_Materno = ""; }

                if (reader[10] != DBNull.Value)
                { pre.IPre_Miembros = (int)reader[10]; }
                else
                { pre.IPre_Miembros = 0; }

                if (reader[11] != DBNull.Value)
                { soc.VS_Tipo_Vivienda = (string)reader[11]; }
                else
                { soc.VS_Tipo_Vivienda = ""; }

                if (reader[12] != DBNull.Value)
                { soc.VS_Profesion = (string)reader[12]; }
                else
                { soc.VS_Profesion = ""; }

                if (reader[13] != DBNull.Value)
                { soc.VS_Rubro = (string)reader[13]; }
                else
                { soc.VS_Rubro = ""; }

                if (reader[14] != DBNull.Value)
                { soc.VS_Situacion_Laboral = (string)reader[14]; }
                else
                { soc.VS_Situacion_Laboral = ""; }

                if (reader[15] != DBNull.Value)
                { pre.IPre_Antiguedad = (int)reader[15]; }
                else
                { pre.IPre_Antiguedad = 0; }

                if (reader[16] != DBNull.Value)
                { soc.VS_Frecuencia = (string)reader[16]; }
                else
                { soc.VS_Frecuencia = ""; }

                if (reader[17] != DBNull.Value)
                { pre.FPre_Ingresosfijos = (double)reader[17]; }
                else
                { pre.FPre_Ingresosfijos = 0; }

                if (reader[18] != DBNull.Value)
                { pre.FPre_Ingresosvariables = (double)reader[18]; }
                else
                { pre.FPre_Ingresosvariables = 0; }

                if (reader[19] != DBNull.Value)
                { pre.FPre_Egresosfijos = (double)reader[19]; }
                else
                { pre.FPre_Egresosfijos = 0; }

                if (reader[20] != DBNull.Value)
                { pre.FPre_Egresosvariables = (double)reader[20]; }
                else
                { pre.FPre_Egresosvariables = 0; }

                if (reader[21] != DBNull.Value)
                { pre.VPre_PrestamoVigente = (string)reader[21]; }
                else
                { pre.VPre_PrestamoVigente = ""; }

                if (reader[22] != DBNull.Value)
                { pre.VPre_TipoPreVigente = (string)reader[22]; }
                else
                { pre.VPre_TipoPreVigente = ""; }

                if (reader[23] != DBNull.Value)
                { pre.FPre_MontoPreVigente = (double)reader[23]; }
                else
                { pre.FPre_MontoPreVigente = 0; }

                if (reader[24] != DBNull.Value)
                { pre.IPre_CuotasPreVigente = (int)reader[24]; }
                else
                { pre.IPre_CuotasPreVigente = 0; }

                if (reader[25] != DBNull.Value)
                { pre.FPre_MoMensualPreVigente = (double)reader[25]; }
                else
                { pre.FPre_MoMensualPreVigente = 0; }

                if (reader[26] != DBNull.Value)
                { pre.VPre_DeudaVigente = (string)reader[26]; }
                else
                { pre.VPre_DeudaVigente = ""; }

                if (reader[27] != DBNull.Value)
                { pre.VPre_TipoDeVigente = (string)reader[27]; }
                else
                { pre.VPre_TipoDeVigente = ""; }

                if (reader[28] != DBNull.Value)
                { pre.VPre_BancoDeVigente = (string)reader[28]; }
                else
                { pre.VPre_BancoDeVigente = ""; }

                if (reader[29] != DBNull.Value)
                { pre.FPre_MontoDeVigente = (double)reader[29]; }
                else
                { pre.FPre_MontoDeVigente = 0; }

                if (reader[30] != DBNull.Value)
                { pre.IPre_CuotasDeVigente = (int)reader[30]; }
                else
                { pre.IPre_CuotasDeVigente = 0; }

                if (reader[31] != DBNull.Value)
                { pre.FPre_MoMensualDeVigente = (double)reader[31]; }
                else
                { pre.FPre_MoMensualDeVigente = 0; }

                if (reader[32] != DBNull.Value)
                { sol.VSol_Sexo = (string)reader[32]; }
                else
                { sol.VSol_Sexo = ""; }

                if (reader[33] != DBNull.Value)
                { sol.VSol_Estado_Civil = (string)reader[33]; }
                else
                { sol.VSol_Estado_Civil = ""; }

                if (reader[34] != DBNull.Value)
                { pre.VPre_Residencia = (string)reader[34]; }
                else
                { pre.VPre_Residencia = ""; }

                if (reader[35] != DBNull.Value)
                { sol.VSol_Distrito = (string)reader[35]; }
                else
                { sol.VSol_Distrito = ""; }

                if (reader[36] != DBNull.Value)
                { sol.VSol_Ocupacion = (string)reader[36]; }
                else
                { sol.VSol_Ocupacion = ""; }

                if (reader[37] != DBNull.Value)
                { epre.VEPre_Estado_Prestamo = (string)reader[37]; }
                else
                { epre.VEPre_Estado_Prestamo = ""; }


                pre.estado = 99;
            }
            else
            {
                pre.estado = 1;
            }
            sqlc.Close();

        }




        public void ConsultarPrestamoSocio(Prestamo pre, Socio soc)
        {

            cmd = new SqlCommand("Sp_ConsultarPrestamoSocio", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IPre_Cod", pre.PK_IPre_Cod);
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

                if (reader[3] != DBNull.Value)
                { pre.PK_IPre_Cod = (int)reader[3]; }
                else
                { pre.PK_IPre_Cod = 0; }

                if (reader[4] != DBNull.Value)
                { pre.FPre_Importe = (double)reader[4]; }
                else
                { pre.FPre_Importe = 0; }

                if (reader[5] != DBNull.Value)
                { pre.IPre_Cuotas = (int)reader[5]; }
                else
                { pre.IPre_Cuotas = 0; }

                if (reader[6] != DBNull.Value)
                { pre.DPre_Fecha_Registro = (DateTime)reader[6]; }
                else
                { pre.DPre_Fecha_Registro = DateTime.Parse("01/01/2000 00:00:00"); }



                pre.estado = 99;
            }
            else
            {
                pre.estado = 1;
            }
            sqlc.Close();

        }

        public DataTable listaPrestamos(Prestamo objpre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPrestamos", sqlc);
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

        public DataTable listaPrestamosDesembolsado(Prestamo objpre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPrestamosDesembolsados", sqlc);
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


        public DataTable ListarHistorialdPrestamosxSocio(Socio objSocio)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("Sp_HistorialPrestamo", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Fk_IS_Cod", objSocio.PK_IS_Cod);



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
        public void ConsultarPrestamoxCodPres(Prestamo pre, Socio soc,Solicitud sol)
        {
            cmd = new SqlCommand("Sp_ConsultarPrestamoxCodPres", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IPre_Cod ", pre.PK_IPre_Cod);
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

                if (reader[4] != DBNull.Value)
                { soc.IS_Dni = (int)reader[4]; }
                else
                { soc.IS_Dni = 0; }

                if (reader[5] != DBNull.Value)
                { sol.VSol_Distrito = (string)reader[5]; }
                else
                { sol.VSol_Distrito = ""; }

                if (reader[6] != DBNull.Value)
                { pre.FPre_Importe = (double)reader[6]; }
                else
                { pre.FPre_Importe = 0; }

                if (reader[7] != DBNull.Value)
                { pre.FPre_Tcea = (double)reader[7]; }
                else
                { pre.FPre_Tcea = 0; }

                if (reader[8] != DBNull.Value)
                { pre.IPre_Cuotas = (int)reader[8]; }
                else
                { pre.IPre_Cuotas = 0; }

                if (reader[9] != DBNull.Value)
                { pre.DPre_Fecha_Registro = (DateTime)reader[9]; }
                else
                { pre.DPre_Fecha_Registro = DateTime.Parse("01/01/2000"); }

                if (reader[10] != DBNull.Value)
                { pre.FK_IEPre = (int)reader[10]; }
                else
                { pre.FK_IEPre = 0; }
            }
        }

        public List<Prestamo> ListarPrestamos()
        {
            List<Prestamo> listarPrestamos = new List<Prestamo>();

            try
            {
                cmd = new SqlCommand("Sp_ListarPrestamosCod", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                sqlc.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Crear objetos de tipo rhHorarios
                    Prestamo pres = new Prestamo();
                    //objDocumento.Descripcion = dr["schName"].ToString();
                    if (reader[0] != DBNull.Value)
                    { pres.PK_IPre_Cod = (int)reader[0]; }
                    else
                    { pres.PK_IPre_Cod = 0; }


                    // añadir a la lista de objetos
                    listarPrestamos.Add(pres);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlc.Close();
            }

            return listarPrestamos;
        }
        public DataTable listarConsultarPrestamo()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();
                cmd = new SqlCommand("SP_ConsultarTodosPrestamo", sqlc);
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

        public DataTable ConsultarPrestamoxFecha(Prestamo objpre)
        {
            try
            {

                cmd = new SqlCommand("Sp_ConsultarFecha", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FechaRegistro", objpre.DPre_Fecha_Registro);



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
        public DataTable ConsultaEstadoDePrestamos(Prestamo objpre)
        {
            try
            {

                cmd = new SqlCommand("Sp_ConsultaEstadoDePrestamos", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IEPre", objpre.FK_IEPre);



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

        public DataTable ConsultarPrestamoxDni(Socio objsoci)
        {
            try
            {


                cmd = new SqlCommand("Sp_ConsultarPrestamoxDni", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Dni", objsoci.IS_Dni);

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

        public DataTable ConsultarPrestamosxDNISocio(Socio objsoc)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("Sp_ConsultarPrestamoxDNISoc", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IS_Dni", objsoc.IS_Dni);

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
        public DataTable ConsultarPrestamosxNomApeSocio(Socio objsoc)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("Sp_ConsultarPrestamoxNombresApellidosSoc", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Nombre_Completo", objsoc.VS_Nombre_Completo);

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

        public int BuscarIdPrestamoPorFkSocio(Prestamo pre)
        {
            int resultado = 0;

            try
            {
                cmd = new SqlCommand("buscarIdPrestamoPorFKsocio", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FK_IS_COD", pre.Fk_IS_Cod);
                sqlc.Close();
                sqlc.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    if (reader[0] != DBNull.Value)
                    {
                        pre.PK_IPre_Cod = (int)reader[0];
                    }
                    else
                    {
                        pre.PK_IPre_Cod = 0;
                    }

                    pre.estado = 99;
                    resultado = pre.PK_IPre_Cod; // O el valor que desees devolver
                }
                else
                {
                    pre.estado = 1;
                }
            }
            finally
            {
                sqlc.Close();
            }

            return resultado;
        }

        public void GuardarCronogramaPago(DataTable data,int codSocio,int idPrestamo, int esBorrador)
        {
                sqlc.Open();

                // Iterar a través de las filas del DataTable e insertar en la base de datos
                foreach (DataRow row in data.Rows)
                {
                        cmd = new SqlCommand("InsertarCronogramaPago", sqlc);
                        cmd.CommandType = CommandType.StoredProcedure;
                        // Asignar valores a los parámetros del procedimiento almacenado
                        cmd.Parameters.AddWithValue("@NumeroCuota", row["N° CUOTA"].ToString());
                        cmd.Parameters.AddWithValue("@FechaPago", row["FECHA DE PAGO"].ToString());
                        cmd.Parameters.AddWithValue("@DiasCorridos", row["DÍAS CORRIDOS"].ToString());
                        cmd.Parameters.AddWithValue("@Amortizacion", row["AMORTIZACIÓN"].ToString());
                        cmd.Parameters.AddWithValue("@Interes", row["INTERÉS"].ToString());
                        cmd.Parameters.AddWithValue("@Seguro", row["SEGURO"].ToString());
                        cmd.Parameters.AddWithValue("@Cuota", row["CUOTA"].ToString());
                        cmd.Parameters.AddWithValue("@Saldo", row["SALDO"].ToString());
                        cmd.Parameters.AddWithValue("@CodSocio", codSocio);
                        cmd.Parameters.AddWithValue("@IdPrestamo", idPrestamo);
                        cmd.Parameters.AddWithValue("@esBorrador", esBorrador);
                        sqlc.Close();
                        sqlc.Open();
                        cmd.ExecuteNonQuery();

                }
        }


        public DataTable listarPrestamosxDniSocio(Socio objsoc)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_LISTAR_PRESTAMOS_POR_DNI", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IS_Dni", objsoc.IS_Dni);

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

        public DataTable listarCronogramaPrestamosxDniSocio(Prestamo pre)
        {
            try
            {
                sqlc.Open();

                cmd = new SqlCommand("SP_CONSULTAR_CRONOGRAMA_POR_ID_PRESTAMO", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PK_PRE", pre.PK_IPre_Cod);
               
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



        

    }
}


