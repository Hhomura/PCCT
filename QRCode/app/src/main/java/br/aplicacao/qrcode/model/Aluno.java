package br.aplicacao.qrcode.model;

public class Aluno {
   private int id_Aluno, rfid, matricula, numcel;
   private String nome;

   public Aluno(){

   }

   public void setNome(String nome){
        this.nome = nome;
   }

   public String getNome(){
        return nome;
   }

   public void setId_Aluno(int id_Aluno){
        this.id_Aluno = id_Aluno;
   }

   public int getId_Aluno(){
        return id_Aluno;
   }

   public void setRfid(int rfid){
        this.rfid = rfid;
   }

   public int getRfid(){
        return rfid;
   }

   public void setMatricula(int matricula){
        this.matricula = matricula;
   }

   public int getMatricula(){
        return matricula;
   }

   public void setNumCel(int numcel){
        this.numcel = numcel;
   }

   public int getNumCel(){
        return numcel;
   }


}