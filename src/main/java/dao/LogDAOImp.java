package dao;

import object.LogEntry;
import object.Log_Level;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LogDAOImp implements LogDao {
    Utils utils = new Utils();

    @Override
    public int add(LogEntry log) {
        String sql = "INSERT INTO logs ( log_level, address, ip, before_value, after_value, create_at) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, log.getLogLevel().toString());
            stmt.setString(2, log.getAddress());
            stmt.setString(3, log.getIp());
            stmt.setString(4, log.getBeforeValue());
            stmt.setString(5, log.getAfterValue());
            stmt.setTimestamp(6, log.getCreateAt());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public List<LogEntry> findAll() {
        List<LogEntry> logs = new ArrayList<>();
        String sql = "SELECT * FROM logs";

        try (Connection conn = utils.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                LogEntry log = new LogEntry();
                log.setId(rs.getInt("id"));
                log.setLogLevel(Log_Level.valueOf(rs.getString("log_level")));
                log.setAddress(rs.getString("address"));
                log.setIp(rs.getString("ip"));
                log.setBeforeValue(rs.getString("before_value"));
                log.setAfterValue(rs.getString("after_value"));
                log.setCreateAt(rs.getTimestamp("create_at"));

                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logs;
    }
}