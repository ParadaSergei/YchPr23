using DatabaseYchPractic.DbEntity;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DatabaseYchPractic.ViewModel
{
    public class TableInfoViewModel : BaseViewModel
    {
        private ObservableCollection<Product> _products;

        private Product _product;

        public TableInfoViewModel()
        {
            Products = new ObservableCollection<Product>();
            LoadData();
        }
        public ObservableCollection<Product> Products
        {
            get => _products;
            set
            {
                _products = value;
                OnPropertyChanged(nameof(Products));
            }
        }

        public Product SelectProduct
        {
            get => _product;
            set
            {
                _product = value;
                OnPropertyChanged(nameof(SelectProduct));
            }
        }


        public void LoadData()
        {
            if (_products.Count > 0)
            {
                _products.Clear();
            }

            var result = DbStorage.Db.Product.ToList();

            result.ForEach(a => Products.Add(a));
        }

        public void DeleteData()

        {
            if (!(SelectProduct is null))
            {
                using (var db = new TradeEntities())
                {
                    var result = MessageBox.Show("Вы действительно хотите удалить запись\n" + "Это нельзя будет отменить", "Предупреждения", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                    if (result == MessageBoxResult.Yes)
                    {
                        try
                        {
                            var entityForDelete = db.Product.Where(user => user.ID == SelectProduct.ID).FirstOrDefault();
                            db.Product.Remove(entityForDelete);
                            db.SaveChanges();
                            LoadData();

                            MessageBox.Show("Вы успешно удалили объект", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                        }

                    }
                }
            }
        }
    }
}
