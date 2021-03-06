package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MiniHomeBoard;

@Mapper
@Transactional
public interface MiniHomeBoardDao {
	
	void insertMiniHomeBoard(MiniHomeBoard miniHomeBoard);
	
	void updateMiniHomeBoard(MiniHomeBoard miniHomeBoard);
	
	int getTotalBoardsByOption(Map<String, Object> opt);
	
	MiniHomeBoard getBoardByNo(int boardNo);

	List<MiniHomeBoard> getBoardsByOption(Map<String, Object> opt);
	
}
