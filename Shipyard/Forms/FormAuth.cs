using System;
using System.Windows.Forms;
using Shipyard.Models;

namespace Shipyard.Forms
{
    public partial class FormAuth : Form
    {
        public ModelDatabase Database { get; set; }

        public User User { get; set; }

        private int _failcount = 2;

        public FormAuth()
        {
            InitializeComponent();
        }

        private void TryLogin(object sender, EventArgs e)
        {
            var user = Database.Users.Find(textBoxLogin.Text);

            if(_failcount == 0)
            {
                _failcount = 2;


                textBoxLogin.Enabled = false;
                textBoxPassword.Enabled = false;
                buttonLogin.Enabled = false;
                buttonRegister.Enabled = false;
                buttonExit.Enabled = false;


                MessageBox.Show($"Вы неверно ввели логин или пароль 3 раза!\nСистема заблокирована на {timer.Interval/1000} секунд!");

                timer.Enabled = true;

                return;
            }

            if(user == null || user.Password != textBoxPassword.Text)
            {
                _failcount -= 1;
                MessageBox.Show($"Вы ввели неверный логин или пароль.\nПожалуйста проверьте ещё раз введенные данные!\nОсталось попыток: {_failcount + 1}");
                return;
            }

            User = user;
            DialogResult = DialogResult.OK;
        }

        private void ExitApplication(object sender, EventArgs e)
        {
            User = null;
            DialogResult = DialogResult.Cancel;
        }

        private void TimerTick(object sender, EventArgs e)
        {
            textBoxLogin.Enabled = true;
            textBoxPassword.Enabled = true;
            buttonLogin.Enabled = true;
            buttonRegister.Enabled = true;
            buttonExit.Enabled = true;
            timer.Enabled = false;
            timer.Interval += 20000;
        }

        private void UserRegister(object sender, EventArgs e)
        {
            var form = new FormRegister
            {
                Database = this.Database
            };

            DialogResult dialogResult = form.ShowDialog();
        }
    }
}
