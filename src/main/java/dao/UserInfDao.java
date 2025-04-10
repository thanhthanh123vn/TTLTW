package dao;
import object.UserInf;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserInfDao {
    private Connection conn;
private Utils utils;
    public UserInfDao( ) {
        utils = new Utils();
        this.conn = utils.getConnection();
    }

    // Phương thức cập nhật dữ liệu trong cả hai bảng
    public void updateUserAndAddress(UserInf userInf) {
        String updateUserSQL = "UPDATE Users SET userName = ?, email = ? WHERE userID = ?";
        String updateUserAddressSQL = "UPDATE UserArress SET age = ?, address = ?, imageURL = ?, phone = ? WHERE email = ?";

        try {
            // Bắt đầu giao dịch
            conn.setAutoCommit(false);

            // Cập nhật bảng Users
            try (PreparedStatement psUser = conn.prepareStatement(updateUserSQL)) {
                psUser.setString(1, userInf.getUserName());
                psUser.setString(2, userInf.getEmail());
                psUser.setInt(3, userInf.getId());
                psUser.executeUpdate();
            }

            // Cập nhật bảng UserArress
            try (PreparedStatement psUserAddress = conn.prepareStatement(updateUserAddressSQL)) {
                psUserAddress.setString(1, userInf.getPassword());
                psUserAddress.setString(2, userInf.getAddress());
                psUserAddress.setString(3, userInf.getImageURL());
                psUserAddress.setString(4, userInf.getPhone());
                psUserAddress.setString(5, userInf.getEmail());
                psUserAddress.executeUpdate();
            }

            // Cam kết giao dịch
            conn.commit();

        } catch (SQLException e) {
            try {
                // Rollback nếu có lỗi
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Phương thức lấy danh sách người dùng
    public List<UserInf> getListUserInf(){
        List<UserInf> listUserInf = new ArrayList<>();
        String sql = "select ua.userID, u.userName,u.role, ua.email, u.password, ua.address, ua.imageURL, ua.phone from Users u join UsersArress ua on u.ID = ua.userID";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                UserInf userInf = new UserInf(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("imageURL"),
                        rs.getString("phone"),
                        rs.getString("role")
                );
                listUserInf.add(userInf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUserInf;
    }

    public List<UserInf> searchUserInf(String name) {
        List<UserInf> listUserInf = new ArrayList<>();
        String sql = "SELECT ua.userID, u.userName, ua.email, u.password, ua.address, ua.imageURL, ua.phone " +
                "FROM Users u " +
                "JOIN UsersArress ua ON u.ID = ua.userID " +
                "WHERE u.userName LIKE ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserInf userInf = new UserInf(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("imageURL"),
                        rs.getString("phone"),
                        rs.getString("role")
                );
                listUserInf.add(userInf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUserInf;
    }


    // Phương thức chèn dữ liệu vào bảng Users và UserArress
    public void insertUserAndAddress(UserInf userInf) {
        String insertUserSQL = "INSERT INTO users (userName, email, password) VALUES (?, ?, ?)";
        String insertUserAddressSQL = "INSERT INTO usersarress (userID, email, address, imageURL, phone) VALUES (?, ?, ?, ?, ?)";

        try {
            // Start transaction
            conn.setAutoCommit(false);

            // Insert into Users table
            int userID;
            try (PreparedStatement psUser = conn.prepareStatement(insertUserSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
                psUser.setString(1, userInf.getUserName());
                psUser.setString(2, userInf.getEmail());
                psUser.setString(3, userInf.getPassword());
                int row = psUser.executeUpdate();
                if (row > 0) {
                    System.out.println("Inserted user successfully");
                } else {
                    System.out.println("Inserting user failed");
                }

                // Retrieve userID from Users table
                try (ResultSet generatedKeys = psUser.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userID = generatedKeys.getInt(1);
                        System.out.println("Inserted user ID: " + userID);
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }

            // Insert into UsersAddress table
            try (PreparedStatement psUserAddress = conn.prepareStatement(insertUserAddressSQL)) {
                psUserAddress.setInt(1, userID);
                psUserAddress.setString(2, userInf.getEmail());
                psUserAddress.setString(3, userInf.getAddress());
                psUserAddress.setString(4, userInf.getImageURL());
                psUserAddress.setString(5, userInf.getPhone());
                int row = psUserAddress.executeUpdate();
                if (row > 0) {
                    System.out.println("Inserted user address successfully");
                } else {
                    System.out.println("Inserting user address failed");
                }
            }

            // Commit transaction
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                // Rollback if there is an error
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public int findAddressUser(String authID) {
        String sql = "SELECT id FROM usersarress WHERE authid = ?";

        try {
            Connection connection = utils.getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, authID);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }

        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi tìm địa chỉ user: " + e.getMessage(), e);
        }

        return 0; // Trả về 0 nếu không tìm thấy
    }
    public boolean insertAddressUser(UserInf userInf) {
        // Kiểm tra dựa trên provider
        boolean checkAddress;
        if ("FACEBOOK".equalsIgnoreCase(userInf.getProvider()) || "GOOGLE".equalsIgnoreCase(userInf.getProvider())) {
            checkAddress = checkIdAddressUser(0, userInf.getAuthId());
        } else {
            checkAddress = checkIdAddressUser(userInf.getId(), null);
        }
        System.out.println(checkAddress);

        if (checkAddress) {
            String sql = "UPDATE usersarress SET address = ?, phone = ?, fullName = ?, userid = ?, authid = ?, provider = ? WHERE userid = ? OR authid = ?";
            try {

                PreparedStatement stm = conn.prepareStatement(sql);
                if (userInf.getId() > 0) {
                    stm.setInt(4, userInf.getId());
                } else {
                    stm.setObject(4, null); // dùng setObject để gán null
                }
                stm.setString(1, userInf.getAddress());
                stm.setString(2, userInf.getPhone());
                stm.setString(3, userInf.getUserName());
                if (userInf.getId() > 0) {
                    stm.setInt(4, userInf.getId());
                } else {
                    stm.setObject(4, null); // dùng setObject để gán null
                }
                stm.setString(5, userInf.getAuthId());
                stm.setString(6, userInf.getProvider());

                if (userInf.getId() > 0) {
                    stm.setInt(7, userInf.getId());
                } else {
                    stm.setObject(7, null); // dùng setObject để gán null
                }
                stm.setString(8, userInf.getAuthId());

                int row = stm.executeUpdate();
                System.out.println("Inserted user address successfully update" + row);
                return row > 0;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {


            String insertUserAddressSQL = "INSERT INTO usersarress (userid, address, phone, fullName, authid, provider) VALUES (?, ?, ?, ?, ?, ?)";
           try{
                PreparedStatement stm = conn.prepareStatement(insertUserAddressSQL);

               // Gán giá trị cho userid (chấp nhận null nếu cần)
               if (userInf.getId() > 0) {
                   stm.setInt(1, userInf.getId());
               } else {
                   stm.setObject(1, null); // dùng setObject để gán null
               }

                stm.setString(2, userInf.getAddress());
                stm.setString(3, userInf.getPhone());
                stm.setString(4, userInf.getUserName());
                stm.setString(5, userInf.getAuthId());
                stm.setString(6, userInf.getProvider());

                int row = stm.executeUpdate();
                System.out.println("Inserted user address successfully" + row);
                return row > 0;
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi chèn dữ liệu: " + e.getMessage(), e);
            }
        }
        return false;
    }

    private boolean checkIdAddressUser(int id, String authId) {
        try {
            String sql;
            PreparedStatement stm;
            if (authId != null) {
                sql = "SELECT COUNT(*) FROM usersarress WHERE authid = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, authId);
            } else {
                sql = "SELECT COUNT(*) FROM usersarress WHERE userid = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
            }
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Phương thức xóa dữ liệu từ bảng Users và UserArress
    public void deleteUserAndAddress(int userID) {
        String deleteUserAddressSQL = "DELETE FROM usersarress WHERE userID = ?";
        String deleteUserSQL = "DELETE FROM users WHERE id = ?";

        try {
            // Start transaction
            conn.setAutoCommit(false);

            // Delete from UsersArress table
            try (PreparedStatement psUserAddress = conn.prepareStatement(deleteUserAddressSQL)) {
                psUserAddress.setInt(1, userID);
                int row = psUserAddress.executeUpdate();
                if (row > 0) {
                    System.out.println("Deleted user address successfully");
                } else {
                    System.out.println("Deleting user address failed");
                }
            }

            // Delete from Users table
            try (PreparedStatement psUser = conn.prepareStatement(deleteUserSQL)) {
                psUser.setInt(1, userID);
                int row = psUser.executeUpdate();
                if (row > 0) {
                    System.out.println("Deleted user successfully");
                } else {
                    System.out.println("Deleting user failed");
                }
            }

            // Commit transaction
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                // Rollback if there is an error
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
// Up load ảnh đại diện
public boolean updateAvatar(int userID, String imageUrl) {
    String sql = "UPDATE UserArress SET imageURL = ? WHERE userID = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, imageUrl);
        ps.setInt(2, userID);

        int row = ps.executeUpdate();
        return row > 0; // Trả về true nếu cập nhật thành công
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // Trả về false nếu có lỗi
}
public UserInf getUser(int userID) {
    UserInf userInf = null;
    String sql = "select ua.userID, u.userName,u.role, ua.email, u.password, ua.address, ua.imageURL, ua.phone from Users u join UsersArress ua on u.ID = ua.userID where u.ID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                 userInf = new UserInf(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("imageURL"),
                        rs.getString("phone"),
                        rs.getString("role")
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInf;
    }

    public static void main(String[] args) {
        String name  ="%le%";
        UserInfDao userInfDao = new UserInfDao();
      List<UserInf> users =   userInfDao.searchUserInf(name);
      System.out.println(users.size());
    }
    }



