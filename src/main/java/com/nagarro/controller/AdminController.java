package com.nagarro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.nagarro.model.Admin;
import com.nagarro.model.Employee;
import com.nagarro.services.AdminService;
import com.nagarro.services.EmployeeService;

@Controller
public class AdminController {

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping(path = "/afterlogin", method = RequestMethod.POST)
	public String loginHandle(@ModelAttribute Admin admin, Model model, HttpServletRequest request) {
//
//		System.out.println(admin.getEmail());
//		System.out.println(admin.getPassword());
		String ee = admin.getEmail();
		Admin user;
		try {
			user = AdminService.getUser(ee);
			List<Employee> list = EmployeeService.getAllEmployee();
			model.addAttribute("list", list);
			model.addAttribute("success", "abc");
		} catch (Exception e) {
			e.printStackTrace();
			return "login";
		}
		request.getSession().setAttribute("name", user.getName());
		return "redirect:/allemployee";
	}

	@RequestMapping("/sessionlogout")
	public String logout(HttpSession httpsession, SessionStatus status) {
		/*
		 * Mark the current handler's session processing as complete, allowing for
		 * cleanup of session attributes.
		 */
		status.setComplete();

		/* Invalidates this session then unbinds any objects boundto it. */
		httpsession.invalidate();
		return "login";
	}

	@RequestMapping("/error_404")
	public String error1() {
		return "error_404";
	}

}
