package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AcornHistory {

	private int no;
	private int userNo;
	private String content;
	private Integer orderNo;
	private int acornAmount;
	private Date createdDate;
}
