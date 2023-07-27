package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.WishlistMapper;
import com.team.webproject.service.WishlistService;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	PerformanceMapper performanceMapper;

	
	
	@GetMapping("/performance") // 로그인 했을때 목록보기
	String getProduckList(Model model, String main_category, int member_code) {
		
		model.addAttribute("performances", performanceMapper.getPerformances(main_category));
		model.addAttribute("main_category", main_category);
		model.addAttribute("userWishlist", performanceMapper.getUserWishlist());
		return "/product-list/product-list";
	}
	
	@GetMapping("/performance")// 로그인 안했을때 목록보기
	String getProduckList(Model model, String main_category) {
		
		model.addAttribute("performances", performanceMapper.getPerformances(main_category));
		model.addAttribute("main_category", main_category);
		return "/product-list/product-list";
	}
	
	@GetMapping("/product-detail")
	String getProductDetail(Model model, String performance_code) {
		
		model.addAttribute("perfomance", performanceMapper.getPerformance(performance_code));
		
		return "/detail/detail";
	}
	
}
