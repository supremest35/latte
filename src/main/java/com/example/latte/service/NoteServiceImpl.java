package com.example.latte.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.NoteDao;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

@Service
public class NoteServiceImpl  implements NoteService{

	@Autowired
	NoteDao noteDao;

	
	
	public List<NoteCategory> getAllCategories(){
		return noteDao.getAllNoteCategories();
	};
	
	public NoteCategory getNoteCategoryByNo(int categoryNo) {
		return noteDao.getNoteCategiryByNo(categoryNo);
	};
	
	public void insertNote(Note note) {
		noteDao.insertNote(note);
	};
	
	public void deleteNoteByNo(int no) {
		noteDao.deleteNoteByNo(no);
	};
	
	public void updateNoteByNo(int no) {
		noteDao.updateNote(no);
	};

	@Override
	public List<Note> getNoteListByOption(Map<String, Object> option) {
		
		return noteDao.getNoteListByOption(option);
	}
	
}
