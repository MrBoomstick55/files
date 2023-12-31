﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CryptoAlertSystem
{
    public partial class CryptoAlertSystem : Form
    {

        public CryptoAlertSystem()
        {
            InitializeComponent();
            dashboard1.Hide();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl3.Hide();

        }

        private void Help_Click(object sender, EventArgs e)
        {
            Help.BackColor = Color.FromArgb(1, 204, 102, 153); 
            dashboard1.Hide();
            helpControl1.Show();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl3.Hide();
        }

        private void DashboardButton_Click(object sender, EventArgs e)
        {
            DashboardButton.BackColor = Color.FromArgb(1, 204, 102, 153);
            helpControl1.Hide();
            dashboard1.Show();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl3.Hide();
        }

        private void Crypto1_Click(object sender, EventArgs e)
        {
            Crypto1.BackColor = Color.FromArgb(1, 204, 102, 153);
            helpControl1.Hide();
            dashboard1.Hide();
            cryptoCurrencyControl3.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl1.Show();
            
        }

        private void Crypto2_Click(object sender, EventArgs e)
        {
            Crypto2.BackColor = Color.FromArgb(1, 204, 102, 153);
            helpControl1.Hide();
            dashboard1.Hide();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl3.Hide();
            cryptoCurrencyControl2.Show();
        }

        private void Crypto3_Click(object sender, EventArgs e)
        {
            Crypto3.BackColor = Color.FromArgb(1, 204, 102, 153);
            helpControl1.Hide();
            dashboard1.Hide();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl3.Show();
        }

        private void Notifications_Click(object sender, EventArgs e)
        {
            Notifications.BackColor = Color.FromArgb(1, 204, 102, 153);
            helpControl1.Hide();
            dashboard1.Hide();
            cryptoCurrencyControl1.Hide();
            cryptoCurrencyControl2.Hide();
            cryptoCurrencyControl3.Hide();
        }
    }
}
