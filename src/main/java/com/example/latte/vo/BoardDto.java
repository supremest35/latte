package com.example.latte.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDto {

	private int no;
	private int categoryNo;
	private String title;
	private int userNo;
	private String content;
	private int hitCnt;
	private int commentCnt;
	private int likeCnt;
	private int dislikeCnt;
	private String deleted;
	@JsonFormat(pattern = "yyyy년 MM월 d일")
	private Date createdDate;
	private String imageFilename;
	private String nickname;
	private String commentContent;
	private int commentLikeCnt;
	@JsonFormat(pattern = "yyyy년 MM월 d일")
	private Date commentCreatedDate;
	private String categoryName;
	
}
