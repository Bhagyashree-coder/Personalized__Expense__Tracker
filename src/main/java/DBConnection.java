import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection con = null;

    public static Connection establishConnection() {

        String oracleDriver = "oracle.jdbc.driver.OracleDriver";
        String oracleUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String userName = "system";
        String password = "24122005";

        try {
            //Register Driver.
            Class.forName(oracleDriver);

            //Create Connection.
             con = DriverManager.getConnection(oracleUrl, userName, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Connection established...");

        return con;

    }
}
