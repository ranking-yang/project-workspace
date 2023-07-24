package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.service.ExampleService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Detail_Bottom_Controller_jun {
	
	private final ExampleService exService;
	
	@GetMapping("/detailBottom")
	String index() {
		
//		model.addAttribute("ex", exService.getAll());
		
		return "/detail/detail_bottom";
	}
	
}
