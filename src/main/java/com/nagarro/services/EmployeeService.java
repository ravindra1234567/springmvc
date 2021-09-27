package com.nagarro.services;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.nagarro.model.Employee;

public class EmployeeService {

	private final static String EMP = "/employees";
	private final static String EMP_AND_ID = "/employees/{id}";
	private final static String SERVER_URI = "http://localhost:8081";
	private final static RestTemplate restTemplate = new RestTemplate();

	// Method to get all the employees
	public static List<Employee> getAllEmployee() {
		ResponseEntity<List<Employee>> empResponse = restTemplate.exchange(SERVER_URI + EMP, HttpMethod.GET, null,
				new ParameterizedTypeReference<List<Employee>>() {
				});
		List<Employee> emps = empResponse.getBody();
		return emps;
	}

	public static Employee getEmployee(int id) {
		Employee emp = restTemplate.getForObject(SERVER_URI + EMP_AND_ID, Employee.class, id);
		return emp;
	}

	public static void createEmployee(Employee employee) {
		restTemplate.postForObject(SERVER_URI + EMP, employee, Employee.class);
	}

	public static void updateEmployee(Employee employee) {
		String Url = SERVER_URI + EMP + "/" + employee.getId();
		System.out.println("id === " + employee.getId());
		HttpHeaders headers = new HttpHeaders();
		headers.set("X-COM-PERSIST", "true");
		HttpEntity<Employee> requestUpdate = new HttpEntity<Employee>(employee, headers);
		restTemplate.exchange(Url, HttpMethod.PUT, requestUpdate, Void.class);
	}

	public static void deleteEmployee(int id) {
		System.out.println("delete id = " + id);
		System.out.println(SERVER_URI + EMP_AND_ID + id);
		restTemplate.delete(SERVER_URI + EMP_AND_ID, id);
	}
}
