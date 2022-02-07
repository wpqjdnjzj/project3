package com.company.myapp;

import java.sql.Connection;
import java.sql.DriverManager;
 
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class OracleConnectionTest {
    //로깅을 위한 변수 선언
    private static final Logger logger=LoggerFactory.getLogger(OracleConnectionTest.class);
    
    //DB연결 관련 변수 선언
    private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
    //연결문자열 jdbc:oracle:thin:@호스트:포트:sid
    private static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER="system"; //아이디
    private static final String PW="1234"; //비번
    
    @Test // JUnit이 테스트하는 method
    public void test() throws Exception {
        Class.forName(DRIVER); //드라이버 로딩
        try(Connection conn=DriverManager.getConnection(URL,USER,PW)){
            //로깅을 사용한 예제
            logger.info("오라클에 연결되었습니다.");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}