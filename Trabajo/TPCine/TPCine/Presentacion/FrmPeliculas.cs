using CineBack.Datos;
using CineBack.Datos.Implementacion;
using CineBack.Datos.Interfaz;
using CineBack.Entidades;
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
    public partial class FrmPeliculas : Form
    {
        IPeliculaDao dao;

        public FrmPeliculas()
        {
            InitializeComponent();
            dao = new PeliculaDao();
        }

        private void FrmPeliculas_Load(object sender, EventArgs e)
        {

        }

        private void btnMostrar_Click(object sender, EventArgs e)
        {
            dataGridView1.Rows.Clear();
            List<Pelicula> lpeli = dao.ObtenerPeliculas();
            foreach (Pelicula p in lpeli)
            {
                dataGridView1.Rows.Add(new object[] {p.Id,p.Nombre,
                                                     p.Descripcion,p.Duracion+" hs",
                                                     p.Clasification.Clasification,"Editar","Ver"});
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (Validar())
            {
                dataGridView1.Rows.Clear();
                List<Parametro> pl = new List<Parametro>();
                pl.Add(new Parametro("@nom", txtBuscar.Text));
                List<Pelicula> lpeli = dao.ObtenerPorFiltro(pl);
                foreach (Pelicula p in lpeli)
                {
                    dataGridView1.Rows.Add(new object[] {p.Id,p.Nombre,
                                                     p.Descripcion,p.Duracion+" hs",
                                                    p.Clasification.Clasification,"Editar","Ver"});
                }
                if (dataGridView1.Rows == null)
                {
                    MessageBox.Show(" No se encontro la pelicula", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

        }
        private bool Validar()
        {
            if (string.IsNullOrEmpty(txtBuscar.Text))
            {
                MessageBox.Show("Debe Ingresar una pelicula", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("¿Desea regresar?", "Saliendo", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Dispose();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.CurrentCell.ColumnIndex == 5)
            {

                int nro = Convert.ToInt32(dataGridView1.CurrentRow.Cells["ColId"].Value);
                string nom = Convert.ToString(dataGridView1.CurrentRow.Cells["ColNom"].Value);
                string clas = Convert.ToString(dataGridView1.CurrentRow.Cells["ColCl"].Value);
                ABMCPelis detalle = new ABMCPelis(nro, nom,clas);
                detalle.Nro = nro;
                detalle.Nom = nom;
                detalle.Clas = clas;
                detalle.ShowDialog();
            }
        }
    }
}
