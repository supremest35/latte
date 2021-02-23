package com.example.latte.dto;

import lombok.Data;

@Data
public class WishItemDto {

	private int itemNo;
	private int categoryNo;
	private int acornNo;
	private String acornName;
	private int itemPrice;
	private int itemAmount;
}
