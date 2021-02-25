package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.latte.vo.DisLike;
import com.example.latte.vo.Like;

@Mapper
public interface LikeDao {
	//좋아요
	Like getLikeByBoardNoAndUserNo(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
	void insertLikes(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
	
	//싫어요
	DisLike getDisLikeByBoardNoAndUserNo(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
	void insertDislikes(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
}
