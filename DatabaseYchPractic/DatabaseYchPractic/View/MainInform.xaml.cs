using DatabaseYchPractic.DbEntity;
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
    /// Логика взаимодействия для MainInform.xaml
    /// </summary>
    public partial class MainInform : Window
    {
        public MainInform(User user)
        {
            InitializeComponent();
            DataContext = new InformViewModel(user);
        }

       
    }
}
