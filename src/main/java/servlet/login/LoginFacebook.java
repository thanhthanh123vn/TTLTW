package servlet.login;


import com.google.gson.Gson;
import com.google.gson.JsonObject;

import object.User;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.hc.client5.http.fluent.Form;
import org.apache.hc.client5.http.fluent.Request;

import services.Login.IConstant;

import java.io.IOException;

public class LoginFacebook  {


        // Đọc dữ liệu JSON từ request
        public static String getToken(String code) throws ClientProtocolException, IOException {
            String response = Request.post(IConstant.FACEBOOK_LINK_GET_TOKEN)
                    .bodyForm(
                            Form.form()
                                    .add("client_id", IConstant.FACEBOOK_CLIENT_ID)
                                    .add("client_secret", IConstant.FACEBOOK_CLIENT_SECRET)
                                    .add("redirect_uri", IConstant.FACEBOOK_REDIRECT_URI)
                                    .add("code", code)
                                    .build()
                    )
                    .execute().returnContent().asString();
            JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
            String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
            return accessToken;
        }
    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IConstant.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.get(link).execute().returnContent().asString();
        User fbAccount= new Gson().fromJson(response, User.class);
        return fbAccount;
    }
    

}


