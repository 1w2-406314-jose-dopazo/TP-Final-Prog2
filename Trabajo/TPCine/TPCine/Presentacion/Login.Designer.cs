namespace TPCine
{
    partial class Login
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
            btnIngresar = new Button();
            btnSalir = new Button();
            txtEmail = new TextBox();
            label1 = new Label();
            SuspendLayout();
            // 
            // btnIngresar
            // 
            btnIngresar.BackColor = Color.FromArgb(13, 93, 143);
            btnIngresar.Location = new Point(190, 241);
            btnIngresar.Margin = new Padding(4);
            btnIngresar.Name = "btnIngresar";
            btnIngresar.Size = new Size(278, 33);
            btnIngresar.TabIndex = 0;
            btnIngresar.Text = "Ingresar";
            btnIngresar.UseVisualStyleBackColor = false;
            btnIngresar.Click += btnIngresar_Click;
            // 
            // btnSalir
            // 
            btnSalir.BackColor = Color.FromArgb(13, 93, 143);
            btnSalir.Location = new Point(270, 303);
            btnSalir.Margin = new Padding(4);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(118, 33);
            btnSalir.TabIndex = 1;
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = false;
            btnSalir.Click += btnSalir_Click;
            // 
            // txtEmail
            // 
            txtEmail.Location = new Point(215, 183);
            txtEmail.Margin = new Padding(4);
            txtEmail.Name = "txtEmail";
            txtEmail.Size = new Size(228, 29);
            txtEmail.TabIndex = 2;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(108, 186);
            label1.Margin = new Padding(4, 0, 4, 0);
            label1.Name = "label1";
            label1.Size = new Size(60, 22);
            label1.TabIndex = 3;
            label1.Text = "Email";
            // 
            // Login
            // 
            AutoScaleDimensions = new SizeF(11F, 22F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(11, 43, 64);
            ClientSize = new Size(653, 421);
            Controls.Add(label1);
            Controls.Add(txtEmail);
            Controls.Add(btnSalir);
            Controls.Add(btnIngresar);
            Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            ForeColor = SystemColors.ButtonFace;
            Margin = new Padding(4);
            Name = "Login";
            Text = "Login";
            Load += Login_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btnIngresar;
        private Button btnSalir;
        private TextBox txtEmail;
        private Label label1;
    }
}