package com.example.latte.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.service.MiniHomeService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;

@Controller
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@RequestMapping("/minihome.do")
	public String minihome(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		Map<String, Object> miniHomeInfo = miniHomeService.getMiniHomeInfo(user.getNo());
		
		model.addAttribute("miniHomeInfo", miniHomeInfo);

		return "minihome/minihome";
	}

	@RequestMapping("/sideSection.do")
	public String sideSection() {
		return "minihome/sideSection";
	}

	@RequestMapping("/mainSection.do")
	public String mainSection(@RequestParam("contentId") String contentId, Model model) {
		if ("#profile-intro".equals(contentId)) {
			Profile profile = miniHomeService.getProfileByMiniHomeNo(1);
			profile.setPhotoFilename("../resources/images/miniHome/" + profile.getPhotoFilename());
			
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
