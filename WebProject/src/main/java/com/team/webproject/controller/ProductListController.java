package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.mapper.PerformanceMapper;

import lombok.RequiredArgsConstructor;


@Controller
public class ProductListController {
	
	@Autowired
	PerformanceMapper performanceMapper;	
	
	@GetMapping("/product")
	String getProduckList(Model model) {
		model.addAttribute("performances", performanceMapper.getAllPerformances());
		
		return "/product-list/product-list";
	}
	
	@GetMapping("/product/product-detail")
	String getProductDetail(Model model, String performance_code) {
		
		model.addAttribute("perfomance", performanceMapper.getPerformance(performance_code));
		
		return "/detail/detail";
	}
	
}
