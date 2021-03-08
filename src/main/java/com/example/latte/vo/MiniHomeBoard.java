package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MiniHomeBoard {

	private int no;
	private int folderNo;
	private int miniHomeNo;
	private int categoryNo;
	private String title;
	private String content;
	private String imgFilename;
	private String extraFilename;
	private int hitCnt;
	private int likeCnt;
	private int commentCnt;
	private String deleted;
	private Date createdDate;
}
