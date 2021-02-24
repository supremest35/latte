package com.example.latte.form;

import lombok.Data;

@Data
public class NoteForm {

	private int categoryNo;
	private int senderNo;
	private int recipientNo;
	private String title;
	private String content;
}
