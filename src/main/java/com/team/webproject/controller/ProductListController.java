package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.service.ProductListService;
import com.team.webproject.service.ReviewService;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductListService productListService;
	
	@Autowired
	MD_RecomMapper mdMapper;
	
	@Autowired
	ReviewService reviewService;

	@GetMapping("/performance")
	String getProduckList(Model model, String main_category, String area_code) {
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {			
			String member_id = ((UserDetails) principal).getUsername();
			Integer member_code = productListService.getMember_code(member_id);
			
			model.addAttribute("member_id", member_id);			
			model.addAttribute("member_code", member_code);
			model.addAttribute("wishlist", productListService.getUserWish_list(member_code));
		}
		
		model.addAttribute("main_category", main_category);
		model.addAttribute("performances", productListService.getProductList(main_category,area_code));
		model.addAttribute("scorenavgs", reviewService.getPerformanceReviewCountnAvg());
		
		return "/product-list/product-list";
	}
	

	@GetMapping(path = {"/sort", "/area"})
	String getSortProductList(Model model, String main_category, String sort_code, String area_code) {
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {
			String member_id = ((UserDetails) principal).getUsername();
			Integer member_code = productListService.getMember_code(member_id);
			model.addAttribute("member_id", member_id);
			model.addAttribute("member_code", member_code);
			model.addAttribute("wishlist", productListService.getUserWish_list(member_code));
		}

	    model.addAttribute("main_category", main_category);
	    if(sort_code == null) {
			model.addAttribute("performances", productListService.getProductList(main_category,area_code));
		}else {
			model.addAttribute("performances", productListService.getSortProductList(main_category, sort_code, area_code));			
		}

		model.addAttribute("scorenavgs", reviewService.getPerformanceReviewCountnAvg());
		return "/product-list/product-list";
	}
	
	@GetMapping("/mdrecom")
	String getProduckMd(Model model, String main_category) {
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {			
			String member_id = ((UserDetails) principal).getUsername();
			Integer member_code = productListService.getMember_code(member_id);
			
			model.addAttribute("member_id", member_id);			
			model.addAttribute("member_code", member_code);
			model.addAttribute("wishlist", productListService.getUserWish_list(member_code));

		}
		
		model.addAttribute("main_category", "md_category");
		model.addAttribute("performances", mdMapper.getMDperfom(main_category));
		
		return "/product-list/product-list";
	}
}
