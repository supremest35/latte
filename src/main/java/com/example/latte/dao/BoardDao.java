package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;

@Mapper
public interface BoardDao {

	List<Board> getAllBoards(); 
	Board getBoardByNo(int boardNo);
	BoardDto getBoardDtoByNo(int boardNo);
	List<BoardDto> getAllBoardDtoByCategoryNo(int categoryNo);
	List<Board> getBoardsByCategoryNo(int categoryNo);
	
	void insertBoard(Board board);
	void updateBoard(Board board);
}
