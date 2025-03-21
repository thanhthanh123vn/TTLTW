package services.Login;

public class IConstant {
    public static final String FACEBOOK_CLIENT_ID = "963539282426449";
    public static final String FACEBOOK_CLIENT_SECRET = "b60048c4b879e151357e2e0b5e126f17";
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8080/WebMyPham__/login";
    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/v19.0/oauth/access_token";
    public static final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";
    public static final String GOOGLE_CLIENT_ID = "834631603807-ep2tbokt3a5qt1tpgdttlqr6mdnldgk3.apps.googleusercontent.com";

    public static final String GOOGLE_CLIENT_SECRET = "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";

    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/WebMyPham__/loginGoogle";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
}