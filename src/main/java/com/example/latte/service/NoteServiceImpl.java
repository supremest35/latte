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
		
		note.setSenderNo(((User)SessionUtils.getAttribute("LOGINED_USER")).getNo());
		note.setRecDeptNo(recipient.getDeptNo());
		noteDao.insertNote(note);
	};
	
	public void deleteNoteByNo(int no) {
		noteDao.deleteNoteByNo(no);
	};
	
	public void updateNoteByNo(int no) {
		noteDao.updateNote(no);
	};

	@Override
	public List<Note> getNoteListByOpt(Map<String, Object> opt) {
		return noteDao.getNoteList(opt);
		// 전체 컬럼 수 구하기 , 페이지네이션 객체 받아오기 ,
	}
	
	@Override
	public Note getNoteByNo(int noteNo) {
		return noteDao.getNoteByNo(noteNo);
	}
	
}
