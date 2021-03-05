package com.example.latte.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.service.AcornService;
import com.example.latte.service.MarketCategoryService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.AcornItemComment;
import com.example.latte.vo.AcornItemLike;
import com.example.latte.vo.MarketMidCategory;
import com.example.latte.vo.User;

import com.example.latte.dto.AcornItemCommentDto;
import com.example.latte.form.AcornForm;

@Controller
@RequestMapping("/shopping/acorn")
public class AcornController {
	
	@Autowired
	AcornService acornService;
	@Autowired
	MarketCategoryService marketCategoryService;

	@RequestMapping("/list.do")
	public String list(@RequestParam(name="catno", required=false, defaultValue="-1") int categoryNo,
			@RequestParam(name="pageno", required=false, defaultValue="1") int pageNo,
			@RequestParam(name="rows", required=false, defaultValue="10") int rows,
			Model model) {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
			
			MarketMidCategory category = marketCategoryService.getMidCategory(categoryNo);
			model.addAttribute("category", category);
		}
		condition.put("pageno", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1)*rows + 1);
		condition.put("end",  pageNo*rows);
		
		Map<String, Object> resultMap = acornService.getAcorns(condition);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("acorns", resultMap.get("acorns"));
		
		return "/shopping/acorn/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("acornno") int acornNo,
			@RequestParam(name="catno", required=false, defaultValue="-1") int categoryNo,
			@RequestParam(name="pageno", defaultValue="1") int pageNo,
			@RequestParam(name="reviewpageno", required=false, defaultValue="1") int commentPageNo,
			Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		AcornItem acorn = acornService.getAcornDetail(acornNo);
		MarketMidCategory category = marketCategoryService.getMidCategory(acorn.getCategoryMidNo());
		
		final int ROWS_PER_PAGE = 5;
		int begin = (commentPageNo-1)*ROWS_PER_PAGE+1;
		int end = commentPageNo*ROWS_PER_PAGE;
		
		int totalCount = acornService.getCommentsCountByAcornNo(acornNo);
		int totalPages = (int) (Math.ceil((double) totalCount/ROWS_PER_PAGE));
		
		List<AcornItemCommentDto> commentDtoList = new ArrayList<>();
		if (user == null) {
			commentDtoList = acornService.getCommentDtosByRangeWithoutUserNo(acornNo, begin, end);
		} else {
			commentDtoList = acornService.getCommentDtosByRange(acornNo, user.getNo(), begin, end);
		}
		System.out.println("댓글리스트: "+commentDtoList);
		
		model.addAttribute("acorn", acorn);
		model.addAttribute("category", category);
		model.addAttribute("pageno", pageNo);
		
		model.addAttribute("comments", commentDtoList);
		model.addAttribute("commentpageno", commentPageNo);
		model.addAttribute("totalpages", totalPages);
		
		return "/shopping/acorn/detail";
	}
	
	@RequestMapping("/insertLikeCnt.do")
	public String insertLikeCnt(@RequestParam("acornno") int acornNo,
			@RequestParam("catno") int categoryNo,
			Model model){
		
		System.out.println("도토리번호:"+acornNo);
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:../acorn/list.do?catno="+categoryNo;
		}
		
		AcornItemLike likeUser = acornService.getAcornItemLike(acornNo, user.getNo());
		
		if (likeUser == null) {
			AcornItemLike itemLike = new AcornItemLike();
			itemLike.setAcornItemNo(acornNo);
			itemLike.setUserNo(user.getNo());
			acornService.insertAcornItemLike(itemLike);
			
			AcornItem acorn = acornService.getAcornByNo(acornNo);
			System.out.println("도토리상품:"+acorn);
			acorn.setLikeCnt(acorn.getLikeCnt()+1);
			acornService.updateAcorn(acorn);
		} 
		
		return "redirect:../acorn/list.do?catno="+categoryNo;
		
	}
	
	@RequestMapping("/insertComment.do")
	public String insertComment(@RequestParam("acornno") int acornNo,
			@RequestParam(name="pageno", defaultValue="1") int pageNo,
			@RequestParam("content") String content) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		AcornItemComment comment = new AcornItemComment();
		comment.setUserNo(user.getNo());
		comment.setItemNo(acornNo);
		comment.setContent(content);
		acornService.insertComment(comment);
		
		AcornItem acorn = acornService.getAcornByNo(acornNo);
		acorn.setCommentCnt(acorn.getCommentCnt()+1);
		acornService.updateAcorn(acorn);
		
		return "redirect:/shopping/acorn/detail.do?acornno="+acornNo;
	}
	
	@RequestMapping("/likeComment.do")
	public String likeComment(@RequestParam("commentno") int commentNo,
			@RequestParam("acornno") int acornNo) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		acornService.insertCommentLike(commentNo, user.getNo());
		
		AcornItemComment comment = acornService.getCommentByNo(commentNo);
		comment.setLikeCnt(comment.getLikeCnt() + 1);
		acornService.updateComment(comment);;
		
		return "redirect:/shopping/acorn/detail.do?acornno="+acornNo+"&commentno="+commentNo;
	}

	@RequestMapping("/form.do")
	public String acorn(Model model) {
		List<MarketMidCategory> acornCategories = marketCategoryService.getMidCategories(600); 
		
		model.addAttribute("acornCategories", acornCategories);
		
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
