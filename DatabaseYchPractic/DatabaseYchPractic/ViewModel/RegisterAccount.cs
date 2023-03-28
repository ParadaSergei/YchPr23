using DatabaseYchPractic.DbEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseYchPractic.ViewModel
{
    public class RegisterAccount:BaseViewModel
    {
        public User _user;
        private string _AccoutLogin;
        private string _AccoutPassword;
        private string _AccoutSurname;
        private string _AccoutName;
        private string _AccoutPatronymic;

        public string LoginAccount

        {
            get => _AccoutLogin;
            set
            {
                _AccoutLogin = value;
                OnPropertyChanged(nameof(LoginAccount));
            }
        }
        public string PasswordAccount

        {
            get => _AccoutPassword;
            set
            {
                _AccoutPassword = value;
                OnPropertyChanged(nameof(PasswordAccount));
            }
        }
        public string SurnameAccount

        {
            get => _AccoutSurname;
            set
            {
                _AccoutSurname = value;
                OnPropertyChanged(nameof(SurnameAccount));
            }
        }

        public string NameAccount

        {
            get => _AccoutName;
            set
            {
                _AccoutName = value;
                OnPropertyChanged(nameof(NameAccount));
            }
        }
        public string PatronymicAccount

        {
            get => _AccoutPatronymic;
            set
            {
                _AccoutPatronymic = value;
                OnPropertyChanged(nameof(PatronymicAccount));
            }
        }

        public void RegisterAccounts(string login,string password , string surname , string name, string patronymic)
        {

        }
    }
}
