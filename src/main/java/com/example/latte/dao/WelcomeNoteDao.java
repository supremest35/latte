package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.WelcomeNote;

@Mapper
@Transactional
public interface WelcomeNoteDao {

	WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo);
}
