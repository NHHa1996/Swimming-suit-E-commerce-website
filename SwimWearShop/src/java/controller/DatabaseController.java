package controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Cuong
 */
public class DatabaseController {

    private static Connection conn;
    private static final String URL = "jdbc:mysql://localhost:3306/swimwearshop";
    private static final String username = "root";
    private static final String password = "ititiu13170";

    public static Connection getConnection() throws SQLException {
        if (conn == null) {
            createConnection();
        }
        return conn;
    }

    public static void createConnection() throws SQLException {
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException | IllegalAccessException | ClassNotFoundException ex) {
                Logger.getLogger(DatabaseController.class.getName()).log(Level.SEVERE, null, ex);
            }
            conn = DriverManager.getConnection(URL, username, password);
        } catch (SQLException e) {
            System.out.println("Error");
        }
    }

    public static ResultSet executeQuery(String query) throws SQLException {
        if (conn == null) {
            createConnection();
        }
        return conn.createStatement().executeQuery(query);
    }

    public static void executeUpdate(String query) throws SQLException {
        if (conn == null) {
            createConnection();
        }
        conn.createStatement().executeUpdate(query);
    }

    public static void updateDatabase(String query) {
        try {
            DatabaseController.createConnection();
            DatabaseController.executeUpdate(query);
            try {
                DatabaseController.closeConnection();
            } catch (Exception ex) {
//                return;
            }
        } catch (SQLException ex) {
//            return;
        }
    }
    
    public static void closeConnection() throws Exception {
        conn.close();
    }
}
