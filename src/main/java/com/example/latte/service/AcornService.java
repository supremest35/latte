package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.dto.AcornItemCommentDto;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.AcornItemComment;
import com.example.latte.vo.AcornItemLike;
import com.example.latte.vo.UserItem;

public interface AcornService {

	int getCommentsCountByAcornNo(int acornNo);
	
	List<AcornItem> getAllAcornList();
	List<AcornItemCommentDto> getCommentDtosByRange(int acornNo, int userNo, int begin, int end);
	List<AcornItemCommentDto> getCommentDtosByRangeWithoutUserNo(int acornNo, int begin, int end);
	List<UserItem> getUserItems(int userNo);
	
	Map<String, Object> getAcorns(Map<String, Object> condition);
	
	AcornItem getAcornDetail(int acornNo);
	AcornItem getAcornByNo(int acornNo);
	AcornItemComment getCommentByNo(int commentNo);
	AcornItemLike getAcornItemLike(int acornNo, int userNo);
	
	void addNewAcorn(AcornItem acorn);
	void insertAcornItemLike(AcornItemLike itemLike);
	void insertComment(AcornItemComment comment);
	void insertCommentLike(int commentNo, int userNo);
	void insertUserItem(UserItem userItem);
	void updateAcorn(AcornItem acorn);
	void updateComment(AcornItemComment comment);
}
