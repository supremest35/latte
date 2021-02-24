package com.example.latte.service;

import com.example.latte.vo.Like;

public interface LikeService {

	Like getLikeByBoardNoAndUserNo(int boardNo, int userNo);
	void insertLikes(int boardNo, int userNo);
}
