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
    /// <summary>
    /// Логика взаимодействия для VisitorWindows.xaml
    /// </summary>
    public partial class VisitorWindows : Window
    {
        public VisitorWindows()
        {
            InitializeComponent();
            this.DataContext = new TableInfoViewModel();
        }

        private void backAutorized_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
