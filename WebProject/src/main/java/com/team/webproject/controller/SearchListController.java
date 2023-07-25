package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.mapper.SearchMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchListController {
	
	@Autowired
	SearchMapper searchMapper;
	
	@GetMapping("/search")
	String getSearchList(Model model, String keyword) {
		
		model.addAttribute("searchList", searchMapper.getSearchList(keyword));
				
		return "/search-list/search-list";
	}
}
