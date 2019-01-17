package com.yi.rentcar_project.model;

public class RentDate {
	private String chk_start_date;
	private String chk_end_date;
	private String chk_id;
	
	public RentDate() {
		// TODO Auto-generated constructor stub
	}

	public RentDate(String chk_start_date, String chk_end_date, String chk_id) {
		this.chk_start_date = chk_start_date;
		this.chk_end_date = chk_end_date;
		this.chk_id = chk_id;
	}

	public String getChk_start_date() {
		return chk_start_date;
	}

	public void setChk_start_date(String chk_start_date) {
		this.chk_start_date = chk_start_date;
	}

	public String getChk_end_date() {
		return chk_end_date;
	}

	public void setChk_end_date(String chk_end_date) {
		this.chk_end_date = chk_end_date;
	}

	public String getChk_id() {
		return chk_id;
	}

	public void setChk_id(String chk_id) {
		this.chk_id = chk_id;
	}

	@Override
	public String toString() {
		return String.format("RentDate [chk_start_date=%s, chk_end_date=%s, chk_id=%s]", chk_start_date, chk_end_date,
				chk_id);
	}

}
