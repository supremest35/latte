package com.example.latte.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.Exception.FailedLoginException;
import com.example.latte.Exception.PasswordMismatchException;
import com.example.latte.Exception.UserNotFoundException;
import com.example.latte.dao.BoardDao;
import com.example.latte.dto.CommentDto;
import com.example.latte.form.BoardForm;
import com.example.latte.form.CommentForm;
import com.example.latte.form.ModifyForm;
import com.example.latte.service.BoardService;
import com.example.latte.service.CategoryService;
import com.example.latte.service.CommentService;
import com.example.latte.service.LikeService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.util.StringUtils;
import com.example.latte.vo.Board;
import com.example.latte.vo.BoardDto;
import com.example.latte.vo.Category;
import com.example.latte.vo.Comment;
import com.example.latte.vo.DisLike;
import com.example.latte.vo.Like;
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
	@Autowired
	CommentService commentService;
	@Autowired
	LikeService likeService;

	@RequestMapping("/index.do")
	public String index(@RequestParam(name = "catno", required = false, defaultValue = "100") int categoryNo,
						@RequestParam(name="pageno", required = false, defaultValue="1") int pageNo,
						@RequestParam(name="rows", required = false, defaultValue = "5") int rows, 
						Model model) {
		
		 if (categoryNo == 100) { Category category =
				  categoryService.getCategoryByNo(categoryNo); model.addAttribute("category",category);
				  
				  List<BoardDto> boards = boardService.getBestByLikeCnt();
				 System.out.println("보드컨트롤러" + boards); 
				 model.addAttribute("boards", boards);
		 } else {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		if(categoryNo != 100) {
			condition.put("categoryNo", categoryNo);
			Category category = categoryService.getCategoryByNo(categoryNo);
			model.addAttribute("category", category);
		}
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo-1)*rows+1);
		condition.put("end", pageNo*rows);
		
		Map<String, Object> resultMap = boardService.getBoardDtoList(condition);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("boards", resultMap.get("boardDto"));
		 }
		 
		 return "board/index";
		
		
		
		
		 
		  
		   /*else { Category category = categoryService.getCategoryByNo(categoryNo);
		  model.addAttribute("category", category);
		  
		  List<BoardDto> boards = boardService.getAllBoardDtoByCategoryNo(categoryNo);
		  model.addAttribute("boards", boards); System.out.println(boards); }*/
		 

		
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
	public String detail(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int categoryNo, Model model) {
		Category category = categoryService.getCategoryByNo(categoryNo);
		model.addAttribute("category", category);

		BoardDto dto = boardService.getBoardDtoByNo(boardNo);
		model.addAttribute("dto", dto);

		List<CommentDto> comments = commentService.getAllCommentsByBno(boardNo);
		model.addAttribute("comments", comments);

		/*
		 * int loginedUserNo = (int)SessionUtils.getAttribute("LOGINED_USER_NO");
		 * model.addAttribute("loginedUserNo", loginedUserNo);
		 */

		return "board/detail";
	}

	@RequestMapping("/commentInsert.do")
	public String commentInsert(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int categoryNo,
			CommentForm commentForm, Model model) {
		System.out.println(boardNo);
		System.out.println(categoryNo);
		System.out.println(commentForm);
		Comment comment = new Comment();
		BeanUtils.copyProperties(commentForm, comment);

		int userNo = (int) SessionUtils.getAttribute("LOGINED_USER_NO");
		comment.setUserNo(userNo);
		commentService.addComment(comment);
		System.out.println(comment);

		return "redirect:detail.do?boardNo=" + boardNo + "&catno=" + categoryNo;
	}

	@RequestMapping("/loginform.do")
	public String loginform(Model model) {

		return "board/loginform";
	}

	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String userId, @RequestParam("password") String password) {
		if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(password)) {
			return "redirect:loginform.do?error=empty";
		}

		try {
			User user = userService.getLoginedUserInfo(userId, password);

			SessionUtils.setAttribute("LOGINED_USER", user);
			SessionUtils.setAttribute("LOGINED_USER_NO", user.getNo());
			SessionUtils.setAttribute("LOGINED_USER_NAME", user.getName());
			SessionUtils.setAttribute("LOGINED_USER_NICKNAME", user.getNickName());
		} catch (UserNotFoundException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=notfount";
		} catch (PasswordMismatchException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=mismatch";
		}

		return "redirect:index.do";
	}

	@RequestMapping("/logout.do")
	public String logout() {
		SessionUtils.removeAttribute("LOGINED_USER_NO");
		SessionUtils.removeAttribute("LOGINED_USER_NAME");
		SessionUtils.removeAttribute("LOGINED_USER_NICKNAME");

		return "redirect:index.do";
	}

	@RequestMapping("/register.do")
	public String registerForm(BoardForm boardForm, Model model) throws IOException {

		Board board = new Board();
		BeanUtils.copyProperties(boardForm, board);
		System.out.println("보드컨트롤러: " + board);

		MultipartFile photofile = boardForm.getPhotofile();
		System.out.println(photofile);
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;
			File file = new File(directory, filename);
			FileCopyUtils.copy(photofile.getInputStream(), new FileOutputStream(file));
			board.setImageFilename(filename);
		} else {
			board.setImageFilename(null);
		}

		boardService.insertBoard(board);

		Board savedBoard = boardService.getBoardByNo(board.getNo());
		int savedCatno = savedBoard.getCategoryNo();
		System.out.println(savedCatno);

		SessionUtils.getAttribute("LOGINED_USER_NO");

		return "redirect:index.do?catno=" + savedCatno;
	}

	@RequestMapping("/like.do")
	public String like(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int categoryNo) {
		int userNo = (int) SessionUtils.getAttribute("LOGINED_USER_NO");
		Like savedLike = likeService.getLikeByBoardNoAndUserNo(boardNo, userNo);

		if (savedLike == null) {
			likeService.insertLikes(boardNo, userNo);

			Board savedBoard = boardService.getBoardByNo(boardNo);
			savedBoard.setLikeCnt(savedBoard.getLikeCnt() + 1);
			boardService.updateBaord(savedBoard);
		}

		return "redirect:detail.do?boardNo=" + boardNo + "&catno=" + categoryNo;
	}

	@RequestMapping("/dislike.do")
	public String dislike(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int categoryNo) {
		int userNo = (int) SessionUtils.getAttribute("LOGINED_USER_NO");
		DisLike savedDisLike = likeService.getDisLikeByBoardNoAndUserNo(boardNo, userNo);

		if (savedDisLike == null) {
			likeService.insertDisLikes(boardNo, userNo);

			Board savedBoard = boardService.getBoardByNo(boardNo);
			savedBoard.setDislikeCnt(savedBoard.getDislikeCnt() + 1);
			boardService.updateBaord(savedBoard);
		}

		return "redirect:detail.do?boardNo=" + boardNo + "&catno=" + categoryNo;
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int categoryNo) {
		Board savedBoard = boardService.getBoardByNo(boardNo);
		savedBoard.setDeleted("Y");
		boardService.updateBaord(savedBoard);
		
		return "redirect:index.do";
	}

	/* 글수정 보류
	 * @RequestMapping("/modifyform.do") public String
	 * modifyform(@RequestParam("boardNo") int boardNo, @RequestParam("catno") int
	 * categoryNo, Model model) { Category category =
	 * categoryService.getCategoryByNo(categoryNo); model.addAttribute("category",
	 * category);
	 * 
	 * Board board = boardService.getBoardByNo(boardNo); model.addAttribute("board",
	 * board);
	 * 
	 * return "board/modifyform"; }
	 * 
	 * @RequestMapping("/modify.do") public String modify(@RequestParam("boardNo")
	 * int boardNo, @RequestParam("catno") int categoryNo, ModifyForm modifyForm,
	 * Model model) { Board board = new Board();
	 * BeanUtils.copyProperties(modifyForm, board);
	 * System.out.println("보드컨트롤러에서의 boardDto:"+board);
	 * boardService.updateBaord(board);
	 * 
	 * return "redirect:detail.do?boardNo="+boardNo+"&catno="+categoryNo; }
	 */

}
