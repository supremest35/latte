package com.example.latte.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.service.AcornService;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.MarketCategory;
import com.example.latte.form.AcornForm;

@Controller
@RequestMapping("/shopping/acorn")
public class AcornController {
	
	@Autowired
	AcornService acornService;

	@RequestMapping("/list.do")
	public String list(@RequestParam(name="catno", required=false, defaultValue="-1") int categoryNo,
			@RequestParam(name="pageno", required=false, defaultValue="1") int pageNo,
			@RequestParam(name="rows", required=false, defaultValue="4") int rows,
			Model model) {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
			
			MarketCategory category = acornService.getCategory(categoryNo);
			model.addAttribute("category", category);
		}
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1)*rows + 1);
		condition.put("end",  pageNo*rows);
		
		Map<String, Object> resultMap = acornService.getAcorns(condition);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("acorns", resultMap.get("acorns"));
		
		return "/shopping/acorn/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("acornno") int acornNo, Model model) {
		AcornItem acorn = acornService.getAcornDetail(acornNo);
		
		MarketCategory category = acornService.getCategory(acorn.getCategoryNo());
		
		model.addAttribute("acorn", acorn);
		model.addAttribute("category", category);
		
		return "/shopping/acorn/detail";
	}

	@RequestMapping("/form.do")
	public String acorn() {
		return "/shopping/acorn/form";
	}
	
	@RequestMapping("/register.do")
	public String register(AcornForm acornForm) throws IOException {
		
		System.out.println(acornForm);
		AcornItem acorn = new AcornItem();
		BeanUtils.copyProperties(acornForm, acorn);
				
		acornService.addNewAcorn(acorn);
		
		return "redirect:/shopping/main.do";
	}
	
}
