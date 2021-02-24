package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.dto.CommentDto;
import com.example.latte.vo.Comment;

@Mapper
public interface CommentDao {

	List<CommentDto> getAllCommentByBno(int boardNo);
	
	void insertComment(Comment comment);
}
