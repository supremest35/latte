package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WelcomeNote {

	private int no;
	private int miniHomeNo;
	private String emotion;
	private String photoFilename;
	private String content;
	private String display;
	private String deleted;
	private Date createdDate;
}
