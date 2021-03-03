package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoteDto {

	private int noteNo;
	private String categoryName;
	private int senderNo;
	private String senderName;
	private String senderNickNmae;
	private String senderDept;
	private int recNo;
	private String recName;
	private String recNickName;
	private String recDept;
	private String title;
	private String content;
	private String status;
	private Date createdDate;
}
