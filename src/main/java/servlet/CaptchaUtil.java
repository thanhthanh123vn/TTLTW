package servlet;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONObject;

public class CaptchaUtil {
    private static final String SECRET_KEY = "6Lccm1MrAAAAACbA-YROXevKb11U7Y6SuQksrLhf";

    public static boolean verify(String gRecaptchaResponse) {
        try {
            String secret = "6Lccm1MrAAAAACbA-YROXevKb11U7Y6SuQksrLhf";
            String url = "https://www.google.com/recaptcha/api/siteverify";
            String params = "secret=" + secret + "&response=" + gRecaptchaResponse;
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);

            DataOutputStream out = new DataOutputStream(con.getOutputStream());
            out.writeBytes(params);
            out.flush();
            out.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                responseBuffer.append(inputLine);
            }
            in.close();

            JSONObject json = new JSONObject(responseBuffer.toString());
            return json.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}


