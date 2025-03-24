package object;
// Lớp hỗ trợ để tạo JSON
public  class LogEntry {
    public String timestamp;
    public String level;
    public String message;
    public int userId;
    private String preData;
    private String afterData;


    // 🔥 Constructor mặc định (Jackson cần)
    public LogEntry() {}


    public LogEntry(String timestamp, String level, String message, int userId) {
        this.timestamp = timestamp;
        this.level = level;
        this.message = message;
        this.userId = userId;
    }

    public LogEntry(String timestamp, String level, String message, int userId, String preData, String afterData) {
        this.timestamp = timestamp;
        this.level = level;
        this.message = message;
        this.userId = userId;
        this.preData = preData;
        this.afterData = afterData;
    }

    public String getPreData() {
        return preData;
    }

    public void setPreData(String preData) {
        this.preData = preData;
    }

    public String getAfterData() {
        return afterData;
    }

    public void setAfterData(String afterData) {
        this.afterData = afterData;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "LogEntry{" +
                "timestamp='" + timestamp + '\'' +
                ", level='" + level + '\'' +
                ", message='" + message + '\'' +
                ", userId=" + userId +
                '}';
    }
}