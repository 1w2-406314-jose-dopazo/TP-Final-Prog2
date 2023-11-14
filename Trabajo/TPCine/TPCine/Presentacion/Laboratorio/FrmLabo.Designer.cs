namespace TPCine.Presentacion
{
    partial class FrmLabo
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
            components = new System.ComponentModel.Container();
            panel1 = new Panel();
            bindingSource1 = new BindingSource(components);
            btn1 = new Button();
            button1 = new Button();
            button2 = new Button();
            button3 = new Button();
            button4 = new Button();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)bindingSource1).BeginInit();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(11, 43, 64);
            panel1.Controls.Add(button4);
            panel1.Controls.Add(button3);
            panel1.Controls.Add(button2);
            panel1.Controls.Add(button1);
            panel1.Controls.Add(btn1);
            panel1.Dock = DockStyle.Left;
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(231, 450);
            panel1.TabIndex = 0;
            // 
            // btn1
            // 
            btn1.BackColor = Color.FromArgb(211, 230, 242);
            btn1.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            btn1.ForeColor = Color.FromArgb(65, 80, 89);
            btn1.Location = new Point(24, 30);
            btn1.Name = "btn1";
            btn1.Size = new Size(177, 66);
            btn1.TabIndex = 1;
            btn1.Text = "Funciones en Cordoba";
            btn1.UseVisualStyleBackColor = false;
            // 
            // button1
            // 
            button1.BackColor = Color.FromArgb(211, 230, 242);
            button1.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            button1.ForeColor = Color.FromArgb(65, 80, 89);
            button1.Location = new Point(24, 110);
            button1.Name = "button1";
            button1.Size = new Size(177, 66);
            button1.TabIndex = 2;
            button1.Text = "Funciones en Cordoba";
            button1.UseVisualStyleBackColor = false;
            // 
            // button2
            // 
            button2.BackColor = Color.FromArgb(211, 230, 242);
            button2.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            button2.ForeColor = Color.FromArgb(65, 80, 89);
            button2.Location = new Point(24, 190);
            button2.Name = "button2";
            button2.Size = new Size(177, 66);
            button2.TabIndex = 3;
            button2.Text = "Funciones en Cordoba";
            button2.UseVisualStyleBackColor = false;
            // 
            // button3
            // 
            button3.BackColor = Color.FromArgb(211, 230, 242);
            button3.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            button3.ForeColor = Color.FromArgb(65, 80, 89);
            button3.Location = new Point(24, 270);
            button3.Name = "button3";
            button3.Size = new Size(177, 66);
            button3.TabIndex = 4;
            button3.Text = "Funciones en Cordoba";
            button3.UseVisualStyleBackColor = false;
            // 
            // button4
            // 
            button4.BackColor = Color.FromArgb(13, 93, 143);
            button4.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point);
            button4.ForeColor = SystemColors.ButtonFace;
            button4.Location = new Point(24, 350);
            button4.Name = "button4";
            button4.Size = new Size(177, 66);
            button4.TabIndex = 4;
            button4.Text = "Atras";
            button4.UseVisualStyleBackColor = false;
            // 
            // FrmLabo
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(panel1);
            Name = "FrmLabo";
            Text = "FrmLabo";
            panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)bindingSource1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private Button btn1;
        private BindingSource bindingSource1;
        private Button button4;
        private Button button3;
        private Button button2;
        private Button button1;
    }
}