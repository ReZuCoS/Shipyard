using System;
using System.Linq;
using System.Windows.Forms;
using Shipyard.Models;

namespace Shipyard.Forms
{
    public partial class FormMain : Form
    {
        private readonly ModelDatabase _database = new ModelDatabase();

        public User User { get; set; }

        public FormMain()
        {
            InitializeComponent();
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            var form = new FormAuth
            {
                Database = _database
            };

            DialogResult dialogResult = form.ShowDialog();

            if(dialogResult == DialogResult.OK)
            {
                User = form.User;
            }
            else
            {
                Application.Exit();
            }
        }

        private void SelectedTableChanged(object sender, EventArgs e)
        {
            switch (comboBoxTableSelect.SelectedItem)
            {
                case "Аксессуары":
                    dataGridViewMain.DataSource = _database.Accessories.ToList();
                    break;
                case "Лодки":
                    dataGridViewMain.DataSource = _database.Boats.ToList();
                    break;
                case "Контракты":
                    dataGridViewMain.DataSource = _database.Contracts.ToList();
                    break;
                case "Покупатели":
                    dataGridViewMain.DataSource = _database.Customers.ToList();
                    break;
                case "Счета":
                    dataGridViewMain.DataSource = _database.Invoices.ToList();
                    break;
                case "Заказы":
                    dataGridViewMain.DataSource = _database.Orders.ToList();
                    break;
                case "Партнёры":
                    dataGridViewMain.DataSource = _database.Partners.ToList();
                    break;
                case "Продавцы":
                    dataGridViewMain.DataSource = _database.SalesPersons.ToList();
                    break;
                default:
                    ArgumentOutOfRangeException exception = new ArgumentOutOfRangeException();
                    MessageBox.Show(exception.Message);
                    break;
            }
        }

        private void CloseApplication(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
