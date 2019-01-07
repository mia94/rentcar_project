package com.yi.rentcar_project.model;

public class Insurance {
	private String code;		//보험코드(I001, I002, ..)
	private String car_type;	//차종(S0, S1, S2, ..)
	private int price;			//보험 비용
	
	public Insurance() {
		// TODO Auto-generated constructor stub
	}

	public Insurance(String code, String car_type, int price) {
		this.code = code;
		this.car_type = car_type;
		this.price = price;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCar_type() {
		return car_type;
	}

	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return String.format("Insurance [code=%s, car_type=%s, price=%s]", code, car_type, price);
	}
	
}
