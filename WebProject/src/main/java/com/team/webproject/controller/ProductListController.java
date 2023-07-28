package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.mapper.PerformanceMapper;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	PerformanceMapper performanceMapper;	
	
	@GetMapping("/performance")
	String getProduckList(Model model, String main_category) {
		
		model.addAttribute("performances", performanceMapper.getPerformances(main_category));
		model.addAttribute("main_category", main_category);
		
		return "/product-list/product-list";
	}
	
}
