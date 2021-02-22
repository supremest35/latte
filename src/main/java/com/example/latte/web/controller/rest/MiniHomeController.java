package com.example.latte.web.controller.rest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.MiniHomeService;
import com.example.latte.service.UserService;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
import com.example.latte.vo.VisitorNote;

@CrossOrigin("*")
@RestController("apiMiniHomeController")
@RequestMapping("/api")
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/profile/intro/{no}")
	public Profile getIntro(@PathVariable("no") int miniHomeNo) {
		return miniHomeService.getProfileByMiniHomeNo(miniHomeNo);
	}

	@GetMapping("/profile/keyword/{no}")
	public List<Keyword> getKeyword(@PathVariable("no") int profileNo) {
		return miniHomeService.getKeywordsByProfileNo(profileNo);
	}
	
	@GetMapping("/profile/qna/{no}")
	public List<Qna> getQna(@PathVariable("no") int profileNo) {
		return miniHomeService.getQnasByProfileNo(profileNo);
	}

	@GetMapping("/profile/basicInfo/{no}")
	public User getbasicInfo(@PathVariable("no") int userNo) {
		return userService.getUserByNo(userNo);
	}

	@GetMapping("/photo/parentFolder/{miniHomeNo}&{categoryNo}")
	public List<Folder> getParentFolders(@PathVariable("miniHomeNo") int miniHomeNo, @PathVariable("categoryNo") int categoryNo) {
		return miniHomeService.getParentFoldersByMiniHomeNoAndCategoryNo(miniHomeNo, categoryNo);
	}

	@GetMapping("/visitorNote/{miniHomeNo}&{index}")
	public VisitorNote getVisitorNote(@PathVariable("miniHomeNo") int miniHomeNo, @PathVariable("index") int index) {
		return miniHomeService.getVisitorNoteByMiniHomeNoAndIndex(miniHomeNo, index);
	}
	
	
}
