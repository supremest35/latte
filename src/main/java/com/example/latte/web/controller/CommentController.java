package com.example.latte.web.controller;

import java.io.IOException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.form.CommentForm;
import com.example.latte.service.CommentService;
import com.example.latte.vo.Comment;

@Controller
@RequestMapping("/board/comment")
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@RequestMapping("/addComment.do")
	public String addComment(@RequestParam("boardNo") int boardNo, CommentForm commentForm, Model model) throws IOException {
		Comment comment = new Comment();
		BeanUtils.copyProperties(commentForm, comment);
		
		commentService.addComment(comment);
		
		return "redirect:detail.do?boardNo="+boardNo;
	}
}
