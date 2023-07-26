package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.webproject.mapper.WishlistMapper;


@RestController
public class WishlistController {
	@Autowired
	WishlistMapper wishlistMapper;
	
//	@GetMapping("/wishlist")
//	String getUserWislist(Model model, String member_id) {
//		member_id = "이순신2";
//		model.addAttribute("userWishlist", wishlistMapper.getUserWislist(member_id));
//		return "wish-list/wish-list";
//	}

	
	@PostMapping("/wishlist")
	void addWishlist(int member_code, String performance_code, Model model) {
		member_code = 50;
		model.addAttribute("list_writer_code", member_code);
		model.addAttribute("performance_code", performance_code);
		
		
		wishlistMapper.insertWishlist(member_code, performance_code);
	}

}
