package com.example.latte.web.controller.rest;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.form.DiaryEventForm;
import com.example.latte.service.MiniHomeService;
import com.example.latte.service.UserService;
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.MiniHomeBoard;

@CrossOrigin("*")
@RestController("apiMiniHomeController")
@RequestMapping("/minihome/api")
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/diary/eventList/{start}&{end}&{miniHomeNo}")
	public List<DiaryEventForm> getDiaryEvents(@PathVariable("start") Date start, @PathVariable("end") Date end, @PathVariable("miniHomeNo") int miniHomeNo) {
		List<DiaryEventForm> diaryEventForms = new ArrayList<DiaryEventForm>();
		 
		Map<String, Object> opt = new HashMap<String, Object>();
		 opt.put("miniHomeNo", miniHomeNo); 
		 opt.put("start", start); 
		 opt.put("end", end);
		List<Diary> diaries = miniHomeService.getDiariesByOption(opt); 
		for (Diary diary : diaries) { 
			DiaryEventForm diaryEventForm = new DiaryEventForm();
			diaryEventForm.setId(diary.getNo());
			diaryEventForm.setTitle(diary.getTitle());
			diaryEventForm.setStart(diary.getCreatedDate());

			diaryEventForms.add(diaryEventForm); 
		}
		return diaryEventForms;
	}

	@GetMapping("/diary/{diaryNo}")
	public Diary getDiary(@PathVariable("diaryNo") int diaryNo) {
		return miniHomeService.getDiaryByNo(diaryNo);
	}

	@GetMapping("/folder/{parentFolderNo}")
	public List<Folder> getChildFolders(@PathVariable("parentFolderNo") int parentFolderNo) {
		return miniHomeService.getChildFoldersByParentFolderNo(parentFolderNo);
	}

	@GetMapping("/boards/{folderNo}&{pageNo}")
	public List<MiniHomeBoard> getBoards(@PathVariable("folderNo") int folderNo, @PathVariable("pageNo") int pageNo) {
		// 처음에는 16개가 보여지기때문에 무한스크롤이 시작하면 17번째부터 보여줘야됨(8개씩)
		int begin = (pageNo - 1)*4 + 13;
		int end = pageNo*4 + 12;
		
		Map<String, Object> opt = new HashMap<String, Object>();
		opt.put("folderNo", folderNo);
		opt.put("begin", begin);
		opt.put("end", end);
		return (List) miniHomeService.getBoardsByOption(opt).get("boards");
	}

	@GetMapping("/home/{miniHomeNo}&{pageNo}")
	public List<MiniHomeBoard> home(@PathVariable("miniHomeNo") int miniHomeNo, @PathVariable("pageNo") int pageNo) {
		// 처음에는 16개가 보여지기때문에 무한스크롤이 시작하면 17번째부터 보여줘야됨(8개씩)
		int begin = (pageNo - 1)*4 + 13;
		int end = pageNo*4 + 12;
		
		Map<String, Object> opt = new HashMap<String, Object>();
		opt.put("miniHomeNo", miniHomeNo);
		opt.put("begin", begin);
		opt.put("end", end);
		return miniHomeService.getAllBoardsByOption(opt);
	}
	
}
