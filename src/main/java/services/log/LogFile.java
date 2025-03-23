package services.log;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.Utils;
import object.LogEntry;

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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void writeLog(LogEntry msg) {
        logToDatabase( msg);
    }
    public void writeError(LogEntry msg) {
        logToDatabase( msg);
    }

    public void writeWarning(LogEntry msg) {
        logToDatabase(msg);
    }
    public void writeDanger(LogEntry msg) {
     logToDatabase(msg);
    }
}
