package com.yi.rentcar_project.model;

public class CarModel {
	private String car_code;
	private String name;
	private String color;
	private String gear;
	private Brand brand;
	private CarType cartype;
	private int basic_charge;
	private int hour6;
	private int hour10;
	private int hour12;
	private int hour_else;
	private Fuel fuel_code;
	private boolean is_rent;
	private int rent_cnt;
//	private List<CarOption> car_option;
	
	
	public CarModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public CarModel(String carCode, String name, int rentCnt) {
		super();
		this.car_code = carCode;
		this.name = name;
		this.rent_cnt = rentCnt;
	}


	public CarModel(String carCode, String name, String color, String gear, Brand brand, CarType carType,
			int basicCharge, int hour6, int hour10, int hour12, int hourElse, Fuel fuel, boolean isRent, int rentCnt) {
		super();
		this.car_code = carCode;
		this.name = name;
		this.color = color;
		this.gear = gear;
		this.brand = brand;
		this.cartype = carType;
		this.basic_charge = basicCharge;
		this.hour6 = hour6;
		this.hour10 = hour10;
		this.hour12 = hour12;
		this.hour_else = hourElse;
		this.fuel_code = fuel;
		this.is_rent = isRent;
		this.rent_cnt = rentCnt;
	}



	public CarModel(String carCode) {
		super();
		this.car_code = carCode;
	}
	//get, set
	
	public String getCarCode() {
		return car_code;
	}
	public int getBasicCharge() {
		return basic_charge;
	}
	public void setBasicCharge(int basicCharge) {
		this.basic_charge = basicCharge;
	}
	
	/*public List<CarOption> getCarOption() {
		return car_option;
	}
	public void setCarOption(List<CarOption> carOption) {
		this.car_option = carOption;
	}*/
	public void setCarCode(String carCode) {
		this.car_code = carCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getGear() {
		return gear;
	}
	public void setGear(String gear) {
		this.gear = gear;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}


	public CarType getCarType() {
		return cartype;
	}

	public void setCarType(CarType carType) {
		this.cartype = carType;
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
		return hour_else;
	}
	public void setHourElse(int hourElse) {
		this.hour_else = hourElse;
	}
	public Fuel getFuel() {
		return fuel_code;
	}
	public void setFuel(Fuel fuel) {
		this.fuel_code = fuel;
	}
	public boolean isRent() {
		return is_rent;
	}
	public void setRent(boolean isRent) {
		this.is_rent = isRent;
	}
	public int getRentCnt() {
		return rent_cnt;
	}
	public void setRentCnt(int rentCnt) {
		this.rent_cnt = rentCnt;
	}
	@Override
	public String toString() {
		return "CarModel [carCode=" + car_code + ", name=" + name + ", color=" + color + ", gear=" + gear + ", brand="
				+ brand + ", cartype=" + cartype + ", basicCharge=" + basic_charge + ", hour6=" + hour6 + ", hour10="
				+ hour10 + ", hour12=" + hour12 + ", hourElse=" + hour_else + ", fuel=" + fuel_code + ", isRent=" + is_rent
				+ ", rentCnt=" + rent_cnt + ", carOption=" + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((car_code == null) ? 0 : car_code.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		CarModel other = (CarModel) obj;
		if(other.car_code.equals(car_code)) {
			return true;
		}
		if(other.name.equals(name)) {
			return true;
		}
		return false;
	}
}
