package br.aplicacao.qrcode.model;

import java.sql.Date;

public class Refeicao {
    private int id_Refeicao, fk_Aluno, status;
    private String turno;
    private Date data;
    
    public Refeicao(){

    }

    public void setTurno(String turno){
        this.turno = turno;
    }

    public String getTurno(){
        return turno;
    }

    public void setId_Refeicao(int id_Refeicao){
        this.id_Refeicao = id_Refeicao;
    }
    
    public int getId_Refeicao(){
        return id_Refeicao;
    }

    public void setFk_Aluno(int fk_Aluno){
        this.fk_Aluno = fk_Aluno;
    }

    public int getFk_Aluno(){
        return fk_Aluno;
    }

    public void setStatus(int status){
        this.status = status;
    }

    public int getStatus(){
        return status;
    }

    public void setData(Date data){
        this.data = data;
    }
    public Date getData(){
        return data;
    }
}
