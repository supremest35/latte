package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.dto.NoteDto;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

@Mapper
public interface NoteDao {

	List<NoteCategory> getAllNoteCategories();
	NoteCategory getNoteCategiryByNo(int categoryNo);
	
	void insertNote(Note note);
	void deleteNoteByNo(int no);
	void updateNote(Note note);
	Note getNoteByNo(int noteNo);
	NoteDto getNoteDtoByNo(int noteNo);
	
	int getNoteListCnt(Map<String, Object> opt);
	List<NoteDto> getNoteListByOpt(Map<String, Object> opt);
	int getUnreadNormalNote(int userNo);
	int getUnreadFriendNote(int userNo);
}
