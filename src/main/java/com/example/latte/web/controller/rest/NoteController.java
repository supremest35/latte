package com.example.latte.web.controller.rest;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.dao.DeptDao;
import com.example.latte.dao.NoteDao;
import com.example.latte.dto.NoteDto;
import com.example.latte.form.NoteForm;
import com.example.latte.service.DeptService;
import com.example.latte.service.NoteService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Dept;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;
import com.example.latte.vo.Relationship;
import com.example.latte.vo.User;



@CrossOrigin("*")
@RestController("apiNoteController")
@RequestMapping("/api/notes/")
public class NoteController {

	@Autowired
	NoteService noteService;
	@Autowired
	UserService userService;
	
	@RequestMapping("getCategories")
	public List<NoteCategory> getCategories(){
		return noteService.getAllCategories();
	}
	
	@RequestMapping("sendNote")
	public String addNote(@RequestBody NoteForm noteForm) {
		Note note = new Note();
		BeanUtils.copyProperties(noteForm, note);
		
		return noteService.insertNote(note);
	}
	
	@RequestMapping("getDtoList")
	public Map<String, Object> getAllNoteList(@RequestParam("userNo") int userNo, 
					@RequestParam("sort") String sort, @RequestParam(name="pageNo", defaultValue="1") int pageNo){
		// 현재 페이지 번호 , 탭 이름, 유저넘버 -> 맵에 담아서 호출 
		
		// 쪽지를 조회할 옵션 설정
		Map<String, Object> opt = new HashMap<>();		
		opt.put("userNo", userNo);
		opt.put("sort", sort);
		// 페이징 처리에 필요한 값 설정
		int rows = 5; // 한 페이지에 표시할 데이터 수
		opt.put("pageNo", pageNo);
		opt.put("rows", rows);
		opt.put("startRn", (pageNo -1)*rows +1);
		opt.put("endRn", pageNo*rows);
		
		return noteService.getNoteListByOpt(opt);
		// 표현할 리스트에 새로운 값 전해주기 
	}
	
	@RequestMapping("getNoteDetail/{no}")
	public NoteDto getNoteDetail(@PathVariable("no") int noteNo){
		Note note = noteService.getNoteByNo(noteNo);
		if("STANDBY".equals(note.getStatus()) && note.getSenderNo() != ((User)SessionUtils.getAttribute("LOGINED_USER")).getNo()) {
			note.setStatus("READ");
			noteService.updateNote(note);
		}
		return noteService.getNoteDtoByNo(noteNo);
	}
	
	@PostMapping("deleteNote")
	public int deleteNote(@RequestBody List<Integer> noteNoArr) {
		for(int no : noteNoArr) {
			noteService.deleteNoteByNo(no);
		}
		
		return noteNoArr.size();
	}
	
	@RequestMapping("setRelationship")
	public String setRelationship(@RequestParam("userNo") int userNo, 
						@RequestParam("status") String status, @RequestParam("friendNo") int friendNo) {
		
		System.out.println("@@@@@@@@@@@  일촌 신청 수락/거절 메서드 실행됨 @@@@@@@@@@@@@@@");
		Map<String, Integer> nums = new HashMap<>();
		nums.put("userNo", userNo);
		nums.put("friendNo", friendNo);
		Relationship re =  noteService.findRelationship(nums);
		
		if(re != null) {
			re.setStatus(status);
			noteService.updateRelationship(re);
		}
		
		if("accept".equals(status)) {
			return re.getFriendNickName()+"님의 일촌 신청이 수락되었습니다.";
		}else {
			return re.getFriendNickName()+"님의 일촌 신청이 거절되었습니다.";
		}
	}
	
}








