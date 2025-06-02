package dao;

import object.User;
import object.UserInf;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public boolean checkUser(String username, String password) {
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, username);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();
			return resultSet.next(); // Trả về true nếu tìm thấy người dùng
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public int findIdByEmail(String email) {
		String sql = "SELECT id FROM users WHERE email = ?";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, email);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				return resultSet.getInt("id");
			} else {
				return 0; // Không tìm thấy
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public boolean insertUser(String username, String password, String email) {
		String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";

		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, email);

			int rowsInserted = statement.executeUpdate();
			return rowsInserted > 0; // Trả về true nếu chèn thành công
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // Trả về false nếu có lỗi xảy ra
		}
	}
	public List<User> getList(){
		List<User> list = new ArrayList<User>();
		String sql = "SELECT * FROM users";
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullName(resultSet.getString("username"));
				user.setEmail(resultSet.getString("email"));
				user.setPassword(resultSet.getString("password"));
				user.setRole(resultSet.getString("role"));
				user.setDate(resultSet.getDate("created_at"));
				list.add(user);

			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;

	}
	public boolean UpdateUser(User user) {
		String sql = "UPDATE users SET username = ?, email = ?, password = ?, role = ?, created_at = ? WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getRole());
			ps.setDate(5, new java.sql.Date(user.getDate().getTime()));
			ps.setInt(6, user.getId());

			int row = ps.executeUpdate();
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean UpdatePassWord(String  password , int id) {
		String sql = "UPDATE users SET password = ? WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setInt(2, id);


			int row = ps.executeUpdate();
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean UpdateToken(String  email ,String token) {
		String sql = "UPDATE users SET token = ? WHERE  email = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, token);
			ps.setString(2, email);



			int row = ps.executeUpdate();
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean UpdatePassWord(String  password  ,String email) {
		String sql = "UPDATE users SET password = ? WHERE email = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);


			int row = ps.executeUpdate();
			return row > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
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


}