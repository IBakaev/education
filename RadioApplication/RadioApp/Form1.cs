using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RadioApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            comboBox1.SelectedIndex = 0;
        }


        string[] linksOnStations = { "https://rusradio.hostingradio.ru/rusradio96.aacp",
            "https://icecast-newradio.cdnvideo.ru/newradio3",
            "https://ep128.hostingradio.ru:8030/ep128",
            "https://icecast-vgtrk.cdnvideo.ru/vestifm_mp3_128kbps",
            "https://pub0202.101.ru:8443/stream/reg/mp3/128/region_avto_154",
            "https://dorognoe.hostingradio.ru:8000/dorognoe",
            "https://europaplus.hostingradio.ru:8014/retro320.mp3",
            "https://dfm.hostingradio.ru/dfm96.aacp",
            "https://pub0101.101.ru:8000/stream/air/aac/64/102",
            "https://air2.volna.top/LoveRadio-MSK",
            "https://icecast-piterfm.cdnvideo.ru/piterfm",
            "https://nashe1.hostingradio.ru:80/rock-128.mp3"
        };
        int GetIndexOfSelectedItemInComboBox()
        {
            return comboBox1.FindStringExact(comboBox1.Text);
        }

        void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string currentStation = comboBox1.SelectedItem.ToString();
        }

        string GetCurrentStation()
        {
            return comboBox1.Text;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            int currentIndexOfStation = GetIndexOfSelectedItemInComboBox();
            //string currentStation;
            string linkOnCurrentStation;
            if (currentIndexOfStation < 0)
            {
                MessageBox.Show("Выберите радиостанцию!");
            }
            else
            {
                //currentStation = comboBox1.SelectedItem.ToString();
                linkOnCurrentStation = linksOnStations[currentIndexOfStation];
                axWindowsMediaPlayer1.URL = linkOnCurrentStation;
            }
        }
    }
}
