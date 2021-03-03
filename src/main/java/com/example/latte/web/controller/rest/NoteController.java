package com.example.latte.web.controller.rest;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.dao.DeptDao;
import com.example.latte.form.NoteForm;
import com.example.latte.service.DeptService;
import com.example.latte.service.NoteService;
import com.example.latte.service.UserService;
import com.example.latte.vo.Dept;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;
import com.example.latte.vo.User;



@CrossOrigin("*")
@RestController("apiNoteController")
@RequestMapping("/api/note/")
public class NoteController {

	@Autowired
	NoteService noteService;
	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;
	
	@RequestMapping("getCategories")
	public List<NoteCategory> getCategories(){
		return noteService.getAllCategories();
	}
	
	@RequestMapping("sendNote")
	public void addNote(@RequestBody NoteForm noteForm) {
		Note note = new Note();
		BeanUtils.copyProperties(noteForm, note);
		noteService.insertNote(note);
		
	}
	
	@RequestMapping("getRecivedNotes/{no}")
	public List<Note> getNoteList(@PathVariable("no") int userNo){
		
		System.out.println("###userNo" + userNo);
		Map<String, Object> opt = new HashMap<>();
		opt.put("type", "rec");
		opt.put("userNo", userNo);
		return noteService.getNoteListByOpt(opt);
	}
	
	@RequestMapping("getNoteList/{no}")
	public List<Note> getAllNoteList(@PathVariable("no") int userNo){
		// 현재 페이지 번호 , 탭 이름, 유저넘버 -> 맵에 담아서 호출 
		
		System.out.println("###userNo" + userNo);
		Map<String, Object> opt = new HashMap<>();		
		opt.put("type", "");
		opt.put("userNo", userNo);
		return noteService.getNoteListByOpt(opt);
		// 표현할 리스트에 새로운 값 전해주기 
	}
	
	@RequestMapping("getNoteDetail/{no}")
	public Map<String,Object> getNoteDetail(@PathVariable("no") int noteNo){
		Map<String, Object> result = new HashMap<>();
		
		Note note = noteService.getNoteByNo(noteNo);
		NoteCategory category = noteService.getNoteCategoryByNo(note.getCategoryNo());
		System.out.println(category.getName());
		User sender = userService.getUserByNo(note.getSenderNo());
		User recipient = userService.getUserByNo(note.getRecipientNo());
		Dept senderDept = deptService.getDeptByNo(sender.getDeptNo());
		Dept recipientDept = deptService.getDeptByNo(recipient.getDeptNo());
		result.put("note", note);
		result.put("noteCategory", category);
		result.put("sender", sender);
		result.put("senderDept", senderDept);
		result.put("recipient", recipient);
		result.put("recipientDept", recipientDept);
		
		return result;
	}
		
}








