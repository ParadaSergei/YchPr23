using DatabaseYchPractic.DbEntity;
using DatabaseYchPractic.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
        private Product _product;
        private TableInfoViewModel _tableInfoViewModel;
        public InsertTableWindow(Product product)
        {
            InitializeComponent();

            /* foreach(var items in App.Current.Windows)
               {
                   if(items is Window)
                   {
                       this.Owner = items as Window;
                   }
               }*/
            if (product is null)
            {
                _product = product = new Product();
            }
            else
            {
                _product = product;
            }

            this.DataContext = _product;
        }

        public void btnSaveAccount_Click(object sender, RoutedEventArgs e)
        {
           using(var db = new TradeEntities())
           {
                try
                {
                    var validateEntity = ValidateEntity();
                    if (validateEntity.Length > 0)
                    {
                        MessageBox.Show(validateEntity.ToString(),"Информация",MessageBoxButton.OK,MessageBoxImage.Error);
                        return;
                    }
                    db.Product.AddOrUpdate(_product);
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
            if(_product != null)
            {
                if (string.IsNullOrEmpty(_product.Name))
                {
                    error.AppendLine("Поле названия пустое");
                }
                if (string.IsNullOrEmpty(_product.Description))
                {
                    error.AppendLine("Поле названия пустое");
                }
                if (string.IsNullOrEmpty(_product.Manufacturer))
                {
                    error.AppendLine("Поле Производитель пустое или имеит символы");
                }
                if (_product.Cost <= 0)
                {
                    error.AppendLine("Стоимость не может быть отрицательной или введены символы!");
                }
                if (_product.DiscountAmount <= 0)
                {
                    error.AppendLine("Скидка не может быть отрицательной или введены символы!");
                }
                if (_product.QuantityInStock <= 0)
                {
                    error.AppendLine("Количество не может быть отрицательной или введены символы!");
                }
            }
            return error;
        }

    }
}
