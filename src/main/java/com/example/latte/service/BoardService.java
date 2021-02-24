package com.example.latte.service;

import java.util.List;

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
	
	void insertBoard(Board board);
	void updateBaord(Board board);
}
