package com.yi.rentcar_project.model;

public class RentCarOptions {
	private int option_id;	//옵션번호(0:없음, 1: seat, 2: blackbox, 3: sunroof)
	private String code;	//대여번호(R001, R002, ..)
	
	public RentCarOptions() {
		// TODO Auto-generated constructor stub
	}

	public RentCarOptions(int option_id, String code) {
		this.option_id = option_id;
		this.code = code;
	}

	public int getOption_id() {
		return option_id;
	}

	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return String.format("RentCarOptions [option_id=%s, code=%s]", option_id, code);
	}
	
}
