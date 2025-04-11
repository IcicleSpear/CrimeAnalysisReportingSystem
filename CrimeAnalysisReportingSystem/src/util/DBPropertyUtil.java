package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class DBPropertyUtil {

    public static String getPropertyString(String fileName) {
        Properties props = new Properties();
        String connectionString = "";

        try (FileInputStream fis = new FileInputStream(fileName)) {
            props.load(fis);

            String host = props.getProperty("db.host");
            String port = props.getProperty("db.port");
            String dbName = props.getProperty("db.name");
            String user = props.getProperty("db.user");
            String password = props.getProperty("db.password");

            connectionString = "jdbc:mysql://" + host + ":" + port + "/" + dbName
                    + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
                    + "&user=" + user + "&password=" + password;

        } catch (IOException e) {
            System.out.println("Error reading database properties file: " + e.getMessage());
        }

        return connectionString;
    }
}
