package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.BoardDao;
import com.example.latte.dao.CommentDao;
import com.example.latte.dto.CommentDto;
import com.example.latte.vo.Board;
import com.example.latte.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<CommentDto> getAllCommentsByBno(int boardNo) {
		return commentDao.getAllCommentByBno(boardNo);
	}

	@Override
	public void addComment(Comment comment) {
		commentDao.insertComment(comment);
		System.out.println("코멘트: " + comment);
		
		Board savedBoard = boardDao.getBoardByNo(comment.getBoardNo());
		System.out.println(savedBoard);
		savedBoard.setCommentCnt(savedBoard.getCommentCnt()+1);
		System.out.println("+1하고나서"+savedBoard);
		
		//업데이트 보드 해보자
	}
}
