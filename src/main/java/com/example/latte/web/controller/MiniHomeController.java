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
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
import com.example.latte.vo.WelcomeNote;

@Controller
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/minihome.do")
	public String minihome(@RequestParam(name="miniHomeNo", required = false, defaultValue = "-1") int miniHomeNo, Model model) {
		
		MiniHome miniHome = null;
		User hostUser = null;
		
		if (miniHomeNo != -1) {
			miniHome = miniHomeService.getMiniHomeByNo(miniHomeNo);
			hostUser = userService.getUserByNo(miniHome.getUserNo());
		} else {
			hostUser = (User) SessionUtils.getAttribute("LOGINED_USER");
			miniHome = miniHomeService.getMiniHomeByUserNo(hostUser.getNo());
			
		}
		
		Map<String, Object> hostUserInfo = new HashMap<String, Object>();
		hostUserInfo.put("no", hostUser.getNo());
		hostUserInfo.put("id", hostUser.getId());
		hostUserInfo.put("name", hostUser.getName());
		hostUserInfo.put("nickName", hostUser.getNickName());
		
		model.addAttribute("miniHome", miniHome);
		model.addAttribute("hostUser", hostUserInfo);
		
		return "minihome/minihome";
	}

	@RequestMapping("/sideSection.do")
	public String sideSection(@RequestParam("sectionId") String sectionId, @RequestParam("miniHomeNo") int miniHomeNo, Model model) {
		
	
		if ("#home-section".equals(sectionId) || "#visitor-section".equals(sectionId)) {
			WelcomeNote welcomeNote = miniHomeService.getWelcomeNoteByMiniHomeNo(miniHomeNo);
			welcomeNote.setPhotoFilename("/resources/images/miniHome/" + welcomeNote.getPhotoFilename());
			model.addAttribute("welcomeNote", welcomeNote);
		} else if ("#diary-section".equals(sectionId)) {
			
		} else if ("#photo-section".equals(sectionId)) {
			
		} else if ("#video-section".equals(sectionId)) {
			
		} else if ("#board-section".equals(sectionId)) {
			
		}
		
		return "minihome/sideSection";
	}

	@RequestMapping("/mainSection.do")
	public String mainSection(@RequestParam("contentId") String contentId, @RequestParam("miniHomeNo") int miniHomeNo, Model model) {
		if ("#profile-intro".equals(contentId)) {
			Profile profile = miniHomeService.getProfileByMiniHomeNo(miniHomeNo);
			profile.setPhotoFilename("/resources/images/miniHome/" + profile.getPhotoFilename());
			
			model.addAttribute("profile", profile);
		} else if ("#profile-keyword".equals(contentId)) {
			List<Keyword> keywords = miniHomeService.getKeywordsByProfileNo(miniHomeNo);
			
			model.addAttribute("keywords", keywords);
		} else if ("#profile-qna".equals(contentId)) {
			List<Qna> qnas = miniHomeService.getQnasByProfileNo(miniHomeNo);
			
			model.addAttribute("qnas", qnas);
		} else if ("#profile-basicInfo".equals(contentId)) {
			MiniHome miniHome = miniHomeService.getMiniHomeByNo(miniHomeNo);
			User hostUser = userService.getUserByNo(miniHome.getUserNo());
			
			Map<String, Object> hostUserInfo = new HashMap<String, Object>();
			hostUserInfo.put("no", hostUser.getNo());
			hostUserInfo.put("id", hostUser.getId());
			hostUserInfo.put("name", hostUser.getName());
			hostUserInfo.put("nickName", hostUser.getNickName());
			hostUserInfo.put("birthday", hostUser.getBirthday());
			hostUserInfo.put("tel", hostUser.getTel());
			hostUserInfo.put("address", hostUser.getAddress());
			
			model.addAttribute("hostUser", hostUserInfo);
		} else if ("#diary-section".equals(contentId)) {
			model.addAttribute("diary", miniHomeService.getLatestDiaryByMiniHomeNo(miniHomeNo));
		}
		return "minihome/mainSection";
	}
}
