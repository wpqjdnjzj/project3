package com.board.example.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.example.dao.MemberDAO;
import com.board.example.dto.MemberDTO;
import com.board.example.service.MemberService;

@Controller //스프링에서 관리하는 컨트롤러 빈으로 등록
public class MemberController {
    //MemberService 인스턴스를 주입시킴
    @Inject
    MemberService memberService;
    MemberDAO memberDao;
    MemberDTO member;
    
    @RequestMapping("member/list.do") //url mapping -> member_list.jsp
    public String memberList(Model model) {
        List<MemberDTO> list=memberService.memberList();
        model.addAttribute("list", list);
        //   WEB-INF/views/member/member_list.jsp로 포워딩
        return "member/member_list";
    }
    
    @RequestMapping("member/join.do") //url mapping -> join.jsp(회원가입 폼)
    public String write() {
        //  /WEB-INF/views/member/join.jsp로 포워딩
        return "member/join";
    }
    
    //@ModelAttribute : 폼에서 전달된 값을 저장하는 객체  - 회원가입 처리 컨트롤러
    @RequestMapping("member/insert.do")
    public String insert(@ModelAttribute MemberDTO dto) {    
        memberService.insertMember(dto);
        return "redirect:/member/list.do";
    }
    
    // 회원 가입 진행
    @RequestMapping(value="member/joinPro.do", method=RequestMethod.POST)
    public String memberReg(MemberDTO dto) {
    	memberService.insertMember(dto);
    	return "redirect:/";
    }

    //회원 로그인 폼 이동 (login.jsp)
    @RequestMapping("member/login.do")
    	public String mainPage() {
    	return "member/login";
    }

    //회원 로그인 처리
    @RequestMapping(value = "member/loginPro.do", method=RequestMethod.POST )
    public String memberCheckPw(String userid, String passwd, HttpSession session, RedirectAttributes rttr) {
    	MemberDTO member = new MemberDTO();
		member = memberService.checkPw(userid, passwd);
		if(member!=null) {
			session.setAttribute("member", member);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		return "redirect:/";
    }
    
    //회원 로그아웃 (logout)
    @RequestMapping("member/logout.do")
	public String logOut(HttpSession session) {
    	session.invalidate();
		return "redirect:/";
    }
    
    //관리자가 회원 상세 보기
    //@RequestParam  : request.getParameter("변수명") 대체  
    @RequestMapping("member/view.do") //url mapping -> view.jsp(관리자 회원 상세 보기)
    public String view(@RequestParam String userid, Model model) {
	        //모델에 자료 저장
	        model.addAttribute("dto", memberService.viewMember(userid));
	        // view.jsp로 포워딩
	        return "member/view";
    }
    
    //일반회원이 본인 정보 보기
    @RequestMapping("member/mypage.do")	//url mapping -> mypage.jsp(마이페이지) 
    public String mypage(String userid, Model model) {
        //모델에 자료 저장
        model.addAttribute("dto", memberService.viewMember(userid));
        // view.jsp로 포워딩
        return "member/mypage"; 
    }
    
    //회원정보 수정 처리    
    @RequestMapping("member/update.do")	//회원정보 수정 처리 컨트롤
    public String update(String userid, String passwd, MemberDTO dto, Model model,  HttpSession session) {
    	MemberDTO member = new MemberDTO();
        //비밀번호 체크
    	member=memberService.checkPw(userid, passwd);
    	if(member != null) { //비밀번호가 맞으면
            //회원정보 수정
            memberService.updateMember(dto);
            this.logOut(session);
            //수정 후 목록으로 이동
            return "redirect:/"; //redirect
        } else { //비밀번호가 틀리면
            model.addAttribute("dto", dto);
            model.addAttribute("resdate", memberService.viewMember(dto.getUserid()).getRegdate());
            model.addAttribute("message", "비밀번호를 확인하세요.");
            return "member/view"; //forward
        }
    }
    
	//회원 탈퇴 처리 컨트롤
    @RequestMapping("member/delete.do")	
    public String delete(String userid, String passwd, MemberDTO dto, Model model) {
    	MemberDTO member = new MemberDTO();
    	member=memberService.checkPw(userid, passwd);
        if(member!=null) { //비번이 맞으면 삭제 => 목록으로 이동
            memberService.deleteMember(dto.getUserid());
            return "redirect:/member/list.do";
        }else { //비번이 틀리면 되돌아감
            model.addAttribute("message","비밀번호를 확인하세요.");
            model.addAttribute("dto", memberService.viewMember(dto.getUserid()));
            return "member/view";
        }
    }
}