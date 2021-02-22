package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

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
	private String imageFilename;
	private Date createdDate;

}
