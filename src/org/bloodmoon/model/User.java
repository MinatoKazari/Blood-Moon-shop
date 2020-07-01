package org.bloodmoon.model;

import java.util.Date;

public class User {
    /**
     * UID
     */
    private int uid;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 真名
     */
    private String realname;

    /**
     * 年龄
     */
    private String age;

    /**
     * 性别
     */
    private String sex;

    /**
     * 电话
     */
    private String phone;

    /**
     * 电子邮箱
     */
    private String email;

    /**
     * 头像
     */
    private String avatar;


    /**
     * 注册时间
     */
    private String createtime;

    /**
     * 修改时间
     */
    private String modified;

    /**
     * 构造函数
     */
    public User() {
    }

    /**
     * 构造函数
     * @param username
     * @param password
     */
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getUid() {
        return uid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setRealname(String realname){this.realname = realname;}

    public String getRealname(){return realname;}

    public void setAge(String age){this.age = age;}

    public String getAge(){return age;}

    public void setSex(String age){this.sex = sex;}

    public String getSex(){return sex;}

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setTime(String createtime) {
        this.createtime = createtime;
    }

    public String getTime() {
        return createtime;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public String getModified() {
        return modified;
    }
}
