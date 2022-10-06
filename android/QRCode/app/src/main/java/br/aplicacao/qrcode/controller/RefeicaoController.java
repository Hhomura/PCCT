package br.aplicacao.qrcode.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import br.aplicacao.qrcode.model.Aluno;
import br.aplicacao.qrcode.model.DAO.DAO;
import br.aplicacao.qrcode.model.Refeicao;

public class RefeicaoController {
    
    private DAO<Aluno> _IDAO;
    private DAO<Refeicao> _IDAOR;
    

    public RefeicaoController(DAO<Aluno> _IDAO, DAO<Refeicao> _IDAOR){
        this._IDAO = _IDAO;
        this._IDAOR = _IDAOR;
    }

    public int compareRfid(int rfid){
        AtomicInteger atomic = new AtomicInteger(-1);
        
        _IDAO.getIntercession().forEach(aluno->{
            if(rfid==aluno.getRfid()){
               atomic.set(aluno.getId_Aluno()); 
            }
        });

        return atomic.get();
    }

    public int validateInSystem(int id_Aluno){
        int retorno = 0;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateLocal = null;
        try {
            dateLocal = sdf.parse(LocalDate.now().toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if(id_Aluno!=-1){
            List<Refeicao> refeicoes = _IDAOR.getAll();
            for (Refeicao refeicao : refeicoes){

                /*System.out.println(refeicao.getData() + " outra data: " + LocalDate.now().toString()
                + "\n" + refeicao.getFk_Aluno() + " Outro: " + id_Aluno);*/

                if(refeicao.getFk_Aluno()==id_Aluno&refeicao.getData().compareTo(dateLocal)==0){
                    return 1;    
                }
                else if(refeicao.getFk_Aluno()==id_Aluno&&refeicao.getData().toString()!=LocalDate.now().toString()){
                    retorno = 2;
                }
            }
        }
       return retorno; 
    }
}
