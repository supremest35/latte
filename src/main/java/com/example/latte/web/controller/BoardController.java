package com.example.latte.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.dao.BoardDao;
import com.example.latte.form.BoardForm;
import com.example.latte.service.BoardService;
import com.example.latte.service.CategoryService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.util.StringUtils;
import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;
import com.example.latte.vo.Category;
import com.example.latte.vo.User;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Value("${directory.board.photo}")
	String directory;

	@Autowired
	BoardService boardService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/index.do")
	public String index(@RequestParam(name="catno", required = false, defaultValue = "100") int categoryNo, Model model) {
		Category category = categoryService.getCategoryByNo(categoryNo);
		model.addAttribute("category", category);

		List<BoardDto> boardDto = boardService.getAllBoardDtoByCategoryNo(categoryNo);
		model.addAttribute("boardDto", boardDto);
		
		
		return "board/index";
	}
	
	
	@RequestMapping("/form.do")
	public String form(@RequestParam("catno") int categoryNo, Model model) {
		Category category = categoryService.getCategoryByNo(categoryNo);
		model.addAttribute("category", category);
		
		List<Category> categories = boardService.getAllCategories();
		model.addAttribute("categories", categories);
		return "board/form";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("boardNo") int boardNo, 
			@RequestParam("catno") int categoryNo, Model model) {
			Category category = categoryService.getCategoryByNo(categoryNo);
			model.addAttribute("category", category);
		
			BoardDto dto = boardService.getBoardDtoByNo(boardNo);
			model.addAttribute("dto", dto);
		return "board/detail";
	}
	
	@RequestMapping("/loginform.do")
	public String loginform(Model model) {
		
		return "board/loginform";
	}
	
	
	
	@RequestMapping("/register.do")
	public String registerForm(BoardForm boardForm) throws  IOException {
		Board board = new Board();
		BeanUtils.copyProperties(boardForm, board);
		
		MultipartFile photofile = boardForm.getPhotofile();
		System.out.println(photofile);
		if(!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis()+filename;
			File file = new File(directory, filename);
			FileCopyUtils.copy(photofile.getInputStream(), new FileOutputStream(file));
			board.setImageFilename(filename);
		} else {
			board.setImageFilename(null);
		}
		
		boardService.insertBoard(board);
		
		Board savedBoard = boardService.getBoardByNo(board.getNo());
		int savedCatno = savedBoard.getCategoryNo();
		return "redirect:index.do?catno="+savedCatno;
	}
	
	@RequestMapping("/like.do")
	public String like(@RequestParam("boardNo") int boardNo) {
		
		return null;
	}
	
	
	
	
}
