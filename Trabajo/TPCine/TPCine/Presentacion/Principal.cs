using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPCine.Presentacion;

namespace TPCine
{
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {

            DialogResult result = MessageBox.Show("¿Desea regresar al inicio?", "Saliendo", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Dispose();
            }
        }

        private void peliculasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmPeliculas p = new FrmPeliculas();
            p.ShowDialog();

        }

        private void reportesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form FrmLabo = new FrmLabo();
            FrmLabo.Show();
        }
    }
}
