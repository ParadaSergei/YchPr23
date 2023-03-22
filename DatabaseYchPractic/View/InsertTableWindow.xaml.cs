using DatabaseYchPractic.DbEntity;
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
    /// Логика взаимодействия для InsertTableWindow.xaml
    /// </summary>
    public partial class InsertTableWindow : Window
    {
        private Item _item;
        public InsertTableWindow(Item item)
        {
            InitializeComponent();
          
         /* foreach(var items in App.Current.Windows)
            {
                if(items is Window)
                {
                    this.Owner = items as Window;
                }
            }*/
            if (item is null)
            {
                _item = item = new Item();
            }

            this.DataContext = _item;
        }

        public void btnSave_Click(object sender, RoutedEventArgs e)
        {
           using(var db = new CommunSalonDB())
           {
                try
                {
                    var validateEntity = ValidateEntity();
                    if (validateEntity.Length > 0)
                    {
                        MessageBox.Show(validateEntity.ToString(),"Информация",MessageBoxButton.OK,MessageBoxImage.Error);
                        return;
                    }
                    db.Item.Add(_item);
                    db.SaveChanges();

                    MessageBox.Show("Данные успешно внесены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);

                    (Owner as WindowTableInform)?.RefrashDataTable();
                    Owner?.Focus();
                    this.Close();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, "Информация", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            }
        }
        private StringBuilder ValidateEntity()
        {
            var error = new StringBuilder();
            if(_item!= null)
            {
                if (string.IsNullOrEmpty(_item.Name))
                {
                    error.AppendLine("Поле названия пустое");
                }
                if (_item.Price <=0)
                {
                    error.AppendLine("Поле пустое");
                }
                if (_item.Amount <= 0)
                {
                    error.AppendLine("Цена неправильное или не введено");
                }
            }
            return error;
        }
    }
}
