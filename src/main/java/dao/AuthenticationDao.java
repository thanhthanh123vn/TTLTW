package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AuthenticationDao {

    Utils utils;
    public AuthenticationDao() {
        utils = new Utils();

    }
    public  boolean insertAuthentication(String token , String email) {
        String sql = "insert into authentication (token,emaill)values(?,?)";
        try {
            Connection conn = utils.getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, token);
            stm.setString(2, email);
            int row = stm.executeUpdate();
            if(row > 0)return true;
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}
