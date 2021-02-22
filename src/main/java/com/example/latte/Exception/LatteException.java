package com.example.latte.Exception;

public class LatteException extends RuntimeException{

	public LatteException() {}

	public LatteException(String message) {
		super(message);
	}
	
	public LatteException(String message, Throwable cause) {
		super(message,cause);
	}
}
