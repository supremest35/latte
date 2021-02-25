package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Diary;

@Mapper
@Transactional
public interface DiaryDao {
	
	Diary getDiaryByNo(int diaryNo);
	
	Diary getLatestDiaryByMiniHomeNo(int miniHomeNo);
	
	List<Diary> getDiariesByOption(Map<String, Object> opt);
}
