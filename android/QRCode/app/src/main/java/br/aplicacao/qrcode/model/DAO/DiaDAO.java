package br.aplicacao.qrcode.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.aplicacao.qrcode.model.Dia;
import br.aplicacao.qrcode.model.util.DBCon;

public class DiaDAO implements DAO<Dia> {

    @Override
    public List<Dia> getIntercession() {
        return null;
    }

    @Override
    public List<Dia> getAll() {
        List<Dia> dias = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        
        try{
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                "SELECT * FROM Dia;");
            rst = pstmt.executeQuery();

            while(rst.next()){
                Dia dia = new Dia();
                
                dia.setData(rst.getDate("data"));
                dia.setFeriado(rst.getString("feriado"));
                dia.setId_Dia(rst.getInt("id_DiaLetivo"));

                dias.add(dia);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        finally{

            try{
                if(con!=null){
                    con.close();
                }
                if(pstmt!=null){
                    pstmt.close();
                }
                if(rst!=null){
                    rst.close();
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }        
        return dias;
    }

    @Override
    public boolean insert(Dia dia) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try{
            con = DBCon.connectDB();
            pstmt = con.prepareStatement(
                "INSERT INTO DiaLetivo(data, feriado) "+
                "VALUES (?, ?)");

            pstmt.setDate(1, dia.getDate());
            pstmt.setString(2, dia.getFeriado());

            pstmt.execute();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
}
