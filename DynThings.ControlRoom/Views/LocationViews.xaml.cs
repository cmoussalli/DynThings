using DynThings.ControlRoom.ViewModels;
using Windows.UI.Xaml.Navigation;
using Windows.UI.Xaml.Controls;

namespace DynThings.ControlRoom.Views
{
    public sealed partial class LocationViews : Page
    {
        public LocationViews()
        {
            InitializeComponent();
            NavigationCacheMode = NavigationCacheMode.Enabled;
        }

        public void Test()
        {
            btnMyButton.Content = "123";
        }

        private void btnMyButton_Click(object sender, Windows.UI.Xaml.RoutedEventArgs e)
        {
            Test();
        }
    }
}

