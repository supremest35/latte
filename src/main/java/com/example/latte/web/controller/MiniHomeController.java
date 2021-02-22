package com.example.latte.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.service.MiniHomeService;
import com.example.latte.util.SessionUtils;
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

		return "minihome";
	}
}
