package com.example.latte.service;

import com.example.latte.vo.DisLike;
import com.example.latte.vo.Like;

public interface LikeService {

	Like getLikeByBoardNoAndUserNo(int boardNo, int userNo);
	void insertLikes(int boardNo, int userNo);
	
	DisLike getDisLikeByBoardNoAndUserNo(int boardNo, int userNo);
	void insertDisLikes(int boardNo, int userNo);
}
