package com.example.latte.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@RequestMapping("/main.do")
	public String newsMain() {
		return "news/main";
	}
	@RequestMapping("/detail.do")
	public String newsDetail() {
		return "news/detail";
	}
}
