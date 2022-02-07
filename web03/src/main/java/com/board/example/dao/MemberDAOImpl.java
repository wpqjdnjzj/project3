package com.board.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.example.dto.MemberDTO;

//현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class MemberDAOImpl implements MemberDAO {
  //mybatis의 SqlSession 객체를 스프링에서 주입시킴
  //의존관계 주입 느슨한 결합, 제어의 역전
  //@Inject 어노테이션이 있어 sqlSession은 null상태가 아닌 외부에서 객체를 주입받는 형태가 된다.
  @Inject
  SqlSession sqlSession;
  // 회원 목록
  @Override
  public List<MemberDTO> memberList() {
      return sqlSession.selectList("member.memberList");
  }
  // 회원 가입
  @Override
  public void insertMember(MemberDTO dto) {
      //auto commit, auto close        
      sqlSession.insert("member.insertMember", dto);
  }
  // 회원 정보 상세 보기
  @Override
  public MemberDTO viewMember(String userid) { 
      // 레코드 1개 : selectOne(), 2개 이상 : selectList()        
      return sqlSession.selectOne("member.viewMember", userid);
  }
  // 회원 삭제 하기
  @Override
  public void deleteMember(String userid) {
      sqlSession.delete("member.deleteMember", userid); 
  }
  // 회원 정보 수정
  @Override
  public void updateMember(MemberDTO dto) {
      sqlSession.update("member.updateMember", dto); 
  }
  //회원수 카운트
  @Override
  public int memberCnt() { // 회원 수 
	  return sqlSession.selectOne("member.memberCnt");
  }

  // 로그인 체크
  @Override
  public MemberDTO checkPw(String userid, String passwd) {
      //mapper에 2개 이상의 자료를 전달할 때 : map, dto 사용
	  MemberDTO dao = new MemberDTO();
      Map<String,String> map=new HashMap<>();
      map.put("userid", userid);
      map.put("passwd", passwd);
      dao=sqlSession.selectOne("member.checkPw", map);
      //비번이 맞으면 1=>true, 틀리면 0=>false 리턴
	 return dao;  
  }
}