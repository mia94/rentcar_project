package com.yi.rentcar_project.model;

public class RentHour {
	private int hour6;
	private int hour10;
	private int hour12;
	private int hourElse;
	private int overHour;
	private int basicCharge;
	
	public RentHour() {
		// TODO Auto-generated constructor stub
	}

	public RentHour(int hour6, int hour10, int hour12, int hourElse, int overHour, int basicCharge) {
		this.hour6 = hour6;
		this.hour10 = hour10;
		this.hour12 = hour12;
		this.hourElse = hourElse;
		this.overHour = overHour;
		this.basicCharge = basicCharge;
	}

	public int getHour6() {
		return hour6;
	}

	public void setHour6(int hour6) {
		this.hour6 = hour6;
	}

	public int getHour10() {
		return hour10;
	}

	public void setHour10(int hour10) {
		this.hour10 = hour10;
	}

	public int getHour12() {
		return hour12;
	}

	public void setHour12(int hour12) {
		this.hour12 = hour12;
	}

	public int getHourElse() {
		return hourElse;
	}

	public void setHourElse(int hourElse) {
		this.hourElse = hourElse;
	}

	public int getOverHour() {
		return overHour;
	}

	public void setOverHour(int overHour) {
		this.overHour = overHour;
	}

	public int getBasicCharge() {
		return basicCharge;
	}

	public void setBasicCharge(int basicCharge) {
		this.basicCharge = basicCharge;
	}

	@Override
	public String toString() {
		return String.format("RentHour [hour6=%s, hour10=%s, hour12=%s, hourElse=%s, overHour=%s, basicCharge=%s]",
				hour6, hour10, hour12, hourElse, overHour, basicCharge);
	}
	
	public int getAddPrice() {
		if(overHour <= 24) {
			return getAddHourPrice();
		} else {
			int day = overHour / 24;
			overHour = overHour % 24;
			return day * basicCharge + getAddHourPrice();
		}
	}

	private int getAddHourPrice() {
		if (overHour < 6) {
			return hour6;
		} else if (overHour < 10) {
			return hour10;
		} else if (overHour <= 12) {
			return hour12;
		} else {
			return hourElse;
		}
	}
}
