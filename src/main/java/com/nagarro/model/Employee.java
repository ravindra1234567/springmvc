package com.nagarro.model;

public class Employee {
	private int id;
	private int employeeCode;
	private String employeeName;
	private String email;
	private String dob;
	private String location;

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(int id, int employeeCode, String employeeName, String email, String dob, String location) {
		super();
		this.id = id;
		this.employeeCode = employeeCode;
		this.employeeName = employeeName;
		this.email = email;
		this.dob = dob;
		this.location = location;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(int employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", employeeCode=" + employeeCode + ", employeeName=" + employeeName + ", email="
				+ email + ", dob=" + dob + ", location=" + location + "]";
	}

}
