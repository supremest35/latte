package com.example.latte.dto;

import java.util.Date;

import com.example.latte.vo.User;

import lombok.Data;

@Data
public class VisitorNoteDto {

	private int no;
	private int miniHomeNo;
	private User user;
	private String content;
	private String secret;
	private String deleted;
	private Date createdDate;
}
