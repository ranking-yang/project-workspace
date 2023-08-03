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
import com.team.webproject.service.ProductListService;


@Controller
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductListService productListService;

	@GetMapping("/performance")
	String getProduckList(Model model, String main_category, String area) {
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<PerformanceDTO> performances;
		
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
			performances = productListService.getProductList(main_category, area);
		} else {			
			String member_id = ((UserDetails) principal).getUsername();
			model.addAttribute("member_id", member_id);			
			model.addAttribute("member_code", productListService.getMember_code(member_id));
			performances = productListService.getUserProductList(main_category, area);
			System.out.println("product 사용자 id : " + member_id);
			System.out.println("product 사용자 code : " + productListService.getMember_code(member_id));
		}
		model.addAttribute("main_category", main_category);
		model.addAttribute("performances", performances);
		
		return "/product-list/product-list";
	}
	
}
