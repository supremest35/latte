package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Task {

	private int no;
	private int deptNo;
	private int categoryNo;
	private int priorityNo;
	private int userNo;
	private int statusNo;
	private Date startDate;
	private Date dueDate;
	private Date completedDate;
	private String title;
	private String description;
	private Date createdDate;
	
}
