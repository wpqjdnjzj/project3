package com.board.example.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.example.dto.BoardDTO;
import com.board.example.service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService boardService;
	
	// 과거 ModelAndView를 활용한 방법
//	@RequestMapping("list.do")
//	public ModelAndView boardMenu() throws Exception {
//		List<BoardDTO> list = boardService.boardList();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("board/board_list");
//		mav.addObject("list", list);
//		return mav; // board/board_list.jsp로 이동
//	}
	
	// 현재 자주 쓰는 Model 클래스를 DI 하는 방법
	@RequestMapping("list.do")
	public String boardList(Model model) throws Exception {
		List<BoardDTO> list = boardService.boardList(); // list 변수에 결과 값을 담는다
		model.addAttribute("list", list); // model에 데이터 값을 담는다
		return "board/board_list"; // board/board_list.jsp로 이동
	}
	
    // writer_page.jsp 매핑
    @RequestMapping("writer_page")
    public String writerpage() {
        return "board/writer_page";
    }
    
    // 게시글 from 데이터 처리
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public String boardWriter(BoardDTO bdto) throws Exception {
        boardService.writerBoard(bdto);
        return "redirect:list.do";
    }
    
    // 게시글 상세내용 불러오기 
    @RequestMapping(value="read.do", method=RequestMethod.GET)
    public String boardRead(@RequestParam int bno,Model model) throws Exception {
        BoardDTO data = boardService.boardRead(bno); // bno값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
        return "board/board_read"; // board/board_list.jsp로 이동
    }
    
    // 게시글 수정 페이지로 이동 
    @RequestMapping(value="updatepage.do", method=RequestMethod.GET)
    public String boardUpdate(@RequestParam int bno,Model model) throws Exception {
        BoardDTO data = boardService.boardRead(bno); // bno값을 넘김
        model.addAttribute("data", data); // model에 데이터 값을 담는다
        return "board/board_update"; // board/board_update.jsp로 이동
    }
    
    // 게시글 수정 실행
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String boardUpdatedo(BoardDTO bdto) throws Exception {
        boardService.updateBoard(bdto);
        return "redirect:list.do"; // 리스트로 리다이렉트
    }
    // 게시글 삭제
    @RequestMapping(value="delete.do", method=RequestMethod.GET)
    public String boardDelete(int bno, Model model) throws Exception {
        boardService.boardDelete(bno);
        return "redirect:list.do"; // 리스트로 리다이렉트
    }
}