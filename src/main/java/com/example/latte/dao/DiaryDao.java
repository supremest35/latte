package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Diary;

@Mapper
@Transactional
public interface DiaryDao {
	
	List<Diary> getDiariesByMiniHomeNoAndYearMonth(int miniHomeNo, String yearMonth);
}
