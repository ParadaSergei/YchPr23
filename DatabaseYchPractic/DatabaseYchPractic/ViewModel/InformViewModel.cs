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

        private string _firstname;
        private string _lastname;
        private int _age;

        public string Firstname
        {
            get => _firstname;
            set
            {
                _firstname = value;
                OnPropertyChanged(nameof(Firstname));
            }
        }
        public string Lastname
        {
            get => _lastname;
            set
            {
                _lastname = value;
                OnPropertyChanged(nameof(Lastname));
            }
        }
        public int Age
        {
            get => _age;
            set
            {
                _age = value;
                OnPropertyChanged(nameof(Age));
            }
        }

        public InformViewModel(User user)
        {
            Firstname = user.UserInform.FirstName;
            Lastname = user.UserInform.LastName;
            Age = user.UserInform.Age;
        }
    }
}
