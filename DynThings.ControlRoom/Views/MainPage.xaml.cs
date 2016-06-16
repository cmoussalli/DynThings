using System;
using DynThings.ControlRoom.ViewModels;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;
using System.Collections.ObjectModel;
using DynThings.ControlRoom.Services.DataService;

namespace DynThings.ControlRoom.Views
{
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            NavigationCacheMode = Windows.UI.Xaml.Navigation.NavigationCacheMode.Enabled;
        }

        private void AppBarButton_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(SettingsPage));
        }

        private void btnTest_Click(object sender, RoutedEventArgs e)
        {
            btnTest.Content = DataService.Test(); 
        }
    }
}
