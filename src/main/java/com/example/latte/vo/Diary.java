package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Diary {

	private int no;
	private int miniHomeNo;
	private String title;
	private String content;
	private String secret;
	private int hitCnt;
	private int commentCnt;
	private int likeCnt;
	private String deleted;
	private Date createdDate;
	
}
