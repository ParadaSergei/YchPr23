using DatabaseYchPractic.DbEntity;
using DatabaseYchPractic.View;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DatabaseYchPractic.ViewModel
{
    public class AutorizViewModel : BaseViewModel
    {
        private string _buttonDescription = "Войти";
        public User _user;
        private string _login;
        private string _password;

        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public string ButtonDes
        {
            get => _buttonDescription;
            set
            {
                _buttonDescription = value;
                OnPropertyChanged(nameof(ButtonDes));
            }
        }
        public async Task<bool> Authorization(string login, string password)
        {
            try
            {
                var result = await DbStorage.Db.User.FirstOrDefaultAsync(user => user.Login == login && user.Password == password);
                _user = result;
                if (result != null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message, "Исключения!", MessageBoxButton.OK, MessageBoxImage.Stop);
                return false;
            }
        }

        public async void AuthorInApp()
        {
            ButtonDes = "Подождите";

            if (await Authorization(Login, Password))
            {
                var infoWindow = new WindowTableInform();
                infoWindow.Show();

                foreach (var item in App.Current.Windows)
                {
                    if (item is MainWindow)
                    {
                        (item as Window)?.Hide();
                    }
                }
                ButtonDes = "Подождите";
                return;
            }
            MessageBox.Show("Неверный логин или пароль", "Авторизация!", MessageBoxButton.OK, MessageBoxImage.Error);
            ButtonDes = "Войти";
        }
    }
}
