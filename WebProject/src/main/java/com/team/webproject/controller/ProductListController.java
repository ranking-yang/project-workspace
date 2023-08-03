package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

		model.addAttribute("performances", productListService.getProductList(main_category,member_code, area));

		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal.equals("anonymousUser")) {
			model.addAttribute("userId", null);
		} else {			
			String username = ((UserDetails) principal).getUsername();
			model.addAttribute("userId", username);
		}
		
		member_code = 51;
		model.addAttribute("performances", productListService.getProductList(main_category, member_code, area));
		model.addAttribute("main_category", main_category);
		
		return "/product-list/product-list";
	}
	
}
