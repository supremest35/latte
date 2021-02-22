package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Profile {

	private int no;
	private int miniHomeNo;
	private String content;
	private String photoFilename;
	private Date createdDate;
}
