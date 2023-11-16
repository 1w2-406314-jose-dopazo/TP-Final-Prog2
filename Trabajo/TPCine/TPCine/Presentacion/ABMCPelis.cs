using CineBack.Datos.Implementacion;
using CineBack.Datos.Interfaz;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPCine.Presentacion
{
    public partial class ABMCPelis : Form
    {
        IPeliculaDao dao;
        public ABMCPelis()
        {
            
        }
        public ABMCPelis(int Nro, string Nom, string clas)
        {
            InitializeComponent();
            lbnro.Text += Nro.ToString();
            dao = new PeliculaDao();
            //cboClas.Text += Clas.ToString();
            txtPeli.Text += Nom.ToString();
            cboClas.Text += clas.ToString();
        }
        public string Nom { get; set; }
        public string Clas { get; set; }
        private void ABMCPelis_Load(object sender, EventArgs e)
        {

           // CargarClas();
        }

        private void CargarClas()
        {
            cboClas.DataSource = dao.ObtenerClasificacion();
            cboClas.ValueMember = "Id";
            cboClas.DisplayMember = "Clasification";
        }



        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public int Nro { get; set; }
    }
}
