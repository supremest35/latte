package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.NoteCategory;

@Mapper
public interface NoteDao {

	// 카테고리번호로 쪽지 불러오기 (페이징)
	List<NoteCategory> getAllNoteCategories();
	NoteCategory getNoteCategiryByNo(int no);
	List<Map<String, Object>> getListByCondition(Map<String, Object> condition);
	// 안읽은 쪽지 개수 가져오기 (페이징)
	// 내가 보낸 쪽지 가져오기 (페이징)
	// insert 쪽지 
	// delete 쪽지
	// 읽으면 상태 update

}
