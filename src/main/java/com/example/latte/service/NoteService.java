package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

public interface NoteService {
	
	List<NoteCategory> getAllCategories();
	NoteCategory getNoteCategoryByNo(int categoryNo);
	Note getNoteByNo(int noteNo);
	void insertNote(Note note);
	void deleteNoteByNo(int no);
	void updateNoteByNo(int no);
	List<Note> getNoteListByOpt(Map<String, Object> opt);
}
