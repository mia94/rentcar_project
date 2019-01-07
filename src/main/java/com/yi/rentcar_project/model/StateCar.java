package com.yi.rentcar_project.model;

public class StateCar {
	
	private String title;
	private int count;
	private String type;	//�� ����
	private String brand;
	private String name;	//�� �̸�
	private String customerCode;	//�� �ڵ�
	
	public StateCar() {
		// TODO Auto-generated constructor stub
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		return String.format("StateCar [title=%s, count=%s, type=%s, brand=%s, name=%s, customerCode=%s]", title, count,
				type, brand, name, customerCode);
	}	
}
