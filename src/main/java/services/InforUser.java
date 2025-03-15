package services;

import java.awt.desktop.SystemEventListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import dao.Utils;
import object.User;

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
		String query = "SELECT u.* ,ua.* FROM users u join usersarress ua on ua.userid = u.id  WHERE username = ? AND password = ?";
		try (PreparedStatement stmt = conn.prepareStatement(query)) {
			String hashedPassword = hashPassword(password);


			stmt.setString(1, username);
			stmt.setString(2, hashedPassword);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("username"), rs.getString("email"), rs.getString("password"),rs.getString("role"),
						rs.getString("malle"),rs.getDate("dateBth"),rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // Trả về null nếu không tìm thấy user
	}


	public boolean insertUser(String username, String email, String password) {
		String sql = "INSERT INTO users (username, email,password) VALUES (?, ?, ?)";
		String hashedPassword = "";
		try {

		 hashedPassword = hashPassword(password);
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
