package br.aplicacao.qrcode.model;

import java.sql.Date;

public class Dia {
    private int id_DiaLetivo;
    private Date data;
    private String feriado;

    public Dia(){

    }

    public void setId_Dia(int id_Dia){
        this.id_DiaLetivo = id_Dia;
    }

    public int getId_Dia(){
        return id_DiaLetivo;
    }

    public void setData(Date data){
        this.data = data;
    }

    public Date getDate(){
        return data;
    }

    public void setFeriado(String feriado){
        this.feriado = feriado;
    }

    public String getFeriado(){
        return feriado;
    }

}
