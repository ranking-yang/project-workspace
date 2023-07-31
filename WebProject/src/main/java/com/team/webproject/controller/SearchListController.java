package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.service.SearchListService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchListController {
	
	@Autowired
	SearchListService searchListService;
	
	@GetMapping("/search")
	String getSearchList(Model model, String keyword, Integer member_code) {
		member_code=51;
		model.addAttribute("searchList", searchListService.getSearchList(keyword, member_code));
				
		return "/search-list/search-list";
	}
}
