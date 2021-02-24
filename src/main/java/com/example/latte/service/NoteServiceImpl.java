package com.example.latte.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.NoteDao;
import com.example.latte.dao.UserDao;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;
import com.example.latte.vo.User;

@Service
public class NoteServiceImpl  implements NoteService{

	@Autowired
	NoteDao noteDao;
	@Autowired
	UserDao userDao;

	
	
	public List<NoteCategory> getAllCategories(){
		return noteDao.getAllNoteCategories();
	};
	
	public NoteCategory getNoteCategoryByNo(int categoryNo) {
		return noteDao.getNoteCategiryByNo(categoryNo);
	};
	
	public void insertNote(Note note) {
		User recipient = userDao.getUserByNo(note.getRecipientNo());
		System.out.println("###########노트 service호출됨");
		
		note.setSenderNo((int)SessionUtils.getAttribute("LOGINED_USER_NO"));
		note.setRecDeptNo(recipient.getDeptNo());
		System.out.println("########서비스 노트"+note);
		noteDao.insertNote(note);
		System.out.println("###########노트 dao호출됨");
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
