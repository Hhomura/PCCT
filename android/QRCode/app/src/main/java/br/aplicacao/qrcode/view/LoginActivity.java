package br.aplicacao.qrcode.view;

import android.app.ActivityManager;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import br.aplicacao.qrcode.R;
import br.aplicacao.qrcode.controller.RefeicaoController;
import br.aplicacao.qrcode.model.DAO.AlunoDAO;
import br.aplicacao.qrcode.model.DAO.RefeicaoDAO;

public class LoginActivity extends AppCompatActivity {
    EditText editRfid;
    Button btnOk;
    String rfid;
    boolean setOk;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        init();

        btnOk.setOnClickListener(v -> {
            rfid = editRfid.getText().toString().trim();
            Log.d("RF", rfid);
            
        });


    }

    private void init() {
        editRfid = findViewById(R.id.edtRfid);
        btnOk = findViewById(R.id.materialButton);
    }


}
