package com.yi.rentcar_project.model;

public class Rent {
	private String code;	//대여코드(R001, R002, ..)
	private String start_date;	//대여일 2019-01-07
	private String start_time;	//대여시간 12:00:00
	private String end_date;	//반납일
	private String end_time;	//반납시간
	private boolean is_return;	//반납여부
	private int basic_price;	//차량 기본 요금
	private CarModel car_code;	//차량코드(V001, V002, ..)
	private Customer customer_code;	//고객코드(C001, C002, ..)
	private Insurance insurance_code;	//보험코드(I001, I002, ..)
	private String e_code;		//이벤트코드(EVT1, EVT2, ..)
	private int opt_price;		//옵션비용
	
	public Rent() {
		// TODO Auto-generated constructor stub
	}

	public Rent(String code, String start_date, String start_time, String end_date, String end_time, boolean is_return,
			int basic_price, CarModel car_code, Customer customer_code, Insurance insurance_code, String e_code,
			int opt_price) {
		this.code = code;
		this.start_date = start_date;
		this.start_time = start_time;
		this.end_date = end_date;
		this.end_time = end_time;
		this.is_return = is_return;
		this.basic_price = basic_price;
		this.car_code = car_code;
		this.customer_code = customer_code;
		this.insurance_code = insurance_code;
		this.e_code = e_code;
		this.opt_price = opt_price;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public boolean isIs_return() {
		return is_return;
	}

	public void setIs_return(boolean is_return) {
		this.is_return = is_return;
	}

	public int getBasic_price() {
		return basic_price;
	}

	public void setBasic_price(int basic_price) {
		this.basic_price = basic_price;
	}

	public CarModel getCar_code() {
		return car_code;
	}

	public void setCar_code(CarModel car_code) {
		this.car_code = car_code;
	}

	public Customer getCustomer_code() {
		return customer_code;
	}

	public void setCustomer_code(Customer customer_code) {
		this.customer_code = customer_code;
	}

	public Insurance getInsurance_code() {
		return insurance_code;
	}

	public void setInsurance_code(Insurance insurance_code) {
		this.insurance_code = insurance_code;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public int getOpt_price() {
		return opt_price;
	}

	public void setOpt_price(int opt_price) {
		this.opt_price = opt_price;
	}

	@Override
	public String toString() {
		return String.format(
				"Rent [code=%s, start_date=%s, start_time=%s, end_date=%s, end_time=%s, is_return=%s, basic_price=%s, car_code=%s, customer_code=%s, insurance_code=%s, e_code=%s, opt_price=%s]",
				code, start_date, start_time, end_date, end_time, is_return, basic_price, car_code, customer_code,
				insurance_code, e_code, opt_price);
	}

	
	
}
