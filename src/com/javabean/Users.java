package com.javabean;

/**
 * Created by myklory on 2016/3/3.
 */
public class Users { //规则1：这个类是公共的
    private String username;    //规则2：属性私有化
    private String password;

    //规则3:公有的无参构造方法
    public Users(){

    }

    //规则4:属性有Getter和Setter方法
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
