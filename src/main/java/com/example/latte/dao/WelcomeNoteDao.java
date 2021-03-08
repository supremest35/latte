package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.WelcomeNote;

@Mapper
@Transactional
public interface WelcomeNoteDao {

	int getTotalRecordsByMiniHomeNo(int miniHomeNo);
	void insertWelcomeNote(WelcomeNote welcomeNote);
	WelcomeNote getWelcomeNoteByNo(int no);
	WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo);
	List<WelcomeNote> getWelcomeNotesByOption(Map<String, Object> opt);
	void updateWelcomeNote(WelcomeNote welcomeNote);
}
