package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.dto.AcornItemCommentDto;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.AcornItemComment;

public interface AcornService {

	int getCommentsCountByAcornNo(int acornNo);
	
	List<AcornItem> getAllAcornList();
	List<AcornItemCommentDto> getCommentDtosByRange(int acornNo, int userNo, int begin, int end);
	List<AcornItemCommentDto> getCommentDtosByRangeWithoutUserNo(int acornNo, int begin, int end);
	
	Map<String, Object> getAcorns(Map<String, Object> condition);
	
	AcornItem getAcornDetail(int acornNo);
	AcornItem getAcornByNo(int acornNo);
	AcornItemComment getCommentByNo(int commentNo);
	
	void addNewAcorn(AcornItem acorn);
	void insertComment(AcornItemComment comment);
	void insertCommentLike(int commentNo, int userNo);
	void updateAcorn(AcornItem acorn);
	void updateComment(AcornItemComment comment);
}
