namespace TPCine.Presentacion
{
    partial class ABMCPelis
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
            lbnro = new Label();
            lblPeli = new Label();
            lblClas = new Label();
            cboClas = new ComboBox();
            txtPeli = new TextBox();
            btnSalir = new Button();
            btnEliminar = new Button();
            btnConfirmar = new Button();
            btnActualizar = new Button();
            SuspendLayout();
            // 
            // lbnro
            // 
            lbnro.AutoSize = true;
            lbnro.Location = new Point(27, 20);
            lbnro.Name = "lbnro";
            lbnro.Size = new Size(68, 15);
            lbnro.TabIndex = 0;
            lbnro.Text = "Pelicula N*:";
            // 
            // lblPeli
            // 
            lblPeli.AutoSize = true;
            lblPeli.Location = new Point(27, 58);
            lblPeli.Name = "lblPeli";
            lblPeli.Size = new Size(48, 15);
            lblPeli.TabIndex = 1;
            lblPeli.Text = "Pelicula";
            // 
            // lblClas
            // 
            lblClas.AutoSize = true;
            lblClas.Location = new Point(27, 103);
            lblClas.Name = "lblClas";
            lblClas.Size = new Size(74, 15);
            lblClas.TabIndex = 2;
            lblClas.Text = "Clasificacion";
            // 
            // cboClas
            // 
            cboClas.FormattingEnabled = true;
            cboClas.Location = new Point(122, 103);
            cboClas.Name = "cboClas";
            cboClas.Size = new Size(185, 23);
            cboClas.TabIndex = 4;
            cboClas.SelectedIndexChanged += comboBox2_SelectedIndexChanged;
            // 
            // txtPeli
            // 
            txtPeli.Location = new Point(122, 55);
            txtPeli.Name = "txtPeli";
            txtPeli.Size = new Size(238, 23);
            txtPeli.TabIndex = 5;
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(591, 376);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(75, 23);
            btnSalir.TabIndex = 6;
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += btnSalir_Click;
            // 
            // btnEliminar
            // 
            btnEliminar.Location = new Point(435, 376);
            btnEliminar.Name = "btnEliminar";
            btnEliminar.Size = new Size(75, 23);
            btnEliminar.TabIndex = 7;
            btnEliminar.Text = "Eliminar";
            btnEliminar.UseVisualStyleBackColor = true;
            btnEliminar.Click += btnEliminar_Click;
            // 
            // btnConfirmar
            // 
            btnConfirmar.Location = new Point(51, 376);
            btnConfirmar.Name = "btnConfirmar";
            btnConfirmar.Size = new Size(75, 23);
            btnConfirmar.TabIndex = 8;
            btnConfirmar.Text = "Confirmar";
            btnConfirmar.UseVisualStyleBackColor = true;
            // 
            // btnActualizar
            // 
            btnActualizar.Location = new Point(220, 376);
            btnActualizar.Name = "btnActualizar";
            btnActualizar.Size = new Size(75, 23);
            btnActualizar.TabIndex = 9;
            btnActualizar.Text = "Actualizar";
            btnActualizar.UseVisualStyleBackColor = true;
            // 
            // ABMCPelis
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(btnActualizar);
            Controls.Add(btnConfirmar);
            Controls.Add(btnEliminar);
            Controls.Add(btnSalir);
            Controls.Add(txtPeli);
            Controls.Add(cboClas);
            Controls.Add(lblClas);
            Controls.Add(lblPeli);
            Controls.Add(lbnro);
            Name = "ABMCPelis";
            Text = "ABMCPelis";
            Load += ABMCPelis_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lbnro;
        private Label lblPeli;
        private Label lblClas;
        private ComboBox cboClas;
        private TextBox txtPeli;
        private Button btnSalir;
        private Button btnEliminar;
        private Button btnConfirmar;
        private Button btnActualizar;
    }
}