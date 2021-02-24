package com.example.latte.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.service.MiniHomeService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.WelcomeNote;

@Controller
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/minihome.do")
	public String minihome(@RequestParam(name="miniHomeNo", required = false, defaultValue = "-1") int miniHomeNo, Model model) {
		Map<String, Object> opt = new HashMap<String, Object>();
		opt.put("userNo", SessionUtils.getAttribute("LOGINED_USER_NO"));
		opt.put("miniHomeNo", miniHomeNo);
		
		Map<String, Object> miniHomeInfo = miniHomeService.getMiniHomeInfoByOption(opt);
		model.addAttribute("miniHome", miniHomeInfo.get("miniHome"));
		model.addAttribute("hostUser", miniHomeInfo.get("hostUser"));
		return "minihome/minihome";
	}

	@RequestMapping("/sideSection.do")
	public String sideSection(@RequestParam("sectionId") String sectionId, @RequestParam("miniHomeNo") int miniHomeNo, Model model) {
		WelcomeNote welcomeNote = miniHomeService.getWelcomeNoteByMiniHomeNo(miniHomeNo);
		welcomeNote.setPhotoFilename("/resources/images/miniHome/" + welcomeNote.getPhotoFilename());
		model.addAttribute("welcomeNote", welcomeNote);
		return "minihome/sideSection";
	}

	@RequestMapping("/mainSection.do")
	public String mainSection(@RequestParam("contentId") String contentId, Model model) {
		if ("#profile-intro".equals(contentId)) {
			Profile profile = miniHomeService.getProfileByMiniHomeNo(1);
			profile.setPhotoFilename("/resources/images/miniHome/" + profile.getPhotoFilename());
			
			model.addAttribute("profile", profile);
		} else if ("#profile-keyword".equals(contentId)) {
			List<Keyword> keywords = miniHomeService.getKeywordsByProfileNo(1);
			
			model.addAttribute("keywords", keywords);
		} else if ("#profile-qna".equals(contentId)) {
			List<Qna> qnas = miniHomeService.getQnasByProfileNo(1);
			
			model.addAttribute("qnas", qnas);
		}
		return "minihome/mainSection";
	}
}
