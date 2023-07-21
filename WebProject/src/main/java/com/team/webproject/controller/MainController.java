//package com.team.webproject.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.team.webproject.service.ExampleService;
//
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//public class MainController {
//	
//	private final ExampleService exService;
//	
//	@GetMapping("/")
//	String index(Model model) {
//		
//		model.addAttribute("ex", exService.getAll());
//		
//		return "index";
//	}
//	
//}
