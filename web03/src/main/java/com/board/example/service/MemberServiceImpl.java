package com.board.example.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.example.dao.MemberDAO;
import com.board.example.dto.MemberDTO;

//현재 클래스를 스프링에서 관리하는 service bean으로 설정
@Service
public class MemberServiceImpl implements MemberService {
    //dao 인스턴스를 주입시킴
    @Inject
    MemberDAO memberDao;
    // 회원 목록
    @Override
    public List<MemberDTO> memberList() {
        return memberDao.memberList();
    }
    // 회원 가입
    @Override
    public void insertMember(MemberDTO dto) {
        memberDao.insertMember(dto);
    }
    // 회원 상세보기
    @Override
    public MemberDTO viewMember(String userid) {
        return memberDao.viewMember(userid);
    }
    // 회원 삭제
    @Override
    public void deleteMember(String userid) {
        memberDao.deleteMember(userid); 
    }
    // 회원 정보 수정
    @Override
    public void updateMember(MemberDTO dto) {
        memberDao.updateMember(dto); 
    }
    // 회원수 카운트
    @Override
    public int memberCnt() {
    	return memberDao.memberCnt();
    }
    
    // 로그인 처리
    @Override
    public MemberDTO checkPw(String userid, String passwd) {
        return memberDao.checkPw(userid, passwd); 
    }
}