using CineBack.Datos.Interfaz;
using CineBack.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Implementacion
{
    public class PeliculaDao : IPeliculaDao
    {
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
