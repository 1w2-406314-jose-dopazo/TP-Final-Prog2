using CineBack.Datos.Interfaz;
using CineBack.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CineBack.Datos.Implementacion
{
    public class PeliculaDao : IPeliculaDao
    {
        public bool Actualizar(Pelicula p)
        {
            bool confirm = true;
            SqlTransaction t = null;
            SqlConnection conexion = HelperDao.ObtenerInstancia().ObtenerConexion();

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                //Se inicia la conexion bajo transaccion
                t = conexion.BeginTransaction();
                comando.Connection = conexion;
                comando.Transaction = t;
                comando.CommandType = CommandType.StoredProcedure;
                comando.CommandText = "UpdatePeli";

                comando.Parameters.AddWithValue("@id_pelicula", p.Id);
                comando.Parameters.AddWithValue("@nombre", p.Nombre);
                comando.Parameters.AddWithValue("@descripcion", p.Descripcion);
                comando.Parameters.AddWithValue("@duracion", p.Duracion);
                comando.Parameters.AddWithValue("@id_clasificacion", p.Clasification.Id);
                comando.Parameters.AddWithValue("@valoracion", p.Valoracion);


                comando.ExecuteNonQuery();
                t.Commit();
            }
            catch
            {
                t.Rollback();
                confirm = false;
            }
            finally
            {
                if ((conexion != null) && (conexion.State == ConnectionState.Closed))
                    conexion.Close();
            }
            return confirm;
        }

        public bool Borrar(int nro)
        {
            string sp = "BorrarPeli";
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@id", nro));
            int afectadas = HelperDao.ObtenerInstancia().EjecutarSQL(sp,lst);
            return afectadas > 0;
        }

        public bool Crear(Pelicula p)
        {
            bool confirm = true;
            SqlTransaction t = null;
            SqlConnection conexion = HelperDao.ObtenerInstancia().ObtenerConexion();

            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand();
                //Se inicia la conexion bajo transaccion
                t = conexion.BeginTransaction();
                comando.Connection = conexion;
                comando.Transaction = t;
                comando.CommandType = CommandType.StoredProcedure;
                comando.CommandText = "InsertPeli";

                comando.Parameters.AddWithValue("@id_pelicula", p.Id);
                comando.Parameters.AddWithValue("@nombre", p.Nombre);
                comando.Parameters.AddWithValue("@descripcion", p.Descripcion);
                comando.Parameters.AddWithValue("@duracion", p.Duracion);
                comando.Parameters.AddWithValue("@id_clasificacion", p.Clasification.Id);
                comando.Parameters.AddWithValue("@valoracion", p.Valoracion);
               

                comando.ExecuteNonQuery();
                t.Commit();
            }
            catch
            {
                t.Rollback();
                confirm = false;
            }
            finally
            {
                if ((conexion != null) && (conexion.State == ConnectionState.Closed))
                    conexion.Close();
            }
            return confirm;
        }

        public List<Clasificacion> ObtenerClasificacion()
        {
            List<Clasificacion>clist=new List<Clasificacion>();
            DataTable t = HelperDao.ObtenerInstancia().Consultar("Clasificacion");
            foreach (DataRow fila in t.Rows)
            {
                Clasificacion c = new Clasificacion();
                c.Id = Convert.ToInt32(fila["id_clasificacion"].ToString());
                c.Clasification = fila["clasificacion"].ToString();
                clist.Add(c);
            }
            return clist;
        }

        public List<Pelicula> ObtenerPeliculas()
        {
            List<Pelicula> lPelicula = new List<Pelicula>();
            DataTable t = HelperDao.ObtenerInstancia().Consultar("Pelis");
            foreach (DataRow fila in t.Rows)
            {
                Clasificacion c = new Clasificacion();
                int id = Convert.ToInt32(fila["id_pelicula"].ToString());
                string nom = fila["nombre"].ToString();
                string desc = fila["descripcion"].ToString();
                int dur = Convert.ToInt32(fila["duracion"].ToString());
                c.Clasification = fila["clasificacion"].ToString();
                Pelicula p = new Pelicula(id,nom,desc,dur,c);
                lPelicula.Add(p);
            }
            return lPelicula;
        }

        public List<Pelicula> ObtenerPorFiltro(List<Parametro>plist)
        {
            List<Pelicula> lPelicula = new List<Pelicula>();
            
            DataTable t = HelperDao.ObtenerInstancia().Consultar("PelisBusqueda",plist);
            foreach (DataRow fila in t.Rows)
            {
                Clasificacion c = new Clasificacion();
                int id = Convert.ToInt32(fila["id_pelicula"].ToString());
                string nom = fila["nombre"].ToString();
                string desc = fila["descripcion"].ToString();
                int dur = Convert.ToInt32(fila["duracion"].ToString());
                c.Clasification = fila["clasificacion"].ToString();
                Pelicula p = new Pelicula(id, nom, desc, dur,c);
                lPelicula.Add(p);
            }
            return lPelicula;
        }
    }
}
