package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.AcornCommentDao;
import com.example.latte.dao.AcornDao;
import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.dto.AcornItemCommentDto;
import com.example.latte.dto.Pagination;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.AcornItemComment;
import com.example.latte.vo.AcornItemCommentLike;
import com.example.latte.vo.AcornItemLike;
import com.example.latte.vo.UserItem;

@Service
public class AcornServiceImpl implements AcornService {

	@Autowired
	AcornDao acornDao;
	@Autowired
	AcornCommentDao acornCommentDao;
	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public int getCommentsCountByAcornNo(int acornNo) {
		return acornCommentDao.getCommentsCountByAcornNo(acornNo);
	}
	
	@Override
	public List<AcornItem> getAllAcornList() {
		return acornDao.getAllAcorns();
	}
	@Override
	public List<AcornItemCommentDto> getCommentDtosByRange(int acornNo, int userNo, int begin, int end) {
		return acornCommentDao.getCommentDtosByRange(acornNo, userNo, begin, end);
	}
	@Override
	public List<AcornItemCommentDto> getCommentDtosByRangeWithoutUserNo(int acornNo, int begin, int end) {
		return acornCommentDao.getCommentDtosByRangeWithoutUserNo(acornNo, begin, end);
	}
	@Override
	public List<UserItem> getUserItems(int userNo) {
		return acornDao.getUserItems(userNo);
	}
	
	@Override
	public Map<String, Object> getAcorns(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = acornDao.getTotalCountByCondition(condition);
		
		List<AcornItem> acorns = acornDao.getAcornsBycondition(condition);

		Pagination pagination = new Pagination((Integer) condition.get("pageno"), totalRows);
		
		result.put("acorns", acorns);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public AcornItem getAcornDetail(int acornNo) {
		return acornDao.getAcornByNo(acornNo);
	}
	@Override
	public AcornItem getAcornByNo(int acornNo) {
		return acornDao.getAcornByNo(acornNo);
	}
	@Override
	public AcornItemComment getCommentByNo(int commentNo) {
		return acornCommentDao.getCommentByNo(commentNo);
	}
	@Override
	public AcornItemCommentLike getCommentLike(int commentNo, int userNo) {
		return acornCommentDao.getCommentLike(commentNo, userNo);
	}
	@Override
	public AcornItemLike getAcornItemLike(int acornNo, int userNo) {
		return acornDao.getAcornItemLike(acornNo, userNo);
	}
	
	@Override
	public void addNewAcorn(AcornItem acorn) {
		acornDao.insertAcorn(acorn);
	}
	@Override
	public void deleteUserItem(int userNo, int acornNo) {
		acornDao.deleteUserItem(userNo, acornNo);
	}
	@Override
	public void insertAcornItemLike(AcornItemLike itemLike) {
		acornDao.insertAcornItemLike(itemLike);
	}
	@Override
	public void insertComment(AcornItemComment comment) {
		acornCommentDao.insertComment(comment);
	}
	@Override
	public void insertCommentLike(int commentNo, int userNo) {
		acornCommentDao.insertCommentLike(commentNo, userNo);
	}
	@Override
	public void insertUserItem(UserItem userItem) {
		acornDao.insertUserItem(userItem);
	}
	@Override
	public void updateAcorn(AcornItem acorn) {
		acornDao.updateAcorn(acorn);
	}
	@Override
	public void updateComment(AcornItemComment comment) {
		acornCommentDao.updateComment(comment);
	}
}
