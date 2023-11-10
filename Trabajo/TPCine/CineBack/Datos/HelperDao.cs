using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CineBack.Datos
{
    public class HelperDao
    {
        private static HelperDao instancia;
        private SqlConnection conexion;
        private HelperDao()
        {
            conexion = new SqlConnection(@"");
        }
        public static HelperDao ObtenerInstancia()
        {
            if (instancia == null)
            {
                instancia = new HelperDao();

            }
            return instancia;
        }
        public SqlConnection ObtenerConexion()
        {
            return this.conexion;
        }
        public int ConsultaEscalar(string nombreSp,string paramOut)
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = nombreSp;
            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = paramOut;
            parametro.SqlDbType = SqlDbType.Int;
            parametro.Direction = ParameterDirection.Output;
            comando.Parameters.Add(parametro);
            comando.ExecuteNonQuery();
            conexion.Close();
            return (int)parametro.Value;
        }
        public DataTable Consultar(string Sp)
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = Sp;
            DataTable t = new DataTable();
            t.Load(comando.ExecuteReader());
            conexion.Close();
            return t;
        }
        public DataTable Consultar(string Sp,List<Parametro>lparametro)
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = Sp;
            comando.Parameters.Clear();
            foreach (Parametro p in lparametro)
            {
                comando.Parameters.AddWithValue(p.Nombre, p.Valor);
            }
            DataTable t = new DataTable();
            t.Load(comando.ExecuteReader());
            conexion.Close();
            return t;
        }
    }
}
