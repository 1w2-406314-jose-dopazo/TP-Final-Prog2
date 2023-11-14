using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Entidades
{
    public class Clasificacion
    {
        public int Id { get; set; }
        public string Clasification { get; set; }
        public Clasificacion()
        {
            Id = 0;
            Clasification = string.Empty;
        }
        public Clasificacion(int id,string clasification)
        {
            Id = id;
            Clasification = clasification;
        }
        public override string ToString()
        {
            return Clasification;
        }
    }
}
