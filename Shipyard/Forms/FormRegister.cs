using System;
using System.Linq;
using System.Windows.Forms;
using Shipyard.Models;

namespace Shipyard.Forms
{
    public partial class FormRegister : Form
    {
        public ModelDatabase Database { get; set; }

        public FormRegister()
        {
            InitializeComponent();
        }

        private void Register(object sender, EventArgs e)
        {
            if(textBoxName.Text == "" ||
                textBoxLogin.Text == "" ||
                textBoxPass.Text == "" ||
                textBoxConfirmPass.Text == "" ||
                comboBoxType.SelectedIndex == -1)
            {
                MessageBox.Show("Заполните все поля для продолжения!");
                return;
            }

            if (textBoxPass.Text != textBoxConfirmPass.Text)
            {
                MessageBox.Show("Введённые пароли не совпадают!");
                return;
            }
            
            if (Database.Users.Find(textBoxLogin.Text) != null)
            {
                MessageBox.Show("Пользователь с таким логином уже существует!");
                return;
            }

            var user = new User
            {
                Name = textBoxName.Text,
                Login = textBoxLogin.Text,
                Password = textBoxPass.Text,
                UserType = comboBoxType.SelectedIndex + 1
            };

            Database.Users.Add(user);

            try
            {
                Database.SaveChanges();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            DialogResult = DialogResult.OK;
        }

        private void CancelRegistration(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void FormRegister_Load(object sender, EventArgs e)
        {
            userTypeBindingSource.DataSource = Database.UserTypes.ToList();
        }
    }
}
