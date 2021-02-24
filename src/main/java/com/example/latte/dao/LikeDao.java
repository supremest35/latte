package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.latte.vo.Like;

@Mapper
public interface LikeDao {

	Like getLikeByBoardNoAndUserNo(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
	void insertLikes(@Param("boardNo") int boardNo, @Param("userNo") int userNo);
}
