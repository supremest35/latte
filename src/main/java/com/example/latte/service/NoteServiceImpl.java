package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.NoteDao;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;

@Service
public class NoteServiceImpl {

	@Autowired
	NoteDao noteDao;
	
	List<NoteCategory> getAllCategories(){
		return noteDao.getAllNoteCategories();
	};
	NoteCategory getNoteCategoryByNo(int categoryNo) {
		return noteDao.getNoteCategiryByNo(categoryNo);
	};
	
	void insertNote(Note note) {
		noteDao.insertNote(note);
	};
	void deleteNoteByNo(int no) {
		noteDao.deleteNoteByNo(no);
	};
	void updateNoteByNo(int no) {
		noteDao.updateNote(no);
	};
	
}
