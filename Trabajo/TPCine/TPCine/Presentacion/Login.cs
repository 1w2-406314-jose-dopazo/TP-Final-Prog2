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
using TPCine.Presentacion;

namespace TPCine
{
    public partial class Login : Form
    {
        ILoginDao dao;
        public Login()
        {
            InitializeComponent();
            dao = new LoginDao();
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario();
            u.Email = txtEmail.Text;
            if (Validar())
            {
                if (dao.Login(u)==1)
                {
                    Principal p = new Principal();
                    p.ShowDialog();
                }
                else if (dao.Login(u) == 2)
                {
                    FrmLabo f = new FrmLabo();
                    f.ShowDialog();
                }
                else
                {
                    MessageBox.Show("Email no valido", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtEmail.Focus();
                    txtEmail.Clear();
                }
            }
          
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("¿Desea Salir?", "Saliendo", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void Login_Load(object sender, EventArgs e)
        {

            Borrar();
        }

        private void Borrar()
        {
            txtEmail.Clear();
        }

        private bool Validar()
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                MessageBox.Show("Debe Ingresar un email","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
    }
}
