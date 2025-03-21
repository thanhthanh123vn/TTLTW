package services.Login;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import object.GoogleAccount;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.hc.client5.http.fluent.Form;
import org.apache.hc.client5.http.fluent.Request;

import java.io.IOException;

public class GoogleLogin {
    public static String getToken(String code) throws ClientProtocolException, IOException {

        String response = Request.post(IConstant.GOOGLE_LINK_GET_TOKEN)

                .bodyForm(

                        Form.form()

                                .add("client_id", IConstant.GOOGLE_CLIENT_ID)

                                .add("client_secret", IConstant.GOOGLE_CLIENT_SECRET)

                                .add("redirect_uri", IConstant.GOOGLE_REDIRECT_URI)

                                .add("code", code)

                                .add("grant_type", IConstant.GOOGLE_GRANT_TYPE)

                                .build()

                )

                .execute().returnContent().asString();



        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }
    public static GoogleAccount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = IConstant.GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.get(link).execute().returnContent().asString();

        GoogleAccount googlePojo = new Gson().fromJson(response, GoogleAccount.class);

        return googlePojo;

    }
}
