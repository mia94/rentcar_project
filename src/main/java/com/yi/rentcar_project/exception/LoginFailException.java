package com.yi.rentcar_project.exception;

@SuppressWarnings("serial")
public class LoginFailException extends Exception {

	public LoginFailException(String message) {
		super(message); //부모호출
	}

}
