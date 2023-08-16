package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.service.ProductListService;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductListService productListService;
	
	@Autowired
	MD_RecomMapper mdMapper;

	@GetMapping("/performance")
	String getProduckList(Model model, String main_category) {
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
		model.addAttribute("performances", productListService.getProductList(main_category));
		
		return "/product-list/product-list";
	}
	
	
	@GetMapping("/area")
	String getAreaProduckList(Model model, String area_code) {
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
		model.addAttribute("area_code", area_code);
		System.out.println(area_code);
		model.addAttribute("performances", productListService.getAreaProductList(area_code));
		
		
		System.out.println(productListService.getAreaProductList(area_code));
		return "/product-list/product-list";
	}
	
	@GetMapping("/mdrecom")
	String getProduckMd(Model model, String main_category) {
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(main_category);
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
		System.out.println(mdMapper.getMDperfom(main_category));
		model.addAttribute("performances", mdMapper.getMDperfom(main_category));
		
		return "/product-list/product-list";
	}
}
