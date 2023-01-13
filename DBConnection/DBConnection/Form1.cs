using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DBConnection
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string connectionString;
            SqlConnection connection;
            connectionString = @"Data source=home-pc\SQLEXPRESS;Initial Catalog=TestDB;User ID=TestUser;Password=TestPassword";
            connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command;
            SqlDataReader dataReader;
            String sql, output = "";
            sql = textBox1.Text;
            command = new SqlCommand(sql, connection);
            dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
                output += dataReader.GetValue(0) + " - " + dataReader.GetValue(1) + " | "; 
            }
            textBox2.Text = "";
            textBox2.Text = output; 
            dataReader.Close();
            command.Dispose();
            connection.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand command;
            SqlConnection connection;
            string connectionString = @"Data source=home-pc\SQLEXPRESS;Initial Catalog=TestDB;User ID=TestUser;Password=TestPassword";
            connection = new SqlConnection(connectionString);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = "";
            sql = textBox1.Text;
            command = new SqlCommand(sql, connection);
            adapter.InsertCommand = new SqlCommand(sql, connection);
            adapter.InsertCommand.ExecuteNonQuery();
            textBox2.Text = "";
            textBox2.Text = "An entry has been added";
            command.Dispose();
            connection.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlCommand command;
            SqlConnection connection;
            string connectionString = @"Data source=home-pc\SQLEXPRESS;Initial Catalog=TestDB;User ID=TestUser;Password=TestPassword";
            connection = new SqlConnection(connectionString);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = "";
            sql = textBox1.Text;
            command = new SqlCommand(sql, connection);
            adapter.UpdateCommand = new SqlCommand(sql, connection);
            adapter.UpdateCommand.ExecuteNonQuery();
            textBox2.Text = "";
            textBox2.Text = "An entry has been updated";
            command.Dispose();
            connection.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand command;
            SqlConnection connection;
            string connectionString = @"Data source=home-pc\SQLEXPRESS;Initial Catalog=TestDB;User ID=TestUser;Password=TestPassword";
            connection = new SqlConnection(connectionString);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = "";
            sql = textBox1.Text;
            command = new SqlCommand(sql, connection);
            adapter.DeleteCommand = new SqlCommand(sql, connection);
            adapter.DeleteCommand.ExecuteNonQuery();
            textBox2.Text = "";
            textBox2.Text = "An entry has been deleted";
            command.Dispose();
            connection.Close();
        }
    }
}
