package com.majidalnaamani.DynThings;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    private WebView webView;
    private String ThingsURL;
    private JsHandler _jsHandler;
    @SuppressLint("JavascriptInterface")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);




        //ThingsURL = getIntent().getExtras().getString("ThingsURL");
ThingsURL = "http://demo.dynthings.com/";

        if(webView == null) {
            //ThingsURL = "http://192.168.31.220/dynthings.webportal/";
            webView = ( WebView) findViewById(R.id.webView1);
            //_jsHandler = new JsHandler(this, webView);
            webView.getSettings().setJavaScriptEnabled(true);
            //webView.addJavascriptInterface(_jsHandler, "JsHandler");
            webView.addJavascriptInterface(new WebAppInterface(this), "Android");

            webView.setWebViewClient(new WebViewClient() {
                @Override
                public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    view.loadUrl(url);
                    return false;
                }
                @Override
                public void onPageFinished(WebView view, String url)
                {
                    super.onPageFinished(view,url);
                    webView.loadUrl("javascript:(function() { " +
                            "AndroidMode();" +
                            "})()");
                }
            });
            webView.loadUrl(ThingsURL );
        }

        if (savedInstanceState == null) {
            webView.loadUrl(ThingsURL);
        }
        else {
            webView.restoreState(savedInstanceState);
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START) || webView.canGoBack()) {
            if(drawer.isDrawerOpen(GravityCompat.START))
                drawer.closeDrawer(GravityCompat.START);

            if(webView.canGoBack())
                webView.goBack();

        } else {
            super.onBackPressed();
        }
    }
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        webView.saveState(outState);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        return super.onOptionsItemSelected(item);
    }

    @SuppressLint("JavascriptInterface")
    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_dashboard) {
            //ThingsURL = "http://192.168.31.220/dynthings.webportal/";
            webView = ( WebView) findViewById(R.id.webView1);
            //_jsHandler = new JsHandler(this, webView);
            webView.getSettings().setJavaScriptEnabled(true);
            //webView.addJavascriptInterface(_jsHandler, "JsHandler");
            webView.addJavascriptInterface(new WebAppInterface(this), "Android");

            webView.setWebViewClient(new WebViewClient() {
                @Override
                public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    view.loadUrl(url);
                    return false;
                }
                @Override
                public void onPageFinished(WebView view, String url)
                {
                    super.onPageFinished(view,url);
                     webView.loadUrl("javascript:(function() { " +
                     "AndroidMode();" +
                            "})()");
                }
            });
            webView.loadUrl(ThingsURL );

        } else if (id == R.id.nav_views) {
            webView = (WebView) findViewById(R.id.webView1);
            webView.getSettings().setJavaScriptEnabled(true);
            webView.addJavascriptInterface(new WebAppInterface(this), "Android");
            webView.setWebViewClient(new WebViewClient() {
                @Override
                public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    view.loadUrl(url);
                    return false;
                }
                @Override
                public void onPageFinished(WebView view, String url)
                {
                    super.onPageFinished(view,url);
                    webView.loadUrl("javascript:(function() { " +
                            "AndroidMode();" +
                            "})()");
                }
            });
            webView.loadUrl(ThingsURL + "locationViews/");
            //url
        } else if (id == R.id.nav_alerts) {
            webView = (WebView) findViewById(R.id.webView1);
            webView.getSettings().setJavaScriptEnabled(true);
            webView.addJavascriptInterface(new WebAppInterface(this), "Android");
            webView.setWebViewClient(new WebViewClient() {
                @Override
                public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    view.loadUrl(url);
                    return false;
                }
                @Override
                public void onPageFinished(WebView view, String url)
                {
                    super.onPageFinished(view,url);
                    webView.loadUrl("javascript:(function() { " +
                            "AndroidMode();" +
                            "})()");
                }
            });
            webView.loadUrl(ThingsURL + "Alerts/");
            //url
        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}
