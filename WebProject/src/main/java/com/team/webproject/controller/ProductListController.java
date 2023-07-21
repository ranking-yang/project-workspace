package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor()
public class ProductListController {
	@GetMapping("/product")
	String getProduckList() {
		return "/product-list/product-list";
	}
	
}
