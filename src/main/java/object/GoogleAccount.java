package object;

public class GoogleAccount
{
    private String  id, email, name, first_name, given_name, family_name, picture;

    private boolean verified_email;

    public GoogleAccount(boolean verified_email, String picture, String family_name, String given_name, String first_name, String name, String email, String id) {
        this.verified_email = verified_email;
        this.picture = picture;
        this.family_name = family_name;
        this.given_name = given_name;
        this.first_name = first_name;
        this.name = name;
        this.email = email;
        this.id = id;
    }
    public GoogleAccount() {}

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public String getPicture() {
        return picture;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }
}
