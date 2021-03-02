package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.VisitorNote;

@Mapper
@Transactional
public interface VisitorNoteDao {
	List<VisitorNote> getVisitorNotesByOption(Map<String, Object> opt);
}
