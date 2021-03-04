package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.dto.NoteDto;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

public interface NoteService {
	
	List<NoteCategory> getAllCategories();
	NoteCategory getNoteCategoryByNo(int categoryNo);
	
	void insertNote(Note note);
	void deleteNoteByNo(int no);
	void updateNote(Note note);
	Note getNoteByNo(int noteNo);
	NoteDto getNoteDtoByNo(int noteNo);
	
	Map<String, Object> getNoteListByOpt(Map<String, Object> opt);
}
