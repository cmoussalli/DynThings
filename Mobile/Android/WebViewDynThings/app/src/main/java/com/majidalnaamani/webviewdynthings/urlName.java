package com.majidalnaamani.webviewdynthings;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class urlName extends AppCompatActivity {

    EditText etUrl;
    Button btnSubmit;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_url_name);

        etUrl = (EditText) findViewById(R.id.etUrl);
        btnSubmit = (Button) findViewById(R.id.btnSubmit);

        btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                /*
                    Validate ThingsUrl if "Test OK"
                 */


                Intent i = new Intent(urlName.this, MainActivity.class);
                Bundle args = new Bundle();
                args.putString("ThingsURL", etUrl.getText().toString());
                args.putBoolean("Login", true);
                i.putExtras(args);
                startActivity(i);
                finish();
            }
        });
    }
}
