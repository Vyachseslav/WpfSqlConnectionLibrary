using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows;

namespace WpfSqlConnectionLibrary.Windows
{
    /// <summary>
    /// Логика взаимодействия для SqlConnectionWindow.xaml
    /// </summary>
    public partial class SqlConnectionWindow : Window, INotifyPropertyChanged
    {
        private Visibility _visibleLoadingRing = Visibility.Visible;
        private List<string> _serverList;
        private List<string> _databaseList;

        /// <summary>
        /// Строка подключения к серверу.
        /// </summary>
        public string SqlConnectionString { get; set; }

        /// <summary>
        /// Видимость загрущочного кольца.
        /// </summary>
        public Visibility VisibleLoadingRing
        {
            get { return _visibleLoadingRing; }
            set { _visibleLoadingRing = value; OnPropertyChanged("VisibleLoadingRing"); }
        }

        /// <summary>
        /// Список доступных серверов.
        /// </summary>
        public List<string> ServerList
        {
            get { return _serverList; }
            set { _serverList = value; OnPropertyChanged("ServerList"); }
        }

        /// <summary>
        /// Список доступных баз данных.
        /// </summary>
        public List<string> DatabaseList
        {
            get { return _databaseList; }
            set { _databaseList = value; OnPropertyChanged("DatabaseList"); }
        }

        public SqlConnectionWindow()
        {
            InitializeComponent();

            ServerList = new List<string>();
            DatabaseList = new List<string>();

            LoadServersAsync();

            DataContext = this;
        }

        private void ComboDatabaseName_DropDownOpened(object sender, EventArgs e)
        {
            LoadDatabases();            
        }

        private void BtnApply_Click(object sender, RoutedEventArgs e)
        {
            switch (checkIntSec.IsChecked)
            {
                case true:
                    SqlConnectionString = String.Format(@"Data Source={0};Initial Catalog={1};Integrated Security=True",
                        comboServerName.Text,
                        comboDatabaseName.Text);
                    break;
                case false:
                    SqlConnectionString = String.Format(@"Data Source={0};Initial Catalog={1};User Id = {2}; Password = {3};",
                        comboServerName.Text,
                        comboDatabaseName.Text,
                        txtUserName.Text,
                        txtPassword.Password);
                    break;
            }
            this.DialogResult = true;
        }

        private void LoadServers()
        {
            VisibleLoadingRing = Visibility.Visible;

            DataTable dt = System.Data.Sql.SqlDataSourceEnumerator.Instance.GetDataSources();
            comboServerName.Items.Clear();

            foreach (DataRow dr in dt.Rows)
            {
                comboServerName.Items.Add(string.Concat(dr["ServerName"], "\\", dr["InstanceName"]));
            }

            VisibleLoadingRing = Visibility.Hidden;
        }

        /// <summary>
        /// Загрузить список доступных серверов.
        /// </summary>
        private void LoadServersAsync()
        {
            Task.Factory.StartNew(() =>
            {
                VisibleLoadingRing = Visibility.Visible;

                DataTable dt = System.Data.Sql.SqlDataSourceEnumerator.Instance.GetDataSources();
                ServerList.Clear();

                foreach (DataRow dr in dt.Rows)
                {
                    ServerList.Add(string.Concat(dr["ServerName"], "\\", dr["InstanceName"]));
                }

                VisibleLoadingRing = Visibility.Hidden;
            });
        }

        /// <summary>
        /// Загрузить список базы данных для выбранного сервера.
        /// </summary>
        private void LoadDatabases()
        {
            comboDatabaseName.Items.Clear();

            string connectionString = String.Format(@"Data Source={0};Initial Catalog=master;Integrated Security=True",
                comboServerName.Text);

            string request = String.Format("EXEC sp_databases");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(request, connection);
                    DataTable ds = new DataTable();
                    adapter.Fill(ds);

                    foreach (DataRow dr in ds.Rows)
                    {
                        comboDatabaseName.Items.Add(string.Concat(dr["DATABASE_NAME"]));
                    }
                }
                catch (Exception ex)
                {
                    comboDatabaseName.Items.Clear();
                    MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void LoadDataBasesAsync()
        {
            Task.Factory.StartNew(() =>
            {
                //VisibleLoadingRing = Visibility.Visible;

                DatabaseList.Clear();
                string server = String.Empty;
                comboServerName.Dispatcher.Invoke(new Action(() => server = comboServerName.Text));

                string connectionString = String.Format(@"Data Source={0};Initial Catalog=master;Integrated Security=True",
                    server);
                string request = String.Format("EXEC sp_databases");
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(request, connection);
                        DataTable ds = new DataTable();
                        adapter.Fill(ds);

                        foreach (DataRow dr in ds.Rows)
                        {
                            DatabaseList.Add(string.Concat(dr["DATABASE_NAME"]));
                        }
                    }
                    catch (Exception ex)
                    {
                        DatabaseList.Clear();
                        MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }

                //VisibleLoadingRing = Visibility.Hidden;
            });
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged(string name = "")
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
