package com.board.example.dto;

import java.util.Date;

public class MemberDTO {
    //Field
    private String userid;
    private String passwd;
    private String name;
    private String email;
    private Date regdate; //java.util.Date
    
    //기본 생성자 (파라미터 없는것)
    public MemberDTO() {}
    //기본 생성자
    public MemberDTO(String userid, String passwd, String name, String email, Date join_date) {
        super();
        this.userid = userid;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.regdate = join_date;
    }
 
    //getter,setter,toString()
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    @Override //toString
    public String toString() {
        return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", join_date="
                + regdate + "]";
    }
}