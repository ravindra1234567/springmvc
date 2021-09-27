package com.nagarro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nagarro.model.Employee;
import com.nagarro.services.EmployeeService;

@Controller
public class EmployeeController {

	@RequestMapping("/allemployee")
	public String allEmp(@RequestParam("success") String msg, Model model, HttpSession session) {

		String name = (String) session.getAttribute("name");
		if (name != null) {
			try {
				System.out.println("session  = " + msg);
				List<Employee> list = EmployeeService.getAllEmployee();
				model.addAttribute("list", list);
				model.addAttribute("success", msg);
			} catch (Exception e) {
				e.printStackTrace();
				return "employeedetails";
			}

			return "employeedetails";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(path = "/addemployee", method = RequestMethod.POST)
	public String handleForm(@ModelAttribute Employee employee, Model model, HttpSession session) {
//		if (result.hasErrors()) {
//			try {
//				List<Employee> list = EmployeeService.getAllEmployee();
//				model.addAttribute("list", list);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return "employeedetails";
//		}

		String name = (String) session.getAttribute("name");
		if (name != null) {
			EmployeeService.createEmployee(employee);
			try {
				List<Employee> list = EmployeeService.getAllEmployee();
				model.addAttribute("list", list);
				model.addAttribute("success", "added");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/allemployee";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(path = "/editemployee")
	public String editEmployee(@RequestParam("id") int id1, Model model, HttpSession session) {
		String name = (String) session.getAttribute("name");
		if (name != null) {
			try {
				Employee list = EmployeeService.getEmployee(id1);
				model.addAttribute("e", list);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return "employeeedit";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(path = "/afteredit", method = RequestMethod.POST)
	public String editHandleForm(@ModelAttribute Employee employee, Model model, HttpSession session) {
		String name = (String) session.getAttribute("name");
		if (name != null) {
			EmployeeService.updateEmployee(employee);
			try {
				List<Employee> list = EmployeeService.getAllEmployee();
				model.addAttribute("list", list);
				model.addAttribute("success", "edited");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/allemployee";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping("/deleteemployee")
	public String deleteHandler(@RequestParam("id") int id1, Model model, HttpSession session) {
		String name = (String) session.getAttribute("name");

		if (name != null) {
			EmployeeService.deleteEmployee(id1);
			try {
				List<Employee> list = EmployeeService.getAllEmployee();
				model.addAttribute("list", list);
				model.addAttribute("success", "deleted");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/allemployee";
		} else {
			return "redirect:/login"; //
		}
	}
}
