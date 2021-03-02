package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.dto.AcornItemCommentDto;
import com.example.latte.vo.AcornItemComment;

@Mapper
@Transactional
public interface AcornCommentDao {

	List<AcornItemCommentDto> getCommentDtosByRangeWithoutUserNo(int acornNo, int begin, int end);
	List<AcornItemCommentDto> getCommentDtosByRange(int acornNo, int userNo, int begin, int end);
	
	AcornItemComment getCommentByNo(int commentNo);
	
	int getCommentsCountByAcornNo(int acornNo);
	
	void insertComment(AcornItemComment comment);
	void updateComment(AcornItemComment comment);
	void insertCommentLike(int commentNo, int userNo);
}
