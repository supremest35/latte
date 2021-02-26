package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;

@Mapper
public interface BoardDao {

	List<Board> getAllBoards(); 
	Board getBoardByNo(int boardNo);
	BoardDto getBoardDtoByNo(int boardNo);
	List<BoardDto> getAllBoardDtoByCategoryNo(int categoryNo);
	List<Board> getBoardsByCategoryNo(int categoryNo);
	List<BoardDto> getTop10ByLikeCnt();
	
	void insertBoard(Board board);
	void updateBoard(Board board);
	
	int getTotalCountByCondition(Map<String, Object> condition);
	List<BoardDto> getBoardDtoByCondition(Map<String, Object> condition);
}
