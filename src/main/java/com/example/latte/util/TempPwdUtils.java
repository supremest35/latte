package com.example.latte.util;

import java.util.Random;

public class TempPwdUtils {

	private static String[] arr = {"1","2","3","4","5","6","7","8","9","0",
			"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
			"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};   

	public static String generatePassword() {
		StringBuilder sb = new StringBuilder();

		Random random = new Random();
		for (int i=0; i<8; i++) {
			int index = random.nextInt(arr.length);
			String ch = arr[index];
			sb.append(ch);
		}
		return sb.toString();
	}

	//	   public static void main(String[] args) {
	//		
	//		   
	//		   System.out.println(TempPwdUtils.generatePassword());
	//	}
}
