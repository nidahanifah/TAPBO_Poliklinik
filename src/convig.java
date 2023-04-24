import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
//import java.sql.Statement;

public class convig {
    private static Connection mysqlconfig;
   // public static Statement stm;
    public static Connection configDB()throws SQLException{
        try{
            String url="jdbc:mysql://localhost/ta";
            String user="root";
            String pass="";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            mysqlconfig = DriverManager.getConnection(url, user, pass);
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Koneksi Gagal : "+e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return mysqlconfig;
    }
}