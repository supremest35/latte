package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;
import com.example.latte.vo.Category;

public interface BoardService {

	List<Board> getAllBoards();
	Board getBoardByNo(int boardNo);
	BoardDto getBoardDtoByNo(int boardNo);
	
	
	List<Board> getBoardsByCategoryNo(int categoryNo);
	List<BoardDto> getAllBoardDtoByCategoryNo(int categoryNo);
	List<Category> getAllCategories();
	List<BoardDto> getBestByLikeCnt();
	
	void insertBoard(Board board);
	void updateBaord(Board board);
	
	Map<String, Object> getBoardDtoList(Map<String, Object> condition);
		
	
	
	
}
