package com.example.latte.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.LikeDao;
import com.example.latte.vo.DisLike;
import com.example.latte.vo.Like;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao likeDao; 
	
	@Override
	public Like getLikeByBoardNoAndUserNo(int boardNo, int userNo) {
		return likeDao.getLikeByBoardNoAndUserNo(boardNo, userNo);
	}
	
	@Override
	public void insertLikes(int boardNo, int userNo) {
		likeDao.insertLikes(boardNo, userNo);
	}
	
	@Override
	public DisLike getDisLikeByBoardNoAndUserNo(int boardNo, int userNo) {
		return likeDao.getDisLikeByBoardNoAndUserNo(boardNo, userNo);
	}
	
	@Override
	public void insertDisLikes(int boardNo, int userNo) {
		likeDao.insertDislikes(boardNo, userNo);
		
	}
}
