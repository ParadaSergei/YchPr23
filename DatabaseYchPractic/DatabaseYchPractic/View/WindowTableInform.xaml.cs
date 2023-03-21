﻿using DatabaseYchPractic.DbEntity;
using DatabaseYchPractic.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DatabaseYchPractic.View
{
    public partial class WindowTableInform : Window
    {
        private User _user;
        public WindowTableInform()
        {
            InitializeComponent();
            this.DataContext = new TableInfoViewModel();
        }

        private void infoUser_Click(object sender, RoutedEventArgs e)
        {
           MainInform mainInform = new MainInform(_user);
           mainInform.Show();
        }
    }
}
