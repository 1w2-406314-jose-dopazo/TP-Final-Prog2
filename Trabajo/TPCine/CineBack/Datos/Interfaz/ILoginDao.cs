﻿using CineBack.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.Datos.Interfaz
{
    public interface ILoginDao
    {
        int Login(Usuario oUsuario);
    }
}
