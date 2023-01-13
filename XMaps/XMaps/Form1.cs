using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace XMaps
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            webBrowser1.ScriptErrorsSuppressed = true;
            webBrowser1.Navigate("https://google.com/maps");
        }


        private void button1_Click(object sender, EventArgs e)
        {
            string street = label1.Text;
            string city = label2.Text;
            string country = label3.Text;
            string postcode = label4.Text;
            string[] addressInfo = { 
                street,
                city,
                country,
                postcode
            };
            string address = ("https://maps.google.com/maps?q=");
            for (int counter = 0; counter < addressInfo.Length; counter++)
            {
                    address += addressInfo[counter] + "+";
            }
            if (address != string.Empty)
            {
                webBrowser1.Navigate($"https://maps.google.com/maps?q={address}");
            } else
            {
                webBrowser1.Navigate("https://maps.google.com/maps?q=Russia");
            }
        }
    }
}
