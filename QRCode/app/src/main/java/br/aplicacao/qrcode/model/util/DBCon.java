package br.aplicacao.qrcode.model.util;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBCon {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private static final String DATABASE = "jdbc:mysql://localhost:3306/pcct";


    public static Connection connectDB(){
        try {
             return DriverManager.getConnection(DATABASE, USERNAME, PASSWORD);
        }
        catch(java.sql.SQLException exception){
            exception.printStackTrace();
            return null;
        }
    }
}
