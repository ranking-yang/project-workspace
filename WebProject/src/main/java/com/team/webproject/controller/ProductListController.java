package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.service.ProductListService;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductListService productListService;

	@GetMapping("/performance")
	String getProduckList(Model model, String main_category, Integer member_code, String area) {
		member_code = 51;
		model.addAttribute("performances", productListService.getProductList(main_category,member_code, area));
		model.addAttribute("main_category", main_category);
		return "/product-list/product-list";
	}

}
