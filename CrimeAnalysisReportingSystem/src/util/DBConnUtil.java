package util;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnUtil {

    private static Connection connection = null;

    public static Connection getConnection(String fileName) {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String connectionString = DBPropertyUtil.getPropertyString("db.properties");

                connection = DriverManager.getConnection(connectionString);
                System.out.println("✅ Database connection established successfully.");

            } catch (ClassNotFoundException e) {
                System.out.println("❌ MySQL JDBC Driver not found. Add the JAR to classpath.");
            } catch (SQLException e) {
                System.out.println("❌ Error establishing database connection: " + e.getMessage());
            }
        }
        return connection;
    }
}
