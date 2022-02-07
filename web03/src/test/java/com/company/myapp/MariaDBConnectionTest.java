package com.company.myapp;

import java.sql.Connection;
import java.sql.DriverManager;
 
import org.junit.Test;
 
public class MariaDBConnectionTest {
    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL    = "jdbc:mariadb://192.168.0.4:3306/company";
    private static final String USER   = "admin";
    private static final String PW     = "1234";
    
    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);
        try {
            Connection con = DriverManager.getConnection(URL, USER, PW);
            //sysout으로 콘솔 로그 출력
            System.out.println(con);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}