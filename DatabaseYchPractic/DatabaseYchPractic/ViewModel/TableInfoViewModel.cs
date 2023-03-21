using DatabaseYchPractic.DbEntity;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseYchPractic.ViewModel
{
    public class TableInfoViewModel : BaseViewModel
    {
        private ObservableCollection<Item> _items;

        public TableInfoViewModel()
        {
            Items = new ObservableCollection<Item>();
            LoadData();
        }
        public ObservableCollection<Item> Items
        {
            get => _items;
            set 
            {
                _items = value;
                OnPropertyChanged(nameof(Item));
            }
        }

        public void LoadData()
        {
            var result = DbStorage.Db.Item.ToList();

            result.ForEach(a => Items.Add(a));
        }

    }
}
