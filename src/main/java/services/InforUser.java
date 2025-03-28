package services;

import java.awt.desktop.SystemEventListener;
import java.sql.*;
import java.security.MessageDigest;
import dao.Utils;
import object.User;
import org.mindrot.jbcrypt.BCrypt;
public class InforUser {
	private Connection conn;
	private Utils utils;

	public InforUser() {
		// TODO Auto-generated constructor stub
		utils = new Utils();
		conn = utils.getConnection();
	}
public void closeConnection(){
		utils.closeConnection(conn);
}
//	public User checkUser(String username, String password) {
//		String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
//		User user = null;
//		try (PreparedStatement statement = conn.prepareStatement(sql)) {
//			statement.setString(1, username);
//			statement.setString(2, password);
//
//			ResultSet resultSet = statement.executeQuery();// Trả về true nếu tìm thấy người dùng
//
//			while (resultSet.next()) {
//				user = new User(resultSet.getInt("id"), resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("email"),resultSet.getString("role"));
//				return user;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		//utils.closeConnection(conn);
//		return user;
//	}
public boolean updateUser(User user) {
	String sql = "update users set username=?, email=? where id = ?";
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, user.getFullName());
		ps.setString(2, user.getEmail());
		ps.setInt(3, user.getId());

		int row = ps.executeUpdate();
		return row > 0;

	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}

	public boolean updateUserAddress(User user) {
		String sql = "update usersarress set email = ?, malle = ?, dateBth=? where userID = ?";
		try {
			PreparedStatement stm = conn.prepareStatement(sql);
			stm.setString(1, user.getEmail());
			stm.setString(2, user.getMalle());
			stm.setDate(3, new java.sql.Date(user.getDate().getTime()));
			stm.setInt(4, user.getId());

			int row = stm.executeUpdate();
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}



	public User checkUser(String username, String password) {
		String query = "SELECT u.*, ua.* FROM users u JOIN usersarress ua ON ua.userid = u.id WHERE username = ?";

		try (PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				String storedHashedPassword = rs.getString("password");
				System.out.println(storedHashedPassword);

				// Kiểm tra mật khẩu nhập vào có khớp với mật khẩu đã mã hóa trong database
				if (BCrypt.checkpw(password, storedHashedPassword)) {
					return new User(
							rs.getInt("id"),
							rs.getString("username"),
							rs.getString("email"),
							rs.getString("password"),
							rs.getString("role"),
							rs.getString("malle"),
							rs.getDate("dateBth"),
							rs.getString("phone")
					);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // Trả về null nếu không tìm thấy user hoặc sai mật khẩu
	}

	public boolean insertUser(String username, String email, String password) {
		String sql = "INSERT INTO users (username, email,password) VALUES (?, ?, ?)";
		String hashedPassword = "";
		try {

			hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		}catch (Exception e) {
			e.printStackTrace();
		}
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, username);
			statement.setString(2, email);
			statement.setString(3, hashedPassword);

			int rowsInserted = statement.executeUpdate();
			//utils.closeConnection(conn);
			return rowsInserted > 0; // Trả về true nếu chèn thành công
		} catch (SQLException e) {
			e.printStackTrace();

			return false; // Trả về false nếu có lỗi xảy ra

		}

	}
	public boolean insertUser(String username, String email, String password, String malle,Date date) {
		String userSql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
		String addressSql = "INSERT INTO usersarress (userid, malle, dateBth) VALUES (?, ?, ?, ?)";

		String hashedPassword = "";
		try {
			hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			conn.setAutoCommit(false); // Bắt đầu transaction

			// Chèn user vào bảng users
			PreparedStatement userStmt = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS);
			userStmt.setString(1, username);
			userStmt.setString(2, email);
			userStmt.setString(3, hashedPassword);
			int rowsInserted = userStmt.executeUpdate();

			if (rowsInserted > 0) {
				ResultSet rs = userStmt.getGeneratedKeys();
				if (rs.next()) {
					int userId = rs.getInt(1); // Lấy ID của user vừa thêm

					// Chèn địa chỉ vào bảng usersarress
					PreparedStatement addressStmt = conn.prepareStatement(addressSql);
					addressStmt.setInt(1, userId);
					addressStmt.setString(2, malle);
					addressStmt.setDate(3, date);

					addressStmt.executeUpdate();

					conn.commit(); // Xác nhận transaction
					return true;
				}
			}

			conn.rollback(); // Nếu có lỗi, rollback transaction
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return false; // Trả về false nếu có lỗi
	}

	public boolean checkInfoUser(String username , String email) {
		String sql = "SELECT * FROM users WHERE username = ? AND email = ?";
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, username);
			statement.setString(2, email);

			ResultSet resultSet = statement.executeQuery();
			return resultSet.next(); // Trả về true nếu tìm thấy người dùng
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//utils.closeConnection(conn);
		return false;
	}


	public String hashPassword(String password) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hash = md.digest(password.getBytes("UTF-8"));
		StringBuilder hexString = new StringBuilder();

		for (byte b : hash) {
			String hex = Integer.toHexString(0xff & b);
			if (hex.length() == 1) hexString.append('0');
			hexString.append(hex);
		}
		return hexString.toString();
	}

	public static void main(String[] args)  throws Exception {
		InforUser inforUser = new InforUser();
		System.out.println( inforUser.hashPassword("123456"));

	}

}
