package com.example.latte.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductForm {

	private int categoryNo;
	private int colorNo;
	private int mallNo;
	private String brandName;
	private String name;
	private int price;
	private int salePrice;
	private double discountRate;
	private String information;
	private String url;
	private MultipartFile photofile;
}
