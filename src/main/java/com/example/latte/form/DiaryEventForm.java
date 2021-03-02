package com.example.latte.form;

import java.util.Date;

import lombok.Data;

@Data
public class DiaryEventForm {

	private int id;
	private String title;
	private Date start;
}
