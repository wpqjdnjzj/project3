package com.board.example.service;

import java.util.List;


import com.board.example.dto.BoardDTO;

public interface BoardService {
	// 게시물 목록 조회
	public List<BoardDTO> boardList() throws Exception;
    // 게시물 글 쓰기
    public void writerBoard(BoardDTO bdto) throws Exception;
    // 게시물 상세내용 불러오기
    public BoardDTO boardRead(int bno) throws Exception;
    // 게시물 수정 실행
    public void updateBoard(BoardDTO bdto) throws Exception;
	//게시물 삭제
	public void boardDelete(int bno) throws Exception;
}