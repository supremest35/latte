package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {

	private int no;
	private int boardNo;
	private int userNo;
	private String nickname;
	private String commentContent;
	private int commentCnt;
	private int likeCnt;
	private Date createdDate;
}
