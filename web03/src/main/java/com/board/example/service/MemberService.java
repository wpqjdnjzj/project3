package com.board.example.service;

import java.util.List;

import com.board.example.dto.MemberDTO;

public interface MemberService {
    public List<MemberDTO> memberList();
    public void insertMember(MemberDTO dto);
    public MemberDTO viewMember(String userid);
    public void deleteMember(String userid);
    public void updateMember(MemberDTO dto);
    public int memberCnt();
    public MemberDTO checkPw(String userid, String passwd);
}
