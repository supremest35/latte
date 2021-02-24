package com.example.latte.web.controller.rest;




import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("노트배열 호출");
		return noteService.getAllCategories();
	}
	
	@RequestMapping("sendNote")
	public void addNote(@RequestBody NoteForm noteForm) {
		Note note = new Note();
		BeanUtils.copyProperties(noteForm, note);
		System.out.println("## 노트form : " + noteForm.toString());
		System.out.println("##노트 : " + note.toString());
		
	}
	
		
}
