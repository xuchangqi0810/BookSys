package cn.xcq.entity;

import java.util.Date;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/31
 * Time:13:52
 */
public class Users {
    private Integer user_id;
    private String user_code;
    private String password;
    private String email;
    private String gender;
    private Date register_time;
    private Date last_logintime;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_code() {
        return user_code;
    }

    public void setUser_code(String user_code) {
        this.user_code = user_code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }

    public Date getLast_logintime() {
        return last_logintime;
    }

    public void setLast_logintime(Date last_logintime) {
        this.last_logintime = last_logintime;
    }
}
