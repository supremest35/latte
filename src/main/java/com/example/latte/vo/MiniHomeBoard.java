package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MiniHomeBoard {

	private int no;
	private int folderNo;
	private int userNo;
	private String title;
	private String content;
	private String imgFilename;
	private String extraFilename;
	private int hitCnt;
	private int likeCnt;
	private int commentCnt;
	private Date createdDate;
}
