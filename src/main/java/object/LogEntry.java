package object;
// Lớp hỗ trợ để tạo JSON
public  class LogEntry {
    public String timestamp;
    public String level;
    public String message;
    public int userId;
    private String username;
    // 🔥 Constructor mặc định (Jackson cần)
    public LogEntry() {}


    public LogEntry(String timestamp, String level, String message, int userId) {
        this.timestamp = timestamp;
        this.level = level;
        this.message = message;
        this.userId = userId;
    }

    public LogEntry(String timestamp, String level, String message, int userId, String username) {
        this.timestamp = timestamp;
        this.level = level;
        this.message = message;
        this.userId = userId;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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