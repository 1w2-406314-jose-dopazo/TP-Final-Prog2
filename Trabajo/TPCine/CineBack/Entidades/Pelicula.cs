using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Entidades
{
    public class Pelicula
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int Duracion { get; set; }
        public Clasificacion Clasification { get; set; }
        public decimal Valoracion { get; set; }
        public Pelicula(int id,string nombre,string descripcion,int duracion,Clasificacion cl)
        {
            Id = id;
            Nombre = nombre;
            Descripcion = descripcion;
            Duracion = duracion;
            Clasification = cl;
        }
        public override string ToString()
        {
            return Nombre;
        }
    }
}
