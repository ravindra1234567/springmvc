package com.nagarro.services;

import org.springframework.web.client.RestTemplate;

import com.nagarro.model.Admin;

public class AdminService {
	// Final static properties
	private final static String USER = "/admin";
	private final static String USER_AND_ID = "/login/{email}";
	private final static String SERVER_URI = "http://localhost:8081";
	private final static RestTemplate restTemplate = new RestTemplate();

	public static Admin getUser(String email) {
//		System.out.println("insite service = " + email);
		Admin user = restTemplate.getForObject(SERVER_URI + USER_AND_ID, Admin.class, email);
		return user;
	}

	public static void createUser(Admin admin) {
		restTemplate.postForObject(SERVER_URI + USER, admin, Admin.class);
	}
}
