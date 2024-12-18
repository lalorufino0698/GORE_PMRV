using System;
using Dominio;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Net;
namespace GestionDatos
{
    public class GD_Usuario
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;

        public GD_Usuario()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }
     
        public void IniciarSesion(Usuario objusu)
        {

            //cmd = new SqlCommand("sp_IniciarSesion", sqlc);
            //cmd.CommandType = CommandType.StoredProcedure;

            // cmd.Parameters.AddWithValue("@IU_Dni", objusu.IU_Dni);
            // cmd.Parameters.AddWithValue("@VU_Contraseña", objusu.VU_Contraseña);
            // sqlc.Close();
            //sqlc.Open();
            //cmd.ExecuteNonQuery();
            //SqlDataReader reader = cmd.ExecuteReader();
            //if (reader.Read())
            //{
           

            //    if (reader[0] != DBNull.Value)
            //    { objusu.IU_Dni = (int)reader[0]; }
            //    else
            //    { objusu.IU_Dni = 0; }

            //    if (reader[1] != DBNull.Value)
            //    { objusu.VU_Contraseña = (string)reader[1]; }
            //    else
            //    { objusu.VU_Contraseña = ""; }



            //    objusu.estado = 99;
            //}
            //else
            //{
            //    objusu.estado = 1;
            //}
            sqlc.Close();

        }




        public int registrarUsuario(Usuario objusu)
        {
            cmd = new SqlCommand("SP_GuardarNuevoUsuario", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodigoUsuario ", objusu.VU_codigoUsuario);
            cmd.Parameters.AddWithValue("@Contrasena ", objusu.VU_contraseña);
            cmd.Parameters.AddWithValue("@DatosCompletos", objusu.VU_NombreCompletos);
            cmd.Parameters.AddWithValue("@Dni ", objusu.IU_dni);
            cmd.Parameters.AddWithValue("@Correo", objusu.VU_correo);
            cmd.Parameters.AddWithValue("@fk_ic", objusu.fk_iro);
            cmd.Parameters.AddWithValue("@fk_iie", objusu.fk_iie);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public bool ExisteDniUsuario(Usuario objusu)
        {

            cmd = new SqlCommand("SP_ValidarExisteDni", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", objusu.IU_dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            bool existeDni = false;
            if (reader.Read())
            {

                if (reader[0] != DBNull.Value)
                { objusu.IU_dni = (string)reader[0]; }
                else
                { objusu.IU_dni = ""; }


                objusu.estado = 99;
                existeDni = true;
            }
            else
            {
                objusu.estado = 1;
                existeDni = false;
            }

            sqlc.Close();
            return existeDni;
            
        }


        public bool ExisteCodigoUsuario(Usuario objusu)
        {

            cmd = new SqlCommand("SP_ValidarExisteUsuario", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodigoUsuario", objusu.VU_codigoUsuario);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            bool existeCodigo = false;
            if (reader.Read())
            {

                if (reader[0] != DBNull.Value)
                { objusu.VU_codigoUsuario = (string)reader[0]; }
                else
                { objusu.VU_codigoUsuario = ""; }


                objusu.estado = 99;
                existeCodigo = true;
            }
            else
            {
                objusu.estado = 1;
                existeCodigo = false;
            }

            sqlc.Close();
            return existeCodigo;
        }



        public void buscarUsuarioPorCodigoUsuario(Usuario objusu)
        {

            cmd = new SqlCommand("sp_BuscarUsuarioPorCodigo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Codigo", objusu.VU_codigoUsuario);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { objusu.PK_IU_Cod = (int)reader[0]; }
                else
                { objusu.PK_IU_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { objusu.VU_codigoUsuario = (string)reader[1]; }
                else
                { objusu.VU_codigoUsuario = ""; }

                if (reader[2] != DBNull.Value)
                { objusu.VU_contraseña = (string)reader[2]; }
                else
                { objusu.VU_contraseña = ""; }

                if (reader[3] != DBNull.Value)
                { objusu.fk_iro = (int)reader[3]; }
                else
                { objusu.fk_iro = 0; }
                if (reader[4] != DBNull.Value)
                { objusu.VU_NombreCompletos = (string)reader[4]; }
                else
                { objusu.VU_NombreCompletos  = ""; }
                if (reader[5] != DBNull.Value)
                { objusu.VU_correo = (string)reader[5]; }
                else
                { objusu.VU_correo = ""; }

                objusu.estado = 99;
            }
            else
            {
                objusu.estado = 1;
            }
            sqlc.Close();
        }


        public void actualizarContraseña(Usuario objusu)
        {
            cmd = new SqlCommand("sp_actualizarContraseña", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@VU_Contraseña ", objusu.VU_contraseña);
            cmd.Parameters.AddWithValue("@VU_Cod ", objusu.VU_codigoUsuario);
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }



        public void enviarCredenciales(Usuario persona)
        {
           
            string contraseña = "gctn mbei czhq osgn";
            string mensaje = string.Empty;
            //Creando el correo electronico
            string destinatario = persona.VU_correo;
            string remitente = "callaocafedcallao@gmail.com";
            string asunto = "CREDENCIALES A LA PLATAFORMA DE MATERIALES Y RECURSOS VIRTUALES - CAFED";
            string stCuerpoHTML = "<!DOCTYPE html>";
            stCuerpoHTML += "<html lang='es'>";
            stCuerpoHTML += "<head>";
            stCuerpoHTML += "<meta charset='utf - 8'>";
            stCuerpoHTML += "<title>CREDENCIALES PLATAFORMA VIRTUAL CAFED</title>";
            stCuerpoHTML += "</head>";
            stCuerpoHTML += "<body style='background - color: black '>";
            stCuerpoHTML += "<table style='max - width: 600px; padding: 0px; margin: 0 auto; border - collapse: collapse; '>	";
            stCuerpoHTML += "<tr>";
            stCuerpoHTML += "<td style='padding: 0'>";
            stCuerpoHTML += "<img style='padding: 0; display: block' src='cid:Fondo' width='100%' height='10%'>";
            stCuerpoHTML += "</td>";
            stCuerpoHTML += "</tr>";
            stCuerpoHTML += "<tr>";
            stCuerpoHTML += "<td style='background - color: #ecf0f1'>";
            stCuerpoHTML += "<div style='color: #34495e; text-align: justify;font-family: sans-serif'>";
            stCuerpoHTML += "<h2 style='color:#E36C1E; margin: 0 0 7px'>Hola " + persona.VU_NombreCompletos + " (" + persona.IU_dni + ") </h2>";
            stCuerpoHTML += "<p style='margin: 2px; font-size: 15px'>";
            stCuerpoHTML += "Esperamos que se encuentre bien. Nos complace informarle que hemos generado su usuario y contraseña de acceso.<br><br>";
            stCuerpoHTML += "Su <strong>usuario</strong> es: <strong>(" + persona.VU_codigoUsuario + ")</strong>, y su <strong>contraseña</strong> es: <strong>(" + persona.passDesencriptada + ")</strong>.<br><br>";
            stCuerpoHTML += "Si tiene alguna pregunta o necesita ayuda, no dude en contactarnos. Estamos aquí para apoyarle.<br><br>";
            stCuerpoHTML += "Reciba un cordial saludo,<br>";
            stCuerpoHTML += "<strong>El equipo de CAFED</strong>";
            stCuerpoHTML += "</p>";
            stCuerpoHTML += "<br/>";
            stCuerpoHTML += "Si no ha realizado esta solicitud, puede ignorar este mensaje";
            stCuerpoHTML += "</div>";
            stCuerpoHTML += "</td>";
            stCuerpoHTML += "</tr>";
            stCuerpoHTML += "</table>";
            stCuerpoHTML += "</body>";
            stCuerpoHTML += "</html>";
            MailMessage ms = new MailMessage(remitente, destinatario, asunto, stCuerpoHTML);

            ms.IsBodyHtml = true;
            ms.Body = stCuerpoHTML;
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(" " + stCuerpoHTML + "CAFED <br/> " +
                " <a href='https://cafedcallao.gob.pe/'>www.cafedcallao.gob.pe</a> <br/>" + "<p style='color: #b3b3b3; font-size: 12px; text-align: center;margin: 30px 0 0'>NOTA DE CONFIDENCIALIDAD: La información contenida en este e-mail es confidencial, privilegiada y está dirigida exclusivamente a su destinatario. Cualquier revisión, difusión, distribución o copiado de este mensaje está prohibido. De conformidad con lo establecido en la Ley N° 29733 - Ley de Protección de Datos Personales - y su Reglamento, aprobado por D.S. N° 003-2013-JUS, declaro conocer los alcances de dichas normas y doy mi consentimiento en forma libre, expresa e inequívoca, para el tratamiento -con estrictas medidas de seguridad- de mis datos personales,</p> <br/> <p style='color: #b3b3b3; font-size: 12px; text-align: center;margin: 30px 0 0'>Copyright © CAFED 2024</p> ", null, "text/html");

            ms.BodyEncoding = UTF8Encoding.UTF8;
            ms.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            ms.CC.Add("callaocafedcallao@gmail.com");

            string fileNameLogo = HttpContext.Current.Server.MapPath("img/gore_img/cafed.png");

            System.Net.Mail.LinkedResource imageResource = new System.Net.Mail.LinkedResource(fileNameLogo, "image/png");

            imageResource.ContentId = "cafed";
            htmlView.LinkedResources.Add(imageResource);
            ms.AlternateViews.Add(htmlView);
            //confirmación  de envio de correo
            Task.Run(() =>
            {
                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(remitente, contraseña);
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    try
                    {
                        client.Send(ms);
                        ms.Dispose();

                    }
                    catch (Exception ex)
                    {
                    }
                }
            });

        }


    }
}
