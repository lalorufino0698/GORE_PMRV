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
    public class GD_FichaInformativa
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public GD_FichaInformativa()
        {
            sqlc = new SqlConnection(GD_ConexionBD.CadenaConexion);
        }
        public int registrarFicha(FichaInformativa ficha)
        {
            int newId = 0;

            using (SqlCommand cmd = new SqlCommand("SP_GuardarNuevaFicha", sqlc))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Autor", ficha.VFI_Autor);
                cmd.Parameters.AddWithValue("@Resumen", ficha.VFI_Resumen);
                cmd.Parameters.AddWithValue("@Tema", ficha.VFI_Tema);
                cmd.Parameters.AddWithValue("@anio", ficha.VFI_Anio);
                cmd.Parameters.AddWithValue("@IdiomaLenguaje", ficha.VFI_IdiomaLenguaje);
                cmd.Parameters.AddWithValue("@Fuente", ficha.VFI_Fuente);
                cmd.Parameters.AddWithValue("@fk_Modalidad", 1);

                sqlc.Open();
                newId = Convert.ToInt32(cmd.ExecuteScalar());
                sqlc.Close();
            }

            return newId;
        }

        public int registrarMaterial(MaterialEducativo material)
        {
            cmd = new SqlCommand("SP_GuardarNuevoMaterial", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", material.VM_Nombre);
            cmd.Parameters.AddWithValue("@Observacion", material.VM_Observacion);
            cmd.Parameters.AddWithValue("@TipoArchivo", material.VM_TipoArchivo);
            cmd.Parameters.AddWithValue("@fk_Ficha", material.fk_ficha);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;

        }


     


        public DataTable ObtenerMaterialesEducativos()
        {
            try
            {
                dat = new SqlDataAdapter("SP_ObtenerMaterialEducativo", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable ObtenerMaterialesEducativosPorTipoArchivo()
        {
            try
            {
                dat = new SqlDataAdapter("SP_ObtenerMaterialEducativoPorTipo", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
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
