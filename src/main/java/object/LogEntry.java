package object;


import java.sql.Timestamp;

public class LogEntry {
    private int id;
    private Log_Level logLevel;
    private String address;
    private String ip;
    private String beforeValue;
    private String afterValue;
    private Timestamp createAt;

    public LogEntry() {

    }

    public LogEntry(int id, Log_Level logLevel, String address, String ip, String beforeValue, String afterValue, Timestamp createAt) {
        this.id = id;
        this.logLevel = logLevel;
        this.address = address;
        this.ip = ip;
        this.beforeValue = beforeValue;
        this.afterValue = afterValue;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Log_Level getLogLevel() {
        return logLevel;
    }

    public void setLogLevel(Log_Level logLevel) {
        this.logLevel = logLevel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getBeforeValue() {
        return beforeValue;
    }

    public void setBeforeValue(String beforeValue) {
        this.beforeValue = beforeValue;
    }

    public String getAfterValue() {
        return afterValue;
    }

    public void setAfterValue(String afterValue) {
        this.afterValue = afterValue;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }
}