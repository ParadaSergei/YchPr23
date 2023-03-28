using DatabaseYchPractic.DbEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseYchPractic.ViewModel
{
    public class InformViewModel : BaseViewModel
    {
        private User _user;

        private string _surname;
        private string _name;
        private string _patronymic;

        public string Surname
        {
            get => _surname;
            set
            {
                _surname = value;
                OnPropertyChanged(nameof(Surname));
            }
        }
        public string Name
        {
            get => _name;
            set
            {
                _name = value;
                OnPropertyChanged(nameof(Name));
            }
        }
        public string Patronymic
        {
            get => _patronymic;
            set
            {
                _patronymic = value;
                OnPropertyChanged(nameof(Patronymic));
            }
        }

        public InformViewModel(User user)
        {
            Surname = user.UserData.Surname;
            Name = user.UserData.Name;
            Patronymic = user.UserData.Patronymic;
        }
    }
}
