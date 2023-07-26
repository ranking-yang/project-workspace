package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.WishlistMapper;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	PerformanceMapper performanceMapper;
	@Autowired
	WishlistMapper wishlistMapper;
	
	@GetMapping("/performance")
	String getProduckList(Model model, String main_category) {
		
		model.addAttribute("performances", performanceMapper.getPerformances(main_category));
		model.addAttribute("main_category", main_category);
		return "/product-list/product-list";
	}
	
	@GetMapping("/wishlist")
	String getUserWislist(Model model, int member_code) {
		member_code = 50;
		model.addAttribute("userWishlist", wishlistMapper.getUserWislist(member_code));
		return "wish-list/wish-list";
	}
	
	@GetMapping("/product-detail")
	String getProductDetail(Model model, String performance_code) {
		
		model.addAttribute("perfomance", performanceMapper.getPerformance(performance_code));
		
		return "/detail/detail";
	}
	
}
