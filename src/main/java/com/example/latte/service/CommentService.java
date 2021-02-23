package com.example.latte.service;

import java.util.List;

import com.example.latte.dto.CommentDto;
import com.example.latte.vo.Comment;

public interface CommentService {

	List<CommentDto> getAllCommentsByBno(int boardNo);
	void addComment(Comment comment);
	
}
