package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

@Mapper
public interface NoteDao {

	// 카테고리
	List<NoteCategory> getAllNoteCategories();
	NoteCategory getNoteCategiryByNo(int categoryNo);
	
	// 안읽은 쪽지 개수 가져오기 (페이징) 안읽은 쪽지 ->status:N , 읽은 쪽지->status:Y , categoty -> 100/ 
	List<Map<String, Object>> getNoteListByOption(Map<String, Object> condition);
	
	// 내가 보낸 쪽지 가져오기 (페이징)
	// insert 쪽지 
	void insertNote(Note note);
	// delete 쪽지
	void deleteNoteByNo(int no);
	// 읽으면 상태 update (클릭시 상태 확인 -> 안읽음일 때 메서드 실행)
	void updateNote(int no);
}
