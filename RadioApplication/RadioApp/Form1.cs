using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Media;
using System.Windows.Forms;
using WMPLib;
using NAudio.Wave;
using System.IO;

namespace RadioApp
{
    public partial class Form1 : Form
    {
        private WaveFileWriter RecordedAudioWriter = null;
        private WasapiLoopbackCapture CaptureInstance = null;
        public Form1()
        {
            //TopMost = true;
            InitializeComponent();
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            comboBox1.SelectedIndex = 0;
            axWindowsMediaPlayer1.settings.volume = 50;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            SoundPlayer soundPlayer = new SoundPlayer("Hello.wav");
            soundPlayer.Play();
            MessageBox.Show("Добро пожаловать!");
        }

        readonly string[] linksOnStations = { "https://rusradio.hostingradio.ru/rusradio96.aacp",
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
        private int GetIndexOfSelectedItemInComboBox()
        {
            return comboBox1.FindStringExact(comboBox1.Text);
        }

        void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string currentStation = comboBox1.SelectedItem.ToString();
        }

        private string GetCurrentStation()
        {
            return comboBox1.Text;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            axWindowsMediaPlayer1.settings.volume += 10;
        }
        
        private void pictureBox3_Click(object sender, EventArgs e)
        {
            axWindowsMediaPlayer1.settings.volume -= 10;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            progressBar1.Value = 0;
            int currentIndexOfStation = GetIndexOfSelectedItemInComboBox();
            string linkOnCurrentStation;
            if (currentIndexOfStation < 0)
            {
                MessageBox.Show("Выберите радиостанцию!");
            }
            else
            {
                var timer = new System.Windows.Forms.Timer();
                timer.Interval = 100;
                timer.Tick += (s, a) =>
                {
                    progressBar1.Value += 5;
                    if (progressBar1.Value == progressBar1.Maximum)
                    {
                        timer.Stop();
                        progressBar1.Value = 0;
                    }
                };
                timer.Start();
                linkOnCurrentStation = linksOnStations[currentIndexOfStation];
                axWindowsMediaPlayer1.URL = linkOnCurrentStation;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            int volumeLevel = axWindowsMediaPlayer1.settings.volume;
            MessageBox.Show($"Текущий уровень громкости: {volumeLevel}");
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            axWindowsMediaPlayer1.settings.volume = 0;
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            //char[] symbArr = {'.', ':', ' ', '/', '\''};
            string currentDate = DateTime.Now.ToString("ddhhmmss");
            string filename = $"{currentDate}record.wav";
            string path = Path.Combine(Environment.CurrentDirectory, filename);
            this.CaptureInstance = new WasapiLoopbackCapture();
            this.RecordedAudioWriter = new WaveFileWriter(path, CaptureInstance.WaveFormat);
            this.CaptureInstance.DataAvailable += (s, a) =>
            {
                this.RecordedAudioWriter.Write(a.Buffer, 0, a.BytesRecorded);
            };
            this.CaptureInstance.RecordingStopped += (s, a) =>
            {
                this.RecordedAudioWriter.Dispose();
                this.RecordedAudioWriter = null;
                CaptureInstance.Dispose();
            };
            this.pictureBox5.Enabled = false;
            this.pictureBox6.Enabled = true;
            this.CaptureInstance.StartRecording();
            MessageBox.Show("Запись звука включена. Файл будет сохранён в корневой директории программы");
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            this.CaptureInstance.StopRecording();
            this.pictureBox5.Enabled = true;
            this.pictureBox6.Enabled = false;
            MessageBox.Show("Запись остановлена");
        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.Cancel)
            {
                return;
            } else
            {
                axWindowsMediaPlayer1.URL = $"{openFileDialog1.FileName}";
            }
        }
    }
}
