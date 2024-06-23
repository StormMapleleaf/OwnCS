public class User3 {
    // 私有属性
    private int userid;
    private String username;
    private String gender;
    private int age;
    private Boolean member;

    // 无参构造方法
    public User3() {
    }

    // 带参构造方法
    public User3(int userid, String username, String gender, int age, Boolean member) {
        this.userid = userid;
        this.username = username;
        this.gender = gender;
        this.age = age;
        this.member = member;
    }

    // Getter 和 Setter 方法
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Boolean getMember() {
        return member;
    }

    public void setMember(Boolean member) {
        this.member = member;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", member=" + member +
                '}';
    }
}
