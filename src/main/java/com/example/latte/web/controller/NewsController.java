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
	
	@RequestMapping("/EntSports.do")
	public String EntSports() {
		
		return "news/EntSports";
	}
	
	@RequestMapping("/Economy.do")
	public String economy() {
		
		return "news/Economy";
	}
	
	@RequestMapping("/itScience.do")
	public String itScience() {
		
		return "news/itScience";
	}
	
}
