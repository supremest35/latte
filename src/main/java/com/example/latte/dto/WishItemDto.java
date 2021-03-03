package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class WishItemDto {

	private int itemNo;
	private int acornNo;
	private int categoryNo;
	private String acornName;
	private int acornPrice;
	private int acornAmount;
	private Date createdDate;
}
