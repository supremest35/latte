package com.example.latte.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.NoteDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dto.NoteDto;
import com.example.latte.dto.NotePagination;
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
	public Note getNoteByNo(int noteNo) {
		return noteDao.getNoteByNo(noteNo);
	}
	
	@Override
	public Map<String, Object> getNoteListByOpt(Map<String, Object> opt){
		Map<String, Object> result = new HashMap<>();
		
		// 전체 데이터수 구하기
		int totalRows = noteDao.getNoteListCnt(opt);
		// 페이지네이션 객체 생성 ->페이징에 필요한 데이터
		NotePagination pagination = new NotePagination((Integer)opt.get("pageNo"), totalRows);
		// 옵션에 맞는 데이터 조회
		List<NoteDto> noteDtoList = noteDao.getNoteListByOpt(opt);
		// 얻은 값 반환
		result.put("noteDtos", noteDtoList);
		result.put("pagination", pagination);
		
		return result;
	}
	
}
