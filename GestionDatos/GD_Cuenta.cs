using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace GestionDatos
{
    public class GD_Cuenta
    {

        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Cuenta()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public int registrarCuenta(Cuenta cue)
        {

            cmd = new SqlCommand("sp_Registrar_Cuenta", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FK_IS_Cod", cue.FK_IS_Cod);
         


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public int registrarImageCuenta(Cuenta cue)
        {

            cmd = new SqlCommand("sp_Registrar_ImagenCuenta", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fksocio", cue.FK_IS_Cod);
            cmd.Parameters.AddWithValue("@img", cue.IMGCu_FIleImage);


            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;


           
        }

        public void buscarCuentaxSocio(Cuenta cue)
        {

            cmd = new SqlCommand("Sp_ConsultarSocioCuenta", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@fksocio", cue.FK_IS_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { cue.PK_ICu_Cod = (int)reader[0]; }

                if (reader[1] != DBNull.Value)
                { cue.IMGCu_FIleImage = (byte[])reader[1]; }



               cue.estado = 99;
            }
            else
            {
                cue.estado = 1;
            }
            sqlc.Close();

        }

        public void ConsultarCuenta(Cuenta cue)
        {

            cmd = new SqlCommand("SP_Listar_Cuenta", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@fksocio", cue.FK_IS_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { cue.PK_ICu_Cod = (int)reader[0]; }
                else
                { cue.PK_ICu_Cod = 0; }


                if (reader[1] != DBNull.Value)
                { cue.FCu_Saldo = (double)reader[1]; }
                else
                { cue.FCu_Saldo = 0; }

                if (reader[2] != DBNull.Value)
                { cue.FCu_Incripcion = (double)reader[2]; }
                else
                { cue.FCu_Incripcion = 0; }

                if (reader[3] != DBNull.Value)
                { cue.CHCu_Numero_Cuenta = (string)reader[3]; }
                else
                { cue.CHCu_Numero_Cuenta = ""; }

                if (reader[4] != DBNull.Value)
                { cue.IMGCu_FIleImage = (byte[])reader[4]; }
              

                if (reader[5] != DBNull.Value)
                { cue.FK_Numero_Transaccion = (int)reader[5]; }
                else
                { cue.FK_Numero_Transaccion = 0; }

                if (reader[6] != DBNull.Value)
                { cue.FK_IS_Cod = (int)reader[6]; }
                else
                { cue.FK_IS_Cod = 0; }

               
            }
            else
            {

            }
            sqlc.Close();
        }

    }
}
