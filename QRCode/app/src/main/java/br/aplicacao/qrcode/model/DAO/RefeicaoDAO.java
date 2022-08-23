package br.aplicacao.qrcode.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.aplicacao.qrcode.model.Refeicao;
import br.aplicacao.qrcode.model.util.DBCon;

public class RefeicaoDAO implements DAO<Refeicao> {
    
    @Override
    public boolean insert(Refeicao refeicao){
        Connection con = null;
        PreparedStatement pstmt = null;

        try{
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                "INSERT INTO Refeicao(fk_Aluno, turno, status, data) VALUES (?, ?, ?, ?);");

            pstmt.setInt(1, refeicao.getFk_Aluno());
            pstmt.setString(2, refeicao.getTurno());
            pstmt.setInt(3, refeicao.getStatus());
            pstmt.setDate(4, refeicao.getData());
            
            pstmt.execute();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }

        finally{

            try{
                if(con!=null){
                    con.close();
                }
                if(pstmt!=null){
                    pstmt.close();
                } 
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Refeicao> getAll(){
        List<Refeicao> refeicoes = new ArrayList<>();
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try{
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                "SELECT * FROM Refeicao;");
            rst = pstmt.executeQuery();
            
            while(rst.next()){
                Refeicao refeicao = new Refeicao();

                refeicao.setTurno(rst.getString("turno"));
                refeicao.setStatus(rst.getInt("status"));
                refeicao.setId_Refeicao(rst.getInt("id_Refeicao"));
                refeicao.setFk_Aluno(rst.getInt("fk_Aluno"));
                refeicao.setData(rst.getDate("data"));
                
                refeicoes.add(refeicao);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

        finally{

            try{
                if(rst!=null){
                    rst.close();
                }
                if(pstmt!=null){
                    pstmt.close();
                }
                if(con!=null){
                    con.close();
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        return refeicoes;
    }

    @Override
    public List<Refeicao> getIntercession() {
        
        return null;
    }
}
