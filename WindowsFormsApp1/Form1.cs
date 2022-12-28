using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            webBrowser1.Url = new Uri("https://google.com");
            button1.Click += button1_Click;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            webBrowser1.Navigate(textBox1.Text);
        }
    }
}
