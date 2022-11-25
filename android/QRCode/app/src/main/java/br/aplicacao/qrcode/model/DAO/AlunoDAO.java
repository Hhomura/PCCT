package br.aplicacao.qrcode.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.aplicacao.qrcode.model.Aluno;
import br.aplicacao.qrcode.model.util.DBCon;


public class AlunoDAO implements DAO<Aluno> {

    public boolean insert(Aluno aluno) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {

            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                    "INSERT INTO Aluno(nome, matricula, rfid, numcel) VALUES (?, ?, ?, ?)");

            pstmt.setString(1, aluno.getNome());
            pstmt.setInt(2, aluno.getMatricula());
            pstmt.setInt(3, aluno.getRfid());
            pstmt.setInt(4, aluno.getNumCel());

            pstmt.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Aluno> getAll() {
        List<Aluno> alunos = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                    "SELECT * FROM Aluno;");
            rst = pstmt.executeQuery();
            while (rst.next()) {
                Aluno aluno = new Aluno();

                aluno.setId_Aluno(rst.getInt("id_Aluno"));
                aluno.setMatricula(rst.getInt("matricula"));
                aluno.setNome(rst.getString("nome"));
                aluno.setRfid(rst.getInt("rfid"));
                aluno.setNumCel(rst.getInt("numcel"));

                alunos.add(aluno); 

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (rst != null) {
                    rst.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return alunos;
    }

    //AlunosINTERCESSÃORefeicao
    @Override
    public List<Aluno> getIntercession(){
        List<Aluno> alunos = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        
        try{
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                "SELECT Aluno.id_Aluno, Aluno.nome, Aluno.matricula, Aluno.rfid, Aluno.numcel "+
                "FROM Aluno, Refeicao " +
                "WHERE Aluno.id_Aluno = Refeicao.fk_Aluno");
            rst = pstmt.executeQuery();

            while(rst.next()){
                Aluno aluno = new Aluno();

                aluno.setId_Aluno(rst.getInt("id_Aluno"));
                aluno.setMatricula(rst.getInt("matricula"));
                aluno.setNome(rst.getString("nome"));
                aluno.setRfid(rst.getInt("rfid"));
                aluno.setNumCel(rst.getInt("numcel"));
                
                alunos.add(aluno);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{
            try{
                if(con!=null){
                    con.close();
                }
                if(rst!=null){
                    rst.close();
                }
                if(pstmt!=null){
                    pstmt.close();
                }
            }
            catch(Exception e ){
                e.printStackTrace();
            }
        }
        return alunos;
    }

    
}
