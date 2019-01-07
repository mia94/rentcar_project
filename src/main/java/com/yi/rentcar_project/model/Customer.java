package com.yi.rentcar_project.model;

import java.util.Date;
import java.util.List;

public class Customer {
	private String code;
	private String Id;
	private String passwd;
	private String name;
	private String zip_code;
	private String address;
	private String phone;
	private Date dob;
	private String email;
	private Employee emp_code;
	private String license;
	private Grade grade_code;
	private int rent_cnt;
	private List<CustomEvent> events;

	

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Customer(String id, String passwd) {
		super();
		Id = id;
		this.passwd = passwd;
	}



	public Customer(String id, String passwd, String name, String zipCode, String address, String phone, Date dob,
			String email, Employee empCode, String license, Grade gradeCode, int rentCnt) {

		this.Id = id;
		this.passwd = passwd;
		this.name = name;
		this.zip_code = zipCode;
		this.address = address;
		this.phone = phone;
		this.dob = dob;
		this.email = email;
		this.emp_code = empCode;
		this.license = license;
		this.grade_code = gradeCode;
		this.rent_cnt = rentCnt;
	}

	public Customer(String code, String id, String passwd, String name, String address, String phone, Date dob,
			String email, Employee empCode, String license, Grade gradeCode, int rentCnt, List<CustomEvent> events) {
		super();
		this.code = code;
		this.Id = id;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.dob = dob;
		this.email = email;
		this.emp_code = empCode;
		this.license = license;
		this.grade_code = gradeCode;
		this.rent_cnt = rentCnt;
		this.events = events;
	}

	public Customer(String id, String passwd, String name, String address, String phone, Date dob, String email,
			String license) {
		super();

		this.Id = id;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.dob = dob;
		this.email = email;
		this.license = license;
	}

	public Customer(String id, String passwd, String name, String address, String phone, java.util.Date cusDob,
			String email) {
		super();
		this.Id = id;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.dob = cusDob;
		this.email = email;
	}

	public Customer(String code, String name, Grade gradeCode, String phone, String email) {
		this.code = code;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.grade_code = gradeCode;
	}

	public Customer(String cusId) {
		this.Id = cusId;
	}



	/*
	 * @Override public String toString() { return String.format(
	 * "Customer [code=%s, id=%s, passwd=%s, name=%s, zipCode=%s, address=%s, phone=%s, dob=%s, email=%s, empCode=%s, license=%s, gradeCode=%s, rentCnt=%s, events=%s]"
	 * , code, id, passwd, name, zipCode, address, phone, dob, email, empCode,
	 * license, gradeCode, rentCnt, events); }
	 */

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Employee getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(Employee emp_code) {
		this.emp_code = emp_code;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public Grade getGrade_code() {
		return grade_code;
	}

	public void setGrade_code(Grade grade_code) {
		this.grade_code = grade_code;
	}

	public int getRent_cnt() {
		return rent_cnt;
	}

	public void setRent_cnt(int rent_cnt) {
		this.rent_cnt = rent_cnt;
	}

	public List<CustomEvent> getEvents() {
		return events;
	}

	public void setEvents(List<CustomEvent> events) {
		this.events = events;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		return result;
	}





	@Override
	public String toString() {
		return String.format(
				"Customer [code=%s, Id=%s, passwd=%s, name=%s, zip_code=%s, address=%s, phone=%s, dob=%s, email=%s, emp_code=%s, license=%s, grade_code=%s, rent_cnt=%s, events=%s]",
				code, Id, passwd, name, zip_code, address, phone, dob, email, emp_code, license, grade_code, rent_cnt,
				events);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		return true;
	}

}
