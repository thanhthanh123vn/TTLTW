package object;

import java.util.Date;

public class UserInf {
    private int id;
    private String userName;
    private String password;
    private String address;
    private String imageURL;
    private String email;
    private String phone;
    private Date create_date;
    private String role;

    // Constructor không đối số
    public UserInf() {}

    public UserInf(String userName, String address, String phone) {
        this.userName = userName;
        this.address = address;
        this.phone = phone;
    }

    // Constructor đầy đủ đối số
    public UserInf( int id ,String userName, String email, String password, String address, String imageURL, String phone,String role) {
        this.id = id ;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.imageURL = imageURL;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }
    public UserInf( int id ,String userName, String email, String password, String address, String imageURL, String phone ) {
        this.id = id ;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.imageURL = imageURL;
        this.email = email;
        this.phone = phone;

    }

    public UserInf(String phone, String userName, String password, String address, String imageURL, String email) {
        this.phone = phone;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.imageURL = imageURL;
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
// Getters và setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String age) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "UserInf{" +
                "userName='" + userName + '\'' +
                ", age=" + password +
                ", address='" + address + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
