using CineBack.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Interfaz
{
    public interface IPeliculaDao
    {
        List<Pelicula> ObtenerPeliculas();
       List< Pelicula> ObtenerPorFiltro(List<Parametro>plist);
        List<Clasificacion> ObtenerClasificacion();
        bool Borrar(int nro);
        bool Crear(Pelicula p);
        bool Actualizar(Pelicula p);
    }
}
