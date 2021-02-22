package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.BoardDao;
import com.example.latte.dao.CategoryDao;
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
}
