namespace TPCine.Presentacion.Laboratorio
{
    partial class FrmConsulta2
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
            panel1 = new Panel();
            lb = new Label();
            btnSalir = new Button();
            BtnAgregar = new Button();
            BtnEditar = new Button();
            BtnEliminar = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            panel1.SuspendLayout();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(12, 100);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 62;
            dataGridView1.RowTemplate.Height = 33;
            dataGridView1.Size = new Size(611, 329);
            dataGridView1.TabIndex = 4;
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(16, 63, 94);
            panel1.Controls.Add(lb);
            panel1.Dock = DockStyle.Top;
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(800, 70);
            panel1.TabIndex = 3;
            // 
            // lb
            // 
            lb.AutoSize = true;
            lb.BackColor = Color.FromArgb(16, 63, 94);
            lb.Font = new Font("Verdana", 16F, FontStyle.Regular, GraphicsUnit.Point);
            lb.ForeColor = SystemColors.ButtonFace;
            lb.Location = new Point(12, 16);
            lb.Name = "lb";
            lb.Size = new Size(161, 38);
            lb.TabIndex = 0;
            lb.Text = "Reservas";
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(649, 395);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(112, 34);
            btnSalir.TabIndex = 6;
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            // 
            // BtnAgregar
            // 
            BtnAgregar.Location = new Point(649, 100);
            BtnAgregar.Name = "BtnAgregar";
            BtnAgregar.Size = new Size(112, 34);
            BtnAgregar.TabIndex = 14;
            BtnAgregar.Text = "Agregar";
            BtnAgregar.UseVisualStyleBackColor = true;
            // 
            // BtnEditar
            // 
            BtnEditar.Location = new Point(649, 156);
            BtnEditar.Name = "BtnEditar";
            BtnEditar.Size = new Size(112, 34);
            BtnEditar.TabIndex = 13;
            BtnEditar.Text = "Editar";
            BtnEditar.UseVisualStyleBackColor = true;
            // 
            // BtnEliminar
            // 
            BtnEliminar.Location = new Point(649, 212);
            BtnEliminar.Name = "BtnEliminar";
            BtnEliminar.Size = new Size(112, 34);
            BtnEliminar.TabIndex = 12;
            BtnEliminar.Text = "Eliminar";
            BtnEliminar.UseVisualStyleBackColor = true;
            // 
            // FrmConsulta2
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(BtnAgregar);
            Controls.Add(BtnEditar);
            Controls.Add(BtnEliminar);
            Controls.Add(btnSalir);
            Controls.Add(dataGridView1);
            Controls.Add(panel1);
            Name = "FrmConsulta2";
            Text = "FrmConsulta2";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dataGridView1;
        private Panel panel1;
        private Label lb;
        private Button btnSalir;
        private Button BtnAgregar;
        private Button BtnEditar;
        private Button BtnEliminar;
    }
}