package com.yi.rentcar_project.model;

public class UserPic {
	private String carCode;  
	private byte[] pic;
	
	public String getCarCode() {
		return carCode;
	}
	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	
	@Override
	public String toString() {
		return String.format("UserPic [carCode=%s, pic=%s]", carCode, pic.length);
	}
}
