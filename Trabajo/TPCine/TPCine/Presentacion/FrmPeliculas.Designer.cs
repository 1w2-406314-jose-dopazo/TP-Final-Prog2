namespace TPCine.Presentacion
{
    partial class FrmPeliculas
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            dataGridView1 = new DataGridView();
            ColId = new DataGridViewTextBoxColumn();
            ColNom = new DataGridViewTextBoxColumn();
            ColDesc = new DataGridViewTextBoxColumn();
            ColDur = new DataGridViewTextBoxColumn();
            ColEditar = new DataGridViewButtonColumn();
            ColVer = new DataGridViewButtonColumn();
            btnBuscar = new Button();
            txtBuscar = new TextBox();
            label1 = new Label();
            btnSalir = new Button();
            btnMostrar = new Button();
            lbMostrar = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { ColId, ColNom, ColDesc, ColDur, ColEditar, ColVer });
            dataGridView1.Location = new Point(37, 182);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.ReadOnly = true;
            dataGridView1.RowTemplate.Height = 25;
            dataGridView1.Size = new Size(692, 208);
            dataGridView1.TabIndex = 0;
            // 
            // ColId
            // 
            ColId.HeaderText = "ID";
            ColId.Name = "ColId";
            ColId.ReadOnly = true;
            ColId.Visible = false;
            // 
            // ColNom
            // 
            ColNom.HeaderText = "Nombre";
            ColNom.Name = "ColNom";
            ColNom.ReadOnly = true;
            // 
            // ColDesc
            // 
            ColDesc.HeaderText = "Descripcion";
            ColDesc.Name = "ColDesc";
            ColDesc.ReadOnly = true;
            ColDesc.Width = 250;
            // 
            // ColDur
            // 
            ColDur.HeaderText = "Duracion";
            ColDur.Name = "ColDur";
            ColDur.ReadOnly = true;
            // 
            // ColEditar
            // 
            ColEditar.HeaderText = "Editar";
            ColEditar.Name = "ColEditar";
            ColEditar.ReadOnly = true;
            // 
            // ColVer
            // 
            ColVer.HeaderText = "Ver";
            ColVer.Name = "ColVer";
            ColVer.ReadOnly = true;
            // 
            // btnBuscar
            // 
            btnBuscar.Location = new Point(589, 78);
            btnBuscar.Name = "btnBuscar";
            btnBuscar.Size = new Size(75, 23);
            btnBuscar.TabIndex = 1;
            btnBuscar.Text = "Buscar";
            btnBuscar.UseVisualStyleBackColor = true;
            btnBuscar.Click += btnBuscar_Click;
            // 
            // txtBuscar
            // 
            txtBuscar.Location = new Point(188, 78);
            txtBuscar.Name = "txtBuscar";
            txtBuscar.Size = new Size(329, 23);
            txtBuscar.TabIndex = 2;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(78, 82);
            label1.Name = "label1";
            label1.Size = new Size(92, 15);
            label1.TabIndex = 3;
            label1.Text = "Buscar Pelicula :";
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(635, 415);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(75, 23);
            btnSalir.TabIndex = 4;
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += btnSalir_Click;
            // 
            // btnMostrar
            // 
            btnMostrar.Location = new Point(146, 141);
            btnMostrar.Name = "btnMostrar";
            btnMostrar.Size = new Size(75, 23);
            btnMostrar.TabIndex = 5;
            btnMostrar.Text = "Mostrar";
            btnMostrar.UseVisualStyleBackColor = true;
            btnMostrar.Click += btnMostrar_Click;
            // 
            // lbMostrar
            // 
            lbMostrar.AutoSize = true;
            lbMostrar.Location = new Point(37, 145);
            lbMostrar.Name = "lbMostrar";
            lbMostrar.Size = new Size(103, 15);
            lbMostrar.TabIndex = 6;
            lbMostrar.Text = "Mostrar Peliculas :";
            // 
            // FrmPeliculas
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(lbMostrar);
            Controls.Add(btnMostrar);
            Controls.Add(btnSalir);
            Controls.Add(label1);
            Controls.Add(txtBuscar);
            Controls.Add(btnBuscar);
            Controls.Add(dataGridView1);
            Name = "FrmPeliculas";
            Text = "FrmPeliculas";
            Load += FrmPeliculas_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridView1;
        private Button btnBuscar;
        private TextBox txtBuscar;
        private Label label1;
        private Button btnSalir;
        private Button btnMostrar;
        private Label lbMostrar;
        private DataGridViewTextBoxColumn ColId;
        private DataGridViewTextBoxColumn ColNom;
        private DataGridViewTextBoxColumn ColDesc;
        private DataGridViewTextBoxColumn ColDur;
        private DataGridViewButtonColumn ColEditar;
        private DataGridViewButtonColumn ColVer;
    }
}