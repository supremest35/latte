package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.BoardDao;
import com.example.latte.dao.CategoryDao;
import com.example.latte.dto.BoardPagination;
import com.example.latte.dto.Pagination;
import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;
import com.example.latte.vo.Category;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	CategoryDao	 categoryDao;
	
	@Override
	public List<Board> getAllBoards() {
		return boardDao.getAllBoards();
	}
	
	@Override
	public Board getBoardByNo(int boardNo) {
		return boardDao.getBoardByNo(boardNo);
	}
	
	@Override
	public List<Category> getAllCategories() {
		List<Category> categories =  categoryDao.getAllCategories();
		return categories;
	}
	
	@Override
	public BoardDto getBoardDtoByNo(int boardNo) {
		return boardDao.getBoardDtoByNo(boardNo);
	}
	
	@Override
	public List<Board> getBoardsByCategoryNo(int categoryNo) {
		return boardDao.getBoardsByCategoryNo(categoryNo);
	}
	
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}
	
	@Override
	public List<BoardDto> getAllBoardDtoByCategoryNo(int categoryNo) {
		return boardDao.getAllBoardDtoByCategoryNo(categoryNo);
	}
	
	@Override
	public List<BoardDto> getBestByLikeCnt() {
		return boardDao.getTop10ByLikeCnt();
	}
	
	@Override
	public void updateBaord(Board board) {
		boardDao.updateBoard(board);
	}
	
@Override
	public Map<String, Object> getBoardDtoList(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = boardDao.getTotalCountByCondition(condition);
		
		List<BoardDto> boardDtoList = boardDao.getBoardDtoByCondition(condition);
		
		BoardPagination pagination = new BoardPagination((Integer)condition.get("pageNo"), totalRows);
		
		result.put("boardDto", boardDtoList);
		result.put("pagination", pagination);
		
		return result;
	}
	
	
}
