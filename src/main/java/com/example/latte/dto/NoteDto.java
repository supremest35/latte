package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoteDto {

	private int noteNo;
	private int categoryNo;
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
	
	public String getSenderTotalName() {
		return this.senderName + " (" + this.senderNickNmae +")";
	}
	
	public String getRecTotalName() {
		return this.recName + " (" + this.recNickName +")";
	}
	
	
	
	
}
