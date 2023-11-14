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
        public List<Pelicula> ObtenerPeliculas()
        {
            List<Pelicula> lPelicula = new List<Pelicula>();
            DataTable t = HelperDao.ObtenerInstancia().Consultar("Pelis");
            foreach (DataRow fila in t.Rows)
            {
               
                int id = Convert.ToInt32(fila["id_pelicula"].ToString());
                string nom = fila["nombre"].ToString();
                string desc = fila["descripcion"].ToString();
                int dur = Convert.ToInt32(fila["duracion"].ToString());
                Pelicula p = new Pelicula(id,nom,desc,dur);
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

                int id = Convert.ToInt32(fila["id_pelicula"].ToString());
                string nom = fila["nombre"].ToString();
                string desc = fila["descripcion"].ToString();
                int dur = Convert.ToInt32(fila["duracion"].ToString());
                Pelicula p = new Pelicula(id, nom, desc, dur);
                lPelicula.Add(p);
            }
            return lPelicula;
        }
    }
}
