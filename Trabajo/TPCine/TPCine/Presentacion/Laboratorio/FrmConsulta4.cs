﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPCine.Presentacion.Laboratorio
{
    public partial class FrmConsulta4 : Form
    {
        public FrmConsulta4()
        {
            InitializeComponent();
        }

        private void lb_Click(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("¿Desea regresar?", "Saliendo", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Dispose();
            }
        }
    }
}
