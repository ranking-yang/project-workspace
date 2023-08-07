package com.team.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.service.ProductListService;
import com.team.webproject.service.SearchListService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchListController {
	
	@Autowired
	SearchListService searchListService;
	@Autowired
	ProductListService productListService;
	
	@GetMapping("/search")
	String getSearchList(Model model, String keyword) {
		
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<PerformanceDTO> searchList;
		
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
			searchList = searchListService.getSearchList(keyword);
		} else {			
			String member_id = ((UserDetails) principal).getUsername();
			model.addAttribute("member_id", member_id);			
			model.addAttribute("member_code", productListService.getMember_code(member_id));
			searchList = searchListService.getUserSearchList(keyword);
		}
		model.addAttribute("searchList", searchList);

		return "/search-list/search-list";
	}
}
