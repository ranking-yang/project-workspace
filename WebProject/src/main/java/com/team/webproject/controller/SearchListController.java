package com.team.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SearchListController {
	@GetMapping("/search")
	String getSearchList(Model model) {
		List<String> searchList = new ArrayList<>();
		model.addAttribute("searchList", searchList);
				
		return "/search-list/search-list";
	}
}
