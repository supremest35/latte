package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TaskFiles {
	private int no;
	private int taskNo;
	private String name;
	private String description;
	private Date createdDate;
}
