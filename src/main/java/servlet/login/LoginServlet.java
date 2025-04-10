package servlet.login;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import dao.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import object.User;
import org.json.JSONObject;
import services.Login.IConstant;

@WebServlet(urlPatterns = {"/login-facebook", "/loginGoogle"})
public class LoginServlet extends HttpServlet {
    // Facebook Config
    private static final String FB_APP_ID = IConstant.FACEBOOK_CLIENT_ID;
    private static final String FB_APP_SECRET = IConstant.FACEBOOK_CLIENT_SECRET;
    private static final String FB_REDIRECT_URI = "http://localhost:8080/WebMyPham__/login-facebook";
    private static final String FB_AUTH_URL = "https://www.facebook.com/v12.0/dialog/oauth";
    private static final String FB_TOKEN_URL = "https://graph.facebook.com/v12.0/oauth/access_token";
    private static final String FB_USER_URL = "https://graph.facebook.com/me?fields=id,name,email";

    // Google Config
    private static final String GOOGLE_CLIENT_ID = IConstant.GOOGLE_CLIENT_ID;
    private static final String GOOGLE_CLIENT_SECRET = IConstant.GOOGLE_CLIENT_SECRET;
    private static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/WebMyPham__/loginGoogle";
    private static final String GOOGLE_AUTH_URL = "https://accounts.google.com/o/oauth2/v2/auth";
    private static final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
    private static final String GOOGLE_USER_URL = "https://www.googleapis.com/oauth2/v3/userinfo";

    Utils utils;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        String code = request.getParameter("code");

        if (code == null) {
            if (path.equals("/login-facebook")) {
                String authURL = FB_AUTH_URL + "?client_id=" + FB_APP_ID + "&redirect_uri=" + FB_REDIRECT_URI + "&scope=public_profile,email";
                response.sendRedirect(authURL);
            } else if (path.equals("/loginGoogle")) {
                String authURL = GOOGLE_AUTH_URL + "?client_id=" + GOOGLE_CLIENT_ID + "&redirect_uri=" + GOOGLE_REDIRECT_URI +
                        "&response_type=code&scope=openid%20email%20profile&access_type=offline";
                response.sendRedirect(authURL);
            }
        } else {
            String provider, userInfo;
            if (path.equals("/login-facebook")) {
                String tokenURL = FB_TOKEN_URL + "?client_id=" + FB_APP_ID + "&redirect_uri=" + FB_REDIRECT_URI +
                        "&client_secret=" + FB_APP_SECRET + "&code=" + code;
                String accessToken = getAccessToken(tokenURL);
                userInfo = getUserInfo(FB_USER_URL + "&access_token=" + accessToken);
                provider = "FACEBOOK";
            } else {
                String tokenURL = GOOGLE_TOKEN_URL + "?client_id=" + GOOGLE_CLIENT_ID + "&client_secret=" + GOOGLE_CLIENT_SECRET +
                        "&redirect_uri=" + GOOGLE_REDIRECT_URI + "&code=" + code + "&grant_type=authorization_code";
                String accessToken = getAccessToken(tokenURL, "POST");
                userInfo = getUserInfo(GOOGLE_USER_URL + "?access_token=" + accessToken);
                provider = "GOOGLE";
            }

            JSONObject userJson = new JSONObject(userInfo);
            String id = provider.equals("FACEBOOK") ? userJson.getString("id") : userJson.getString("sub");
            String name = userJson.getString("name");
            String email = userJson.has("email") ? userJson.getString("email") : null;

            saveUserToDatabase(id, name, email, provider);
            User user = new User();
            

            user.setAuthId(id);
            user.setProvider(provider);
            user.setFullName(name);
            user.setEmail(email);
            session.setAttribute("user", user);
            response.sendRedirect("products");



//            response.setContentType("text/html");
//            PrintWriter out = response.getWriter();
//            out.println("<h1>Login Success</h1>");
//            out.println("<p>Provider: " + provider + "</p>");
//            out.println("<p>User Info: " + userInfo + "</p>");
//            out.println("<p>Data saved to database!</p>");
        }
    }

    private String getAccessToken(String tokenURL) throws IOException {
        return getAccessToken(tokenURL, "GET");
    }

    private String getAccessToken(String tokenURL, String method) throws IOException {
        URL url = new URL(tokenURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(method);
        if (method.equals("POST")) {
            conn.setDoOutput(true);
            conn.getOutputStream().write("".getBytes());
        }

        StringBuilder response = new StringBuilder();
        try (Scanner scanner = new Scanner(conn.getInputStream())) {
            while (scanner.hasNext()) {
                response.append(scanner.nextLine());
            }
        }
        JSONObject json = new JSONObject(response.toString());
        return json.getString("access_token");
    }

    private String getUserInfo(String userURL) throws IOException {
        URL url = new URL(userURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        StringBuilder response = new StringBuilder();
        try (Scanner scanner = new Scanner(conn.getInputStream())) {
            while (scanner.hasNext()) {
                response.append(scanner.nextLine());
            }
        }
        return response.toString();
    }

    private void saveUserToDatabase(String id, String name, String email, String provider) {
        String sql = provider.equals("FACEBOOK")
                ? "INSERT INTO authUsers (facebook_id, name, email, provider) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE name = ?, email = ?"
                : "INSERT INTO authUsers (google_id, name, email, provider) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE name = ?, email = ?";

        try {
            utils = new Utils();

            Connection conn = utils.getConnection();

             PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, provider);
            pstmt.setString(5, name);
            pstmt.setString(6, email);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}