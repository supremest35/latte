package com.example.latte.form;

import lombok.Data;

@Data
public class CommentForm {

	private int boardNo;
	private String content;
	
	public CommentForm() {}
}
