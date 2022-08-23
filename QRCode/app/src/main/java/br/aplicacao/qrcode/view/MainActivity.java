package br.aplicacao.qrcode.view;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import br.aplicacao.qrcode.R;

public class MainActivity extends AppCompatActivity {

    Button btnScan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnScan = findViewById(R.id.btnScan);

        btnScan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Initializit intent Integrator
                IntentIntegrator integrator = new IntentIntegrator(
                        MainActivity.this
                );

                //Set prompt Text
                integrator.setPrompt("Direcione bem sua Câmera");
                //Set Beep
                integrator.setBeepEnabled(true);
                //Locked orientation
                integrator.setOrientationLocked(true);
                //set capture activity
                integrator.setCaptureActivity(Capture.class);
                //initiate scan
                integrator.initiateScan();

            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        //initialize intent result
        IntentResult result = IntentIntegrator.parseActivityResult(
                requestCode, resultCode, data
        );

        //check condition
        if(result.getContents() != null){
            //when result is not null
            //initialize alert dialog ou otra coisa
            AlertDialog.Builder builder = new AlertDialog.Builder((
                    MainActivity.this
                    ));
            //Set title
            builder.setTitle("Result");
            builder.setMessage(result.getContents());

            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            });
            //show
            builder.show();
        }else{
            // when result is null
            Toast.makeText(getApplicationContext(), "Nao escaneou nada", Toast.LENGTH_SHORT).show();
        }
    }
}