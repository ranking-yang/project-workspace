package com.team.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team.webproject.mapper.WishlistMapper;



@RestController
public class WishlistController {
	
	@Autowired
	WishlistMapper wishlistMapper;

	@PostMapping(value={"/product/addwishlist", "/addwishlist"})
	@CrossOrigin(origins = "", methods = RequestMethod.POST)
	void addWishlist(@RequestParam("member_code") int member_code,
			@RequestParam("performance_code") String performance_code) {
		wishlistMapper.insertWishlist(member_code, performance_code);
	}
	
	
	@PostMapping(value={"/product/delewishlist", "/delewishlist"})
	@CrossOrigin(origins = "", methods = RequestMethod.POST)
	void deleteWishlist(@RequestParam("member_code") int member_code,
			@RequestParam("performance_code") String performance_code) {
		wishlistMapper.deleteWishlist(member_code, performance_code);
	}
	

	
}
