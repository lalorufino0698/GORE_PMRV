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
    public class GD_Empresa
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_Empresa()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }

        public void ConsultarEmpresa(Empresa Emp)
        {

            cmd = new SqlCommand("SP_Listar_Empresa", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            //cmd.Parameters.AddWithValue("@PK_IPre_Cod ", pre.PK_IPre_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { Emp.PK_IEmp_Cod = (int)reader[0]; }
                else
                { Emp.PK_IEmp_Cod = 0; }


                if (reader[1] != DBNull.Value)
                { Emp.IE_Ruc = (string)reader[1]; }
                else
                { Emp.IE_Ruc = ""; }

                if (reader[2] != DBNull.Value)
                { Emp.VE_Nombre_Empresa = (string)reader[2]; }
                else
                { Emp.VE_Nombre_Empresa = ""; }

                if (reader[3] != DBNull.Value)
                { Emp.IMGE_Logo = (byte[])reader[3]; }
                else
                { Emp.IMGE_Logo = null; }

                if (reader[4] != DBNull.Value)
                { Emp.VE_Rubro = (string)reader[4]; }
                else
                { Emp.VE_Rubro = ""; }

                if (reader[5] != DBNull.Value)
                { Emp.VE_Representante = (string)reader[5]; }
                else
                { Emp.VE_Representante = ""; }

                if (reader[6] != DBNull.Value)
                { Emp.IE_Telefono = (int)reader[6]; }
                else
                { Emp.IE_Telefono = 0; }

                if (reader[7] != DBNull.Value)
                { Emp.VE_Correo = (string)reader[7]; }
                else
                { Emp.VE_Correo = ""; }

                if (reader[8] != DBNull.Value)
                { Emp.VE_Direccion = (string)reader[8]; }
                else
                { Emp.FK_IRo_Cod = 0; }

                if (reader[9] != DBNull.Value)
                { Emp.FK_IRo_Cod = (int)reader[9]; }
                else
                { Emp.FK_IRo_Cod = 0; }

            }
            else
            {

            }
            sqlc.Close();
        }

        public void actualizarEmpresa(Empresa emp)
        {
            cmd = new SqlCommand("SP_ActulizarEmpresas", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IEmp_Cod", emp.PK_IEmp_Cod);
            cmd.Parameters.AddWithValue("@IE_Ruc", emp.IE_Ruc);
            cmd.Parameters.AddWithValue("@VE_Nombre_Empresa", emp.VE_Nombre_Empresa);
            cmd.Parameters.AddWithValue("@VE_Representante", emp.VE_Representante);
            cmd.Parameters.AddWithValue("@IE_Telefono", emp.IE_Telefono);
            cmd.Parameters.AddWithValue("@VE_Correo", emp.VE_Correo);
            cmd.Parameters.AddWithValue("@VE_Direccion", emp.VE_Direccion);
            cmd.Parameters.AddWithValue("@IMGE_Logo", emp.IMGE_Logo);
            cmd.Parameters.AddWithValue("@rol", emp.FK_IRo_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }

        public void buscarLogo(Empresa emp)
        {

            cmd = new SqlCommand("SP_Listar_OrganizacionLogo", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { emp.PK_IEmp_Cod = (int)reader[0]; }
                else
                { emp.PK_IEmp_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { emp.IMGE_Logo = (byte[])reader[1]; }
                else
                { emp.IMGE_Logo = null; }


                emp.estado = 99;
            }
            else
            {
                emp.estado = 1;
            }
            sqlc.Close();

        }

    }

}
