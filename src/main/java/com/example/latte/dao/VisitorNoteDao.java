package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.VisitorNote;

@Mapper
@Transactional
public interface VisitorNoteDao {
	VisitorNote getVisitorNoteByMiniHomeNoAndIndex(int miniHomeNo, int index);
}
