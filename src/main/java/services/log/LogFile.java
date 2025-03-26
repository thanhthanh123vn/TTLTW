package services.log;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.Utils;
import object.LogEntry;
import object.UserInf;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogFile {

    private static final ObjectMapper objectMapper = new ObjectMapper();
    Utils utils;

 public LogFile(){
        utils = new Utils();
    }

    public void logToDatabase(LogEntry entry) {
        String sql = "INSERT INTO log (level, message, userid) VALUES (?, ?, ?)";

        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, entry.level);
            stmt.setString(2, entry.message);
            stmt.setInt(3, entry.userId);


            stmt.executeUpdate();
            utils.closeConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
public void logDeletData(LogEntry entry){
     String sql  = "INSERT INTO log (level, message, userid,previousData) VALUES (?, ?, ?, ?)";
     try {
         Connection conn = utils.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         stmt.setString(1, entry.level);
         stmt.setString(2, entry.message);
         stmt.setInt(3, entry.userId);
         stmt.setString(4,entry.getPreData());
         stmt.executeUpdate();
         utils.closeConnection(conn);

     } catch (Exception e) {
         throw new RuntimeException(e);
     }
}
public void logUpdateData(LogEntry entry){
    String sql  = "INSERT INTO log (level, message, userid,previousData,afterData) VALUES (?, ?, ?, ?,?)";
    try {
        Connection conn = utils.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, entry.level);
        stmt.setString(2, entry.message);
        stmt.setInt(3, entry.userId);
        stmt.setString(4,entry.getPreData());
        stmt.setString(5,entry.getAfterData());
        stmt.executeUpdate();
        utils.closeConnection(conn);

    } catch (Exception e) {
        throw new RuntimeException(e);
    }
}


    public void writeLog(LogEntry msg) {
        logToDatabase( msg);
    }
    public void writeError(LogEntry msg) {
        logToDatabase( msg);
    }

    public void writeWarning(LogEntry msg) {
        logUpdateData(msg);
    }
    public void writeDanger(LogEntry msg) {
        logDeletData(msg);
    }
    public  static void logDeleteUser(UserInf user, String level, String message) {
        try {
            URL url = new URL("http://localhost:8080/WebMyPham__/log");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInput = String.format(
                    "{\"level\": \"%s\", \"message\":\"%s\", \"userId\": %s, \"preData\": \"%s\"}",
                    level,
                    message,
                    (user != null ? user.getId() : "null"),
                    (user != null ? user.toString() : "unknown")
            );

            System.out.println("Sending log: " + jsonInput);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInput.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            System.out.println("Log response: " + responseCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
