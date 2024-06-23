public class User {
    private int userId;
    private String username;
    private String gender;
    private int age;
    private boolean member;

    // Constructor
    public User() {
    }

    // Getter and setter methods for userId
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Getter and setter methods for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and setter methods for gender
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Getter and setter methods for age
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    // Getter and setter methods for member
    public boolean isMember() {
        return member;
    }

    public void setMember(boolean member) {
        this.member = member;
    }
}
