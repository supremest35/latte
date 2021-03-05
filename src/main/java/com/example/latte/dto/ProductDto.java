package com.example.latte.dto;

import lombok.Data;

@Data
public class ProductDto {

	private int no;
	private int categoryNo;
	private int categoryMidNo;
	private int categoryLowNo;
	private int colorNo;
	private String productBrandName;
	private String productCd;
	private String productName;
	private int minPrice;
	private int maxPrice;
	private int hitCnt;
	private String photoFilename;
}
