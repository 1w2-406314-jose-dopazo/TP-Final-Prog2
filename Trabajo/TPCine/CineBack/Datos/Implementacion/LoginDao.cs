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
    public class LoginDao : ILoginDao
    {
        public int Login(Usuario oUsuario)
        {
           int success=0;
            
            List<Parametro> lparametro = new List<Parametro>();
            lparametro.Add(new Parametro("@usuario",oUsuario.Email));
           DataTable t= HelperDao.ObtenerInstancia().Consultar("Logins", lparametro);
            if (t.Rows.Count != 0)
            {
                string columna="";
                columna = Convert.ToString(t.Rows[0]["correo_electronico"]);
                if (columna.Equals("Marco@gmail.com"))
                {
                    return success = 1;
                }
                else if(columna.Equals("Chucho@gmail.com"))
                {
                    return success = 2;
                }
            }
            return success;
        }
    }
}
