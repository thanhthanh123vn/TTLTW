package object;


import java.util.Date;

public class User {
    private int id;
    private String fullName;
    private String email;
    private String password;
    private Date date;
    private String role;
    private String malle;
    private String sdt;

    // Constructors
    public User(int id, String fullName, String email, String password, String role , String malle, Date date,String sdt) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.password = password;
        this.malle = malle;
        this.date = date;
        this.sdt = sdt;
    }
    public User(int id, String fullName, String email, String password, String  role) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User(String fullName, String email) {
        this.fullName = fullName;
        this.email = email;
    }

    public String getMalle() {
        return malle;
    }

    public void setMalle(String malle) {
        this.malle = malle;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public User() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    } 

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    public void setRole(String role){
        this.role = role;
    }
    public String getRole(){
        return role;
    }

    // toString method
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", date=" + date +
                '}';
    }
}
