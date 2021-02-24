package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Note {

	private int no;
	private int categoryNo;
	private int senderNo;
	private int recDeptNo;
	private int recipientNo;
	private String title;
	private String content;
	private String status;
	private Date createdDate;
	
}
