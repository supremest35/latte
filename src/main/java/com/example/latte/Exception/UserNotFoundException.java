package com.example.latte.Exception;

public class UserNotFoundException extends LatteException { //ShopException을 상속받는 UserNotFoundException

	public UserNotFoundException(String message) {
		super(message);
	}
	
	public UserNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
}
