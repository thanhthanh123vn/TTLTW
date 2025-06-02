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

    public UserInfDao() {
        utils = new Utils();
        this.conn = utils.getConnection();
    }

    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int findbyAuthId(String authId) {
        String sql = "select id from usersarress where auth_id=?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, authId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    public void updateUserAndAddress(UserInf userInf) {
        String updateUserSQL = "UPDATE Users SET userName = ?, email = ? WHERE userID = ?";
        String updateUserAddressSQL = "UPDATE UserArress SET age = ?, address = ?, imageURL = ?, phone = ? WHERE email = ?";

        try {
            conn.setAutoCommit(false);

            try (PreparedStatement psUser = conn.prepareStatement(updateUserSQL)) {
                psUser.setString(1, userInf.getUserName());
                psUser.setString(2, userInf.getEmail());
                psUser.setInt(3, userInf.getId());
                psUser.executeUpdate();
            }

            try (PreparedStatement psUserAddress = conn.prepareStatement(updateUserAddressSQL)) {
                psUserAddress.setString(1, userInf.getPassword());
                psUserAddress.setString(2, userInf.getAddress());
                psUserAddress.setString(3, userInf.getImageURL());
                psUserAddress.setString(4, userInf.getPhone());
                psUserAddress.setString(5, userInf.getEmail());
                psUserAddress.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            try {
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

    public List<UserInf> getListUserInf() {
        List<UserInf> listUserInf = new ArrayList<>();
        String sql = "select ua.userID, u.userName,u.role, ua.email, u.password, ua.address, ua.imageURL, ua.phone from users u join usersarress ua on u.ID = ua.userID";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while(rs.next()) {
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
        } catch (SQLException e) {
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

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");
            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUserInf;
    }

    public void insertUserAndAddress(UserInf userInf) {
        String insertUserSQL = "INSERT INTO users (userName, email, password) VALUES (?, ?, ?)";
        String insertUserAddressSQL = "INSERT INTO usersarress (userID, email, address, imageURL, phone) VALUES (?, ?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false);
            int userID;

            try (PreparedStatement psUser = conn.prepareStatement(insertUserSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
                psUser.setString(1, userInf.getUserName());
                psUser.setString(2, userInf.getEmail());
                psUser.setString(3, userInf.getPassword());
                psUser.executeUpdate();

                try (ResultSet generatedKeys = psUser.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userID = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }

            try (PreparedStatement psUserAddress = conn.prepareStatement(insertUserAddressSQL)) {
                psUserAddress.setInt(1, userID);
                psUserAddress.setString(2, userInf.getEmail());
                psUserAddress.setString(3, userInf.getAddress());
                psUserAddress.setString(4, userInf.getImageURL());
                psUserAddress.setString(5, userInf.getPhone());
                psUserAddress.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            try {
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

    public int findAddressUser(String authID) {
        String sql = "SELECT id FROM usersarress WHERE authid = ?";
        try (PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, authID);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm địa chỉ user: " + e.getMessage(), e);
        }
        return 0;
    }

    public boolean upsertAddressUser(UserInf userInf) {
        String sql = """
        INSERT INTO usersarress (address, phone, fullName, userid,email)
        VALUES (?, ?, ?, ?,?)
        ON DUPLICATE KEY UPDATE
            address = VALUES(address),
            phone = VALUES(phone),
            fullName = VALUES(fullName),
            email = VALUES(email)
        """;
        try (PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, userInf.getAddress());
            stm.setString(2, userInf.getPhone());
            stm.setString(3, userInf.getUserName());
            stm.setInt(4, userInf.getId());
            stm.setString(5, userInf.getEmail());

            int row = stm.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean checkIdAddressUser(int id, String authId) {
        String sql = authId != null ? 
            "SELECT COUNT(*) FROM usersarress WHERE authid = ?" :
            "SELECT COUNT(*) FROM usersarress WHERE userid = ?";
            
        try (PreparedStatement stm = conn.prepareStatement(sql)) {
            if (authId != null) {
                stm.setString(1, authId);
            } else {
                stm.setInt(1, id);
            }
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteUserAndAddress(int userID) {
        String deleteUserAddressSQL = "DELETE FROM usersarress WHERE userID = ?";
        String deleteUserSQL = "DELETE FROM users WHERE id = ?";

        try {
            conn.setAutoCommit(false);

            try (PreparedStatement psUserAddress = conn.prepareStatement(deleteUserAddressSQL)) {
                psUserAddress.setInt(1, userID);
                psUserAddress.executeUpdate();
            }

            try (PreparedStatement psUser = conn.prepareStatement(deleteUserSQL)) {
                psUser.setInt(1, userID);
                psUser.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            try {
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

    public boolean updateAvatar(int userID, String imageUrl) {
        String sql = "UPDATE UserArress SET imageURL = ? WHERE userID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, imageUrl);
            ps.setInt(2, userID);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public UserInf getUser(int userID) {
        String sql = "select ua.userID, u.userName,u.role, ua.email, u.password, ua.address, ua.imageURL, ua.phone from Users u join UsersArress ua on u.ID = ua.userID where u.ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new UserInf(
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String name  ="%le%";
        UserInfDao userInfDao = new UserInfDao();
      List<UserInf> users =   userInfDao.searchUserInf(name);
      System.out.println(users.size());
    }
}



