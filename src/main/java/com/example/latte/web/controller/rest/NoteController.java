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

import com.example.latte.form.NoteForm;
import com.example.latte.service.NoteService;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;



@CrossOrigin("*")
@RestController("apiNoteController")
@RequestMapping("/api/note/")
public class NoteController {

	@Autowired
	NoteService noteService;
	
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
		return noteService.getNoteList(opt);
	}
	
	@RequestMapping("getAllNotes/{no}")
	public List<Note> getAllNoteList(@PathVariable("no") int userNo){
		
		System.out.println("###userNo" + userNo);
		Map<String, Object> opt = new HashMap<>();		
		opt.put("type", "");
		opt.put("userNo", userNo);
		return noteService.getNoteList(opt);
	}
	
		
}
